
# xMenu

xMenu is a library written for FiveM and only uses NUI functionalities. This library allows you to create menus in FiveM. This project is open-source and you must respect the license and the hard work.

## Authors

- [@! J'ai Faim](https://github.com/jaiLaDalleDeOufMgl/)
- [@Treifaa](https://github.com/Treifaa)


## Features

- Simple button
- Simple checkbox
- Simple slider

## License

[MIT](https://choosealicense.com/licenses/mit/)


## Roadmap

- List
- Separator
- BoutonPanel
- ColorPanel
- StatisticPanel
- Heritage System

Got it! Let's adjust the documentation accordingly:

## Documentation

#### Create a new menu

```lua
local main = xmenu.create("This is a Title", { subtitle = "cocou", description = "This is a description", banner = "Your banner url" })
```

| Parameter    | Type       | Description                            |
| :------------| :--------- | :------------------------------------- |
| `title`      | `string`   | **Required**. Title of the menu.      |
| `subtitle`   | `string`   | Optional subtitle of the menu.        |
| `description`| `string`   | Optional description of the menu.     |
| `banner`     | `string`   | Optional banner URL for the menu.     |

#### Render the menu

To display the created menu, use the `xmenu.render()` function:

```lua
xmenu.render(main, function()
    -- Add buttons, checkboxes, sliders, etc. here
end)
```

#### Add a button to the menu

```lua
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
```

| Parameter   | Type       | Description                              |
| :-----------| :--------- | :--------------------------------------- |
| `label`     | `string`   | Text displayed on the button.            |
| `style`     | `table`    | Optional style of the button.            |
| `action`    | `function` | Actions triggered when selected, hovered, or active. |

#### Add a checkbox to the menu

```lua
addCheckbox("Label", check, {}, {
    onChange = function(state)
        print(state)
    end
})
```

| Parameter   | Type       | Description                                        |
| :-----------| :--------- | :------------------------------------------------- |
| `label`     | `string`   | Text displayed next to the checkbox.              |
| `default`   | `boolean`  | Initial state of the checkbox.                    |
| `style`     | `table`    | Optional style of the checkbox.                   |
| `action`    | `function` | Actions triggered when the state changes.         |

#### Add a slider to the menu

```lua
addSlider("Label", 0, 100, slider, {
    onChange = function(data)
        slider = data.value
        print(slider, data.value)
    end
})
```

| Parameter   | Type       | Description                              |
| :-----------| :--------- | :--------------------------------------- |
| `label`     | `string`   | Text displayed next to the slider.       |
| `min`       | `number`   | Minimum value of the slider.             |
| `max`       | `number`   | Maximum value of the slider.             |
| `value`     | `number`   | Initial value of the slider.             |
| `action`    | `function` | Actions triggered when the value changes.|


## Feedback

If you have any feedback, please reach out to us at [Discord](https://discord.gg/kzusScAkXM)


## Support

For support, join our [Discord](https://discord.gg/kzusScAkXM).

