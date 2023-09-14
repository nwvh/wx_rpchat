ESX = exports["es_extended"]:getSharedObject()

local function havePermission(xPlayer)
	local group = xPlayer.getGroup()
	if wx.AdminGroups[group] then
		return true
	end
	return false
end

ESX.RegisterServerCallback('wx_rpchat:getPlayerGroup', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(tonumber(source))
	if xPlayer then
		local playergroup = xPlayer.getGroup()
		cb(tostring(playergroup))
	else
		cb('user')
	end
end)

RegisterCommand("report", function(source, args, raw)
	local xPlayer = ESX.GetPlayerFromId(source)
	local name = GetPlayerName(source)
	local content = table.concat(args, " ")
	TriggerClientEvent("wx_rpchat:send", -1, source, name, content)
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
	log("**New Report**", source, name, content,steam,discord,ip,Webhooks['reports'])

end, false)


