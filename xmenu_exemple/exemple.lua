local check = false
local slider = 0

local mainmenu = xmenu.create("default", "This is a Title", { subtitle = "This is a Subtitle", description = "This is a description", itemsPerPage = 10 })
local mainmenu_submenu = xmenu.create("default", "This is a submenu", { subtitle = "This is a Subtitle", description = "This is a description", itemsPerPage = 10 })

function main()
    xmenu.render(mainmenu, function()
        addButton("Button", { rightLabel = "Test Right Label", description = "The best description button" , panel = {title = "Panel Title", value = {{"Sultan","500$"}, {"SMG", "500$"}, {"Pistol", "500$"}}, image = "https://i.ibb.co/ZB0qzKy/Desktop-Screenshot2023-12-11-21-23-05-34.webp", statistics = {{"Max Speed", 75}, {"Damage", 50}, {"Range", 100}}} }, {
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
                check = state
                print(state)
            end
        })
        addSlider("Slider", 0, 100, slider, {description = "The best description slider"}, {
            onChange = function(data)
                slider = data.value
                print(slider, data.value)
            end
        })
        addLine()
        addList("List", {'index1', 'index2', 'index3'}, { description = "The best description list" }, {
            onSelected = function(index)
                print(index)
            end,
            onChange = function(index)
                print(index)
            end
        })
        addButton("SubMenu", { rightLabel = "Test Right Label", description = "The best description button" }, {
            onSelected = function()
                submenu()
            end
        })
        onClosed(function()
            print("closed")
        end)
    end)
end

function submenu()
    xmenu.render(mainmenu_submenu, function()
        addButton("Sub Button", { rightLabel = "Test Right Label", description = "The best description button" }, {})
        addSeparator("Sub Separator")
        addCheckbox("Sub Checkbox", check, { description = "The best description checkbox" }, {})
        onClosed(function()
            print("closed")
            main()
        end)
    end)
end

RegisterCommand('xmenu', function()
    main()
end)