local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
    local Window = OrionLib:MakeWindow({Name = "Komi Hub | Universal", HidePremium = false, IntroEnabled = true, IntroText = "Welcome To KomiHub!", SaveConfig = false, ConfigFolder = "KomiHub"})

OrionLib:MakeNotification({
	Name = "Loaded Script | KomiHub",
	Content = "Discord: .gg/QgkWHTPJSk",
	Image = "rbxassetid://4483345998",
	Time = 10
})

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
_G.froggeESP = true

function speedxd()
    walkSpeed = 50

local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")
local W, A, S, D
local xVelo, yVelo

RS.RenderStepped:Connect(function()
   local HRP = game.Players.LocalPlayer.Character.HumanoidRootPart
   local C = game.Workspace.CurrentCamera
   local LV = C.CFrame.LookVector
   for i,v in pairs(UIS:GetKeysPressed()) do
       if v.KeyCode == Enum.KeyCode.W then
           W = true
       end
       if v.KeyCode == Enum.KeyCode.A then
           A = true
       end
       if v.KeyCode == Enum.KeyCode.S then
           S = true
       end
       if v.KeyCode == Enum.KeyCode.D then
           D = true
       end
   end

   if W == true and S == true then
       yVelo = false
       W,S = nil
   end

   if A == true and D == true then
       xVelo = false
       A,D = nil
   end

   if yVelo ~= false then
       if W == true then
           if xVelo ~= false then
               if A == true then
                   local LeftLV = (C.CFrame * CFrame.Angles(0, math.rad(45), 0)).LookVector
                   HRP.Velocity = Vector3.new((LeftLV.X * walkSpeed), HRP.Velocity.Y, (LeftLV.Z * walkSpeed))
                   W,A = nil
               else
                   if D == true then
                       local RightLV = (C.CFrame * CFrame.Angles(0, math.rad(-45), 0)).LookVector
                       HRP.Velocity = Vector3.new((RightLV.X * walkSpeed), HRP.Velocity.Y, (RightLV.Z * walkSpeed))
                       W,D = nil
                   end
               end
           end
       else
           if S == true then
               if xVelo ~= false then
                   if A == true then
                       local LeftLV = (C.CFrame * CFrame.Angles(0, math.rad(135), 0)).LookVector
                       HRP.Velocity = Vector3.new((LeftLV.X * walkSpeed), HRP.Velocity.Y, (LeftLV.Z * walkSpeed))
                       S,A = nil
                   else
                       if D == true then
                           local RightLV = (C.CFrame * CFrame.Angles(0, math.rad(-135), 0)).LookVector
                           HRP.Velocity = Vector3.new((RightLV.X * walkSpeed), HRP.Velocity.Y, (RightLV.Z * walkSpeed))
                           S,D = nil
                       end
                   end
               end
           end
       end
   end

   if W == true then
       HRP.Velocity = Vector3.new((LV.X * walkSpeed), HRP.Velocity.Y, (LV.Z * walkSpeed))
   end
   if S == true then
       HRP.Velocity = Vector3.new(-(LV.X * walkSpeed), HRP.Velocity.Y, -(LV.Z * walkSpeed))
   end
   if A == true then
       local LeftLV = (C.CFrame * CFrame.Angles(0, math.rad(90), 0)).LookVector
       HRP.Velocity = Vector3.new((LeftLV.X * walkSpeed), HRP.Velocity.Y, (LeftLV.Z * walkSpeed))
   end
   if D == true then
       local RightLV = (C.CFrame * CFrame.Angles(0, math.rad(-90), 0)).LookVector
       HRP.Velocity = Vector3.new((RightLV.X * walkSpeed), HRP.Velocity.Y, (RightLV.Z * walkSpeed))
   end

   xVelo, yVelo, W, A, S, D = nil
end)
end

    Tab:AddButton({
	Name = "Speed",
	Callback = function()
	    speedxd()
      		print("speed is on now")
  	end    
})

Tab:AddButton({
    Name = "Safe Place",
    Callback = function()
            local TweenService = game:GetService("TweenService")
    local Tw = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0), 
    {CFrame = CFrame.new(382.675232, 52.1050148, 241.112534, 0.999999702, 
        -1.09648619e-08, 0.000779382011, 1.09556e-08, 1, 1.18875825e-08, -0.000779382011, 
        -1.187904e-08, 0.999999702)}):Play()
    end
})

Tab:AddButton({
	Name = "Fly (F)",
	Callback = function()
        _G.Speed = 150  -- change the speed to ur liking
    _G.Key = Enum.KeyCode.F  -- change to whatever keybind you want

    local UIS = game:GetService("UserInputService")
    local OnRender = game:GetService("RunService").RenderStepped

    local Player = game:GetService("Players").LocalPlayer
    local Character = Player.Character or Player.CharacterAdded:Wait()

    local Camera = workspace.CurrentCamera
    local Root = Character:WaitForChild("HumanoidRootPart")

    local C1, C2, C3;
    local f = {Flying = false, Forward = false, Backward = false, Left = false, Right = false}

    C1 = UIS.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.Keyboard then
            if Input.KeyCode == _G.Key then
                f.Flying = not f.Flying
                Root.Anchored = f.Flying
            elseif Input.KeyCode == Enum.KeyCode.W then
                f.Forward = true
            elseif Input.KeyCode == Enum.KeyCode.S then
                f.Backward = true
            elseif Input.KeyCode == Enum.KeyCode.A then
                f.Left = true
            elseif Input.KeyCode == Enum.KeyCode.D then
                f.Right = true
            end
        end
    end)
    
    C2 = UIS.InputEnded:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.Keyboard then
            if Input.KeyCode == Enum.KeyCode.W then
                f.Forward = false
            elseif Input.KeyCode == Enum.KeyCode.S then
                f.Backward = false
            elseif Input.KeyCode == Enum.KeyCode.A then
                f.Left = false
            elseif Input.KeyCode == Enum.KeyCode.D then
                f.Right = false
            end
        end
    end)
    
    C3 = Camera:GetPropertyChangedSignal("CFrame"):Connect(function()
        if f.Flying then
            Root.CFrame = CFrame.new(Root.CFrame.Position, Root.CFrame.Position + Camera.CFrame.LookVector)
        end
    end)
    
    while true do 
        local Delta = OnRender:Wait()
        if f.Flying then
            if f.Forward then
                Root.CFrame = Root.CFrame + (Camera.CFrame.LookVector * (Delta * _G.Speed))
            end
            if f.Backward then
                Root.CFrame = Root.CFrame + (-Camera.CFrame.LookVector * (Delta * _G.Speed))
            end
            if f.Left then
                Root.CFrame = Root.CFrame + (-Camera.CFrame.RightVector * (Delta * _G.Speed))
            end
            if f.Right then
                Root.CFrame = Root.CFrame + (Camera.CFrame.RightVector * (Delta * _G.Speed))
            end
        end
    end
  	end    
})
_G.jump = true
_G.farm = true

Tab:AddToggle({
    Name = "Auto Farm",
    Default = false,
    Callback = function(Value)

_G.farm = Value
local Players = game.Players:GetPlayers()
local Player = game.Players.LocalPlayer
--teleport script


if #Players > 1 then -- you as a player
    table.remove(Players,1) -- remove you
end

while _G.farm do
local rnd = Players[math.random(1,#Players)] -- random players

local sav = Player.Character.HumanoidRootPart.CFrame -- saved pos
print(rnd)
wait(0.2)
Player.Character.HumanoidRootPart.CFrame = rnd.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,0) -- teleport and + the numbers 

wait(0.2)
Player.Character.HumanoidRootPart.CFrame = rnd.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,0) -- teleport and + the numbers 
wait(0.2)
Player.Character.HumanoidRootPart.CFrame = rnd.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,0) -- teleport and + the numbers 
wait()
end
        
end
})

Tab:AddButton({
	Name = "Inf Yield",
	Callback = function()
		loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source')))()
  	end    
})

Tab:AddToggle({
	Name = "Inf Jump",
	Default = false,
	Callback = function(Value)
	    _G.jump = Value
	        game:GetService("UserInputService").JumpRequest:connect(function()
	    if _G.jump then
		    game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	    	   else
	   _G.jump = false
	    end
    end)
  	end    
})

Tab:AddButton({
	Name = "ESP",
	Callback = function()
	    getgenv().enabled = true --Toggle on/off
getgenv().filluseteamcolor = false --Toggle fill color using player team color on/off
getgenv().outlineuseteamcolor = false --Toggle outline color using player team color on/off
getgenv().fillcolor = Color3.new(0, 0, 0) --Change fill color, no need to edit if using team color
getgenv().outlinecolor = Color3.new(1, 1, 1) --Change outline color, no need to edit if using team color
getgenv().filltrans = 0.4 --Change fill transparency
getgenv().outlinetrans = 0 --Change outline transparency
loadstring(game:HttpGet("https://raw.githubusercontent.com/zntly/highlight-esp/main/esp.lua"))()
  	end    
})
