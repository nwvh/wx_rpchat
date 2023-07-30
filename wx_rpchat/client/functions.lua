local displayHeight = 1

function DisplayDo(mePlayer, text, offsetme)
    local displaying = true

    Citizen.CreateThread(function()
        Wait(wx.MeDoDisplayTime)
        displaying = false
    end)
	
    Citizen.CreateThread(function()
        displayHeight = displayHeight + 1
        while displaying do
            Wait(0)
            local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer), false)
            local coords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist2(coordsMe, coords)
            if dist < 500 then
                 DrawText3Dme(coordsMe['x'], coordsMe['y'], coordsMe['z']+offsetme-0.550, text)
            end
        end
        displayHeight = displayHeight - 1
    end)
end


function DisplayMe(mePlayer, text, offsetdo)
    local displaying = true

    Citizen.CreateThread(function()
        Wait(wx.MeDoDisplayTime)
        displaying = false
    end)
	
    Citizen.CreateThread(function()
        displayHeight = displayHeight + 1
        while displaying do
            Wait(0)
            local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer), false)
            local coords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist2(coordsMe, coords)
            if dist < 500 then
                 DrawText3Ddo(coordsMe['x'], coordsMe['y'], coordsMe['z']+offsetdo-1.850, text)
            end
        end
        displayHeight = displayHeight - 1
    end)
end


function DisplayDoa(mePlayer, text, offsetdoa)
    local displaying = true

    Citizen.CreateThread(function()
        Wait(1500)
        displaying = false
    end)
	
    Citizen.CreateThread(function()
        displayHeight = displayHeight + 1
        while displaying do
            Wait(0)
            local coordsMe = GetEntityCoords(GetPlayerPed(mePlayer), false)
            local coords = GetEntityCoords(PlayerPedId(), false)
            local dist = Vdist2(coordsMe, coords)
            if dist < 500 then
                 DrawText3Ddo(coordsMe['x'], coordsMe['y'], coordsMe['z']+offsetdoa-1.250, text)
            end
        end
        displayHeight = displayHeight - 1
    end)
end

function DrawText3Dme(x,y,z, text)
  local onScreen, _x, _y = World3dToScreen2d(x, y, z)
  local p = GetGameplayCamCoords()
  local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
  local scale = (1 / distance) * 2
  local fov = (1 / GetGameplayCamFov()) * 100
  local scale = scale * fov
  local font = fontId
  if onScreen then
    RegisterFontFile('BBN')
    fontId = RegisterFontId('BBN') 
      SetTextFont(fontId)
		SetTextScale(0.33, 0.30)
    SetTextDropshadow(10, 100, 100, 100, 255)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
		local factor = (string.len(text)) / 350
		DrawRect(_x,_y+0.0135, 0.025+ factor, 0.03, 0, 0, 0, 30)
    end
end




function DrawText3Ddo(x,y,z, text)
  local onScreen, _x, _y = World3dToScreen2d(x, y, z)
  local p = GetGameplayCamCoords()
  local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
  local scale = (1 / distance) * 2
  local fov = (1 / GetGameplayCamFov()) * 100
  local scale = scale * fov
  if onScreen then
    SetTextScale(0.33, 0.30)
    RegisterFontFile('BBN')
    fontId = RegisterFontId('BBN') 
      SetTextFont(fontId)
    SetTextProportional(1)
    SetTextDropshadow(10, 100, 100, 100, 255)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
		local factor = (string.len(text)) / 370
		DrawRect(_x,_y+0.0135, 0.025+ factor, 0.03, 0, 0, 0, 10)
    end
end

function DrawText3Ddoa(x,y,z, text)
  local onScreen, _x, _y = World3dToScreen2d(x, y, z)
  local p = GetGameplayCamCoords()
  local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
  local scale = (1 / distance) * 2
  local fov = (1 / GetGameplayCamFov()) * 100
  local scale = scale * fov
  if onScreen then
	
    SetTextScale(0.33, 0.30)
    RegisterFontFile('BBN')
    fontId = RegisterFontId('BBN') 
      SetTextFont(fontId)
    SetTextProportional(1)
    SetTextDropshadow(10, 100, 100, 100, 255)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
		local factor = (string.len(text)) / 370
		DrawRect(_x,_y+0.0145, 0.030+ factor, 0.03, 0, 0, 0, 10)
    end
end
