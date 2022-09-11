local WorkspacePlayers = game:GetService("Workspace").Game.Players
local Players = game:GetService('Players')
local localplayer = Players.LocalPlayer

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Komi Hub | Evade", HidePremium = false, IntroEnabled = true, IntroText = "Loading...", SaveConfig = false, ConfigFolder = "KomiHub"})

--esp
local Esp = loadstring(game:HttpGet("https://raw.githubusercontent.com/9Strew/roblox/main/proc/kiriotesp"))()
Esp.Enabled = false
Esp.Tracers = false
Esp.Boxes = false

-- Tabs
local GeneralTab = Window:MakeTab({
	Name = "General",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local GameTab = Window:MakeTab({
	Name = "Game",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local VisualTab = Window:MakeTab({
	Name = "Visual",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--settings

getgenv().Settings = {
    moneyfarm = false,
    afkfarm = false,
    NoCameraShake = false,
    Downedplayeresp = false,
    AutoRespawn = false,
    Speed = 1450,
    Jump = 3,
    reviveTime = 3,
    DownedColor = Color3.fromRGB(255,0,0),
    PlayerColor = Color3.fromRGB(255,170,0),
}

GeneralTab:AddSlider({
	Name = "Speed",
	Min = 1450,
	Max = 12000,
	Default = 1450,
	Color = Color3.fromRGB(255,255,255),
	Increment = 100,
	ValueName = "",
	Callback = function(Value)
		Settings.Speed = Value
	end    
})

GeneralTab:AddSlider({
	Name = "Jump Power",
	Min = 3,
	Max = 20,
	Default = 3,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "",
	Callback = function(Value)
		Settings.Jump = Value
	end    
})

GameTab:AddButton({
	Name = "Full Bright",
	Callback = function()
        Game.Lighting.Brightness = 4
	Game.Lighting.FogEnd = 100000
	Game.Lighting.GlobalShadows = false
    Game.Lighting.ClockTime = 12
  	end    
})

GameTab:AddButton({
	Name = "Respawn",
	Callback = function()
        game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
  	end    
})

GameTab:AddToggle({
	Name = "No Camera Shake",
	Default = false,
	Callback = function(Value)
		Settings.NoCameraShake = Value
	end    
})

GameTab:AddToggle({
	Name = "Auto Respawn",
	Default = false,
	Callback = function(Value)
		Settings.AutoRespawn = Value
	end    
})

GameTab:AddToggle({
	Name = "Fast Revive",
	Default = false,
	Callback = function(Value)
	    if Value then
        workspace.Game.Settings:SetAttribute("ReviveTime", 2.2)
    else
        workspace.Game.Settings:SetAttribute("ReviveTime", Settings.reviveTime)
    end
	end    
})

VisualTab:AddToggle({
	Name = "Enable ESP",
	Default = false,
	Callback = function(Value)
		Esp.Enabled = Value
	end    
})

VisualTab:AddToggle({
	Name = "Bot ESP",
	Default = false,
	Callback = function(Value)
		Esp.NPCs = Value
	end    
})

VisualTab:AddToggle({
	Name = "Downer Player ESP",
	Default = false,
	Callback = function(Value)
		Settings.Downedplayeresp = Value
	end    
})

VisualTab:AddToggle({
	Name = "Boxes",
	Default = false,
	Callback = function(Value)
		Esp.Boxes = Value
	end    
})

VisualTab:AddToggle({
	Name = "Tracers",
	Default = false,
	Callback = function(Value)
		Esp.Tracers = Value
	end    
})

VisualTab:AddToggle({
	Name = "Players",
	Default = false,
	Callback = function(Value)
		Esp.Players = Value
	end    
})

VisualTab:AddToggle({
	Name = "Distance",
	Default = false,
	Callback = function(Value)
		Esp.Distance = Value
	end    
})

VisualTab:AddColorpicker({
	Name = "Player Color",
	Default = Color3.fromRGB(255,170,0),
	Callback = function(Value)
		Settings.PlayerColor = Value
	end	  
})

VisualTab:AddColorpicker({
	Name = "Downed Player Color",
	Default = Color3.fromRGB(255,255,255),
	Callback = function(Value)
		Settings.DownedColor = Value
	end	  
})

local FindAI = function()
    for _,v in pairs(WorkspacePlayers:GetChildren()) do
        if not Players:FindFirstChild(v.Name) then
            return v
        end
    end
end


local GetDownedPlr = function()
    for i,v in pairs(WorkspacePlayers:GetChildren()) do
        if v:GetAttribute("Downed") then
            return v
        end
    end
end

--Kiriot
Esp:AddObjectListener(WorkspacePlayers, {
    Color =  Color3.fromRGB(255,0,0),
    Type = "Model",
    PrimaryPart = function(obj)
        local hrp = obj:FindFirstChild('HRP')
        while not hrp do
            wait()
            hrp = obj:FindFirstChild('HRP')
        end
        return hrp
    end,
    Validator = function(obj)
        return not game.Players:GetPlayerFromCharacter(obj)
    end,
    CustomName = function(obj)
        return '[AI] '..obj.Name
    end,
    IsEnabled = "NPCs",
})

--Tysm CJStylesOrg
Esp.Overrides.GetColor = function(char)
   local GetPlrFromChar = Esp:GetPlrFromChar(char)
   if GetPlrFromChar then
       if Settings.Downedplayeresp and GetPlrFromChar.Character:GetAttribute("Downed") then
           return Settings.DownedColor
       end
   end
   return Settings.PlayerColor
end

local old
old = hookmetamethod(game,"__namecall",newcclosure(function(self,...)
    local Args = {...}
    local method = getnamecallmethod()
    if tostring(self) == 'Communicator' and method == "InvokeServer" and Args[1] == "update" then
        return Settings.Speed, Settings.Jump 
    end
    return old(self,...)
end))

task.spawn(function()
    while task.wait() do
        if Settings.AutoRespawn then
             if localplayer.Character and localplayer.Character:GetAttribute("Downed") then
                game:GetService("ReplicatedStorage").Events.Respawn:FireServer()
             end
        end

        if Settings.NoCameraShake then
            localplayer.PlayerScripts.CameraShake.Value = CFrame.new(0,0,0) * CFrame.new(0,0,0)
        end
    end
end)

local GC = getconnections or get_signal_cons
	if GC then
		for i,v in pairs(GC(localplayer.Idled)) do
			if v["Disable"] then
				v["Disable"](v)
			elseif v["Disconnect"] then
				v["Disconnect"](v)
			end
		end
	else
		localplayer.Idled:Connect(function()
			local VirtualUser = game:GetService("VirtualUser")
			VirtualUser:CaptureController()
			VirtualUser:ClickButton2(Vector2.new())
		end)
	end
print("Infinite yield's Anti afk")

OrionLib:Init()
