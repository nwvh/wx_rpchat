local displayedMessages = {}
local stavwebhook = Webhooks['status']
local zdewebhook = Webhooks['here']

RegisterNetEvent('chat:SyncMessage')
AddEventHandler('chat:SyncMessage', function(message, coords)
    displayedMessages[coords] = message
    local discord = "Not Found"
    local ip = "Not Found"
    local steam = "Not Found"
    for k, v in pairs(GetPlayerIdentifiers(source)) do
      if string.sub(v, 1, string.len("steam:")) == "steam:" then
        steam = v
      elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
        discord = v
      elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
        ip = v
      end
    end
    log("**/here**", source,GetPlayerName(source), message.message.." - ["..message.coords.."]",steam,discord,ip,zdewebhook)
    TriggerClientEvent('chat:SetMessage', -1, message, coords)
end)

RegisterNetEvent('chat:removeDisplayedMessage')
AddEventHandler('chat:removeDisplayedMessage', function(coords)
    displayedMessages[coords] = nil
    TriggerClientEvent('chat:removeMessage', -1, coords)
end)

local playerStatus = {}

AddEventHandler('playerDropped', function (reason)
    for k, v in pairs(displayedMessages) do
        if v.owner == source then
            displayedMessages[k] = nil
            TriggerClientEvent('chat:removeMessage', -1, k)
        end
    end
    if playerStatus[source] then
        TriggerClientEvent('wx_rpchat:RemovePlayerStatus', -1, source)
    end
end)

RegisterCommand(wx.Commands['Status'], function(source, args, rawCommand)
    local ESX = exports["es_extended"]:getSharedObject()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local discord = "Not Found"
    local ip = "Not Found"
    local steam = "Not Found"
    for k, v in pairs(GetPlayerIdentifiers(source)) do
      if string.sub(v, 1, string.len("steam:")) == "steam:" then
        steam = v
      elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
        discord = v
      elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
        ip = v
      end
    end
    if xPlayer then
        if playerStatus[_source] then
            playerStatus[_source] = nil
            TriggerClientEvent('wx_rpchat:RemovePlayerStatus', -1, _source)
            Notify('Success',"You have removed your status")
        else
            local message = rawCommand:sub(6)
            playerStatus[_source] = message
            TriggerClientEvent('wx_rpchat:SetPlayerStatus', -1, _source, message)
            log("**/status**", source,GetPlayerName(source), message,steam,discord,ip,stavwebhook)
            Notify('Success',"You are now showing your status: "..message)
            local playerName = GetPlayerName(_source)
            local steam = GetPlayerIdentifiers(_source)[1]
        end
    end
end, false)

RegisterNetEvent('wx_rpchat:RequestMessages')
AddEventHandler('wx_rpchat:RequestMessages', function()
    TriggerClientEvent('wx_rpchat:SetMessages', source, displayedMessages, playerStatus)
end)
