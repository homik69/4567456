local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Komi Hub | Tapping Legends X", HidePremium = false, IntroEnabled = true, IntroText = "Loading...", SaveConfig = false, ConfigFolder = "KomiHub"})

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local DevTab = Window:MakeTab({
	Name = "Dev Stuff",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

_G.autoTap = true
_G.autoEquip = true

-- functions

function autoTap()
    while _G.autoTap == true do
        game:GetService("ReplicatedStorage").Remotes.Tap:FireServer()
        wait(0.0001)
    end
end

function autoEquip()
    while _G.autoEquip == true do
        game:GetService("ReplicatedStorage").Remotes.EquipBest:InvokeServer()
        wait(10)
    end
end

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

Tab:AddToggle({
	Name = "Auto Tap",
	Default = false,
	Callback = function(Value)
		_G.autoTap = Value
        autoTap()
	end    
})

Tab:AddToggle({
	Name = "Auto Equip",
	Default = false,
	Callback = function(Value)
		_G.autoEquip = Value
        autoEquip()
	end    
})






OrionLib.init()
