local function reloadConfig(files)
    local doReload = false
    for _, file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end

ConfigReloadWatcher = hs.pathwatcher.new(hs.configdir, reloadConfig):start()
hs.alert.show "Config Reload Success"
