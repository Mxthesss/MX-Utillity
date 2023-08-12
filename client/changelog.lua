if not mx.Changelog then
    return
end

if mx.Changelog then

RegisterCommand(mx.ChangeLogsCommand, function()
  SetNuiFocus(true, true)
  SendNUIMessage({
    action = "changelogs",
  })
end)

RegisterNUICallback('Close', function(data, cb)
  SetNuiFocus(false, false)
end)
