ESX = exports["es_extended"]:getSharedObject()

local loocwebhook = Webhooks['looc']
local mewebhook = Webhooks['me']
local dowebhook = Webhooks['do']
local trywebhook = Webhooks['try']
local adwebhook = Webhooks['ad']
local staffwebhook = Webhooks['staff']
local blackmarketwebhook = Webhooks['blackmarket']


function GetRealPlayerName(playerId)
  local xPlayer = ESX.GetPlayerFromId(playerId)

  if xPlayer then
      if wx.OnlyInicials then
          local name = xPlayer.get('firstName')
          name = string.sub(name, 1, 1)
          local surname = xPlayer.get('lastName')
          surname = string.sub(surname, 1, 1)
          local shortName = name..". "..surname..". "
          return shortName
      else
          return xPlayer.getName()
      end
  else
      return GetPlayerName(playerId)
  end
end

function ExtractIdentifiers(src)
  local identifiers = {
      steam = "Not Found",
      ip = "Not Found",
      discord = "Not Found",
      license = "Not Found",
      xbl = "Not Found",
      live = "Not Found"
  }

  --Loop over all identifiers
  for i = 0, GetNumPlayerIdentifiers(src) - 1 do
      local id = GetPlayerIdentifier(src, i)

      --Convert it to a nice table.
      if string.find(id, "steam") then
          identifiers.steam = id
      elseif string.find(id, "ip") then
          identifiers.ip = id
      elseif string.find(id, "discord") then
          identifiers.discord = id
      elseif string.find(id, "license") then
          identifiers.license = id
      elseif string.find(id, "xbl") then
          identifiers.xbl = id
      elseif string.find(id, "live") then
          identifiers.live = id
      elseif string.find(id, "fivem") then
          identifiers.fivem = id
      end
  end

  return identifiers
end



AddEventHandler('chatMessage', function(source, name, message)
  if string.sub(message, 1, string.len('/')) ~= '/' then CancelEvent()
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
    log("L-OOC", source, name, message,steam,discord,ip,loocwebhook)
    local xPlayer = ESX.GetPlayerFromId(source)
    local name = GetPlayerName(source)
    if wx.LOOCAdminPrefixes then
      if wx.AdminGroups[xPlayer.getGroup()] then name = ("^0[^1%s^0] "):format(string.upper(xPlayer.getGroup()))..name
      end
    TriggerClientEvent('wx_rpchat:sendLocalOOC', -1, source, name, message, {30, 144, 255});
  end
end
end)


RegisterCommand(wx.Commands['Staff Announcement'], function(source,args,raw)
  local xPlayer = ESX.GetPlayerFromId(source)
  local toSay = ''
    for i=1,#args do
     toSay = toSay .. args[i] .. ' ' 
   end

   if wx.AdminGroups[xPlayer.getGroup()] == true then
    TriggerClientEvent('chat:addMessage', -1, {
      template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(30, 30, 46, 0.45); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: #ba181b; border-radius: 2px; font-size: 15px;"> <i class="fa-solid fa-bullhorn"></i><b> OZNÁMENÍ</b></font><font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font><font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">{0}</font></div>',
      args = { toSay }
  })
  end
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
  log("**/staff** Announcement", source, GetPlayerName(source), toSay,steam,discord,ip,staffwebhook)
end,false)


RegisterCommand('id', function(source,args,raw)
    TriggerClientEvent('chat:addMessage', source, {
      template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(30, 30, 46, 0.45); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: #22577a; border-radius: 2px; font-size: 15px;"> <i class="fa-solid fa-id-card"></i><b> ID</b></font><font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font><font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">{0}</font></div>',
      args = { "Your current server ID is: "..source }
  })
end,false)


RegisterCommand(wx.Commands['Job'], function(source,args,raw)
    local fal = GetRealPlayerName(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    TriggerClientEvent('chat:addMessage', source, {
      template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(30, 30, 46, 0.45); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: #22577a; border-radius: 2px; font-size: 15px;"> <i class="fa-solid fa-id-card"></i><b> JOB</b></font><font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font><font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">{0}</font></div>',
      args = { fal..", you're employed as "..xPlayer.job.label.." - "..xPlayer.job.grade_label }
  })
end,false)

if wx.AutoMessages then
  Citizen.CreateThread(function()
    while true do
    TriggerClientEvent('chat:addMessage', -1, {
      template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(30, 30, 46, 0.45); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: #6b6b6b; border-radius: 2px; font-size: 15px;"> <i class="fa-sharp fa-solid fa-note-sticky"> | </i><b> SYSTEM</b></font><font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font><font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">{0}</font></div>',
      args = { wx.AutoMessagesList[math.random(#wx.AutoMessagesList)] }
    })
    Citizen.Wait(wx.AutoMessageInterval*60*1000)
  end
  end)
end
RegisterCommand(wx.Commands['Blackmarket'], function(source, args, raw)
  local xPlayer = ESX.GetPlayerFromId(source)
  local toSay = ''
    for i=1,#args do
  toSay = toSay .. args[i] .. ' '
  end
  if xPlayer.job.name ~= wx.Jobs['LSPD'] then
    TriggerClientEvent('chat:addMessage', -1, {
      template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(30, 30, 46, 0.45); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: #343a40; border-radius: 2px; font-size: 15px;"> <i class="fa-solid fa-skull-crossbones"></i><b> BLACK MARKET</b></font><font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font><font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">{0}</font></div>',
      args = {toSay}
    })
  else
    TriggerClientEvent('chat:addMessage', source, {
      template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(30, 30, 46, 0.45); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: #c1121f; border-radius: 2px; font-size: 15px;"> <i class="fa-solid fa-triangle-exclamation"></i> <b>ERROR</b></font><font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">You\'re not allowed to access this chat with your current job</font></div>',
      args = {}
    })
  end
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
  log("**/blackmarket**", source, GetPlayerName(source), toSay,steam,discord,ip,blackmarketwebhook)
end, false)

RegisterCommand(wx.Commands['Twitter'], function(source, args, raw)
  local fal = GetRealPlayerName(source)
  local toSay = ''
  for i=1,#args do
    toSay = toSay .. args[i] .. ' '
  end
  TriggerClientEvent('chat:addMessage', -1, {
    template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(30, 30, 46, 0.75); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: #758bfd; border-radius: 2px; font-size: 15px;"> <i class="fa-brands fa-twitter"></i><b> Twitter</b></font><font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font><b>@{0}</b>:<font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">{1}</font></div>',
      args = {fal, toSay}
  })
end, false)

RegisterCommand(wx.Commands['Police'], function(source, args, raw)
  local playerName = GetPlayerName(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  local command = "ambulance"
  local toSay = ''
     for i=1,#args do
  toSay = toSay .. args[i] .. ' '
end
  if xPlayer.job.name == wx.Jobs['LSPD'] then 
  TriggerClientEvent('chat:addMessage', -1, {
    template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(30, 30, 46, 0.45); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: #4361ee; border-radius: 2px; font-size: 15px;"> <i class="fa-solid fa-handcuffs"></i> <b>Los Santos Police Department</b></font><font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">{0}</font></div>',
    args = {toSay}
    })
else
  TriggerClientEvent('chat:addMessage', source, {
    template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(30, 30, 46, 0.45); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: #c1121f; border-radius: 2px; font-size: 15px;"> <i class="fa-solid fa-triangle-exclamation"></i> <b>ERROR</b></font><font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">{0}</font></div>',
    args = {"You must be an LSPD officer to use this command"}
  })
end
end, false)

RegisterCommand(wx.Commands['Sheriff'], function(source, args, raw)
  local playerName = GetPlayerName(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  local command = "ambulance"
  local toSay = ''
     for i=1,#args do
  toSay = toSay .. args[i] .. ' '
end
  if xPlayer.job.name == wx.Jobs['LSSD'] then 
  TriggerClientEvent('chat:addMessage', -1, {
    template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(30, 30, 46, 0.45); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: #f3722c; border-radius: 2px; font-size: 15px;"> <i class="fa-solid fa-handcuffs"></i> <b>Los Santos Sheriff Department</b></font><font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">{0}</font></div>',
    args = {toSay}
    })
else
  TriggerClientEvent('chat:addMessage', source, {
    template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(30, 30, 46, 0.45); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: #c1121f; border-radius: 2px; font-size: 15px;"> <i class="fa-solid fa-triangle-exclamation"></i> <b>ERROR</b></font><font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">{0}</font></div>',
    args = {"You must be an LSSD officer to use this command"}
  })
end
end, false)

RegisterCommand(wx.Commands['EMS'], function(source, args, raw)
  local playerName = GetPlayerName(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  local command = "ambulance"
  local toSay = ''
     for i=1,#args do
  toSay = toSay .. args[i] .. ' '
end
  if xPlayer.job.name == wx.Jobs['EMS'] then 
  TriggerClientEvent('chat:addMessage', -1, {
    template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(30, 30, 46, 0.45); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: #da627d; border-radius: 2px; font-size: 15px;"> <i class="fa-solid fa-hospital-user"></i> <b>Emergency Medical Services</b></font><font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">{0}</font></div>',
    args = {toSay}
    })
else
  TriggerClientEvent('chat:addMessage', source, {
    template = '<div style="padding: 0.4vw; margin: 0.4vw; background-color: rgba(30, 30, 46, 0.45); border-radius: 3px;"><font style="padding: 0.22vw; margin: 0.22vw; background-color: #c1121f; border-radius: 2px; font-size: 15px;"> <i class="fa-solid fa-triangle-exclamation"></i> <b>ERROR</b></font><font style="background-color:rgba(20, 20, 20, 0); font-size: 17px; margin-left: 0px; padding-bottom: 2.5px; padding-left: 3.5px; padding-top: 2.5px; padding-right: 3.5px;border-radius: 0px;"></font>   <font style=" font-weight: 800; font-size: 15px; margin-left: 5px; padding-bottom: 3px; border-radius: 0px;"><b></b></font><font style=" font-weight: 200; font-size: 14px; border-radius: 0px;">{0}</font></div>',
    args = {"You must be an EMS worker to use this command"}
  })
end
end, false)


RegisterCommand('me', function(source, args, raw)
  local args = table.concat(args, ' ')
  local name = GetRealPlayerName(source)
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
  log("**/me**", source, GetPlayerName(source), args,steam,discord,ip,mewebhook)

  TriggerClientEvent('wx_rpchat:sendMe', -1, source, name, args, { 196, 33, 246 })
  TriggerClientEvent('3dme:triggerDisplay', -1, args, source)
end,false)

RegisterCommand('do', function(source, args, raw)
  local args = table.concat(args, ' ')
  local name = GetRealPlayerName(source)
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
  log("**/do**", source, GetPlayerName(source), args,steam,discord,ip,dowebhook)

  TriggerClientEvent('wx_rpchat:sendDo', -1, source, name, args, { 255, 198, 0 })
  TriggerClientEvent('3ddo:triggerDisplay', -1, "* "..args.." *", source)
end,false)

RegisterCommand('try', function(source, args, raw)
  local result = "NO"
  local name = GetRealPlayerName(source)
  local random = math.random(1,2)
  if random == 1 then
    result = "YES"
    TriggerClientEvent('wx_rpchat:sendTry', -1, source, name, result, { 255, 198, 0 })
    TriggerClientEvent('3dme:triggerDisplay', -1, "* "..result.." *", source)
  else
    TriggerClientEvent('wx_rpchat:sendTry', -1, source, name, result, { 255, 198, 0 })
    TriggerClientEvent('3dme:triggerDisplay', -1, "* "..result.." *", source)
  end
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
  log("**/try**", source, GetPlayerName(source), result,steam,discord,ip,trywebhook)
end,false)

RegisterCommand('doc', function(source, args, raw)
  local name = GetRealPlayerName(source)
  if args[1] ~= nil then 
    local c = 0
    local count = tonumber(args[1])
    if count < wx.MaxDocCount then
      while c < count do
          c = c + 1 
          TriggerClientEvent('wx_rpchat:sendDoc', -1, source, name, c .. "/" .. count , { 255, 198, 0 })
          TriggerClientEvent('3ddoa:triggerDisplay', -1, c .. "/" .. count, source)
          Wait(1518)
      end
    end
  end
end,false)

