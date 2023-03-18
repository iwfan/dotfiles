require("Comment").setup {
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
}

local ft = require "Comment.ft"
ft.set("json", { "//%s" })
ft.set("beancount", { ";%s" })
ft.set("scheme", { ";%s" })
ft.set("lua", { "--%s", "--[[%s]]--" })
