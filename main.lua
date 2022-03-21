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
function WorldToScreen(x, y, z)
    local V = CFrame.new(x, y, z) * CFrame.Angles(0, 0, 0)
    return Vector2.new(V.p.X, V.p.Y)
end
function D3DXVECTOR3(x, y, z)
    return {x = x, y = y, z = z}
end
function DrawCircleNextLvl(x, y, z, radius, width, color, chordlength)
    radius = radius or 300
    quality = math.max(8, math.floor(180 / math.deg((math.asin((chordlength / (2 * radius)))))))
    quality = 2 * math.pi / quality
    radius = radius * .92
    local points = {}
    for theta = 0, 2 * math.pi + quality, quality do
        local c = WorldToScreen(x + radius * math.cos(theta), y, z - radius * math.sin(theta))
        points[#points + 1] = D3DXVECTOR3(c.x, c.y, 0)
    end
    DrawLines3D(points, width or 1, color or 4294967295)
end
function DrawLines3D(points, width, color)
    local s = Instance.new("ScreenGui")
    local l = Instance.new("Frame")
    s.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    l.Parent = s
    l.Size = UDim2.new(0, points[1].x, 0, points[1].y)
    l.BackgroundColor3 = Color3.new(0, 0, 0)
    l.BorderSizePixel = 0
    l.ZIndex = 2
    for i = 1, #points do
        local p = Instance.new("Frame")
        p.Parent = l
        p.Size = UDim2.new(0, points[i].x, 0, points[i].y)
        p.BackgroundColor3 = Color3.new(0, 0, 0)
        p.BorderSizePixel = 0
        p.ZIndex = 2
        if i == 1 then
            p.Position = UDim2.new(0, 0, 0, 0)
        else
            p.Position = UDim2.new(0, points[i - 1].x, 0, points[i - 1].y)
        end
    end
    l.Position = UDim2.new(0, -points[1].x, 0, -points[1].y)
    l.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
end
function DrawCircle(HeadPos, Radius, Color)
    local CirclePos = WorldToScreen(D3DXVECTOR3(HeadPos.x, HeadPos.y, HeadPos.z))
    if CirclePos.x > 0 and CirclePos.y > 0 then
        DrawCircleNextLvl(CirclePos.x, CirclePos.y, Radius, 1, Color, 100)
    end
end
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Marsho Arsenal", "Ocean")
local espTab = Window:NewTab("Combat")
local esp = espTab:NewSection("ESP")
esp:NewToggle("Enemy ESP", "Toggle ESP for Enemies", true, function(b)
    if b then
        
    else
        
    end
end)
esp:NewToggle("Team Tracer ESP", "Toggle ESP for Team", true, function(b)
    --we get all of the player's in the game
    for i,v in pairs(game.Players:GetPlayers()) do
        --if the player is on the same team as the local player
        if v.Team == game.Players.LocalPlayer.Team then
            --then we draw a box around them in the color specified in the variable teamesp
            game.Players.LocalPlayer:DrawBox(v.Character.Head.Position, Vector3.new(0.5, 0.5, 0.5), teamesp)
        end
    end
end)
local aim = espTab:NewSection("Aimbot")
--Kill all toggle
aim:NewToggle("Kill All", "Toggle Kill All", true, function(b)
end)
--Silent Aim Toggle
aim:NewToggle("Silent Aim", "Toggle Silent Aim", true, function(b)
    if b then
        local plrs = game:GetService("Players")
        local plr = plrs.LocalPlayer
        local mouse = plr:GetMouse()
        local camera = game:GetService("Workspace").CurrentCamera
        
        function notBehindWall(target)
            local ray = Ray.new(plr.Character.Head.Position, (target.Position - plr.Character.Head.Position).Unit * 300)
            local part, position = game:GetService("Workspace"):FindPartOnRayWithIgnoreList(ray, {plr.Character},false,true)
            if part then
                local humanoid = part.Parent:FindFirstChildOfClass("Humanoid")
                if not humanoid then
                    humanoid = part.Parent.Parent:FindFirstChildOfClass("Humanoid")
                end
                if humanoid and target and humanoid.Parent ~= target.Parent then
                    local pos, visible = camera:WorldToScreenPoint(part.Position)
                    if visible then
                        return true
                    end
                end
            end
        end
        function getPlayerClosestToMouse()
            local target = nil
            local maxDist = 100
            for _,v in pairs(plrs:GetPlayers()) do
                if v.Character then
                    if v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") and v.TeamColor ~= plr.TeamColor then
                        local pos, vis = camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position) 
                        local dist = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(pos.X, pos.Y)).magnitude
                        if dist < maxDist and vis then
                           local torsoPos = camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                           local torsoDist = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(torsoPos.X, torsoPos.Y)).magnitude
                           local headPos = camera:WorldToViewportPoint(v.Character.Head.Position)
                           local headDist = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(headPos.X, headPos.Y)).magnitude
                            if torsoDist < headDist then
                              if notBehindWall(v.Character.Head) then
                                target = v.Character.Head
                              end
                            else
                                if notBehindWall(v.Character.HumanoidRootPart) then
                                    target = v.Character.HumanoidRootPart
                                end
                            end
                            maxDist = dist
                        end
                    end
                end  
            end
            return target
        end
        
    else
        
    end
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
player:NewToggle("Auto Respawn", "Toggle Auto Respawn", true, function(b)
    if b then
        --do a loop
        while true do
            --check if the player is dead
            if game.Players.LocalPlayer.Character == nil then
                --respawn the player
                game.Players.LocalPlayer:LoadCharacter()
            end
            --if the player is alive
            if game.Players.LocalPlayer.Character ~= nil then
                local localplayername = game.Players.LocalPlayer.Name
                print("Umm:" .. localplayername .. " is alive")
            end
            wait(1)
        end

    else
        --do nothing
        print("Umm:" .. game.Players.LocalPlayer.Name .. " is alive")
    end
end)
player:NewButton("Kill", "Kill the local player", function()
    local localplayer = game.Players.LocalPlayer
    localplayer.Character.Humanoid.Health = 0
end)
