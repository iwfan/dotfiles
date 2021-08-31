local function reloadConfigCallback(files)
    for _, file in pairs(files) do
        if file:sub(-4) == ".lua" then
            hs.reload()
            do
                return
            end
        end
    end
end

_ReloadWatcher = hs.pathwatcher.new(config_path, reloadConfigCallback):start()

hs.alert.show("Config Reload Success")
