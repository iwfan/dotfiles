local function current_selection()
    local elem = hs.uielement.focusedElement()
    local sel = nil
    if elem then
        sel = elem:selectedText()
    end
    if (not sel) or (sel == "") then
        hs.eventtap.keyStroke({ "cmd" }, "c")
        hs.timer.usleep(20000)
        sel = hs.pasteboard.getContents()
    else
        print("sel:" .. sel)
    end
    return (sel or "")
end

local function searchGoogle(text)
    if text ~= nil or text ~= "" then
        if string.match(text, "^https?://") ~= nil then
            pcall(hs.urlevent.openURL, hs.http.encodeForQuery(text))
        else
            pcall(hs.urlevent.openURL, "https://google.com/search?q=" .. hs.http.encodeForQuery(text))
        end
    end
end

local function searchGithub(text)
    if text ~= nil or text ~= "" then
        pcall(hs.urlevent.openURL, "https://github.com/" .. hs.http.encodeForQuery(text))
    end
end

local function searchClipboardText()
    local text = hs.pasteboard.getContents()
    if text ~= nil or text ~= "" then
        searchGoogle(text)
        return
    end
end

hs.hotkey.bind(LEADER, "o", function()
    local text = current_selection()
    print("GOOGLE SEARCH", text)
    if text ~= nil or text ~= "" then
        searchGoogle(text)
    else
        searchClipboardText()
    end
end)
hs.hotkey.bind(LEADER, "g", function()
    local text = current_selection()
    searchGithub(text)
end)
