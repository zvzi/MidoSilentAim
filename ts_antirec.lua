local Aimbot = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")

local Mouse = game.Players.LocalPlayer:GetMouse()

holdx = false

Aimbot.Name = "Aimbot"
Aimbot.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Aimbot.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Aimbot.ResetOnSpawn = false

TextLabel.Parent = Aimbot
TextLabel.BackgroundColor3 = Color3.new(0.444511, 0.771695, 0.998947)
TextLabel.BorderColor3 = Color3.new(0.39057, 0.39057, 0.39057)
TextLabel.BorderSizePixel = 2
TextLabel.Position = UDim2.new(0.75, 0, 0.75, 0)
TextLabel.Size = UDim2.new(0, 132, 0, 50)
TextLabel.Font = Enum.Font.Code
TextLabel.Text = "Target: Nil"
TextLabel.TextColor3 = Color3.new(0.19266, 0.192645, 0.192645)
TextLabel.TextScaled = false
TextLabel.TextSize = 15
TextLabel.TextWrapped = true
TextLabel.BackgroundTransparency = 1


Mouse.KeyDown:Connect(function(key)
    if key == "q" then
        if Mouse.Target.Parent:FindFirstChild("Humanoid") then
            TextLabel.Text = Mouse.Target.Parent.Name
        end
        if Mouse.Target.Parent:IsA("Accessory") then
            TextLabel.Text = Mouse.Target.Parent.Parent.Name
        end
    end
end)

Mouse.KeyDown:Connect(function(key)
    if key == "e" then
        holdx = true
        while holdx do
            game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Shoot:FireServer(game.Players:FindFirstChild(TextLabel.Text).Character.Torso.CFrame+game.Players:FindFirstChild(TextLabel.Text).Character.Torso.Velocity/6.3)
            wait(0.01)
        end
    end
end)