wx = {}

wx.enableLogs = true -- Enable webhooks logs? Make sure to add your webhooks in configs/webhook_config.lua
wx.MaxHereTexts = 5 -- How many /here texts can one player place?
wx.MeDoDisplayTime = 5000 -- [in ms] How long should /me and /do 3D texts be displayed
wx.TransparentStatusHere = true -- The text of /here and /status commands will have no background

wx.OnlyInicials = true -- In commands like /me, /do, use only char name inicials. (John Doe -> J. D.)

wx.loocCooldown = 1500 -- in ms, cooldown between L-OOC messages. Set to 0 to disable

wx.LOOCPrefixes = {
    enabled = true, -- Enable group prefixes for L-OOC (Example: Group Admin: [L-OOC] [ADMIN] Player: Hello!)
--  GROUP       PREFIX
    ["admin"] = "ADMIN",
    ["dev"] = "DEVELOPER",
    ["TRIAL"] = "TRIAL STAFF",
    ["staff"] = "STAFF",
}

wx.Commands = {
-- Don't Touch             /command name
    ["Status"]              = "status",
    ["Here"]                = "here",
    ["Advertisement"]       = "ad",
    ["EMS"]                 = "ems",
    ["Police"]              = "police",
    ["Sheriff"]             = "sheriff",
    ["Blackmarket"]         = "bm",
    ["Twitter"]             = "tweet",
    ["Staff Announcement"]  = "staff",
    ["Job"]                 = "job",
}

wx.Jobs = {
-- Don't Touch  Job Name
    ['LSPD']  =   'police',
    ['EMS']   =   'ambulance',
    ['LSSD']  =   'sheriff',
}

wx.AdminGroups = { -- Your staff groups, they will see player's reports, be able to use admin chat and the staff anouncement command
-- GROUP NAME   true/false
    ["admin"]    = true,
    ["mod"]      = true,
    ["owner"]    = true,
    ["staff"]    = true,
    ["trial"]    = true,
}

wx.AutoMessages = true
wx.AutoMessageInterval = 25 -- In minutes
wx.AutoMessagesList = { -- List of messages that will be randomly sent
    "If you have any question, you can ask any of our staff!",
    "In case of any issues, you can always use /report",
    "Make sure to join our discord! discord.gg/yourinvite",
}

Notify = function(title,desc) -- You can add your own notify function
    lib.notify({
        title = title,
        description = desc,
        position = 'top',
        style = {
            backgroundColor = '#1E1E2E',
            color = '#C1C2C5',
            ['.description'] = {
              color = '#909296'
            }
        },
        icon = 'comments',
        iconColor = '#457b9d'
    })
end