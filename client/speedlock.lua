if not mx.SpeedLock then
  return
end

if mx.SpeedLock then 
  
  local speedLock = false
RegisterKeyMapping(mx.LockSpeedCommand, 'Speed limiter', 'keyboard', mx.LockSpeedKeyBind)
RegisterCommand(mx.LockSpeedCommand, function()
    local inVeh = IsPedInAnyVehicle(PlayerPedId(), false)
    if not speedLock and inVeh then
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        local speed = GetEntitySpeed(vehicle)
        SetVehicleMaxSpeed(vehicle, speed)
        speedLock = true
    elseif speedLock and inVeh then
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        SetVehicleMaxSpeed(vehicle, 0)
        speedLock = false
    end
end)
