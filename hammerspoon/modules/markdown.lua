local function isInTerminal()
  local app = hs.application.frontmostApplication():name()
  return hs.fnutils.contains({'kitty', 'Terminal', 'iTerm2'}, app)
end

local function keyUpDown(modifiers, key)
  -- Un-comment & reload config to log each keystroke that we're triggering
  -- log.d('Sending keystroke:', hs.inspect(modifiers), key)

  hs.eventtap.keyStroke(modifiers, key, 0)
end


local function wrapSelectedText(wrapCharacters)
  -- Preserve the current contents of the system clipboard
  local originalClipboardContents = hs.pasteboard.getContents()

  -- Copy the currently-selected text to the system clipboard
    if isInTerminal() then
        hs.eventtap.keyStroke(nil, 'y', 0)
    else
        keyUpDown('cmd', 'c')
    end

  -- Allow some time for the command+c keystroke to fire asynchronously before
  -- we try to read from the clipboard
  hs.timer.doAfter(0.2, function()
    -- Construct the formatted output and paste it over top of the
    -- currently-selected text
    local selectedText = hs.pasteboard.getContents()
    local wrappedText = wrapCharacters .. selectedText .. wrapCharacters
    hs.pasteboard.setContents(wrappedText)

    if isInTerminal() then
        hs.eventtap.keyStroke(nil, 'p', 0)
    else
        keyUpDown('cmd', 'v')
    end

    -- Allow some time for the command+v keystroke to fire asynchronously before
    -- we restore the original clipboard
    hs.timer.doAfter(0.2, function()
      hs.pasteboard.setContents(originalClipboardContents)
    end)
  end)
end

local function inlineLink()
  -- Fetch URL from the system clipboard
  local linkUrl = hs.pasteboard.getContents()

  -- Copy the currently-selected text to use as the link text
  keyUpDown('cmd', 'c')

  -- Allow some time for the command+c keystroke to fire asynchronously before
  -- we try to read from the clipboard
  hs.timer.doAfter(0.2, function()
    -- Construct the formatted output and paste it over top of the
    -- currently-selected text
    local linkText = hs.pasteboard.getContents()
    local markdown = '[' .. linkText .. '](' .. linkUrl .. ')'
    hs.pasteboard.setContents(markdown)
    keyUpDown('cmd', 'v')

    -- Allow some time for the command+v keystroke to fire asynchronously before
    -- we restore the original clipboard
    hs.timer.doAfter(0.2, function()
      hs.pasteboard.setContents(linkUrl)
    end)
  end)
end

--------------------------------------------------------------------------------
-- Define Markdown Mode
--
-- Markdown Mode allows you to perform common Markdown-formatting tasks anywhere
-- that you're editing text. Use Control+m to turn on Markdown mode. Then, use
-- any shortcut below to perform a formatting action. For example, to format the
-- selected text as bold in Markdown, hit Control+m, and then b.
--
--   b => wrap the selected text in double asterisks ("b" for "bold")
--   c => wrap the selected text in backticks ("c" for "code")
--   i => wrap the selected text in single asterisks ("i" for "italic")
--   s => wrap the selected text in double tildes ("s" for "strikethrough")
--   l => convert the currently-selected text to an inline link, using a URL
--        from the clipboard ("l" for "link")

spoon.ModalMgr:new("markdown_mode")
local cmodal = spoon.ModalMgr.modal_list["markdown_mode"]

local function exit()
    spoon.ModalMgr:deactivate({"markdown_mode"})
end

cmodal:bind('', 'escape', '退出 ', exit)
cmodal:bind('', 'Q', '退出 ', exit)
cmodal:bind('', 'tab', 'Toggle Cheatsheet', function() spoon.ModalMgr:toggleCheatsheet() end)
cmodal:bind('', 'b', '加粗', function() wrapSelectedText('**') end, exit)
cmodal:bind('', 'i', '斜体', function() wrapSelectedText('*') end, exit)
cmodal:bind('', 's', '删除线', function() wrapSelectedText('~~') end, exit)
cmodal:bind('', 'l', '链接', function() inlineLink() end, exit)
cmodal:bind('', 'c', 'Wrap', function() wrapSelectedText('`') end, exit)

spoon.ModalMgr.supervisor:bind(leader, "M", "Markdown Mode", function()
    spoon.ModalMgr:deactivateAll()
    spoon.ModalMgr:activate({"markdown_mode"}, "#FFBD2E", true)
end)
