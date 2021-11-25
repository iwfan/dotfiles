spoon.ModalMgr:new "app_luncher"
local cmodal = spoon.ModalMgr.modal_list["app_luncher"]
cmodal:bind("", "escape", "退出 ", function()
    spoon.ModalMgr:deactivate { "app_luncher" }
end)
cmodal:bind("", "Q", "退出 ", function()
    spoon.ModalMgr:deactivate { "app_luncher" }
end)
local hsapp_list = {
    { key = "f", name = "Finder" },
    { key = "s", name = "Spotify" },
    { key = "i", name = "iTerm" },
    { key = "k", name = "Kitty" },
    { key = "n", name = "Notion" },
    { key = "b", name = "Brave Browser" },
    { key = "w", name = "Wechat" },
    { key = "e", name = "Microsoft Edge" },
    { key = "v", id = "com.apple.ActivityMonitor" },
    { key = "y", id = "com.apple.systempreferences" },
}
for _, v in ipairs(hsapp_list) do
    if v.id then
        local located_name = hs.application.nameForBundleID(v.id)
        if located_name then
            cmodal:bind("", v.key, located_name, function()
                hs.application.launchOrFocusByBundleID(v.id)
                spoon.ModalMgr:deactivate { "app_luncher" }
            end)
        end
    elseif v.name then
        cmodal:bind("", v.key, v.name, function()
            hs.application.launchOrFocus(v.name)
            spoon.ModalMgr:deactivate { "app_luncher" }
        end)
    end
end

spoon.ModalMgr.supervisor:bind(leader, "A", "App Launcher", function()
    spoon.ModalMgr:deactivateAll()
    spoon.ModalMgr:activate({ "app_luncher" }, "#FFBD2E", true)
end)
