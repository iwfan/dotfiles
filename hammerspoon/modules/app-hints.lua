hs.hints.style = "vimperator"
hs.hints.fontSize = 20
hs.hotkey.bind(
    leader, "Tab",
    function()
        hs.hints.windowHints(nil, nil, false)
    end
)
