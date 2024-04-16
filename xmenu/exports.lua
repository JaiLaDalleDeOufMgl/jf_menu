exports('SendNUIMessage', function(input)
    SendNUIMessage(input)
end)

exports('RegisterNUICallback', function(name, cb)
    RegisterNUICallback(name, cb)
end)

exports('UnregisterRawNuiCallback', function(name)
    UnregisterRawNuiCallback(name)
end)

exports('SetNuiFocus', function(hasFocus, hasCursor)
    SetNuiFocus(hasFocus, hasCursor)
end)

exports('SetNuiFocusKeepInput', function(hasFocus)
    SetNuiFocusKeepInput(hasFocus)
end)