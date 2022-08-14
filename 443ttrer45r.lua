local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Komi Hub | Dev Menu", HidePremium = false, IntroEnabled = true, IntroText = "Loading...", SaveConfig = false, ConfigFolder = "KomiHub"})
local DevTab = Window:MakeTab({
	Name = "Dev Stuff",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

DevTab:AddButton({
	Name = "Remote Spy",
	Callback = function()
        loadstring(game:HttpGet("https://github.com/exxtremestuffs/SimpleSpySource/raw/master/SimpleSpy.lua"))()
  	end    
})
DevTab:AddButton({
	Name = "DexHub",
	Callback = function()
        loadstring(game:HttpGet("https://dexhub.xyz/loader.lua", true))()
  	end    
})






OrionLib.init()
