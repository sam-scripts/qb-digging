local QBCore = exports['qb-core']:GetCoreObject()

--// Variables
local player = PlayerPedId()
local inDiggingArea = false

-- Blip
Citizen.CreateThread(function()                                                   
local diggingBlip = AddBlipForCoord(vector3(-2126.12, -491.87, 3.09))
SetBlipScale(diggingBlip, 1.0)
SetBlipSprite(diggingBlip, 676)
SetBlipColour(diggingBlip, 5)
SetBlipCategory(diggingBlip, 1)
BeginTextCommandSetBlipName("Digging Area")
EndTextCommandSetBlipName(diggingBlip)
end)

-- Digging Area
local digging_area = BoxZone:Create(vector3(-2125.14, -491.77, 3.09), 46.6, 21.8, {
    name="DiggingAreaZone",
    heading=33,
    debugPoly=false,
    minZ=1.69,
    maxZ=5.69
  })

  digging_area:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
    if isPointInside then
    inDiggingArea = true
    else
    inDiggingArea = false
    end
end)

-- Shovel Use
RegisterNetEvent("qb-digging:useshovel", function()
    if inDiggingArea == true then
        if IsPedInAnyVehicle(PlayerPedId()) then
            local vehicle = GetVehiclePedIsIn(PlayerPedId())
        
            if GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() then
                QBCore.Functions.Notify("Leave vehicle before digging!", "error", 2000)
            end
            else
        TaskStartScenarioInPlace(player, "WORLD_HUMAN_GARDENER_PLANT", 1, true)
        QBCore.Functions.Progressbar('digging_inprogress', "Digging...", Config.DigTime, false, true)
        Citizen.Wait(Config.DigTime)
        ClearPedTasks(player)
        TriggerServerEvent("qb-digging:reward")
        end
    end
    if inDiggingArea == false then
        return
    end
end)
