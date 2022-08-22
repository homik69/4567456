local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Komi Hub | Select game", HidePremium = false, IntroEnabled = true, IntroText = "Logged in! Loading..."})

OrionLib:MakeNotification({
	Name = "KomiHub Loader",
	Content = "Please select game.",
	Image = "rbxassetid://4483345998",
	Time = 5
})

local Tab = Window:MakeTab({
	Name = "Games",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "Tapping Legends X",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/OnexiaK/4567456/main/32457u8289.lua"))()
  	end    
})

Tab:AddButton({
	Name = "Pressure Wash Simulator",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/OnexiaK/4567456/main/e5ry8ftu5e.lua"))()
  	end    
})

Tab:AddButton({
	Name = "Frogge",
	Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/OnexiaK/4567456/main/g345645wgb.lua"))()
  	end    
})

