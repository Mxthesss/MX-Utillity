if not mx.NoLicence then
  return
end

if mx.NoLicense then
  
  Citizen.CreateThread(function()
    while true do

        local ownedLicenses = {}

        for i=1, #Licenses, 1 do
          ownedLicenses[Licenses[i].type] = true
        end

        Citizen.Wait(1)
        if(IsPedInAnyVehicle(GetPlayerPed(-1), false)) and (not ownedLicenses['dmv'] or not ownedLicenses['drive']) and CurrentTest ~= 'drive' then
          DrawMissionText("~r~You are driving without a license", 2000)
        end

    end
end)
