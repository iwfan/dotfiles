function _G.table.contains(list, val)
    for _, value in ipairs(list) do
        if value == val then
            return true
        end
    end

    return false
end
