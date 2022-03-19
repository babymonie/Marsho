if game.PlaceId == 4924922222 then
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("Marsho - Brookhaven", "Serpent")
    local Main = Window:NewTab("Main")
    local Crazy = Window:NewTab("GO Crazy")
    local HellNah = Window:NewTab("Hell Nah")
    local dababy = Main:NewSection("Local Player")
    dababy:NewSlider("Walk Speed", "BRUH ITS IN THE NAME!!!!", 500, 16, function(s)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end)
    dababy:NewSlider("Jump Power", "Make's Jump Height/Power Higher!", 500, 50, function(s)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
    end)
    dababy:NewButton("Fling Yourself", "Its in the NAME!!!!", function()
        local Player = game:GetService("Player")
        local LPlr = Player.LocalPlayer
        local Character = LPlr.Character
        local HRP = Character:WaitForChild("HumanoidRootPart") -- Basically the humanoidrootpart

        HRP.Velocity =  -- basically anything goes after this, make the velocity however u like
    end)
elseif game.PlaceId == 370731277 then
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("Marsho - Meep City", "Serpent")
    local Main = Window:NewTab("Main")
    local Player = Window:NewTab("Player")
    local Crazy = Window:NewTab("GO Crazy")
    local HellNah = Window:NewTab("Hell Nah")
    local AnnoyPlayers = Main:NewSection("Annoy Some Kids")
    local PlayerName = AnnoyPlayers:NewTextBox("Enter Player Name", "Player Textbox to do things with people!")
    AnnoyPlayers:NewButton("Kill", "Kills the player entered in the player textbox!", function()
        --Kill Script Here
    end)
elseif game.PlaceId == 185655149 then
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("Marsho - Bloxburg", "Serpent")
    local Main = Window:NewTab("Main")
    local Player = Window:NewTab("Player")
    local Crazy = Window:NewTab("GO Crazy")
    local HellNah = Window:NewTab("Hell Nah")
    local AnnoyPlayers = Main:NewSection("Annoy Some Kids")
    local PlayerName = AnnoyPlayers:NewTextBox("Enter Player Name", "Player Textbox to do things with people!")
    AnnoyPlayers:NewButton("Kill", "Kills the player entered in the player textbox!", function()
        --Kill Script Here
    end)
end
