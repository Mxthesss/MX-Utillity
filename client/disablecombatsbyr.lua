if not mx.DisableCombatsByR then
  return
end

if mx.DisableCombatsByR then

  CreateThread(function()
  local ped, sleep;
   while (true) do
     sleep, ped = 1500, PlayerPedId();
    if not ((IsPedArmed(ped, 1)) and (GetSelectedPedWeapon(ped) ~= `WEAPON_UNARMED`)) then
        sleep = 0;
        DisableControlAction(0, 140, true);
        DisableControlAction(0, 141, true);
        DisableControlAction(0, 142, true);
     end
   Wait(sleep);
  end
end)
