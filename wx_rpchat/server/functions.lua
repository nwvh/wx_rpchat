function havePermission(xPlayer)
	local group = xPlayer.getGroup()
	if wx.AdminGroups[group] then
		return true
	end
	return false
end

function CharName(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  if xPlayer then 
    if xPlayer.getName() == GetPlayerName(source) then 
      local result = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {['@identifier'] = GetPlayerIdentifiers(source)[1]})
      if result[1] and result[1].firstname and result[1].lastname then
        return ('%s %s'):format(result[1].firstname, result[1].lastname)
      end
    end
  end
end