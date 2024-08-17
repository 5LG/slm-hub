local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "SLM HUB | BETA",
   LoadingTitle = "SLM HUB",
   LoadingSubtitle = "by 5LG",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "SLM Hub"
   },
   Discord = {
      Enabled = true,
      Invite = "TRW6EjAAM6", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "SLM HUB | KEY",
      Subtitle = "Key System",
      Note = "Join Discord To Get KEY",
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://pastebin.com/raw/wXcDn7F9"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})
local MainTab = Window:CreateTab("Main", nil) -- Title, Image
local PlayerTab = Window:CreateTab("Player", nil) -- Title, Image
 
local SpeedSlider = PlayerTab:CreateSlider({
   Name = "Speed Hack",
   Range = {25, 500},
   Increment = 5,
   Suffix = "Speed",
   CurrentValue = 25,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})
 
local JumpSlider = PlayerTab:CreateSlider({
   Name = "Junmp Hack",
   Range = {50, 500},
   Increment = 5,
   Suffix = "Jump Height",
   CurrentValue = 50,
   Flag = "Slider1",
   Callback = function(Value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   end,
})
