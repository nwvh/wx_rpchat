RegisterCommand('dm', function(source, args,_)
	local xPlayer = ESX.GetPlayerFromId(source)

	if GetPlayerName(args[1]) then
		local player = args[1]
		table.remove(args, 1)
		if wx.AdminGroups[xPlayer.getGroup()] == true then
			TriggerClientEvent('chat:addMessage', player, {
				template = [[
					<div style="padding: 0.3vw; height: 1.5vw; margin: 0.5vw; background-color: #222228ec; border-radius: 10px; padding-top: 0.35vw; border: 0.11vw solid #414146; box-shadow: 0px 0px 11px rgba(158, 158, 158, 0.35)">
					<font style="padding: 0.15vw; margin: 0.22vw; background-color: #922a2a; padding-left: 1%; border-radius: 8px; border: #c72f2f solid 0.11vw; font-size: 12px; box-shadow: 0px 0px 11px rgba(156, 21, 21, 0.55)">
						<font style="font-weight: 600;">MESSAGE FROM ADMIN</font>
					</font>
					<font style="font-size: 14px; padding-left: 5px; color: #c7c5c5; margin: auto; font-weight:400">{0}:</font>
					<font class="message" style="font-size: 14px; color: #a8a7a7; margin: auto; font-weight:400"> {1}</font>
				</div>
				  ]],				args = {GetPlayerName(source), table.concat(args, " ") }
			})
			TriggerClientEvent('chat:addMessage', source, {
				template = [[
					<div style="padding: 0.3vw; height: 1.5vw; margin: 0.5vw;  background-color: #222228ec; border-radius: 10px; padding-top: 0.35vw; border: 0.11vw solid #414146; box-shadow: 0px 0px 11px rgba(158, 158, 158, 0.35)">
					<font style="padding: 0.15vw; margin: 0.22vw; background-color: #31BA4C; padding-left: 1%; border-radius: 8px; border: #2FD951 solid 0.11vw; font-size: 12px; box-shadow: 0px 0px 11px rgba(20, 200, 21, 0.55)">
						<font style="font-weight: 600;">SUCCESS</font>
					</font>
					<font style="font-size: 14px; padding-left: 5px; color: #c7c5c5; margin: auto; font-weight:400"></font>
					<font class="message" style="font-size: 14px; color: #a8a7a7; margin: auto; font-weight:400">Message has been sent to {0}</font>
				</div>
				  ]],				args = {GetPlayerName(player)}
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
			local template = [[
				<div style="padding: 0.3vw; height: 1.5vw; margin: 0.5vw;  background-color: #222228ec; border-radius: 10px; padding-top: 0.35vw; border: 0.11vw solid #414146; box-shadow: 0px 0px 11px rgba(158, 158, 158, 0.35)">
				<font style="padding: 0.15vw; margin: 0.22vw; background-color: #922a2a; padding-left: 1%; border-radius: 8px; border: #c72f2f solid 0.11vw; font-size: 12px; box-shadow: 0px 0px 11px rgba(156, 21, 21, 0.55)">
					<font style="font-weight: 600;">ERROR</font>
				</font>
				<font style="font-size: 14px; padding-left: 5px; color: #c7c5c5; margin: auto; font-weight:400"></font>
				<font class="message" style="font-size: 14px; color: #a8a7a7; margin: auto; font-weight:400">You're not an admin</font>
			</div>
			  ]]
			  TriggerClientEvent('chat:addMessage', source, {
				template = template,				args = {GetPlayerName(player)}
			})
        end
		else
			local template = [[
				<div style="padding: 0.3vw; height: 1.5vw; margin: 0.5vw;  background-color: #222228ec; border-radius: 10px; padding-top: 0.35vw; border: 0.11vw solid #414146; box-shadow: 0px 0px 11px rgba(158, 158, 158, 0.35)">
				<font style="padding: 0.15vw; margin: 0.22vw; background-color: #922a2a; padding-left: 1%; border-radius: 8px; border: #c72f2f solid 0.11vw; font-size: 12px; box-shadow: 0px 0px 11px rgba(156, 21, 21, 0.55)">
					<font style="font-weight: 600;">ERROR</font>
				</font>
				<font style="font-size: 14px; padding-left: 5px; color: #c7c5c5; margin: auto; font-weight:400"></font>
				<font class="message" style="font-size: 14px; color: #a8a7a7; margin: auto; font-weight:400">Specified player is not online</font>
			</div>
			  ]]
			  TriggerClientEvent('chat:addMessage', source, {
				template = template,				args = {GetPlayerName(player)}
			})
		end

end,false)
