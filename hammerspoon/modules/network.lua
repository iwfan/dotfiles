function connect_tw_vpn(config)
    hs.execute("killall 'Cisco AnyConnect Secure Mobility Client'", true)

    local username = config.username
    local password = config.password
    local secret_key = config.secret_key
    local domain = config.domain
    local connection_address = domain or string.format("%s.vpn.thoughtworks.com", region)
    local authentication_method_index = "2"

    local command_of_get_code = string.format("oathtool --totp -b %s", secret_key)
    local code = hs.execute(command_of_get_code, true)
    local user_info = string.format("printf '%s\n%s\n%s\n%s\n'", username, password, authentication_method_index, code)
    local connection_info = string.format("/opt/cisco/anyconnect/bin/vpn -s connect %s", connection_address)

    hs.execute("/opt/cisco/anyconnect/bin/vpn disconnect", true)
    hs.execute(user_info .. " | " .. connection_info, true)
    hs.execute("open -g '/Applications/Cisco/Cisco AnyConnect Secure Mobility Client.app'", true)
end

hs.hotkey.bind(
    { "cmd", "alt", "ctrl", "shift" },
    "v",
    function()
        local config = require('../config')
        hs.execute("say 'Ready to connect'")
        connect_tw_vpn(config)
        -- connect_tw_vpn("cn")
        hs.alert.show("ThoughtWorks VPN successful connection")
        hs.execute("say 'ThoughtWorks VPN successful connection'")
    end
)
