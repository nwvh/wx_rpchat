ESX = exports["es_extended"]:getSharedObject()
local cooldown = false
RegisterNetEvent('wx_rpchat:send')
AddEventHandler('wx_rpchat:send', function(id, name, message)
	local sourceID = PlayerId()
	local playerID = GetPlayerFromServerId(id)
	ESX.TriggerServerCallback('wx_rpchat:getPlayerGroup', function(pgroup)
		if not cooldown then
			cooldown = true
			Citizen.SetTimeout(15*1000,function ()
				cooldown = false
			end)
			if playerID == sourceID then
					if message == '' or message == nil then
						TriggerEvent('chat:addMessage', {
							template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(30, 30, 46, 0.45); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: #c1121f; border-radius: 2px; font-size: 15px;"> <i class="fa-solid fa-flag"></i> <b>REPORT</b></font><font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">Report content cannot be empty!</font></div>',
							args = { id, name, message }
						})
					else
						TriggerEvent('chat:addMessage', {
							template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(30, 30, 46, 0.45); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: #c1121f; border-radius: 2px; font-size: 15px;"> <i class="fa-solid fa-flag"></i> <b>REPORT</b></font><font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">Thank you for your report, we will try our best to resolve it asap! Your message: <strong>{2}</strong></font></div>',
							args = { id, name, message }
						})
					end
			elseif pgroup ~= "user" and playerID ~= sourceID and message ~= '' and message ~= nil then
				TriggerEvent('chat:addMessage', {
					template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(30, 30, 46, 0.45); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: #c1121f; border-radius: 2px; font-size: 15px;"> <i class="fa-solid fa-flag"></i> <b>REPORT</b></font> [{0}] <strong>{1}</strong>:  <font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">{2}</font></div>',
					args = { id, name, message }
				})
			end
		elseif cooldown and playerID == sourceID then
			TriggerEvent('chat:addMessage', {
				template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(30, 30, 46, 0.45); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: #c1121f; border-radius: 2px; font-size: 15px;"> <i class="fa-solid fa-triangle-exclamation"></i> <b>CHYBA</b></font><font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">You can send only one report every 15 seconds!</font></div>',
				args = {}
			})
		end
	end)
end)