# xMenu

xMenu is a library written for FiveM and only uses NUI functionalities. This library allows you to create menus in FiveM. This project is open-source and you must respect the license and the hard work.

## Authors

- [@! J'ai Faim](https://github.com/jaiLaDalleDeOufMgl/)

## Features

- Simple button
- Simple separator
- Simple checkbox
- Simple slider

## Theme list preview

- [Default](https://ibb.co/nPKCfLY)
- [Sensity](https://ibb.co/0M4jr86)
- [RageUI](https://ibb.co/r0RbSHx)

## License

- [MIT](https://choosealicense.com/licenses/mit/)

## Roadmap

- List
- BoutonPanel
- ColorPanel
- StatisticPanel
- Heritage System
- New input system

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

#### Add a line to the menu

```lua
addLine()
```

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

#### Add a list to the menu

```lua
addList("List", {'index1', 'index2', 'index3'}, { description = "The best description list" }, {
    onSelected = function(index)
        print(index)
    end,
    onChange = function(index)
        print(index)
    end
})
```

| Parameter   | Type       | Description                              |
| :-----------| :--------- | :--------------------------------------- |
| `label`     | `string`   | Text displayed next to the list.         |
| `items`     | `table`    | List of items in the list.               |
| `style`     | `table`    | Optional style of the list.              |
| `action`    | `function` | Actions triggered when an item is selected or the value changes.|

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

#### use this function to get state of the menu

```lua
xmenu.getState()
```
| Return | Type       | Description                              |
|:-------| :--------- | :--------------------------------------- |
| `bool` | `boolean`  | Return true if a menu is open.           |

## Feedback

If you have any feedback, please reach out to us at [Discord](https://discord.gg/jaifaim)


## Support

For support, join our [Discord](https://discord.gg/jaifaim).

