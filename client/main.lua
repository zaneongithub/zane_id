local display = false

RegisterCommand('toggleID', function()
end, false)

RegisterKeyMapping('toggleID', 'Toggle Player IDs', 'keyboard', 'Z') 

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)

    if onScreen then
        SetTextScale(0.35, 0.35) 
        SetTextFont(0) 
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215) 
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry('STRING')
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)

        local factor = (string.len(text)) / 450 
        DrawRect(_x, _y + 0.0125, 0.018 + factor, 0.035, 0, 0, 0, 150) 
    end
end

Citizen.CreateThread(function()
    while true do
        Wait(0)
        if IsControlPressed(0, 20) then 
            local players = GetActivePlayers()
            for i = 1, #players do
                local player = players[i]
                local ped = GetPlayerPed(player)
                local playerCoords = GetEntityCoords(ped)
                local playerId = GetPlayerServerId(player)

                DrawText3D(playerCoords.x, playerCoords.y, playerCoords.z + 1.2, tostring(playerId))
            end
        end
    end
end)