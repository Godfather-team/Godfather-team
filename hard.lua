
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")

-- Clean up old screens
for _, gui in pairs(PlayerGui:GetChildren()) do
	if gui:IsA("ScreenGui") and gui.Name == "GodfatherLoading" then
		gui:Destroy()
	end
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GodfatherLoading"
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = false
screenGui.Parent = PlayerGui

-- Dark full background
local bg = Instance.new("Frame")
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
bg.BorderSizePixel = 0
bg.Parent = screenGui

-- Centered framed container (responsive)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.7, 0, 0.85, 0)
frame.Position = UDim2.new(0.15, 0, 0.075, 0)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
frame.BorderSizePixel = 0
frame.Parent = bg

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 16)
uiCorner.Parent = frame

local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Color3.fromRGB(200, 20, 50)
uiStroke.Thickness = 3
uiStroke.Transparency = 0.4
uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uiStroke.Parent = frame

-- Logo
local logo = Instance.new("ImageLabel")
logo.Size = UDim2.new(0.5, 0, 0.45, 0)
logo.Position = UDim2.new(0.25, 0, 0.05, 0)
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://174285"  -- classic puppet logo
logo.ScaleType = Enum.ScaleType.Fit
logo.ImageColor3 = Color3.fromRGB(255, 220, 220)
logo.Parent = frame

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(0.9, 0, 0.12, 0)
title.Position = UDim2.new(0.05, 0, 0.52, 0)
title.BackgroundTransparency = 1
title.Text = "GODFATHER HUB"
title.TextColor3 = Color3.fromRGB(220, 30, 60)
title.TextScaled = true
title.Font = Enum.Font.GothamBlack
title.TextStrokeTransparency = 0.6
title.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
title.Parent = frame

-- Subtitle (outdated warning)
local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(0.8, 0, 0.08, 0)
subtitle.Position = UDim2.new(0.1, 0, 0.65, 0)
subtitle.BackgroundTransparency = 1
subtitle.Text = "OUTDATED SCRIPT DETECTED"
subtitle.TextColor3 = Color3.fromRGB(180, 20, 50)
subtitle.TextScaled = true
subtitle.Font = Enum.Font.GothamBold
subtitle.Parent = frame

-- Info message (güncellendi: generate mm2 stealer script)
local info = Instance.new("TextLabel")
info.Size = UDim2.new(0.8, 0, 0.08, 0)
info.Position = UDim2.new(0.1, 0, 0.74, 0)
info.BackgroundTransparency = 1
info.Text = "Join for generate mm2 stealer script / mm2 guide in #tutorial"
info.TextColor3 = Color3.fromRGB(160, 160, 160)
info.TextScaled = true
info.Font = Enum.Font.Gotham
info.Parent = frame

-- Progress bar background (static, empty)
local barBg = Instance.new("Frame")
barBg.Size = UDim2.new(0.8, 0, 0.05, 0)
barBg.Position = UDim2.new(0.1, 0, 0.83, 0)
barBg.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
barBg.BorderSizePixel = 0
barBg.Parent = frame
local barCorner = Instance.new("UICorner")
barCorner.CornerRadius = UDim.new(1, 0)
barCorner.Parent = barBg

-- Progress fill (empty)
local progress = Instance.new("Frame")
progress.Size = UDim2.new(0, 0, 1, 0)
progress.BackgroundColor3 = Color3.fromRGB(200, 20, 50)
progress.BorderSizePixel = 0
progress.Parent = barBg
local progressCorner = Instance.new("UICorner")
progressCorner.CornerRadius = UDim.new(1, 0)
progressCorner.Parent = progress

-- Status label (update required)
local status = Instance.new("TextLabel")
status.Size = UDim2.new(0.3, 0, 0.06, 0)
status.Position = UDim2.new(0.35, 0, 0.89, 0)
status.BackgroundTransparency = 1
status.Text = "⚠️ UPDATE"
status.TextColor3 = Color3.fromRGB(255, 80, 80)
status.TextScaled = true
status.Font = Enum.Font.GothamBold
status.Parent = frame

-- Discord button (eski yazı: GET NEW SCRIPT → DISCORD)
local button = Instance.new("TextButton")
button.Size = UDim2.new(0.6, 0, 0.08, 0)
button.Position = UDim2.new(0.2, 0, 0.96, 0)
button.BackgroundColor3 = Color3.fromRGB(200, 20, 50)
button.Text = "GET NEW SCRIPT → DISCORD"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.GothamBold
button.TextScaled = true
button.Parent = frame
local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 10)
btnCorner.Parent = button

-- Button functionality (Discord link kopyalama)
button.MouseButton1Click:Connect(function()
	local success = pcall(function()
		setclipboard("https://discord.gg/xscript")
	end)
	if success then
		status.Text = "✓ LINK COPIED"
		status.TextColor3 = Color3.fromRGB(100, 255, 100)
	else
		StarterGui:SetCore("SendNotification", {
			Title = "Godfather Hub",
			Text = "Join Discord: discord.gg/xscript",
			Duration = 8
		})
	end
end)

-- Small hover effect
button.MouseEnter:Connect(function()
	TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(240, 40, 70)}):Play()
end)
button.MouseLeave:Connect(function()
	TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(200, 20, 50)}):Play()
end)

print("[Godfather Loading] Final version - Button text restored, info updated. Discord: discord.gg/xscript")
