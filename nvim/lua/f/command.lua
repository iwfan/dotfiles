vim.api.nvim_create_user_command("Filepath", "echo expand('%:p')", { force = true, nargs = 1 })
vim.api.nvim_create_user_command(
    "FileWithNumber e",
    "echo join([expand('%'),  line('.')], ':')",
    { force = true, nargs = 1 }
)
vim.api.nvim_create_user_command("DeleteHiddenBuffers", function()
    local tpbl = {}
    for _, val in ipairs(vim.fn.range(1, vim.fn.tabpagenr "$")) do
        for _, val2 in ipairs(vim.fn.tabpagebuflist(val)) do
            table.insert(tpbl, val2)
        end
    end
    for _, buf in ipairs(vim.fn.range(1, vim.fn.bufnr "$")) do
        if vim.fn.bufexists(buf) == 1 and vim.fn.index(tpbl, buf) == -1 then
            vim.cmd("bwipeout! " .. buf)
        end
    end
end, { force = true })

vim.api.nvim_create_user_command("DeleteEmptyBuffers", function()
    for _, buf in ipairs(vim.fn.range(1, vim.fn.bufnr "$")) do
        if vim.fn.buflisted(buf) ~= 0
            and vim.fn.empty(vim.fn.bufname(buf)) == 1
            and vim.fn.bufwinnr(buf) < 0
            and vim.fn.getbufvar(buf, "&mod") == 0
        then
            vim.cmd("bwipeout! " .. buf)
        end
    end
end, { force = true })
