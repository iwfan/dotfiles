-- insert helper
function _G.insert(tbl, el)
    if el then
        return table.insert(tbl, el)
    else
        return function(el1)
            return _G.insert(tbl, el1)
        end
    end
end

-- list merge
function _G.list_merge(...)
    local tbl = {}
    for _, list in ipairs { ... } do
        for _, item in ipairs(list) do
            table.insert(tbl, item)
        end
    end
    return tbl
end

-- inspect stuff
function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, { ... })
    print " === "
    print(unpack(objects))
    print " === "
end

-- variable
function _G.var_tbl(variable_table)
    for variable_name, value in pairs(variable_table) do
        vim.api.nvim_set_var(variable_name, value)
    end
end

-- mappings
function _G.map(mode_and_lhs, rhs, opts)
    local options = {
        noremap = true,
        silent = true,
        expr = false,
        nowait = false,
    }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end

    local mode, lhs = mode_and_lhs:match "([^|]*)|?(.*)"
    vim.keymap.set(mode, lhs, rhs, options)
end

function _G.map_cmd(mode_and_lhs, rhs, opts)
    _G.map(mode_and_lhs, string.format("<cmd>%s<CR>", rhs), opts)
end

function _G.searching_google(keyword)
    vim.fn.system { "open", "https://google.com/search?q=" .. keyword }
end

function _G.searching_deepl(keyword)
    vim.fn.system { "open", "https://deepl.com/zh/translator#en/zh/" .. keyword }
end
