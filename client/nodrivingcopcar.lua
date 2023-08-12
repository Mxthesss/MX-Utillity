if not mx.NoDrivingCopCar then
  return
end

if mx.NoDrivingCopCar then

  Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedInAnyPoliceVehicle(GetPlayerPed(PlayerId())) then
            local veh = GetVehiclePedIsUsing(GetPlayerPed(PlayerId()), false)
            if (GetPedInVehicleSeat(veh, -1) == GetPlayerPed(PlayerId())) then
                if (PlayerData.job ~= nil and (PlayerData.job.name ~= 'police' or PlayerData.job.name ~= 'ambulance')) or PlayerData.job.name ~= 'sheriff')) or PlayerData.job.name ~= 'fbi')) or PlayerData.job.name ~= 'government'))  then
                  ESX.ShowNotification("A police car is not just for civilians.")
                  SetVehicleUndriveable(veh, true)
                end
            end
        end
    end
end)
