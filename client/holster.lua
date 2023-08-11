if not mx.Holster then
    return
end

if mx.Holster then

local holstered = true
local weapons = {
    "WEAPON_PISTOL",
    "WEAPON_COMBATPISTOL",
    "WEAPON_STUNGUN",
}

-- Laden der Animationen zu Beginn
Citizen.CreateThread(function()
    loadAnimDict("reaction@intimidation@1h")
    loadAnimDict("weapons@pistol_1h@gang")
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = PlayerPedId()
        if DoesEntityExist(ped) and not IsEntityDead(ped) and not IsPedInAnyVehicle(ped, true) then
            local currentWeapon = GetSelectedPedWeapon(ped)
            local hasWeapon = false
            for i = 1, #weapons do
                if GetHashKey(weapons[i]) == currentWeapon then
                    hasWeapon = true
                    break
                end
            end
            if hasWeapon and holstered then
                PlayAnim("reaction@intimidation@1h", "intro", 700)
                holstered = false
            elseif not hasWeapon and not holstered then
                PlayAnim("reaction@intimidation@1h", "outro", 700)
                holstered = true
            end
        end
    end
end)

function PlayAnim(dict, anim, duration)
    TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, 2.0, -1, 48, 2, 0, 0, 0)
    SetPlayerControl(PlayerId(), false, 256)
    Citizen.Wait(duration)
    SetPlayerControl(PlayerId(), true, 256)
    ClearPedTasks(PlayerPedId())
end

function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(0)
    end
end
