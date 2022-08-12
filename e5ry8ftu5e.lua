local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Komi Hub | Pressure Wash Simulator", HidePremium = false, IntroEnabled = false})

OrionLib:MakeNotification({
	Name = "Success!",
	Content = "Succesfully loaded script.",
	Image = "rbxassetid://4483345998",
	Time = 5
})

local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "Inf Money (Rejoin when execute)",
    Callback = function()
local args = {
    [1] = math.huge,
    [2] = math.huge
}

game:GetService("ReplicatedStorage").Remotes.SurfaceCompleted:FireServer(unpack(args))
      end    
})
