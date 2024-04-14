local check = false
local slider = 0

local main = xmenu.create("default", "This is a Title", { subtitle = "This is a Subtitle", description = "This is a description", itemsPerPage = 10})

RegisterCommand('xmenu', function()
    xmenu.render(main, function()
        addButton("Button", { rightLabel = "Test Right Label", description = "The best description button" }, {
            onSelected = function()
                print("selected")
            end,
            onHovered = function()
                print("hovered")
            end,
            onActive = function()
                print("active")
            end
        })
        addSeparator("Separator")
        addCheckbox("Checkbox", check, { description = "The best description checkbox" }, {
            onChange = function(state)
                print(state)
            end
        })
        addSlider("Slider", 0, 100, slider, {description = "The best description slider"}, {
            onChange = function(data)
                slider = data.value
                print(slider, data.value)
            end
        })
    end)
end)