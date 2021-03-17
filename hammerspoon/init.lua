-- Logger
local logger = hs.logger.new("eventtap", "debug")
-- Auto reload config
function reloadConfig(files)
  doReload = false
  for _, file in pairs(files) do
    if file:sub(-4) == ".lua" then
      doReload = true
    end
  end
  if doReload then
    hs.reload()
  end
end
dotConfigFileChangeWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config reloaded")

-- Hints
hs.hints.style = "vimperator"
hs.hints.fontName = "Source Code Pro Medium"
hs.hints.fontSize = 20
hs.hotkey.bind(
  {"alt"},
  "\\",
  function()
    -- API: hs.hints.windowHints([windows, callback, allowNonStandard])
    hs.hints.windowHints(nil, nil, false)
  end
)

function connect_tw_vpn(region)
  hs.execute("killall 'Cisco AnyConnect Secure Mobility Client'", true)

  local username = config.username
  local password = config.password
  local secret_key = config.secret_key
  local connection_adress = string.format("%s.vpn.thoughtworks.com", region)
  local authentication_method_index = "2"

  local command_of_get_code = string.format("oathtool --totp -b %s", secret_key)
  local code = hs.execute(command_of_get_code, true)
  local user_info = string.format("printf '%s\n%s\n%s\n%s\n'", username, password, authentication_method_index, code)
  local connection_info = string.format("/opt/cisco/anyconnect/bin/vpn -s connect %s", connection_adress)

  hs.execute("/opt/cisco/anyconnect/bin/vpn disconnect", true)
  hs.execute(user_info .. " | " .. connection_info, true)
  hs.execute("open -g '/Applications/Cisco/Cisco AnyConnect Secure Mobility Client.app'", true)
end

hs.hotkey.bind(
  {"cmd", "alt", "ctrl", "shift"},
  "v",
  function()
    hs.execute("say 'Ready to connect'")
    connect_tw_vpn("xdc")
    -- connect_tw_vpn("cn")
    hs.alert.show("Xian VPN successful connection")
    hs.execute("say 'Xian VPN successful connection'")
  end
)
