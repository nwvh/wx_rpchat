wx = {}

wx.MaxHereTexts = 5 -- How many /here texts can one player place?
wx.MeDoDisplayTime = 5000 -- [in ms] How long should /me and /do 3D texts be displayed

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

wx.AdminGroups = { -- Which groups should have access to the staff announcement command?
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
    "Welcome to our server! We hope you enjoy your stay!",
    "In case of any problems, bugs or questions, please join our discord: discord.gg/yourdiscord",
    "Report any rulebreakers to our staff using the command /yourreportcommand!",
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