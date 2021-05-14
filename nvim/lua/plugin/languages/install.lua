local packages = {}

local function installNodePkg(pkg)
  if type(pkg) == 'table' then
    for _,v in ipairs(pkg) do
      insert(packages, pkg)
    end
  else
    insert(packages, pkg)
  end
end

function check_html_server()
  if fn.executable('html-languageserver') == 0 then
    local answer = fn.confirm("install html language server?", "&Yes\n&No")
    if answer == 1 then
      installNodePkg('vscode-html-languageserver-bin')
    end
  end
end
check_html_server()

function check_css_server()
  if fn.executable('css-languageserver') == 0 then
    local answer = fn.confirm("install css language server?", "&Yes\n&No")
    if answer == 1 then
      installNodePkg('vscode-css-languageserver-bin')
    end
  end
end
check_css_server()

function check_tsserver()
  if fn.executable('tsserver') == 0 then
    local answer = fn.confirm("install typescript language server?", "&Yes\n&No")
    if answer == 1 then
      installNodePkg({ 'typescript', 'typescript-language-server' })
    end
  end
end
check_tsserver()

function check_jsonserver()
  if fn.executable('vscode-json-languageserver') == 0 then
    local answer = fn.confirm("install json language server?", "&Yes\n&No")
    if answer == 1 then
      installNodePkg('vscode-json-languageserver')
    end
  end
end
check_jsonserver()

function check_ymlserver()
  if fn.executable('yaml-language-server') == 0 then
    local answer = fn.confirm("install yaml language server?", "&Yes\n&No")
    if answer == 1 then
      installNodePkg('yaml-language-server')
    end
  end
end
check_ymlserver()

function check_bash_server()
  if fn.executable('bash-language-server') == 0 then
    local answer = fn.confirm("install bash language server?", "&Yes\n&No")
    if answer == 1 then
      installNodePkg('bash-language-server')
    end
  end
end
check_bash_server()


function check_vueserver()
  if fn.executable('vls') == 0 then
    local answer = fn.confirm("install vue language server?", "&Yes\n&No")
    if answer == 1 then
      installNodePkg('vls')
    end
  end
end
check_vueserver()

function check_dockerls()
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
    on_stdout = function(j, d, e) print('stdout') end,
    on_stderr = function(j, d, e) error(e) end
  })
end


