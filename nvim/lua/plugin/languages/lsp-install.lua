local packages = {}

local function installNodePkg(pkg)
  if type(pkg) == 'table' then
    for _,v in ipairs(pkg) do
      insert(packages, v)
    end
  else
    insert(packages, pkg)
  end
end

local function check_html_server()
  if fn.executable('html-languageserver') == 0 then
    local answer = fn.confirm("install html language server?", "&Yes\n&No")
    if answer == 1 then
      installNodePkg('vscode-html-languageserver-bin')
    end
  end
end
check_html_server()

local function check_css_server()
  if fn.executable('css-languageserver') == 0 then
    local answer = fn.confirm("install css language server?", "&Yes\n&No")
    if answer == 1 then
      installNodePkg('vscode-css-languageserver-bin')
    end
  end
end
check_css_server()

local function check_tsserver()
  if fn.executable('tsserver') == 0 then
    local answer = fn.confirm("install typescript language server?", "&Yes\n&No")
    if answer == 1 then
      installNodePkg({ 'typescript', 'typescript-language-server' })
    end
  end
end
check_tsserver()

local function check_jsonserver()
  if fn.executable('vscode-json-languageserver') == 0 then
    local answer = fn.confirm("install json language server?", "&Yes\n&No")
    if answer == 1 then
      installNodePkg('vscode-json-languageserver')
    end
  end
end
check_jsonserver()

local function check_ymlserver()
  if fn.executable('yaml-language-server') == 0 then
    local answer = fn.confirm("install yaml language server?", "&Yes\n&No")
    if answer == 1 then
      installNodePkg('yaml-language-server')
    end
  end
end
check_ymlserver()

local function check_bash_server()
  if fn.executable('bash-language-server') == 0 then
    local answer = fn.confirm("install bash language server?", "&Yes\n&No")
    if answer == 1 then
      installNodePkg('bash-language-server')
    end
  end
end
check_bash_server()


local function check_vueserver()
  if fn.executable('vls') == 0 then
    local answer = fn.confirm("install vue language server?", "&Yes\n&No")
    if answer == 1 then
      installNodePkg('vls')
    end
  end
end
check_vueserver()

local function check_dockerls()
  if fn.executable('docker-langserver') == 0 then
    local answer = fn.confirm("install docker language server?", "&Yes\n&No")
    if answer == 1 then
      installNodePkg('dockerfile-language-server-nodejs')
    end
  end
end
check_dockerls()

if #packages > 0 then
  local cmd = 'npm install -g ' .. table.concat(packages, ' ')
  print(cmd)
  fn.termopen(cmd, {
    on_stdout = function() print('stdout') end,
    on_stderr = function(_, _, e) error(e) end
  })
end

-- brew install ninja
local function check_lua()
  local sumneko_root_path = stdpath .. '/lsp-install/lua-language-server'
  local sumneko_binary = sumneko_root_path .. "/bin/Linux/lua-language-server"

  if fn.empty(fn.glob(sumneko_binary .. "/main.lua")) > 0 then
    -- git clone https://github.com/sumneko/lua-language-server ~/.config/lua-language-server
    -- ( cd ~/.config/lua-language-server/ && git submodule update --init --recursive )
    --
    -- #linux only
    -- (cd ~/.config/lua-language-server/3rd/luamake/compile/install.sh)
    -- (cd ~/.config/lua-language-server/ &&  ./3rd/luamake/luamake rebuild)

    -- fn.system({'git', 'clone', 'https://github.com/sumneko/lua-language-server', sumneko_root_path})
    -- fn.system({'cd', sumneko_root_path})
    -- fn.system({'git', 'submodule', 'update', '--init', '--recursive'})
    -- fn.system({'cd', sumneko_root_path .. '/3rd/luamake/'})
    -- fn.system({'sh', 'compile/install.sh'})
    -- fn.system({'cd', sumneko_root_path })
    -- fn.system({'./3rd/luamake/luamake', 'rebuild'})
  end
end
check_lua()
