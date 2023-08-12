if not mx.RagDoll then
  return
end

if mx.Ragdoll then

local ragdoll = false
local shownHelp = false

Citizen.CreateThread(function()
	while ESX == nil do
		ESX = exports["es_extended"]:getSharedObject()
		Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if mx.stunShouldRagdoll and IsPedBeingStunned(GetPlayerPed(-1)) then
            ragdoll = true
        end

        -- Don't ragdoll if player is dead
        if IsPlayerDead(PlayerId()) and ragdoll == true then
            ragdoll = false
            shownHelp = false
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if ragdoll then
            SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
        end
    end
end)

RegisterNetEvent('MX-RagDoll:toggle')
AddEventHandler('MX-RagDoll:toggle', function()
    ragdoll = not ragdoll
    if not ragdoll then
        shownHelp = false
    end
end)

RegisterNetEvent('MX-RagDoll:set')
AddEventHandler('MX-RagDoll:set', function(value)
    ragdoll = value
    if not ragdoll then
        shownHelp = false
    end
end)

RegisterCommand(mx.RagDollCommand, function (src, args, raw)
    TriggerEvent("MX-RagDoll:toggle")
end, false)
