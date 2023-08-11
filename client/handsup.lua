local handsup = false

local function HandsUpAnimation()
    local playerPed = PlayerPedId()
    local RequestAnimDict = RequestAnimDict
    local HasAnimDictLoaded = HasAnimDictLoaded
    local TaskPlayAnim = TaskPlayAnim
    
    RequestAnimDict('anim@move_hostages@mal')
    while not HasAnimDictLoaded('anim@move_hostages@mal') do
        Citizen.Wait(0)
    end

    TaskPlayAnim(playerPed, "anim@move_hostages@male", "male_idle", 8.0, 8.0, 1.0, 50, 0, 0, 0, 0)
end

RegisterCommand(mx.HandsUpCommand, function ()
    local IsPedInAnyVehicle = IsPedInAnyVehicle
    local IsPedArmed = IsPedArmed
    local playerPed = PlayerPedId()

    if IsPedInAnyVehicle(playerPed, false) then ESX.ShowNotification('You cannot perform this action while in the vehicle') return end
    if IsPedArmed(playerPed, 7) then ESX.ShowNotification('You cannot perform this action while armed') return end

    if handsup then
        handsup = false
        ClearPedTasks(playerPed)
    else
        handsup = true
        HandsUpAnimation()
    end    
end, false)

RegisterKeyMapping('handsup', 'Hands Up', 'keyboard', mx.HandUpKeyBind)

