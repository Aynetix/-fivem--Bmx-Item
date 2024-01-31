-- Script client pour utiliser et ranger le BMX depuis l'inventaire
local isBMXInUse = false

RegisterNetEvent("useBMXItem")
AddEventHandler("useBMXItem", function()
    local ped = GetPlayerPed(-1)

    RequestModel("bmx")

    while not HasModelLoaded("bmx") do
        Wait(500)
    end

    local x, y, z = table.unpack(GetEntityCoords(ped))

    local bmx = CreateVehicle("bmx", x, y, z, GetEntityHeading(ped), true, false)

    TaskWarpPedIntoVehicle(ped, bmx, -1)

    SetModelAsNoLongerNeeded("bmx")

    isBMXInUse = true

    local timeLeft = 60  --temps en seconde modifiable

    while isBMXInUse and timeLeft > 0 do
        Wait(1000)
        timeLeft = timeLeft - 1
        TriggerEvent("chatMessage", "SYSTEM", {255, 0, 0}, "Temps restant avant le rangement du BMX : " .. timeLeft .. " secondes.")
    end

    if isBMXInUse then
        isBMXInUse = false


        if DoesEntityExist(bmx) then
            DeleteVehicle(bmx)    
            TriggerServerEvent('terapia_bmxitem:givebmx')

        end
    end
end)

