local check = false
local slider = 0

local main = xmenu.create("This is a Title", { subtitle = "This is a Subtitle", description = "This is a description"})

RegisterCommand('xmenu', function()
    xmenu.render(main, function()
        addButton("Label", { rightLabel = "Test Right Label" }, {
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
        addCheckbox("Label", check, {}, {
            onChange = function(state)
                print(state)
            end
        })
        addSlider("Label", 0, 100, slider, {
            onChange = function(data)
                slider = data.value
                print(slider, data.value)
            end
        })
    end)
end)