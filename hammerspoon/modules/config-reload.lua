function reloadConfigCallback(files)
    for _, file in pairs(files) do
        if file:sub(-4) == ".lua" then
            hs.reload()
            do return end
        end
    end
end

local configPath = os.getenv("HOME") .. "/.hammerspoon/"
reloadWatcher = hs.pathwatcher.new(configPath, reloadConfigCallback):start()

hs.alert.show("Config Reload Success")
