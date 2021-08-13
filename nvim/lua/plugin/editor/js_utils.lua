local M = {}

local function exists_package_json_field(field)
    if vim.fn.filereadable("package.json") ~= 0 then
        local package_json = vim.fn.json_decode(vim.fn.readfile("package.json"))
        return package_json[field] ~= nil
    end
end

local function exists_glob(glob)
    return vim.fn.glob(glob) ~= ""
end

local prettier_ignore = {
    vim.fn.expand("~/Mutual/mutual"),
}

local function should_ignore_prettier()
    for _, dir in ipairs(prettier_ignore) do
        if dir == vim.fn.getcwd() then
            return true
        end
    end

    return false
end

function M.prettier_config_exists()
    if should_ignore_prettier() then
        return false
    end

    return exists_glob("prettier*") or exists_package_json_field("prettier")
end

function M.eslint_config_exists()
    return exists_glob(".eslintrc*") or exists_package_json_field("eslintConfig")
end

function M.get_prettier_cmd()
    return {
        exe = "prettier",
        args = {
            "--single-quote",
            "true",
            "--no-semi",
            "--arrow-parens",
            "void",
            "--stdin-filepath",
        },
    }
end

function M.get_formatter()
    if M.eslint_config_exists() and vim.fn.executable("eslint_d") then
        return {
            exe = "eslint_d",
            args = {
                "--fix-to-stdout",
                "--stdin",
                "--stdin-filename",
            },
        }
    end

    if M.prettier_config_exists() and vim.fn.executable("prettier") then
        return {
            exe = "prettier",
            args = { "--stdin-filepath" },
        }
    end

    return M.get_prettier_cmd()
end

return M
