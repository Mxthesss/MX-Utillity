if not mx.Changelog then
    return
end

if mx.Changelog then

RegisterCommand('changelogs', function()
  SetNuiFocus(true, true)
  SendNUIMessage({
    action = "changelogs",
  })
end)

RegisterNUICallback('Close', function(data, cb)
  SetNuiFocus(false, false)
end)
