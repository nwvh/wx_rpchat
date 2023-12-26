ESX = exports["es_extended"]:getSharedObject()
local displayHeight = 1

RegisterNetEvent('wx_rpchat:sendMe')
AddEventHandler('wx_rpchat:sendMe', function(playerId, title, message, color)
    local source = GetPlayerServerId(PlayerId())
    local target = GetPlayerFromServerId(playerId)
    local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
    local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)
    if target == -1 then return end
    if target == source or GetDistanceBetweenCoords(sourceCoords, targetCoords, true) < 10 then
      TriggerEvent('chat:addMessage', {
        template = [[
          <div style="padding: 0.3vw; height: 1.5vw; margin: 0.5vw;  background-color: #222228ec; border-radius: 10px; padding-top: 0.35vw; border: 0.11vw solid #414146; box-shadow: 0px 0px 11px rgba(158, 158, 158, 0.35)">
          <font style="padding: 0.15vw; margin: 0.22vw; background-color: #626066; padding-left: 1%; border-radius: 8px; border: #9e9e9e solid 0.11vw; font-size: 12px; box-shadow: 0px 0px 11px rgba(158, 158, 158, 0.55)">
              <font style="font-weight: 600;">ID: {0}</font>
          </font>
          <font style="padding: 0.15vw; margin: 0.22vw; background-color: #B05DCB; padding-left: 1%; border-radius: 8px; border: #CD4DF7 solid 0.11vw; font-size: 12px; box-shadow: 0px 0px 11px rgba(200, 90, 225, 0.55)">
              <font style="font-weight: 600;">ME</font>
          </font>
          <font style="font-size: 14px; padding-left: 5px; color: #c7c5c5; margin: auto; font-weight:400">{1}:</font>
          <font class="message" style="font-size: 14px; color: #a8a7a7; margin: auto; font-weight:400"> {2}</font>
      </div>
        ]],
        args = { source,title, message }
      })
    end
end)

RegisterNetEvent('wx_rpchat:sendTry')
AddEventHandler('wx_rpchat:sendTry', function(playerId, title, message, color)
    local source = GetPlayerServerId(PlayerId())
    local target = GetPlayerFromServerId(playerId)
    local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
    local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

    if target == -1 then
        return
    end

    if target == source or GetDistanceBetweenCoords(sourceCoords, targetCoords, true) < 10 then
      TriggerEvent('chat:addMessage', {
        template = [[
          <div style="padding: 0.3vw; height: 1.5vw; margin: 0.5vw;  background-color: #222228ec; border-radius: 10px; padding-top: 0.35vw; border: 0.11vw solid #414146; box-shadow: 0px 0px 11px rgba(158, 158, 158, 0.35)">
          <font style="padding: 0.15vw; margin: 0.22vw; background-color: #626066; padding-left: 1%; border-radius: 8px; border: #9e9e9e solid 0.11vw; font-size: 12px; box-shadow: 0px 0px 11px rgba(158, 158, 158, 0.55)">
              <font style="font-weight: 600;">ID: {0}</font>
          </font>
          <font style="padding: 0.15vw; margin: 0.22vw; background-color: #42C1B1; padding-left: 1%; border-radius: 8px; border: #38E5CF solid 0.11vw; font-size: 12px; box-shadow: 0px 0px 11px rgba(77, 225, 225, 0.55)">
              <font style="font-weight: 600;">TRY</font>
          </font>
          <font style="font-size: 14px; padding-left: 5px; color: #c7c5c5; margin: auto; font-weight:400">{1}:</font>
          <font class="message" style="font-size: 14px; color: #a8a7a7; margin: auto; font-weight:400"> {2}</font>
      </div>
        ]],
        args = { source,title, message }
      })
    end
end)

RegisterNetEvent('wx_rpchat:sendDo')
AddEventHandler('wx_rpchat:sendDo', function(playerId, title, message, color)
  local source = GetPlayerServerId(PlayerId())
  local target = GetPlayerFromServerId(playerId)
  local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
  local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)
  if target == -1 then
    return
  end
  if target == source or GetDistanceBetweenCoords(sourceCoords, targetCoords, true) < 10 then
    TriggerEvent('chat:addMessage', {
      template = [[
        <div style="padding: 0.3vw; height: 1.5vw; margin: 0.5vw;  background-color: #222228ec; border-radius: 10px; padding-top: 0.35vw; border: 0.11vw solid #414146; box-shadow: 0px 0px 11px rgba(158, 158, 158, 0.35)">
        <font style="padding: 0.15vw; margin: 0.22vw; background-color: #626066; padding-left: 1%; border-radius: 8px; border: #9e9e9e solid 0.11vw; font-size: 12px; box-shadow: 0px 0px 11px rgba(158, 158, 158, 0.55)">
            <font style="font-weight: 600;">ID: {0}</font>
        </font>
        <font style="padding: 0.15vw; margin: 0.22vw; background-color: #D19035; padding-left: 1%; border-radius: 8px; border: #F0A53D solid 0.11vw; font-size: 12px; box-shadow: 0px 0px 11px rgba(255, 192, 50, 0.55)">
            <font style="font-weight: 600;">DO</font>
        </font>
        <font style="font-size: 14px; padding-left: 5px; color: #c7c5c5; margin: auto; font-weight:400">{1}:</font>
        <font class="message" style="font-size: 14px; color: #a8a7a7; margin: auto; font-weight:400"> {2}</font>
    </div>
      ]],
      args = { source,title, message }
    })
  end
end)

RegisterNetEvent('wx_rpchat:sendDoc')
AddEventHandler('wx_rpchat:sendDoc', function(playerId, title, message, color)
    local source = GetPlayerServerId(PlayerId())
    local target = GetPlayerFromServerId(playerId)
    local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
    local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

    if target == -1 then
        return
    end

    if target == source or GetDistanceBetweenCoords(sourceCoords, targetCoords, true) < 10 then
      TriggerEvent('chat:addMessage', {
        template = [[
          <div style="padding: 0.3vw; height: 1.5vw; margin: 0.5vw;  background-color: #222228ec; border-radius: 10px; padding-top: 0.35vw; border: 0.11vw solid #414146; box-shadow: 0px 0px 11px rgba(158, 158, 158, 0.35)">
          <font style="padding: 0.15vw; margin: 0.22vw; background-color: #626066; padding-left: 1%; border-radius: 8px; border: #9e9e9e solid 0.11vw; font-size: 12px; box-shadow: 0px 0px 11px rgba(158, 158, 158, 0.55)">
              <font style="font-weight: 600;">ID: {0}</font>
          </font>
          <font style="padding: 0.15vw; margin: 0.22vw; background-color: #DBAB3D; padding-left: 1%; border-radius: 8px; border: #F2BA3B solid 0.11vw; font-size: 12px; box-shadow: 0px 0px 11px rgba(255, 192, 50, 0.55)">
              <font style="font-weight: 600;">DOC</font>
          </font>
          <font style="font-size: 14px; padding-left: 5px; color: #c7c5c5; margin: auto; font-weight:400">{1}:</font>
          <font class="message" style="font-size: 14px; color: #a8a7a7; margin: auto; font-weight:400"> {2}</font>
      </div>
        ]],
        args = { source,title, message }
      })
    end
end)

local cooldown = false
RegisterNetEvent('wx_rpchat:sendLocalOOC')
AddEventHandler('wx_rpchat:sendLocalOOC', function(playerId, title, message, admin)
	local source = GetPlayerServerId(PlayerId())
	local target = GetPlayerFromServerId(playerId)
  local fal = GetPlayerName(PlayerId())
	if target ~= -1 then
    local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
    local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

    if targetPed == source or #(sourceCoords - targetCoords) < 10 then
      if admin then
        TriggerEvent('chat:addMessage', {
            template = [[
              <div style="padding: 0.3vw; height: 1.5vw; margin: 0.5vw;  background-color: #222228ec; border-radius: 10px; padding-top: 0.35vw; border: 0.11vw solid #414146; box-shadow: 0px 0px 11px rgba(158, 158, 158, 0.35)">
              <font style="padding: 0.15vw; margin: 0.22vw; background-color: #626066; padding-left: 1%; border-radius: 8px; border: #9e9e9e solid 0.11vw; font-size: 12px; box-shadow: 0px 0px 11px rgba(158, 158, 158, 0.55)">
                  <font style="font-weight: 600;">ID: {0}</font>
              </font>
              <font style="padding: 0.15vw; margin: 0.22vw; background-color: #626066; padding-left: 1%; border-radius: 8px; border: #9e9e9e solid 0.11vw; font-size: 12px; box-shadow: 0px 0px 11px rgba(158, 158, 158, 0.55)">
                  <font style="font-weight: 600;">L-OOC</font>
              </font>
              <font style="padding: 0.15vw; margin: 0.22vw; background-color: #922a2a; padding-left: 1%; border-radius: 8px; border: #c72f2f solid 0.11vw; font-size: 12px; box-shadow: 0px 0px 11px rgba(156, 21, 21, 0.55)">
                  <font style="font-weight: 600;">ADMIN</font>
              </font>
              <font style="font-size: 14px; padding-left: 5px; color: #c7c5c5; margin: auto; font-weight:400">{1}:</font>
              <font class="message" style="font-size: 14px; color: #a8a7a7; margin: auto; font-weight:400"> {2}</font>
          </div>
            ]],
            args = { playerId,title, message }
          })
        else
          TriggerEvent('chat:addMessage', {
            template = [[
              <div style="padding: 0.3vw; height: 1.5vw; margin: 0.5vw;  background-color: #222228ec; border-radius: 10px; padding-top: 0.35vw; border: 0.11vw solid #414146; box-shadow: 0px 0px 11px rgba(158, 158, 158, 0.35)">
              <font style="padding: 0.15vw; margin: 0.22vw; background-color: #626066; padding-left: 1%; border-radius: 8px; border: #9e9e9e solid 0.11vw; font-size: 12px; box-shadow: 0px 0px 11px rgba(158, 158, 158, 0.55)">
                  <font style="font-weight: 600;">ID: {0}</font>
              </font>
              <font style="padding: 0.15vw; margin: 0.22vw; background-color: #626066; padding-left: 1%; border-radius: 8px; border: #9e9e9e solid 0.11vw; font-size: 12px; box-shadow: 0px 0px 11px rgba(158, 158, 158, 0.55)">
                  <font style="font-weight: 600;">L-OOC</font>
              </font>
              <font style="font-size: 14px; padding-left: 5px; color: #c7c5c5; margin: auto; font-weight:400">{1}:</font>
              <font class="message" style="font-size: 14px; color: #a8a7a7; margin: auto; font-weight:400"> {2}</font>
          </div>
            ]],
            args = { playerId,title, message }
          })
        end
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

