-- stylua: ignore start
local KEY_BINDINGS = {
    { HYPER, ";", function() hs.application.launchOrFocus "Kitty" end, },
    { HYPER, "\\", function() hs.application.launchOrFocus "Arc" end, },
    { HYPER, "'", function() hs.application.launchOrFocus "Google Chrome" end, },
    -- { HYPER, ",", function() hs.application.launchOrFocus "Google Chrome" end, },
    -- { HYPER, ".", function() hs.application.launchOrFocus "Google Chrome" end, },
    -- { HYPER, "/", function() hs.application.launchOrFocus "Google Chrome" end, },
}
-- stylua: ignore end

for _, mapping in ipairs(KEY_BINDINGS) do
    local modifier, trigger, appFunction = table.unpack(mapping)
    hs.hotkey.bind(modifier, trigger, appFunction)
end
