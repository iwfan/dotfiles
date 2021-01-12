" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

lua << END
local plugins = {
  ["far.vim"] = {
    commands = { "F", "Far", "Fardo" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/f/.local/share/nvim/site/pack/packer/opt/far.vim"
  },
  ["formatter.nvim"] = {
    commands = { "Format" },
    config = { "\27LJ\2\nŠ\1\0\0\5\0\6\0\n5\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\2)\4\0\0B\2\2\2>\2\2\1=\1\5\0L\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\4\0\0\21--stdin-filepath\0\19--single-quote\1\0\2\nstdin\2\bexe\rprettierN\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\4\0\0\19--indent-count\3\2\f--stdin\1\0\2\nstdin\2\bexe\vluafmt0\0\0\2\0\2\0\0045\0\0\0004\1\0\0=\1\1\0L\0\2\0\targs\1\0\2\nstdin\2\bexe\ngofmtï\1\1\0\a\0\15\0\0303\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0005\4\5\0004\5\3\0>\0\1\5=\5\6\0044\5\3\0>\0\1\5=\5\a\0044\5\3\0>\0\1\5=\5\b\0044\5\3\0>\0\1\5=\5\t\0044\5\3\0003\6\n\0>\6\1\5=\5\v\0044\5\3\0003\6\f\0>\6\1\5=\5\r\4=\4\14\3B\1\2\1K\0\1\0\rfiletype\ago\0\blua\0\20typescriptreact\15typescript\20javascriptreact\15javascript\1\0\0\1\0\1\flogging\1\nsetup\14formatter\frequire\0\0" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/f/.local/share/nvim/site/pack/packer/opt/formatter.nvim"
  },
  ["packer.nvim"] = {
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/f/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  undotree = {
    commands = { "UndotreeToggle" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/f/.local/share/nvim/site/pack/packer/opt/undotree"
  },
  ["vista.vim"] = {
    commands = { "Vista" },
    loaded = false,
    only_sequence = false,
    only_setup = false,
    path = "/Users/f/.local/share/nvim/site/pack/packer/opt/vista.vim"
  }
}

local function handle_bufread(names)
  for _, name in ipairs(names) do
    local path = plugins[name].path
    for _, dir in ipairs({ 'ftdetect', 'ftplugin', 'after/ftdetect', 'after/ftplugin' }) do
      if #vim.fn.finddir(dir, path) > 0 then
        vim.cmd('doautocmd BufRead')
        return
      end
    end
  end
end

_packer_load = nil

local function handle_after(name, before)
  local plugin = plugins[name]
  plugin.load_after[before] = nil
  if next(plugin.load_after) == nil then
    _packer_load({name}, {})
  end
end

_packer_load = function(names, cause)
  local some_unloaded = false
  for _, name in ipairs(names) do
    if not plugins[name].loaded then
      some_unloaded = true
      break
    end
  end

  if not some_unloaded then return end

  local fmt = string.format
  local del_cmds = {}
  local del_maps = {}
  for _, name in ipairs(names) do
    if plugins[name].commands then
      for _, cmd in ipairs(plugins[name].commands) do
        del_cmds[cmd] = true
      end
    end

    if plugins[name].keys then
      for _, key in ipairs(plugins[name].keys) do
        del_maps[key] = true
      end
    end
  end

  for cmd, _ in pairs(del_cmds) do
    vim.cmd('silent! delcommand ' .. cmd)
  end

  for key, _ in pairs(del_maps) do
    vim.cmd(fmt('silent! %sunmap %s', key[1], key[2]))
  end

  for _, name in ipairs(names) do
    if not plugins[name].loaded then
      vim.cmd('packadd ' .. name)
      if plugins[name].config then
        for _i, config_line in ipairs(plugins[name].config) do
          loadstring(config_line)()
        end
      end

      if plugins[name].after then
        for _, after_name in ipairs(plugins[name].after) do
          handle_after(after_name, name)
          vim.cmd('redraw')
        end
      end

      plugins[name].loaded = true
    end
  end

  handle_bufread(names)

  if cause.cmd then
    local lines = cause.l1 == cause.l2 and '' or (cause.l1 .. ',' .. cause.l2)
    vim.cmd(fmt('%s%s%s %s', lines, cause.cmd, cause.bang, cause.args))
  elseif cause.keys then
    local keys = cause.keys
    local extra = ''
    while true do
      local c = vim.fn.getchar(0)
      if c == 0 then break end
      extra = extra .. vim.fn.nr2char(c)
    end

    if cause.prefix then
      local prefix = vim.v.count ~= 0 and vim.v.count or ''
      prefix = prefix .. '"' .. vim.v.register .. cause.prefix
      if vim.fn.mode('full') == 'no' then
        if vim.v.operator == 'c' then
          prefix = '' .. prefix
        end

        prefix = prefix .. vim.v.operator
      end

      vim.fn.feedkeys(prefix, 'n')
    end

    local formatted_plug_key = string.format('%c%c%c', 0x80, 253, 83)
    local keys = string.gsub(cause.keys, '^<Plug>', formatted_plug_key) .. extra
    local escaped_keys = string.gsub(keys, '<[cC][rR]>', '\r')
    vim.fn.feedkeys(escaped_keys)
  elseif cause.event then
    vim.cmd(fmt('doautocmd <nomodeline> %s', cause.event))
  elseif cause.ft then
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeplugin', cause.ft))
    vim.cmd(fmt('doautocmd <nomodeline> %s FileType %s', 'filetypeindent', cause.ft))
  end
end

-- Runtimepath customization

-- Pre-load configuration
-- Post-load configuration
-- Config for: telescope.nvim
loadstring("\27LJ\2\nÀ\1\0\0\5\0\t\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\b\0'\2\5\0B\0\2\1K\0\1\0\19load_extension\15extensions\1\0\0\15fzy_native\1\0\0\1\0\2\28override_generic_sorter\1\25override_file_sorter\2\nsetup\14telescope\frequire\0")()
-- Config for: zephyr-nvim
loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0")()
-- Config for: nvim-colorizer.lua
loadstring("\27LJ\2\n£\2\0\0\4\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\0025\3\16\0=\3\17\2B\0\2\1K\0\1\0\thtml\1\0\1\tmode\15foreground\ttmux\1\0\1\nnames\1\bvim\1\0\1\nnames\2\vstylus\1\0\1\vrgb_fn\2\tsass\1\0\1\vrgb_fn\2\tscss\1\0\1\vrgb_fn\2\bcss\1\5\0\0\15javascript\20javascriptreact\15typescript\20typescriptreact\1\0\1\vrgb_fn\2\nsetup\14colorizer\frequire\0")()
-- Config for: dashboard-nvim
loadstring("\27LJ\2\n·\5\0\0\4\0\22\0\0296\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\b\0005\2\6\0005\3\5\0=\3\a\2=\2\t\0015\2\v\0005\3\n\0=\3\a\2=\2\f\0015\2\14\0005\3\r\0=\3\a\2=\2\15\0015\2\17\0005\3\16\0=\3\a\2=\2\18\0015\2\20\0005\3\19\0=\3\a\2=\2\21\1=\1\4\0K\0\1\0\18find_register\1\0\1\fcommand\22DashboardJumpMark\1\2\0\0009ï‘¤  Find  Register                          SPC f r\14find_word\1\0\1\fcommand\22DashboardFindWord\1\2\0\0009ï†š  Find  Word                              SPC f g\14find_file\1\0\1\fcommand\22DashboardFindFile\1\2\0\0009ï…œ  Find  File                              SPC f f\17find_history\1\0\1\fcommand\25DashboardFindHistory\1\2\0\0009ïœ¡  Recently opened files                   SPC f h\rnew_file\1\0\0\16description\1\0\1\fcommand\21DashboardNewFile\1\2\0\0009ïœ•  New   File                              SPC t f\29dashboard_custom_section\14telescope dashboard_default_executive\6g\bvim\0")()
-- Config for: nvim-terminal.lua
loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rterminal\frequire\0")()
-- Config for: nvim-web-devicons
loadstring("\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0")()
-- Config for: coc.nvim
loadstring("\27LJ\2\n)\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\14plugs.coc\frequire\0")()
-- Config for: indent-guides.nvim
loadstring("\27LJ\2\nº\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\22exclude_filetypes\1\a\0\0\rNvimTree\14dashboard\nvista\thelp\14sagahover\rterminal\1\0\2\23indent_start_level\3\2\22indent_guide_size\3\1\nsetup\18indent_guides\frequire\0")()
-- Config for: smartim
loadstring("\27LJ\2\nI\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\28com.apple.keylayout.ABC\20smartim_default\6g\bvim\0")()
-- Config for: nvim-bufferline.lua
loadstring("\27LJ\2\nt\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\2\27always_show_bufferline\1\rmappings\1\nsetup\15bufferline\frequire\0")()
-- Config for: galaxyline.nvim
loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugs.galaxyline\frequire\0")()
-- Conditional loads
-- Load plugins in order defined by `after`
END

function! s:load(names, cause) abort
call luaeval('_packer_load(_A[1], _A[2])', [a:names, a:cause])
endfunction


" Command lazy-loads
command! -nargs=* -range -bang -complete=file Fardo call s:load(['far.vim'], { "cmd": "Fardo", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file UndotreeToggle call s:load(['undotree'], { "cmd": "UndotreeToggle", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Format call s:load(['formatter.nvim'], { "cmd": "Format", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file F call s:load(['far.vim'], { "cmd": "F", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Vista call s:load(['vista.vim'], { "cmd": "Vista", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })
command! -nargs=* -range -bang -complete=file Far call s:load(['far.vim'], { "cmd": "Far", "l1": <line1>, "l2": <line2>, "bang": <q-bang>, "args": <q-args> })

" Keymap lazy-loads

augroup packer_load_aucmds
  au!
  " Filetype lazy-loads
  au FileType javascript ++once call s:load(['formatter.nvim'], { "ft": "javascript" })
  au FileType json ++once call s:load(['formatter.nvim'], { "ft": "json" })
  au FileType lua ++once call s:load(['formatter.nvim'], { "ft": "lua" })
  au FileType typescriptreact ++once call s:load(['formatter.nvim'], { "ft": "typescriptreact" })
  au FileType html ++once call s:load(['formatter.nvim'], { "ft": "html" })
  au FileType go ++once call s:load(['formatter.nvim'], { "ft": "go" })
  au FileType css ++once call s:load(['formatter.nvim'], { "ft": "css" })
  au FileType typescript ++once call s:load(['formatter.nvim'], { "ft": "typescript" })
  au FileType javascriptreact ++once call s:load(['formatter.nvim'], { "ft": "javascriptreact" })
  " Event lazy-loads
  " Function lazy-loads
augroup END
