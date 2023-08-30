ESX = exports["es_extended"]:getSharedObject()

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
	--@todo: report logs
end, false)


