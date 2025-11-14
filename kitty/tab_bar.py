import json
import subprocess
from collections import defaultdict
from datetime import datetime, timezone

from kitty.boss import get_boss
from kitty.fast_data_types import Screen
from kitty.tab_bar import (
    DrawData,
    ExtraData,
    Formatter,
    TabBarData,
    PowerlineStyle,
    as_rgb,
    draw_attributed_string,
    draw_title
)
from kitty.rgb import Color
from kitty.utils import color_as_int


def _draw_icon(screen: Screen, index: int) -> int:
    if index != 1:
        return 0

    ICON = " 󰊠 "
    icon_fg = as_rgb(color_as_int(Color(122, 132, 120)))
    icon_bg = as_rgb(color_as_int(Color(55, 65, 69)))

    fg, bg = screen.cursor.fg, screen.cursor.bg
    screen.cursor.fg = icon_fg
    screen.cursor.bg = icon_bg
    screen.draw(ICON)
    screen.cursor.fg, screen.cursor.bg = fg, bg
    screen.cursor.x = len(ICON)
    return screen.cursor.x


def _draw_tab_with_separator(
    draw_data: DrawData, screen: Screen, tab: TabBarData,
    before: int, max_tab_length: int, index: int, is_last: bool,
    extra_data: ExtraData
) -> int:
    if draw_data.leading_spaces:
        screen.draw(' ' * draw_data.leading_spaces)
    draw_title(draw_data, screen, tab, index, max_tab_length)
    trailing_spaces = min(max_tab_length - 1, draw_data.trailing_spaces)
    max_tab_length -= trailing_spaces
    extra = screen.cursor.x - before - max_tab_length
    if extra > 0:
        screen.cursor.x -= extra + 1
        screen.draw('…')
    if trailing_spaces:
        screen.draw(' ' * trailing_spaces)
    end = screen.cursor.x
    screen.cursor.bold = screen.cursor.italic = False
    screen.cursor.fg = 0
    if not is_last:
        screen.cursor.bg = as_rgb(color_as_int(draw_data.inactive_bg))
        screen.draw(draw_data.sep)
    screen.cursor.bg = 0
    return end


def draw_tab(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_title_length: int,
    index: int,
    is_last: bool,
    extra_data: ExtraData,
) -> int:
    _draw_icon(screen, index)
    _draw_tab_with_separator(
        draw_data, screen, tab, before, max_title_length, index, is_last, extra_data
    )
    # if is_last:
    #     draw_right_status(draw_data, screen, tab)
    return screen.cursor.x


def draw_right_status(draw_data: DrawData, screen: Screen, tab: TabBarData) -> None:
    # The tabs may have left some formats enabled. Disable them now.
    draw_attributed_string(Formatter.reset, screen)
    cells = create_cells(tab)
    # Drop cells that wont fit
    while True:
        if not cells:
            return
        padding = screen.columns - screen.cursor.x - sum(len(c) + 3 for c in cells)
        if padding >= 0:
            break
        cells = cells[1:]

    if padding:
        screen.draw(" " * padding)

    tab_bg = as_rgb(int(draw_data.inactive_bg))
    tab_fg = as_rgb(int(draw_data.inactive_fg))
    default_bg = as_rgb(int(draw_data.default_bg))
    for cell in cells:
        # Draw the separator
        if cell == cells[0]:
            screen.cursor.fg = tab_bg
            screen.draw("")
        else:
            screen.cursor.fg = default_bg
            screen.cursor.bg = tab_bg
            screen.draw("")
        screen.cursor.fg = tab_fg
        screen.cursor.bg = tab_bg
        screen.draw(f" {cell} ")


def create_cells(tab: TabBarData) -> list[str]:
    now = datetime.datetime.now()
    title = tab.title
    return [
        f'{title[:30]}…' if title.rindex(title[-1]) + 1 > 30 else (title.center(6) if (title.rindex(title[-1]) + 1) % 2 == 0 else title.center(5)),
        # now.strftime("%d %b"),
        # now.strftime("%H:%M"),
    ]


def _redraw_tab_bar(timer_id):
    for tm in get_boss().all_tab_managers:
        tm.mark_tab_bar_dirty()
