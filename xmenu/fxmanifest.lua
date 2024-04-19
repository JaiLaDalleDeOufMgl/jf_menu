----------------------- [ xMenu ] -----------------------
-- GitHub: https://github.com/JaiLaDalleDeOufMgl/xmenu
-- License: MIT https://choosealicense.com/licenses/mit/
-- Author: ! J'ai Faim
-- Name: xMenu
-- Version: 0.0.8
-- Description: This library allows you to create menus in FiveM.
----------------------- [ xMenu ] -----------------------

fx_version "cerulean"
game "gta5"
name 'xMenu'
version '0.0.8'
description 'This library allows you to create menus in FiveM.'
author '! J\'ai Faim'
contact 'https://discord.gg/jaifaim'
url 'https://github.com/JaiLaDalleDeOufMgl/xmenu'
license 'MIT'

ui_page "web/dist/index.html"

files {
    "web/dist/index.html",
    "web/dist/**/*"
}

client_scripts {
    "exports.lua",
    "xmenu.lua",
}