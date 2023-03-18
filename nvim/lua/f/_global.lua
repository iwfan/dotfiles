-- inspect stuff
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, { ... })
    print " === "
    print(unpack(objects))
    print " === "
end
