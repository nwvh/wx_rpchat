function log(title, playerID, playerName, reportmessage, steam,discord,ip, webhook)
    if wx.Logs then
        local steamprofile = "https://steamcommunity.com/profiles/" .. tostring(tonumber(steam:gsub("steam:", ""),16));
        local embed = {
            {
                ["color"] = 8388736,
                ["title"] = "**".. title .."**",
                ["author"] = {
                ["name"] = "WX RP Chat",
                ["url"] = "https://0wx.tebex.io/",
                ["icon_url"] = "https://media.discordapp.net/attachments/1132686300026241106/1142819425423208478/cK9EEpoQptKJ.gif?width=230&height=230"
                },
                ["footer"] = {
                ["text"] = "🌠 - [ "..os.date('%d.%m.%Y - %H:%M:%S').." ]",
                ["icon_url"] = 'https://cdn.discordapp.com/attachments/1132686300026241106/1135177012730933348/BSvMzVQs7c2c.png'
                },
                ["fields"] = {

                    {
                        ["name"]= "Player Name",
                        ["value"]= "[**"..playerID.."**] "..playerName,
                        ["inline"] = true
                    },
                    {
                        ["name"]= "Message",
                        ["value"]= reportmessage,
                        ["inline"] = false
                    },
                    {
                        ["name"]= "Steam",
                        ["value"]= "["..steam.."]("..steamprofile..")",
                        ["inline"] = true
                    },
                    {
                        ["name"]= "Discord",
                        ["value"]= "<@"..discord:gsub('discord:', '')..">",
                        ["inline"] = true
                    },
                    {
                        ["name"]= "IP Address",
                        ["value"]= ("[%s](https://ipinfo.io/%s)"):format(ip:gsub('ip:', ''),ip:gsub('ip:', '')),
                        ["inline"] = true
                    },
                }
            }
        }
        PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = wx.WebHookName, embeds = embed}), { ['Content-Type'] = 'application/json' })
    end
  end