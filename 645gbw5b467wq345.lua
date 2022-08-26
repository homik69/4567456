local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Komi Hub | Race Clicker", HidePremium = false, IntroEnabled = true, IntroText = "Loading...", SaveConfig = false, ConfigFolder = "KomiHub"})

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

_G.autoFarm = true

Tab:AddToggle({
	Name = "Auto Farm",
	Default = false,
	Callback = function(Value)
		_G.autoFarm = Value
        --settings
	local delay1 = 1
	local delay2 = 0.1
	local onlywhileround = true
	--main
	local plr = game:service'Players'.LocalPlayer
	while task.wait() and _G.autoFarm do
	    pcall(function()
		if plr.PlayerGui.UI_Main.UI.TopMenu.RaceTimer.TextLabel.Text == '' and onlywhileround then
		    repeat task.wait() until plr.PlayerGui.UI_Main.UI.TopMenu.RaceTimer.TextLabel.Text ~= ''
		    task.wait(1)
		end
		for i,v in pairs(workspace.Environment:GetDescendants()) do
		    if v:FindFirstChildWhichIsA'TouchTransmitter' then
			firetouchinterest(v, plr.Character.HumanoidRootPart, 0)
			task.wait((v.Parent.Name == 'Stage1K' and delay1) or delay2)
		    end
		end
	    end)
	end
	
	end
})





OrionLib.init()
