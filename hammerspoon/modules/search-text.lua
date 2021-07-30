local function current_selection()
   local elem=hs.uielement.focusedElement()
   local sel=nil
   if elem then
      sel=elem:selectedText()
   end
   if (not sel) or (sel == "") then
      hs.eventtap.keyStroke({"cmd"}, "c")
      hs.timer.usleep(20000)
      sel=hs.pasteboard.getContents()
   else
      print("sel:" .. sel)
   end
   return (sel or "")
end

local function searchGoogle(text)
    if text ~= nil then
        if string.match(text, '^https?://') ~= nil then
            pcall(hs.urlevent.openURL, text)
        else
            pcall(hs.urlevent.openURL, "https://google.com/search?q=" .. text)
        end
    end
end

local function searchGithub(text)
    if text ~= nil then
        pcall(hs.urlevent.openURL, "https://github.com/" .. text)
    end
end

local function searchSelectedText()
    local text = current_selection()
    searchGoogle(text)
end

local UTI_TYPE = {
    IMAGE_TIFF = "public.tiff",
    IMAGE_PNG = "public.png",
    PLAIN_TEXT = "public.utf8-plain-text",
}

local function searchClipboardText()
    local contentTypes = hs.pasteboard.contentTypes()

    for _, uti in ipairs(contentTypes) do
        if uti == UTI_TYPE.PLAIN_TEXT then
            local text = hs.pasteboard.readString()
            if text ~= nil then
                searchGoogle(text)
                return
            end
        end
    end
end

hs.hotkey.bind(leader, "o", searchSelectedText)
hs.hotkey.bind(leader, "g", function()
    local text = current_selection()
    searchGithub(text)
end)
hs.hotkey.bind({ "alt", "shift" }, "o", searchClipboardText)
