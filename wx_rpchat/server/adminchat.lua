local function havePermission(xPlayer)
	if wx.AdminGroups[xPlayer.getGroup()] then
		return true
	end
	return false
end

RegisterCommand("a", function(source, args, rawCommand)	-- /a command for adminchat
	if source ~= 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
		local playerName = GetPlayerName(source)
		if wx.AdminGroups[xPlayer.getGroup()] then
			if args[1] then
				local message = string.sub(rawCommand, 3)
				local xAll = ESX.GetPlayers()
				for i=1, #xAll, 1 do
					local xTarget = ESX.GetPlayerFromId(xAll[i])
					if wx.AdminGroups[xTarget.getGroup()] then
						TriggerClientEvent('chat:addMessage', xTarget.source, {
							template = [[
								<div style="padding: 0.3vw; height: 1.5vw; margin: 0.5vw; background-color: #222228ec; border-radius: 10px; padding-top: 0.35vw; border: 0.11vw solid #414146; box-shadow: 0px 0px 11px rgba(158, 158, 158, 0.35)">
								<font style="padding: 0.15vw; margin: 0.22vw; background-color: #626066; padding-left: 1%; border-radius: 8px; border: #9e9e9e solid 0.11vw; font-size: 12px; box-shadow: 0px 0px 11px rgba(158, 158, 158, 0.55)">
									<font style="font-weight: 600;">ID: {0}</font>
								</font>
								<font style="padding: 0.15vw; margin: 0.22vw; background-color: #922a2a; padding-left: 1%; border-radius: 8px; border: #c72f2f solid 0.11vw; font-size: 12px; box-shadow: 0px 0px 11px rgba(156, 21, 21, 0.55)">
									<font style="font-weight: 600;">ADMIN CHAT</font>
								</font>
								<font style="font-size: 14px; padding-left: 5px; color: #c7c5c5; margin: auto; font-weight:400">{1}:</font>
								<font class="message" style="font-size: 14px; color: #a8a7a7; margin: auto; font-weight:400"> {2}</font>
							</div>
							  ]],							args = { source, playerName, message }
						})
					end
				end
			else
				TriggerClientEvent('chat:addMessage', xPlayer.source, {
					template = [[
						<div style="padding: 0.3vw; height: 1.5vw; margin: 0.5vw;  background-color: #222228ec; border-radius: 10px; padding-top: 0.35vw; border: 0.11vw solid #414146; box-shadow: 0px 0px 11px rgba(158, 158, 158, 0.35)">
						<font style="padding: 0.15vw; margin: 0.22vw; background-color: #922a2a; padding-left: 1%; border-radius: 8px; border: #c72f2f solid 0.11vw; font-size: 12px; box-shadow: 0px 0px 11px rgba(156, 21, 21, 0.55)">
							<font style="font-weight: 600;">ERROR</font>
						</font>
						<font style="font-size: 14px; padding-left: 5px; color: #c7c5c5; margin: auto; font-weight:400"></font>
						<font class="message" style="font-size: 14px; color: #a8a7a7; margin: auto; font-weight:400">Message cannot be empty</font>
					</div>
					  ]],					args = {}
				})
			end
		else
			TriggerClientEvent('chat:addMessage', xPlayer.source, {
				template = [[
					<div style="padding: 0.3vw; height: 1.5vw; margin: 0.5vw;  background-color: #222228ec; border-radius: 10px; padding-top: 0.35vw; border: 0.11vw solid #414146; box-shadow: 0px 0px 11px rgba(158, 158, 158, 0.35)">
					<font style="padding: 0.15vw; margin: 0.22vw; background-color: #922a2a; padding-left: 1%; border-radius: 8px; border: #c72f2f solid 0.11vw; font-size: 12px; box-shadow: 0px 0px 11px rgba(156, 21, 21, 0.55)">
						<font style="font-weight: 600;">ERROR</font>
					</font>
					<font style="font-size: 14px; padding-left: 5px; color: #c7c5c5; margin: auto; font-weight:400"></font>
					<font class="message" style="font-size: 14px; color: #a8a7a7; margin: auto; font-weight:400">You're not an admin</font>
				</div>
				  ]],				args = {}
			})
		end
	end
end, false)