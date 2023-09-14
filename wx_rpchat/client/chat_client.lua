ESX = exports["es_extended"]:getSharedObject()
local displayHeight = 1

RegisterNetEvent('wx_rpchat:sendMe')
AddEventHandler('wx_rpchat:sendMe', function(playerId, title, message, color)
    local source = PlayerId()
    local target = GetPlayerFromServerId(playerId)
    local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
    local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)
    if target == -1 then return end
    if target == source or GetDistanceBetweenCoords(sourceCoords, targetCoords, true) < 10 then
      TriggerEvent('chat:addMessage', {
        template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(30, 30, 46, 0.45); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: #ef476f; border-radius: 2px; font-size: 15px;"> <i class="fa-solid fa-user"></i> <b>ME</b></font> <strong>{0}</strong>:  <font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">{1}</font></div>',
        args = { title, message }
      })
    end
end)

RegisterNetEvent('wx_rpchat:sendTry')
AddEventHandler('wx_rpchat:sendTry', function(playerId, title, message, color)
    local source = PlayerId()
    local target = GetPlayerFromServerId(playerId)
    local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
    local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

    if target == -1 then
        return
    end

    if target == source or GetDistanceBetweenCoords(sourceCoords, targetCoords, true) < 10 then
      TriggerEvent('chat:addMessage', {
        template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(30, 30, 46, 0.45); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: #38a3a5; border-radius: 2px; font-size: 15px;"> <i class="fa-solid fa-dice"></i> <b>TRY</b></font> <strong>{0}</strong>:  <font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">{1}</font></div>',
        args = { title, message }
      })
    end
end)

RegisterNetEvent('wx_rpchat:sendDo')
AddEventHandler('wx_rpchat:sendDo', function(playerId, title, message, color)
  local source = PlayerId()
  local target = GetPlayerFromServerId(playerId)
  local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
  local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)
  if target == -1 then
    return
  end
  if target == source or GetDistanceBetweenCoords(sourceCoords, targetCoords, true) < 10 then
    TriggerEvent('chat:addMessage', {
      template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(30, 30, 46, 0.45); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: #0077b6; border-radius: 2px; font-size: 15px;"> <i class="fa-solid fa-user"></i> <b>DO</b></font> <strong>{0}</strong>:  <font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">{1}</font></div>',
      args = { title, message }
    })
  end
end)

RegisterNetEvent('wx_rpchat:sendDoc')
AddEventHandler('wx_rpchat:sendDoc', function(playerId, title, message, color)
    local source = PlayerId()
    local target = GetPlayerFromServerId(playerId)
    local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
    local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

    if target == -1 then
        return
    end

    if target == source or GetDistanceBetweenCoords(sourceCoords, targetCoords, true) < 10 then
      TriggerEvent('chat:addMessage', {
        template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(30, 30, 46, 0.45); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: #38a3a5; border-radius: 2px; font-size: 15px;"> <i class="fa-solid fa-user-clock"></i> <b>DOC</b></font> <strong>{0}</strong>:  <font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">{1}</font></div>',
        args = { title, message }
      })
    end
end)

local cooldown = false
RegisterNetEvent('wx_rpchat:sendLocalOOC')
AddEventHandler('wx_rpchat:sendLocalOOC', function(playerId, title, message, color)
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)
  local fal = GetPlayerName(source)
	if target ~= -1 then
    local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
    local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

    if targetPed == source or #(sourceCoords - targetCoords) < 10 then
      TriggerEvent('chat:addMessage', {
          template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(30, 30, 46, 0.45); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: #1D5D9B; border-radius: 2px; font-size: 15px;"> <i class="fa-solid fa-comments"></i> <b>L-OOC</b></font> <strong>{0}</strong>:  <font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">{1}</font></div>',
          args = { title, message }
        })
    end
end
end)


RegisterNetEvent('wx_rpchat:getCoords')
AddEventHandler('wx_rpchat:getCoords', function(player)
	  local ped = PlayerPedId()
    local coords = GetEntityCoords(ped, false)
    local heading = GetEntityHeading(ped)

    local message = tostring("X: " .. coords.x .. " Y: " .. coords.y .. " Z: " .. coords.z .. " HEADING: " .. heading)
    TriggerServerEvent('wx_rpchat:showCoord', player, message)

end)


RegisterNetEvent('3dme:triggerDisplay')
AddEventHandler('3dme:triggerDisplay', function(text, source)
    local offsetme = 2.04 + (displayHeight*0.15)
    if GetPlayerFromServerId(source) ~= -1 then
      DisplayMe(GetPlayerFromServerId(source), text, offsetme)
    end
end)


RegisterNetEvent('3ddo:triggerDisplay')
AddEventHandler('3ddo:triggerDisplay', function(text, source)
    local offsetdo = 1.34 + (displayHeight*0.15)
    if GetPlayerFromServerId(source) ~= -1 then
    DisplayDo(GetPlayerFromServerId(source), text, offsetdo)
    end
end)

RegisterNetEvent('3ddoa:triggerDisplay')
AddEventHandler('3ddoa:triggerDisplay', function(text, source)
    local offsetdoa = 1.29 + (displayHeight*0.15)
    if GetPlayerFromServerId(source) ~= -1 then
    DisplayDoa(GetPlayerFromServerId(source), text, offsetdoa)
    end
end)

