Citizen.CreateThread(function()
    for command, options in pairs(wx.Suggestions) do
        for k,v in pairs(options.argument) do
            TriggerEvent('chat:addSuggestion', command, options.description,  { { name = k, help = v } } )
        end
    end
end)

-- @todo: rewrite. works, but could be done better