local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Frogge script thing", "GrapeTheme")

-- Glowne rzeczy
local Main = Window:NewTab("Info")
local MainSection = Main:NewSection("Creator")

MainSection:NewLabel("Discord: homik#2137")

-- local player
local Player = Window:NewTab("Player")
local PlayerSection = Player:NewSection("Movement")
local VisualSection = Player:NewSection("Visual")

PlayerSection:NewSlider("Walkspeed", "Make u faster than sonik", 500, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

VisualSection:NewButton("ESP", "You can see noobs behind walls", function()
    getgenv().enabled = true --Toggle on/off
getgenv().filluseteamcolor = false --Toggle fill color using player team color on/off
getgenv().outlineuseteamcolor = false --Toggle outline color using player team color on/off
getgenv().fillcolor = Color3.new(0, 0, 0) --Change fill color, no need to edit if using team color
getgenv().outlinecolor = Color3.new(1, 1, 1) --Change outline color, no need to edit if using team color
getgenv().filltrans = 0 --Change fill transparency
getgenv().outlinetrans = 0 --Change outline transparency

loadstring(game:HttpGet("https://raw.githubusercontent.com/zntly/highlight-esp/main/esp.lua"))()
end)

