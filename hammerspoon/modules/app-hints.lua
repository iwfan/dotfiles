hs.hints.style = "vimperator"
hs.hints.fontSize = 20
hs.hotkey.bind(
    { "alt" }, "Tab",
    function()
        hs.hints.windowHints(nil, nil, false)
    end
)
