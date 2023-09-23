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
							template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(30, 30, 46, 0.45); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: #c1121f; border-radius: 2px; font-size: 15px;"> <i class="fa-solid fa-people-group"></i> <b>ADMIN-CHAT</b></font> [{0}] [^1{3}^0] <strong>{1}</strong>:  <font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">{2}</font></div>',
							args = { source, playerName, message, string.upper(xPlayer.getGroup()) }
						})
					end
				end
			else
				TriggerClientEvent('chat:addMessage', xPlayer.source, {
					template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(30, 30, 46, 0.45); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: #c1121f; border-radius: 2px; font-size: 15px;"> <i class="fa-solid fa-triangle-exclamation"></i> <b>ERROR</b></font><font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">Message cannot be empty.</font></div>',
					args = {}
				})
			end
		else
			TriggerClientEvent('chat:addMessage', xPlayer.source, {
				template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(30, 30, 46, 0.45); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: #c1121f; border-radius: 2px; font-size: 15px;"> <i class="fa-solid fa-triangle-exclamation"></i> <b>ERROR</b></font><font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">You don\'t have permissions to use this command!</font></div>',
				args = {}
			})
		end
	end
end, false)