----------------------- [ xMenu ] -----------------------
-- GitHub: https://github.com/JaiLaDalleDeOufMgl/xmenu
-- License: MIT https://choosealicense.com/licenses/mit/
-- Author: (! J'ai Faim) (Treifaa)
-- Name: xMenu
-- Version: 0.0.5
-- Description: This library allows you to create menus in FiveM.
----------------------- [ xMenu ] -----------------------

fx_version "cerulean"
game "gta5"
name 'xMenu'
version '0.0.5'
description 'This library allows you to create menus in FiveM.'
author '(! J\'ai Faim) (Treifaa)'
contact 'https://discord.gg/kzusScAkXM'
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