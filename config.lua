Config = {}

Config.WindowRoll = true -- disable if you already have a script allowing the players to roll down their windows.
Config.WindowRollCommand = "rollwindow"

Config.Locales = {
    ["notify"] = "You need to roll down your window before you can shoot out of it.",
}

Config.Notification = 'native' -- ox_lib, qb, esx or native. You can use your own notification system in the function below.

SendNotification = function(text)
	if Config.Notification == 'ox_lib' then
		lib.notify({title = text})
	elseif Config.Notification == 'qb' then
        	QBCore.Functions.Notify(text)
	elseif Config.Notification == 'esx' then
        	ESX.ShowNotification(text)
	elseif Config.Notification == 'native' then
        	AddTextEntry('notification', text)
        	BeginTextCommandThefeedPost('notification')
       		AddTextComponentSubstringPlayerName(text)
        	EndTextCommandThefeedPostTicker(true, true)
	end
end
