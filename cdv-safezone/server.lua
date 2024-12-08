-- Server-side logic is not needed for basic safezone functionality, 
-- but can be used to handle any custom server-side rules, such as logging player movements.

RegisterNetEvent('safezone:enter')
AddEventHandler('safezone:enter', function(zoneName)
    print("Player entered SafeZone: " .. zoneName)
end)

RegisterNetEvent('safezone:exit')
AddEventHandler('safezone:exit', function(zoneName)
    print("Player exited SafeZone: " .. zoneName)
end)