for i = 1,1 do 
        game.StarterGui:SetCore("SendNotification", {
        Title = "Made By Newj/Alan",
        Text = "Fuck Yall Skids",
        Icon = "",
        Duration = 1,
        })
    end

local InsertedObjects = Instance.new("ScreenGui")
local Gradient = Instance.new("Frame")
local UIGradient = Instance.new("UIGradient")
local UICorner = Instance.new("UICorner")
local LoopDetector = Instance.new("TextLabel")
local player = Instance.new("TextLabel")

--Properties:

InsertedObjects.ResetOnSpawn = false
InsertedObjects.Name = "InsertedObjects"
InsertedObjects.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Gradient.Name = "Gradient"
Gradient.Parent = InsertedObjects
Gradient.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gradient.BorderColor3 = Color3.fromRGB(27, 42, 53)
Gradient.BorderSizePixel = 0
Gradient.Position = UDim2.new(0.5, 0, 0.524539888, 0)
Gradient.Size = UDim2.new(0, 228, 0, 180)

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(137, 0, 254)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(223, 0, 255))}
UIGradient.Parent = Gradient

UICorner.CornerRadius = UDim.new(0, 4)
UICorner.Parent = Gradient

LoopDetector.Name = "Loop Detector"
LoopDetector.Parent = Gradient
LoopDetector.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LoopDetector.BackgroundTransparency = 1.000
LoopDetector.Size = UDim2.new(0, 228, 0, 50)
LoopDetector.Font = Enum.Font.SourceSans
LoopDetector.Text = "Loop Detector"
LoopDetector.TextColor3 = Color3.fromRGB(0, 0, 0)
LoopDetector.TextSize = 24.000

player.Name = "player"
player.Parent = Gradient
player.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
player.BackgroundTransparency = 1.000
player.Position = UDim2.new(0, 0, 0.416666657, 0)
player.Size = UDim2.new(0, 228, 0, 50)
player.Font = Enum.Font.SourceSans
player.Text = ""
player.TextColor3 = Color3.fromRGB(0, 0, 0)
player.TextSize = 16.000

-- Scripts:

local function CYBH_fake_script() -- Gradient.LocalScript 
	local script = Instance.new('LocalScript', Gradient)

	local UIS = game:GetService("UserInputService")
	function dragify(Frame)
		dragToggle = nil
		local dragSpeed = 0
		dragInput = nil
		dragStart = nil
		local dragPos = nil
		function updateInput(input)
			local Delta = input.Position - dragStart
			local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
			game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.25), {Position = Position}):Play()
		end
		Frame.InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
				dragToggle = true
				dragStart = input.Position
				startPos = Frame.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragToggle = false
					end
				end)
			end
		end)
		Frame.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)
		game:GetService("UserInputService").InputChanged:Connect(function(input)
			if input == dragInput and dragToggle then
				updateInput(input)
			end
		end)
	end
	
	dragify(script.Parent)
end
coroutine.wrap(CYBH_fake_script)()

coroutine.wrap(function()
game:GetService("RunService").RenderStepped:connect(function()
    pcall(function()
	if game.Players.LocalPlayer.Character.Humanoid:FindFirstChild("creator") then
		player.Text = tostring(game.Players.LocalPlayer.Character.Humanoid.creator.Value).." Is a skid"
	elseif not game.Players.LocalPlayer.Character.Humanoid:FindFirstChild("creator") then
		player.Text = ''
	        end
        end)
    end)
end)()

coroutine.wrap(function()
game:GetService("RunService").RenderStepped:connect(function()
if player.Text ~= '' then
game.ReplicatedStorage.Remotes.Human_Punch:FireServer(game.Players.LocalPlayer.Character.RightHand, "RightPunch", workspace[tostring(game.Players.LocalPlayer.Character.Humanoid:FindFirstChild("creator").Value)].UpperTorso,5,true,"RightPunch",game.Players.LocalPlayer.Backpack.Boxing.Handle.Hit,5)
game.ReplicatedStorage.Remotes.Human_Punch:FireServer(game.Players.LocalPlayer.Character.LeftHand, "LeftPunch", workspace[tostring(game.Players.LocalPlayer.Character.Humanoid:FindFirstChild("creator").Value)].UpperTorso,5,true,"LeftPunch",game.Players.LocalPlayer.Backpack.Boxing.Handle.Hit,5)
else
end
end)
end)()
