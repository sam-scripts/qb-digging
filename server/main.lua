local QBCore = exports['qb-core']:GetCoreObject()

-- Shovel Item
QBCore.Functions.CreateUseableItem('shovel', function(source)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player or not Player.Functions.GetItemByName('shovel') then return end
        TriggerClientEvent('qb-digging:useshovel', source)
end)

-- Give Item 
RegisterNetEvent('qb-digging:reward', function()
local Player = QBCore.Functions.GetPlayer(source)
	if not Player then return end
    local randomItem = Config.Rewards[math.random(1, #Config.Rewards)]
	Player.Functions.AddItem(randomItem, 1)
    TriggerClientEvent('qb-inventory:client:ItemBox', source, QBCore.Shared.Items[randomItem], 'add')
end)