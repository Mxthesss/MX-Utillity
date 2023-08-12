mx = {}

-- Functions Config

mx.Window = true -- This enabled the function true/false
mx.Finger = true
mx.HandsUp = true
mx.Holster = true
mx.Optimize = true
mx.Changelog = true
mx.NoWeaponReward = true
mx.NoMoreWeaponsOnNPC = true
mx.NoMoreCopNPC = true
mx.NoMoreScope = true
mx.NoLicense = true
mx.NoDrivingCopCar = false
mx.FixTraffic = true
mx.DisableCombatsByR = true
mx.Carry = true
mx.RagDoll = true

------------------------------------------------------------------------------------------------------------------------------------------

-- Rag Doll

mx.RagDollCommand = "rag"
mx.stunShouldRagdoll = true

-- Carry

mx.CarryCommand = "carry"

-- Fix Traffic

To change something in this you need to go client/fixtraffic.lua


-- ChangeLogs

mx.ChangeLogsCommand = 'changelogs'

-- HandsUp

mx.HandsUpCommand = 'handsup'
mx.HandUpKeyBind = 'x'

-- Finger Pointing

mx.FingePoinCommand = 'finger'
mx.FingerPoinKeyBind = 'b'

-- Window roll

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

------------------------------------------------------------------------------------------------------------------------------------------
