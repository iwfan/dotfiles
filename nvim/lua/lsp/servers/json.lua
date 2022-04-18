return function(opts)
    opts.settings = {
        json = {
            schemas = require('schemastore').json.schemas(),
        },
    }
    return opts
end
