ESX = exports["es_extended"]:getSharedObject()
local playerLoaded = false
Citizen.CreateThread(function()
    while ESX.GetPlayerData().job == nil do -- Wait for player to choose character
		Citizen.Wait(10)
	end
    playerLoaded = true
end)

local displayedMessages = {}

RegisterCommand(wx.Commands['Here'], function(source, args, rawCommand)
    if playerLoaded then
        local ped = PlayerPedId()
        local pedCoords = GetEntityCoords(ped)
        local roundedCoords = vector3(ESX.Math.Round(pedCoords.x), ESX.Math.Round(pedCoords.y), ESX.Math.Round(pedCoords.z))
        if not displayedMessages[roundedCoords] then
            local playerMessages = 0
            for k, v in pairs(displayedMessages) do -- Check for spam
                if v.owner == GetPlayerServerId(PlayerId()) then
                    playerMessages = playerMessages + 1
                end
            end

            if playerMessages > wx.MaxHereTexts then
                Notify('Error',"You can't place more than "..wx.MaxHereTexts..' texts')
            else
                local msg = ''
                for i = 1,#args do
                    msg = msg .. ' ' .. args[i]
                end
                local currentMessage = {
                    owner = GetPlayerServerId(PlayerId()),
                    coords = pedCoords,
                    message = msg
                }
                TriggerServerEvent('chat:SyncMessage', currentMessage, roundedCoords)
            end

        elseif displayedMessages[roundedCoords].owner == GetPlayerServerId(PlayerId()) then
            TriggerServerEvent('chat:removeDisplayedMessage', roundedCoords)
            Notify('Success','Text has been removed')
        else
            Notify('Error','Another text is already placed here')
        end
    else
        Notify('Error','You must be spawned')
    end
    
end, false)


RegisterNetEvent('chat:SetMessage')
AddEventHandler('chat:SetMessage', function(message, coords)

    displayedMessages[coords] = message

end)

RegisterNetEvent('chat:removeMessage')
AddEventHandler('chat:removeMessage', function(coords)

    displayedMessages[coords] = nil

end)

local playerStatuses = {}

RegisterNetEvent('wx_rpchat:SetMessages')
AddEventHandler('wx_rpchat:SetMessages', function(heres, statuses)

    playerStatuses = statuses
    displayedMessages = heres

end)

RegisterNetEvent('wx_rpchat:SetPlayerStatus')
AddEventHandler('wx_rpchat:SetPlayerStatus', function(playerId, message)

    playerStatuses[playerId] = message

end)

RegisterNetEvent('wx_rpchat:RemovePlayerStatus')
AddEventHandler('wx_rpchat:RemovePlayerStatus', function(playerId)

    playerStatuses[playerId] = nil

end)

Citizen.CreateThread(function()
    local myServerId = GetPlayerServerId(PlayerId())
    while true do
        Wait(0)
        local letSleep = true
        local pedCoords = GetEntityCoords(PlayerPedId())
        if playerStatuses[myServerId] then
            DrawText3DsS(pedCoords.x, pedCoords.y, pedCoords.z, playerStatuses[myServerId])
            letSleep = false
        end
        for k, v in pairs(playerStatuses) do
            local player = GetPlayerFromServerId(k)
            if player ~= -1 and player ~= myServerId then
                local targetCoords = GetEntityCoords(GetPlayerPed(player))
                local dist = #(targetCoords - pedCoords)
                if dist < 8.0 then
                    DrawText3DsS(targetCoords.x, targetCoords.y, targetCoords.z, v)
                    letSleep = false
                end
            end
        end
        if letSleep then
            Wait(500)
        end
    end
end)

Citizen.CreateThread(function()
    TriggerServerEvent('wx_rpchat:RequestMessages')
    while true do
        Wait(0)
        local letSleep = true
        local pedCoords = GetEntityCoords(PlayerPedId())
        for k, v in pairs(displayedMessages) do
            local dist = #(v.coords - pedCoords)
            if dist < 5.5 then
                letSleep = false
                DrawText3DsH(v.coords.x, v.coords.y, v.coords.z, v.message)
            end
        end
        if letSleep then Wait(135) end
    end

end)

function DrawText3DsH(x,y,z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local pX, pY, pZ = table.unpack(GetGameplayCamCoords())
    local font = fontId

    RegisterFontFile('BBN') -- název soubory gfx bez koncovky gfx
    fontId = RegisterFontId('BBN') -- nazev ktery jsme dávali do in.xml

    SetTextScale(0.55, 0.31)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextEntry("STRING")
    SetTextCentre(true)
    SetTextDropshadow(10, 100, 100, 100, 255)
    SetTextColour(255, 255, 255, 215)
    AddTextComponentString(text)
    
    DrawText(_x, _y)
    local factor = (string.len(text)) / 320
    DrawRect(_x,_y+0.0135, 0.025+ factor, 0.03, 0, 0, 0, 68)
end

function DrawText3DsS(x,y,z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local pX, pY, pZ = table.unpack(GetGameplayCamCoords())
    local font = fontId

    RegisterFontFile('BBN') -- název soubory gfx bez koncovky gfx
    fontId = RegisterFontId('BBN') -- nazev ktery jsme dávali do in.xml

    SetTextScale(0.55, 0.31)
    SetTextFont(fontId)
    SetTextProportional(1)
    SetTextEntry("STRING")
    SetTextCentre(true)
    SetTextDropshadow(10, 100, 100, 100, 255)
    SetTextColour(255, 255, 255, 215)
    AddTextComponentString(text)
    
    DrawText(_x, _y)
    local factor = (string.len(text)) / 320
    DrawRect(_x,_y+0.0135, 0.025+ factor, 0.03, 0, 0, 0, 68)
end