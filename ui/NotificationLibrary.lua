-- Gui to Lua
-- Version: 3.2

-- Functions:

local function genRandomName()
	local nameData = ""
	for i = 0,15 do
		nameData = nameData .. tostring(string.char(math.ceil(math.random() * 254)))
	end
	return nameData
end


-- Instances:

local NotificationUI = Instance.new("ScreenGui")
local Notifications = Instance.new("Folder")
local NotificationTemplate = Instance.new("Frame")
local Text = Instance.new("TextLabel")
local BOT = Instance.new("Frame")

--Properties:

NotificationUI.Name = genRandomName()
NotificationUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
NotificationUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Notifications.Name = genRandomName()
Notifications.Parent = NotificationUI

NotificationTemplate.Name = genRandomName()
NotificationTemplate.Parent = NotificationUI
NotificationTemplate.AnchorPoint = Vector2.new(1, 0)
NotificationTemplate.BackgroundColor3 = Color3.fromRGB(43, 43, 44)
NotificationTemplate.BackgroundTransparency = 0.3
NotificationTemplate.BorderSizePixel = 0
NotificationTemplate.Position = UDim2.new(1.5, 0, 0.850000024, 0)
NotificationTemplate.Size = UDim2.new(0.150000006, 0, 0.100000001, 0)
NotificationTemplate.ZIndex = 2

Text.Name = genRandomName()
Text.Parent = NotificationTemplate
Text.AnchorPoint = Vector2.new(0.5, 0.5)
Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Text.BackgroundTransparency = 1.000
Text.Position = UDim2.new(0.498515248, 0, 0.49425891, 0)
Text.Size = UDim2.new(0.909412682, 0, 0.70074904, 0)
Text.ZIndex = 4
Text.Font = Enum.Font.SourceSansLight
Text.Text = ""
Text.TextColor3 = Color3.fromRGB(255, 255, 255)
Text.TextScaled = true
Text.TextSize = 14.000
Text.TextWrapped = true

BOT.Name = genRandomName()
BOT.Parent = NotificationTemplate
BOT.AnchorPoint = Vector2.new(0.5, 0.5)
BOT.BackgroundColor3 = Color3.fromRGB(9, 135, 0)
BOT.BorderSizePixel = 0
BOT.Position = UDim2.new(0.5, 0, 0.96018523, 0)
BOT.Size = UDim2.new(0.0653771311, 0, 0.067618072, 0)
BOT.ZIndex = 6



	local UI = NotificationUI
	local MaxNotifications = 5
	local NotificationDuration = 2
	
	function createNotification(NotificationText,boolValue)
	    local Notifications2 = Notifications:GetChildren()
		if #Notifications2 >= MaxNotifications then
			Notifications2[1]:TweenPosition(UDim2.new(1.5, 0, Notifications2[1].Position.Y.Scale, 0),"InOut","Linear",0.2,true);wait(0.2)
			Notifications2[1]:Destroy()
			for i,v in pairs(Notifications2) do if v ~= nil then
				v:TweenPosition(UDim2.new(0.97, 0, v.Position.Y.Scale - 0.12, 0),"InOut","Linear",0.2,true)
				end
			end
			local NewNotification = NotificationTemplate:Clone()
			NewNotification.Name = genRandomName()
			NewNotification.Parent = UI.Notifications
			if boolValue then NewNotification.BOT.BackgroundColor3 = Color3.fromRGB(135, 2, 2) else NewNotification.BOT.BackgroundColor3 = Color3.fromRGB(9, 135, 0) end
			NewNotification.Text.Text = NotificationText
			NewNotification:TweenPosition(UDim2.new(0.97, 0, 0.85, 0),"InOut","Linear",0.2,true)
		wait(0.2)
			NewNotification:FindFirstChildOfClass("Frame"):TweenPosition(Udim2.new(1, 0,0.068, 0),"InOut","Quad",0.5)
		else
			for i,v in pairs(Notifications2) do
				v:TweenPosition(UDim2.new(0.97, 0, v.Position.Y.Scale - 0.12, 0),"InOut","Linear",0.2,true)
			end
			local NewNotification = NotificationTemplate:Clone()
			NewNotification.Name = genRandomName()
			NewNotification.Parent = Notifications
			if boolValue then NewNotification:FindFirstChildWhichIsA("Frame").BackgroundColor3 = Color3.fromRGB(135, 2, 2) else NewNotification:FindFirstChildOfClass("Frame").BackgroundColor3 = Color3.fromRGB(9, 135, 0) end
			
			NewNotification:FindFirstChildWhichIsA("TextLabel").Text = NotificationText
			NewNotification:TweenPosition(UDim2.new(0.97, 0, 0.85, 0),"InOut","Linear",0.2,true)
			delay(NotificationDuration,function()
				NewNotification:TweenPosition(UDim2.new(1.5, 0, NewNotification.Position.Y.Scale, 0),"InOut","Linear",0.2,true);NewNotification:FindFirstChildOfClass("Frame"):TweenPosition(Udim2.new(1, 0,0.068, 0),"InOut","Quad",0.5);wait(0.2)
	
				NewNotification:Destroy()
			end)
		end
	end
	



