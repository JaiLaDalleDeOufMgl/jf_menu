
# xMenu

xMenu is a library written for FiveM and only uses NUI functionalities. This library allows you to create menus in FiveM. This project is open-source and you must respect the license and the hard work.

## Authors

- [@! J'ai Faim](https://github.com/jaiLaDalleDeOufMgl/)
- [@Treifaa](https://github.com/Treifaa)


## Features

- Simple button
- Simple separator
- Simple checkbox
- Simple slider

## Theme list preview

- [Default](https://cdn.discordapp.com/attachments/1227017307998388254/1229105354751606854/image.png?ex=662e7890&is=661c0390&hm=c3e53c9405e0f6b2b698b2daa36cb9d81b0c6e41bbe32ca6027a0110864416cf&) (Rework SOON)

## License

- [MIT](https://choosealicense.com/licenses/mit/)

## Roadmap

- List
- BoutonPanel
- ColorPanel
- StatisticPanel
- Heritage System
- New input system
- Theme RageUI
- Theme Sensity
- Rework default theme

## Documentation

#### Create a new menu

```lua
local main = xmenu.create("default", "This is a Title", { subtitle = "This is a Subtitle", description = "This is a description", itemsPerPage = 10})
```

| Parameter    | Type       | Description                            |
| :------------| :--------- | :------------------------------------- |
| `theme`      | `string`   | **Required**. Theme of the menu.       |
| `title`      | `string`   | **Required**. Title of the menu.      |
| `subtitle`   | `string`   | Optional subtitle of the menu.        |
| `description`| `string`   | Optional description of the menu.     |
| `banner`     | `string`   | Optional banner URL for the menu.     |
| `itemsPerPage`| `number`  | Optional number of items per page.    |

#### Render the menu

To display the created menu, use the `xmenu.render()` function:

```lua
xmenu.render(main, function()
    -- Add buttons, checkboxes, sliders, etc. here
end)
```

#### Add a button to the menu

```lua
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
```

| Parameter   | Type       | Description                              |
| :-----------| :--------- | :--------------------------------------- |
| `label`     | `string`   | Text displayed on the button.            |
| `style`     | `table`    | Optional style of the button.            |
| `action`    | `function` | Actions triggered when selected, hovered, or active. |

#### Add a separator to the menu

```lua
addSeparator("Separator")
```

| Parameter   | Type       | Description                              |
| :-----------| :--------- | :--------------------------------------- |
| `label`     | `string`   | Text displayed on the button.            |

#### Add a checkbox to the menu

```lua
addCheckbox("Checkbox", check, { description = "The best description checkbox" }, {
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
addSlider("Slider", 0, 100, slider, {description = "The best description slider"}, {
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
| `style`     | `table`    | Optional style of the slider.           |
| `action`    | `function` | Actions triggered when the value changes.|

#### Add action on close

```lua
onClose(function()
    print("Menu closed")
end)
```

| Parameter   | Type       | Description                              |
| :-----------| :--------- | :--------------------------------------- |
| `action`    | `function` | Actions triggered when the menu closes.  |

#### Add function to close menu

```lua
xmenu.close(main.id)
```

| Parameter | Type       | Description                              |
|:----------| :--------- | :--------------------------------------- |
| `id`      | `string`   | ID of the menu to close.                 |

## Feedback

If you have any feedback, please reach out to us at [Discord](https://discord.gg/kzusScAkXM)


## Support

For support, join our [Discord](https://discord.gg/kzusScAkXM).

