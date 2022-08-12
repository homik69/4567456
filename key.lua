local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Komi Hub | Enter Key", HidePremium = false, IntroEnabled = false})

OrionLib:MakeNotification({
	Name = "Logged in!",
	Content = "Please enter key to continue.",
	Image = "rbxassetid://4483345998",
	Time = 5
})

_G.Key = "test"
_G.KeyInput = "string"

function Correct()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/OnexiaK/4567456/main/main.lua"))()
end

function CorrectKeyNotification()
    OrionLib:MakeNotification({
        Name = "Correct Key!",
        Content = "You just entered correct key, have fun!",
        Image = "rbxassetid://4483345998",
        Time = 5
    })
end

function IncorrectKeyNotification()
    OrionLib:MakeNotification({
        Name = "Incorrect Key!",
        Content = "That key is incorrect! please try again.",
        Image = "rbxassetid://4483345998",
        Time = 5
    })
end

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddTextbox({
	Name = "Enter Key",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		_G.KeyInput = Value
	end	  
})

Tab:AddButton({
	Name = "Check Key",
	Callback = function()
      		if _G.KeyInput == _G.Key then
                Correct()
                CorrectKeyNotification()
            else
                IncorrectKeyNotification()
            end
  	end    
})
