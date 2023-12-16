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
							template = [[
								<div style="padding: 0.3vw; height: 1.5vw; margin: 0.5vw;  background-color: #222228ec; border-radius: 10px; padding-top: 0.35vw; border: 0.11vw solid #414146; box-shadow: 0px 0px 11px rgba(158, 158, 158, 0.35)">
								<font style="padding: 0.15vw; margin: 0.22vw; background-color: #922a2a; padding-left: 1%; border-radius: 8px; border: #c72f2f solid 0.11vw; font-size: 12px; box-shadow: 0px 0px 11px rgba(156, 21, 21, 0.55)">
									<font style="font-weight: 600;">ERROR</font>
								</font>
								<font style="font-size: 14px; padding-left: 5px; color: #c7c5c5; margin: auto; font-weight:400"></font>
								<font class="message" style="font-size: 14px; color: #a8a7a7; margin: auto; font-weight:400">Report content cannot be empty</font>
							</div>
							  ]],							args = { }
						})
					else
						TriggerEvent('chat:addMessage', {
							template = [[
								<div style="padding: 0.3vw; height: 1.5vw; margin: 0.5vw;  background-color: #222228ec; border-radius: 10px; padding-top: 0.35vw; border: 0.11vw solid #414146; box-shadow: 0px 0px 11px rgba(158, 158, 158, 0.35)">
								<font style="padding: 0.15vw; margin: 0.22vw; background-color: #31BA4C; padding-left: 1%; border-radius: 8px; border: #2FD951 solid 0.11vw; font-size: 12px; box-shadow: 0px 0px 11px rgba(20, 200, 21, 0.55)">
									<font style="font-weight: 600;">SUCCESS</font>
								</font>
								<font style="font-size: 14px; padding-left: 5px; color: #c7c5c5; margin: auto; font-weight:400"></font>
								<font class="message" style="font-size: 14px; color: #a8a7a7; margin: auto; font-weight:400">Thank you for your report, one of our active admins will try to resolve it asap!</font>
							</div>
							  ]],							args = { id, name, message }
						})
					end
			elseif pgroup ~= "user" and playerID ~= sourceID and message ~= '' and message ~= nil then
				TriggerEvent('chat:addMessage', {
					template = [[
						<div style="padding: 0.3vw; height: 1.5vw; margin: 0.5vw; background-color: #222228ec; border-radius: 10px; padding-top: 0.35vw; border: 0.11vw solid #414146; box-shadow: 0px 0px 11px rgba(158, 158, 158, 0.35)">
						<font style="padding: 0.15vw; margin: 0.22vw; background-color: #626066; padding-left: 1%; border-radius: 8px; border: #9e9e9e solid 0.11vw; font-size: 12px; box-shadow: 0px 0px 11px rgba(158, 158, 158, 0.55)">
							<font style="font-weight: 600;">ID: {0}</font>
						</font>
						<font style="padding: 0.15vw; margin: 0.22vw; background-color: #922a2a; padding-left: 1%; border-radius: 8px; border: #c72f2f solid 0.11vw; font-size: 12px; box-shadow: 0px 0px 11px rgba(156, 21, 21, 0.55)">
							<font style="font-weight: 600;">NEW REPORT</font>
						</font>
						<font style="font-size: 14px; padding-left: 5px; color: #c7c5c5; margin: auto; font-weight:400">{1}:</font>
						<font class="message" style="font-size: 14px; color: #a8a7a7; margin: auto; font-weight:400"> {2}</font>
					</div>
					  ]],					args = { id, name, message }
				})
			end
		elseif cooldown and playerID == sourceID then
			TriggerEvent('chat:addMessage', {
				template = [[
					<div style="padding: 0.3vw; height: 1.5vw; margin: 0.5vw;  background-color: #222228ec; border-radius: 10px; padding-top: 0.35vw; border: 0.11vw solid #414146; box-shadow: 0px 0px 11px rgba(158, 158, 158, 0.35)">
					<font style="padding: 0.15vw; margin: 0.22vw; background-color: #922a2a; padding-left: 1%; border-radius: 8px; border: #c72f2f solid 0.11vw; font-size: 12px; box-shadow: 0px 0px 11px rgba(156, 21, 21, 0.55)">
						<font style="font-weight: 600;">ERROR</font>
					</font>
					<font style="font-size: 14px; padding-left: 5px; color: #c7c5c5; margin: auto; font-weight:400"></font>
					<font class="message" style="font-size: 14px; color: #a8a7a7; margin: auto; font-weight:400">You can send only one report every 15 seconds</font>
				</div>
				  ]],				args = {}
			})
		end
	end)
end)