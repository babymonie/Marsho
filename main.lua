--if game.PlaceId == 286090429 then
--    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
--    local Window = Library.CreateLib("Marsho", "Ocean")
--    local Main = Window:NewTab("Main")
--   local dababy = Main:NewSection("Local Player")
--end
--elseif game.PlaceId == 292439477 then
--    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
--    local Window = Library.CreateLib("Marsho", "Ocean")
--    local Main = Window:NewTab("Main")
--    local dababy = Main:NewSection("Local Player")
--end
--elseif game.PlaceId == 9057641087 then
    --local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    --local Window = Library.CreateLib("Marsho - Babymonie's Game", "Ocean")
    --local Main = Window:NewTab("Main")
    --local dababy = Main:NewSection("Local Player")
--end
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Marsho Arsenal", "Ocean")
local espTab = Window:NewTab("Combat")
local esp = espTab:NewSection("ESP")
esp:NewToggle("Enemy ESP", "Toggle ESP for Enemies", true, function(b)
    --we get all of the player's in the game
    for i,v in pairs(game.Players:GetPlayers()) do
        --if the player is an enemy
        if v.Team ~= game.Players.LocalPlayer.Team then
            --then we draw a box around them in the color specified in the variable enemyesp
            game.Players.LocalPlayer:DrawBox(v.Character.Head.Position, Vector3.new(0.5, 0.5, 0.5), enemyesp)
        end
    end
end)
esp:NewToggle("Team ESP", "Toggle ESP for Team", true, function(b)
    --we get all of the player's in the game
    for i,v in pairs(game.Players:GetPlayers()) do
        --if the player is on the same team as the local player
        if v.Team == game.Players.LocalPlayer.Team then
            --then we draw a box around them in the color specified in the variable teamesp
            game.Players.LocalPlayer:DrawBox(v.Character.Head.Position, Vector3.new(0.5, 0.5, 0.5), teamesp)
        end
    end
end)
local enemyesp = esp:NewColorPicker("Enemy ESP Color", "Color of ESP for Enemies",Color3.fromRGB(255,0,0), function(color)
    enemyesp = color
end)
local teamesp = esp:NewColorPicker("Team ESP Color", "Color of ESP for Team",Color3.fromRGB(0, 255, 0), function(color)
    teamesp = color
end)
local aim = espTab:NewSection("Aimbot")
aim:NewToggle("Tracers", "Toggle Tracers", true, function(b)
    if b then
        --we get all of the player's in the game
        for i,v in pairs(game.Players:GetPlayers()) do
            --if the player is an enemy
            if v.Team ~= game.Players.LocalPlayer.Team then
                --then we draw a line from the local player's head to the enemy's head
                game.Players.LocalPlayer:DrawLine(game.Players.LocalPlayer.Character.Head.Position, v.Character.Head.Position, Color3.fromRGB(0,255,0))
            end
        end
    end
end)
--Kill all toggle
aim:NewToggle("Kill All", "Toggle Kill All", true, function(b)
end)
--Silent Aim Toggle
aim:NewToggle("Silent Aim", "Toggle Silent Aim", true, function(b)
end)
--Wallbang
aim:NewToggle("Wallbang", "Toggle Wallbang", true, function(b)
end)
--Kill Aura
aim:NewToggle("Kill Aura", "Toggle Kill Aura", true, function(b)
end)
--draw fov toggle
aim:NewToggle("Draw FOV", "Toggle Draw FOV", true, function(b)
end)
--fov slider
aim:NewSlider("FOV", "FOV", 100, 100, function(s)
end)
--localplayer tab
local localplayer = Window:NewTab("Local Player")
local player = localplayer:NewSection("Player")
player:NewToggle("No Recoil", "Toggle No Recoil", true, function(b)
    --no recoil

end)
player:NewToggle("Auto Respawn", "Toggle Auto Respawn", true, function(b)
    if b then
        game.Players.LocalPlayer.CharacterAdded:Connect(function()
            game.Players.LocalPlayer.Character.Humanoid.Health = 100
        end)
    else
        game.Players.LocalPlayer.CharacterAdded:Disconnect()
    end
end)
player:NewToggle("Auto Reload", "Toggle Auto Reload", true, function(b)
    --auto reload
end)