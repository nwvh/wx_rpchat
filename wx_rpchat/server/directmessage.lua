RegisterCommand('dm', function(source, args,_)
	local xPlayer = ESX.GetPlayerFromId(source)

	if GetPlayerName(args[1]) then
		local player = args[1]
		table.remove(args, 1)
		if wx.AdminGroups[xPlayer.getGroup()] == true then
			TriggerClientEvent('chat:addMessage', player, {
                template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(30, 30, 46, 0.45); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: #c1121f; border-radius: 2px; font-size: 15px;"> <i class="fa-solid fa-comment-dots"></i> <b>MESSAGE FROM ADMIN</b></font><strong>{0}</strong>:  <font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">{1}</font></div>',
				args = {GetPlayerName(source), table.concat(args, " ") }
			})
			TriggerClientEvent('chat:addMessage', source, {
                template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(30, 30, 46, 0.45); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: rgb(50,170,50); border-radius: 2px; font-size: 15px;"> <i class="fa-solid fa-circle-check"></i> <b>SUCCESS</b></font><font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">Message successfully sent to <strong>[{0}] {1}</strong></font></div>',
				args = {player, GetPlayerName(player)}
			})
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
			log("**Direct Message to **"..GetPlayerName(player), source, GetPlayerName(source), table.concat(args, " "),steam,discord,ip,Webhooks['directmessage'])
        else
            TriggerClientEvent('chat:addMessage', source, {
                template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(30, 30, 46, 0.45); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: #c1121f; border-radius: 2px; font-size: 15px;"> <i class="fa-solid fa-triangle-exclamation"></i> <b>ERROR</b></font><font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">You don\'t have permissions to use this command!</font></div>',
                args = {}
            })
        end
		else
            TriggerClientEvent('chat:addMessage', source, {
                template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(30, 30, 46, 0.45); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: #c1121f; border-radius: 2px; font-size: 15px;"> <i class="fa-solid fa-triangle-exclamation"></i> <b>ERROR</b></font><font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">Player with the specified ID is not online!</font></div>',
                args = {}
            })
		end

end,false)
