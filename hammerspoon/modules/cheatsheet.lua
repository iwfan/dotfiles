if spoon.KSheet then
    spoon.ModalMgr:new("cheatsheetM")
    local cmodal = spoon.ModalMgr.modal_list["cheatsheetM"]
    cmodal:bind("", "escape", "Deactivate cheatsheetM", function()
        spoon.KSheet:hide()
        spoon.ModalMgr:deactivate({ "cheatsheetM" })
    end)
    cmodal:bind("", "Q", "Deactivate cheatsheetM", function()
        spoon.KSheet:hide()
        spoon.ModalMgr:deactivate({ "cheatsheetM" })
    end)

    -- Register cheatsheetM with modal supervisor
    local hscheats_keys = { hyper, "S" }
    if string.len(hscheats_keys[2]) > 0 then
        spoon.ModalMgr.supervisor:bind(hscheats_keys[1], hscheats_keys[2], "Enter cheatsheetM Environment", function()
            spoon.KSheet:show()
            spoon.ModalMgr:deactivateAll()
            spoon.ModalMgr:activate({ "cheatsheetM" })
        end)
    end
end
