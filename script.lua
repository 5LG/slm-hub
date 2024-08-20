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

local Label = MainTab:CreateLabel("Version: BETA")

-----------------------------------------
 
local SpeedSlider = PlayerTab:CreateSlider({
   Name = "Speed Hack",
   Range = {15, 500},
   Increment = 5,
   Suffix = "Speed",
   CurrentValue = 15,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})
 
local JumpSlider = PlayerTab:CreateSlider({
   Name = "Jump Hack",
   Range = {50, 500},
   Increment = 5,
   Suffix = "Jump Height",
   CurrentValue = 50,
   Flag = "Slider1",
   Callback = function(Value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   end,
})

--------------------------------------------- Fly

local FlyToggle = PlayerTab:CreateToggle({
   Name = "FLY: Press E (NEW, BETA)",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
    if Value == true
    then
        repeat wait() 
	    until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Torso") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
        local mouse = game.Players.LocalPlayer:GetMouse() 
        repeat wait() until mouse
        local plr = game.Players.LocalPlayer 
        local torso = plr.Character.Torso 
        local flying = false
        local deb = true 
        local ctrl = {f = 0, b = 0, l = 0, r = 0} 
        local lastctrl = {f = 0, b = 0, l = 0, r = 0} 
        local maxspeed = 50 
        local speed = 30

        function Fly() 
        local bg = Instance.new("BodyGyro", torso) 
        bg.P = 9e4 
        bg.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
        bg.cframe = torso.CFrame 
        local bv = Instance.new("BodyVelocity", torso) 
        bv.velocity = Vector3.new(0,0.1,0) 
        bv.maxForce = Vector3.new(9e9, 9e9, 9e9) 
        repeat wait() 
        plr.Character.Humanoid.PlatformStand = true 
        if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then 
        speed = speed+.5+(speed/maxspeed) 
        if speed > maxspeed then 
        speed = maxspeed 
        end 
        elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then 
        speed = speed-1 
        if speed < 0 then 
        speed = 0 
        end 
        end 
        if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then 
        bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
        lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r} 
        elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then 
        bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
        else 
        bv.velocity = Vector3.new(0,0.1,0) 
        end 
        bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0) 
        until not flying 
        ctrl = {f = 0, b = 0, l = 0, r = 0} 
        lastctrl = {f = 0, b = 0, l = 0, r = 0} 
        speed = 0 
        bg:Destroy() 
        bv:Destroy() 
        plr.Character.Humanoid.PlatformStand = false 
        end 
        mouse.KeyDown:connect(function(key) 
        if key:lower() == "e" then 
        if flying then flying = false 
        else 
        flying = true 
        Fly() 
        end 
        elseif key:lower() == "w" then 
        ctrl.f = 1 
        elseif key:lower() == "s" then 
        ctrl.b = -1 
        elseif key:lower() == "a" then 
        ctrl.l = -1 
        elseif key:lower() == "d" then 
        ctrl.r = 1 
        end 
        end) 
        mouse.KeyUp:connect(function(key) 
        if key:lower() == "w" then 
        ctrl.f = 0 
        elseif key:lower() == "s" then 
        ctrl.b = 0 
        elseif key:lower() == "a" then 
        ctrl.l = 0 
        elseif key:lower() == "d" then 
        ctrl.r = 0 
        end 
        end)
        Fly()
    end
   end,
})

---------------------------- esp

local EspToggle = PlayerTab:CreateToggle({
    Name = "ESP (NEW)",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        if Value == true then
            local function addHighlightToPlayer(player)
                local character = player.Character
                if character then
                    if not character:FindFirstChild("Highlight") then
                        local highlight = Instance.new("Highlight")
                        highlight.FillTransparency = 0.5
                        highlight.OutlineTransparency = 0
                        highlight.Parent = character
                    end
                end
            end

            -- Add highlights to all existing players
            for _, player in pairs(game.Players:GetPlayers()) do
                addHighlightToPlayer(player)
            end

            -- Connect to players who join later
            game.Players.PlayerAdded:Connect(function(player)
                player.CharacterAdded:Connect(function()
                    addHighlightToPlayer(player)
                end)
            end)

        elseif Value == false then
            local function removeHighlightFromPlayer(player)
                local character = player.Character
                if character then
                    local highlight = character:FindFirstChild("Highlight")
                    if highlight then
                        highlight:Destroy()
                    end
                end
            end

            -- Remove highlights from all existing players
            for _, player in pairs(game.Players:GetPlayers()) do
                removeHighlightFromPlayer(player)
            end

            -- Remove highlights for players who join later
            game.Players.PlayerAdded:Connect(function(player)
                player.CharacterAdded:Connect(function()
                    removeHighlightFromPlayer(player)
                end)
            end)
        end
    end
})
