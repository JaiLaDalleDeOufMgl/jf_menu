xmenu = {}
xmenu.cache = {}

function xmenu.uuid()
    local uuid = ''
    for ii = 0, 31 do
        if ii == 8 or ii == 20 then
            uuid = uuid .. '-'
            uuid = uuid .. string.format('%x', math.floor(math.random() * 16))
        elseif ii == 12 then
            uuid = uuid .. '-'
            uuid = uuid .. '4'
        elseif ii == 16 then
            uuid = uuid .. '-'
            uuid = uuid .. string.format('%x', math.floor(math.random() * 4) + 8)
        else
            uuid = uuid .. string.format('%x', math.floor(math.random() * 16))
        end
    end
    return uuid
end

function xmenu.state(state, data)
    exports['xmenu']:SendNUIMessage({
        action = 'toggle',
        data = {
            component = "xmenu",
            bool = state,
            data = data or {}
        }
    })
end

function xmenu.update(data)
    exports['xmenu']:SendNUIMessage({
        action = 'data',
        data = data or {}
    })
end

function xmenu.create(theme, title, style)
    local id = xmenu.uuid()
    xmenu.cache[id] = {
        id = id,
        theme = theme or "default",
        banner = style.banner or false,
        title = title or "",
        subtitle = style.subtitle or "",
        description = style.description or "",
        itemsPerPage = style.itemsPerPage or 10,
        active = false,
    }
    return xmenu.cache[id]
end

function xmenu.render(menu, callback)
    local open = false
    CreateThread(function()
        if xmenu.cache[menu.id].active then
            return
        end
        xmenu.cache[menu.id].active = true
        while xmenu.cache[menu.id].active do

            xmenu.cache[menu.id].items = {}

            addButton = function(label, style, action)
                local id = xmenu.uuid()
                table.insert(xmenu.cache[menu.id].items, {
                    type = "button",
                    id = id,
                    label = label,
                    style = style or {},
                })
                exports['xmenu']:RegisterNUICallback("onSelected:"..id, function()
                    return action and action.onSelected and action.onSelected()
                end)
                exports['xmenu']:RegisterNUICallback("onHovered:"..id, function()
                    return action and action.onHovered and action.onHovered()
                end)
                exports['xmenu']:RegisterNUICallback("onActive:"..id, function()
                    return action and action.onActive and action.onActive()
                end)
            end

            addSeparator = function(label)
                local id = xmenu.uuid()
                table.insert(xmenu.cache[menu.id].items, {
                    type = "separator",
                    id = id,
                    label = label,
                })
            end

            addCheckbox = function(label, default, style, action)
                local id = xmenu.uuid()
                table.insert(xmenu.cache[menu.id].items, {
                    type = "checkbox",
                    id = id,
                    default = default or false,
                    label = label,
                    style = style or {},
                })
                exports['xmenu']:RegisterNUICallback("onChange:"..id, function(state)
                    return action and action.onChange and action.onChange(state)
                end)
            end

            addSlider = function(label, min, max, value, style, action)
                local id = xmenu.uuid()
                table.insert(xmenu.cache[menu.id].items, {
                    type = "slider",
                    id = id,
                    min = min or 0,
                    max = max or 100,
                    value = value or 0,
                    style = style or {},
                    label = label,
                })
                exports['xmenu']:RegisterNUICallback("onChange:"..id, function(value)
                    return action and action.onChange and action.onChange(value)
                end)
            end

            onClosed = function(action)
                xmenu.cache[menu.id].onClosed = action
            end

            if callback then
                callback(xmenu.cache)
            end

            exports['xmenu']:RegisterNUICallback('onClose:'..menu.id, function()
                xmenu.close(menu.id)
            end)
            exports['xmenu']:SetNuiFocus(true, false)
            exports['xmenu']:SetNuiFocusKeepInput(true)
            if not open then
                xmenu.state(true, {
                    id = menu.id,
                    banner = xmenu.cache[menu.id].banner,
                    theme = xmenu.cache[menu.id].theme,
                    title = xmenu.cache[menu.id].title,
                    subtitle = xmenu.cache[menu.id].subtitle,
                    description = xmenu.cache[menu.id].description,
                    item = xmenu.cache[menu.id].items,
                    itemsPerPage = xmenu.cache[menu.id].itemsPerPage
                })
                open = true
            end
            xmenu.update({
                id = menu.id,
                banner = xmenu.cache[menu.id].banner,
                theme = xmenu.cache[menu.id].theme,
                title = xmenu.cache[menu.id].title,
                subtitle = xmenu.cache[menu.id].subtitle,
                description = xmenu.cache[menu.id].description,
                item = xmenu.cache[menu.id].items,
                itemsPerPage = xmenu.cache[menu.id].itemsPerPage
            })
            Wait(115)
        end
    end)

    function xmenu.close(id)
        if xmenu.cache[id] and xmenu.cache[id].active then
            xmenu.cache[id].active = false
            xmenu.state(false)
            exports['xmenu']:SetNuiFocus(false, false)
            exports['xmenu']:SetNuiFocusKeepInput(false)
            for k, v in pairs(xmenu.cache[menu.id].items) do
                exports['xmenu']:UnregisterRawNuiCallback('onSelected:' .. v.id)
                exports['xmenu']:UnregisterRawNuiCallback('onHovered:' .. v.id)
                exports['xmenu']:UnregisterRawNuiCallback('onActive:' .. v.id)
                exports['xmenu']:UnregisterRawNuiCallback('onChange:' .. v.id)
            end
            if xmenu.cache[id].onClosed then
                xmenu.cache[id].onClosed()
            end
        end
    end
    
end