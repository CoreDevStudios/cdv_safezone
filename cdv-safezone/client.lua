local ESX = nil
local isInSafeZone = false
local currentSafeZone = nil

-- Wait for ESX to be initialized
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(10)
    end
end)

-- Check if player is in any of the safezones
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500) -- Check every 500 ms

        local playerPed = PlayerPedId()
        local playerPos = GetEntityCoords(playerPed)
        local inZone = false

        for _, zone in ipairs(Config.SafeZones) do
            local dist = Vdist(playerPos.x, playerPos.y, playerPos.z, zone.coords.x, zone.coords.y, zone.coords.z)
            if dist < zone.radius then
                inZone = true
                if not isInSafeZone or currentSafeZone ~= zone.name then
                    isInSafeZone = true
                    currentSafeZone = zone.name
                    if ESX then
                        ESX.ShowNotification("You have entered the safezone.", "error", 5000)
                    end
                end
                break
            end
        end

        if not inZone and isInSafeZone then
            isInSafeZone = false
            if ESX then
                ESX.ShowNotification("You have exited the safezone.", "error", 5000)
            end
        end
    end
end)

-- Disable weapons and fist combat in safezone (but allow sprinting and running)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0) -- Check every frame

        local playerPed = PlayerPedId()
        if isInSafeZone then
            -- Disable weapons and melee actions
            DisableControlAction(0, 24, true)  -- Attack (Left Mouse Button)
            DisableControlAction(0, 257, true) -- Attack 2 (Right Mouse Button / Fist)
            DisableControlAction(0, 142, true) -- Melee attack 1 (R)
            DisableControlAction(0, 143, true) -- Melee attack 2 (G)
            DisableControlAction(0, 37, true)  -- Weapon wheel (TAB)
        end
    end
end)