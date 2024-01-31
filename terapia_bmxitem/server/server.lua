local bmxItemId = "bmx_item"


ESX.RegisterUsableItem(bmxItemId, function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        xPlayer.removeInventoryItem(bmxItemId, 1)
        TriggerClientEvent("useBMXItem", source)
    end
end)

RegisterNetEvent('terapia_bmxitem:givebmx')
AddEventHandler('terapia_bmxitem:givebmx', function()
    local item = "bmx_item"
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        xPlayer.addInventoryItem(item, 1)
        
    end
end)