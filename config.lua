mx = {}

mx.WindowRoll = true -- disable if you already have a script allowing the players to roll down their windows.
mx.WindowRollCommand = "rollwindow"

mx.Locales = {
    ["notify"] = "You need to roll down your window before you can shoot out of it.",
}

mx.Notification = 'native' -- ox_lib, qb, esx or native. You can use your own notification system in the function below.

SendNotification = function(text)
	if mx.Notification == 'ox_lib' then
		lib.notify({title = text})
	elseif mx.Notification == 'qb' then
        	QBCore.Functions.Notify(text)
	elseif mx.Notification == 'esx' then
        	ESX.ShowNotification(text)
	elseif mx.Notification == 'native' then
        	AddTextEntry('notification', text)
        	BeginTextCommandThefeedPost('notification')
       		AddTextComponentSubstringPlayerName(text)
        	EndTextCommandThefeedPostTicker(true, true)
	end
end
