if not mx.NoWeaponReward then
  return
end

if mx.NoWeaponReward then
  
  Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		DisablePlayerVehicleRewards(PlayerId())
	end
end)
