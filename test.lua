local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
api.script_id = "e7573b83d61286ef49345959a81a096b"

local LINK_LINKVERTISE = "https://ads.luarmor.net/get_key?for=VoidHub_Linkvertise-KtYjBPLQCQIs"
local LINK_WORKINK     = "https://ads.luarmor.net/get_key?for=VoidHub_Work_Ink-fmzaQzjEFdzz"
local DISCORD          = "https://discord.gg/5sVZW7mQRb"

local BLACK      = Color3.fromRGB(5, 5, 7)
local PANEL      = Color3.fromRGB(9, 9, 13)
local CARD       = Color3.fromRGB(14, 14, 20)
local SILVER     = Color3.fromRGB(190, 195, 210)
local ACCENT     = Color3.fromRGB(160, 210, 230)
local WHITE      = Color3.fromRGB(235, 238, 245)
local MUTED      = Color3.fromRGB(75, 80, 100)
local RED        = Color3.fromRGB(185, 40, 50)
local STROKE     = Color3.fromRGB(30, 32, 44)
local BTN_HOVER  = Color3.fromRGB(22, 26, 38)
local BTN_BLUE   = Color3.fromRGB(25, 110, 155)

local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
local guiWidth  = isMobile and 300 or 345
local guiHeight = isMobile and 405 or 440

local function corner(parent, radius)
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, radius or 8)
	c.Parent = parent
	return c
end

local function stroke(parent, color, thick, trans)
	local s = Instance.new("UIStroke")
	s.Color = color
	s.Thickness = thick or 1
	s.Transparency = trans or 0
	s.Parent = parent
	return s
end

local function label(parent, props)
	local l = Instance.new("TextLabel")
	l.BackgroundTransparency = 1
	l.Font = props.font or Enum.Font.Gotham
	l.TextSize = props.size or 13
	l.TextColor3 = props.color or WHITE
	l.Text = props.text or ""
	l.Size = props.sz or UDim2.new(1, 0, 0, 20)
	l.Position = props.pos or UDim2.new(0, 0, 0, 0)
	l.TextXAlignment = props.align or Enum.TextXAlignment.Left
	l.RichText = props.rich or false
	l.TextTruncate = Enum.TextTruncate.AtEnd
	l.Parent = parent
	return l
end

local blur = Instance.new("BlurEffect")
blur.Size = 20
blur.Parent = Lighting

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "VoidHubKey"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = playerGui

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, guiWidth, 0, guiHeight)
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.Position = UDim2.new(0.5, 0, 0.55, 0)
Main.BackgroundColor3 = BLACK
Main.BackgroundTransparency = 1
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Parent = ScreenGui
corner(Main, 14)
stroke(Main, Color3.fromRGB(45, 50, 68), 1, 0.35)

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 46)
TopBar.BackgroundColor3 = PANEL
TopBar.BorderSizePixel = 0
TopBar.ZIndex = 2
TopBar.Parent = Main
corner(TopBar, 14)

local topMask = Instance.new("Frame")
topMask.Size = UDim2.new(1, 0, 0.5, 0)
topMask.Position = UDim2.new(0, 0, 0.5, 0)
topMask.BackgroundColor3 = PANEL
topMask.BorderSizePixel = 0
topMask.ZIndex = 2
topMask.Parent = TopBar

local Icon = Instance.new("ImageLabel")
Icon.Size = UDim2.new(0, 24, 0, 24)
Icon.Position = UDim2.new(0, 12, 0.5, -12)
Icon.BackgroundTransparency = 1
Icon.Image = "rbxassetid://101833678008843"
Icon.ImageColor3 = SILVER
Icon.ScaleType = Enum.ScaleType.Fit
Icon.ZIndex = 3
Icon.Parent = TopBar

local TitleLbl = Instance.new("TextLabel")
TitleLbl.Size = UDim2.new(1, -120, 1, 0)
TitleLbl.Position = UDim2.new(0, 44, 0, 0)
TitleLbl.BackgroundTransparency = 1
TitleLbl.Text = "VOIDHUB"
TitleLbl.TextColor3 = SILVER
TitleLbl.TextSize = 10
TitleLbl.Font = Enum.Font.GothamBold
TitleLbl.TextXAlignment = Enum.TextXAlignment.Left
TitleLbl.ZIndex = 3
TitleLbl.Parent = TopBar

local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 24, 0, 24)
MinBtn.Position = UDim2.new(1, -66, 0.5, -12)
MinBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 42)
MinBtn.Text = "—"
MinBtn.TextColor3 = SILVER
MinBtn.TextSize = 12
MinBtn.Font = Enum.Font.GothamBold
MinBtn.BorderSizePixel = 0
MinBtn.AutoButtonColor = false
MinBtn.ZIndex = 3
MinBtn.Parent = TopBar
corner(MinBtn, 99)
stroke(MinBtn, Color3.fromRGB(45, 50, 68), 1, 0)

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 24, 0, 24)
CloseBtn.Position = UDim2.new(1, -36, 0.5, -12)
CloseBtn.BackgroundColor3 = RED
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = WHITE
CloseBtn.TextSize = 10
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.BorderSizePixel = 0
CloseBtn.AutoButtonColor = false
CloseBtn.ZIndex = 3
CloseBtn.Parent = TopBar
corner(CloseBtn, 99)

local Body = Instance.new("Frame")
Body.Size = UDim2.new(1, -28, 1, -60)
Body.Position = UDim2.new(0, 14, 0, 52)
Body.BackgroundTransparency = 1
Body.Parent = Main

local layout = Instance.new("UIListLayout")
layout.FillDirection = Enum.FillDirection.Vertical
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Padding = UDim.new(0, 8)
layout.Parent = Body

local titleWrap = Instance.new("Frame")
titleWrap.Size = UDim2.new(1, 0, 0, 48)
titleWrap.BackgroundTransparency = 1
titleWrap.LayoutOrder = 1
titleWrap.Parent = Body

label(titleWrap, {
	text = "WELCOME TO THE,",
	size = 14,
	font = Enum.Font.GothamBold,
	color = WHITE,
	sz = UDim2.new(1, 0, 0, 18),
	pos = UDim2.new(0, 0, 0, 0),
})

local NameLbl = label(titleWrap, {
	text = "VoidHub",
	size = 21,
	font = Enum.Font.GothamBold,
	color = ACCENT,
	sz = UDim2.new(1, 0, 0, 24),
	pos = UDim2.new(0, 0, 0, 20),
})

local nameGrad = Instance.new("UIGradient")
nameGrad.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 220, 240)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(120, 180, 215)),
})
nameGrad.Rotation = 90
nameGrad.Parent = NameLbl

local Divider = Instance.new("Frame")
Divider.Size = UDim2.new(1, 0, 0, 1)
Divider.BackgroundColor3 = Color3.fromRGB(22, 25, 36)
Divider.BorderSizePixel = 0
Divider.LayoutOrder = 2
Divider.Parent = Body

local licenseWrap = Instance.new("Frame")
licenseWrap.Size = UDim2.new(1, 0, 0, 18)
licenseWrap.BackgroundTransparency = 1
licenseWrap.LayoutOrder = 3
licenseWrap.Parent = Body

label(licenseWrap, {
	text = "License Key",
	size = 10,
	color = MUTED,
	sz = UDim2.new(1, -18, 1, 0),
	pos = UDim2.new(0, 0, 0, 0),
})

local LockIco = Instance.new("ImageLabel")
LockIco.Size = UDim2.new(0, 12, 0, 12)
LockIco.Position = UDim2.new(1, -12, 0, 3)
LockIco.BackgroundTransparency = 1
LockIco.Image = "rbxassetid://6031094678"
LockIco.ImageColor3 = ACCENT
LockIco.Parent = licenseWrap

local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.new(1, 0, 0, 40)
KeyFrame.BackgroundColor3 = CARD
KeyFrame.BorderSizePixel = 0
KeyFrame.LayoutOrder = 4
KeyFrame.Parent = Body
corner(KeyFrame, 9)
stroke(KeyFrame, Color3.fromRGB(30, 35, 52), 1, 0)

local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(1, -18, 1, 0)
KeyInput.Position = UDim2.new(0, 10, 0, 0)
KeyInput.BackgroundTransparency = 1
KeyInput.PlaceholderText = "Enter your key here..."
KeyInput.PlaceholderColor3 = Color3.fromRGB(55, 60, 80)
KeyInput.Text = ""
KeyInput.TextColor3 = WHITE
KeyInput.TextSize = 12
KeyInput.Font = Enum.Font.Gotham
KeyInput.ClearTextOnFocus = false
KeyInput.TextXAlignment = Enum.TextXAlignment.Left
KeyInput.Parent = KeyFrame

local RedeemBtn = Instance.new("TextButton")
RedeemBtn.Size = UDim2.new(1, 0, 0, 40)
RedeemBtn.BackgroundColor3 = BTN_BLUE
RedeemBtn.Text = "▶   Redeem"
RedeemBtn.TextColor3 = WHITE
RedeemBtn.TextSize = 13
RedeemBtn.Font = Enum.Font.GothamBold
RedeemBtn.BorderSizePixel = 0
RedeemBtn.AutoButtonColor = false
RedeemBtn.LayoutOrder = 5
RedeemBtn.Parent = Body
corner(RedeemBtn, 9)

local redeemGrad = Instance.new("UIGradient")
redeemGrad.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 145, 200)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 90, 140)),
})
redeemGrad.Rotation = 90
redeemGrad.Parent = RedeemBtn

local supportWrap = Instance.new("Frame")
supportWrap.Size = UDim2.new(1, 0, 0, 16)
supportWrap.BackgroundTransparency = 1
supportWrap.LayoutOrder = 6
supportWrap.Parent = Body

label(supportWrap, {
	text = "Need support?",
	size = 10,
	color = MUTED,
	sz = UDim2.new(0, 72, 1, 0),
	pos = UDim2.new(0, 0, 0, 0),
})

local DiscordLbl = Instance.new("TextButton")
DiscordLbl.Size = UDim2.new(0, 98, 1, 0)
DiscordLbl.Position = UDim2.new(0, 80, 0, 0)
DiscordLbl.BackgroundTransparency = 1
DiscordLbl.Text = "Join the Discord"
DiscordLbl.TextColor3 = ACCENT
DiscordLbl.TextSize = 10
DiscordLbl.Font = Enum.Font.GothamSemibold
DiscordLbl.TextXAlignment = Enum.TextXAlignment.Left
DiscordLbl.AutoButtonColor = false
DiscordLbl.Parent = supportWrap

local providerWrap = Instance.new("Frame")
providerWrap.Size = UDim2.new(1, 0, 0, 34)
providerWrap.BackgroundTransparency = 1
providerWrap.LayoutOrder = 7
providerWrap.Parent = Body

local providerLayout = Instance.new("UIListLayout")
providerLayout.FillDirection = Enum.FillDirection.Horizontal
providerLayout.SortOrder = Enum.SortOrder.LayoutOrder
providerLayout.Padding = UDim.new(0, 8)
providerLayout.Parent = providerWrap

local providerButtonWidth = math.floor((guiWidth - 28 - 8) / 2)

local providerData = {
	{ text = "Linkvertise", link = LINK_LINKVERTISE },
	{ text = "Work.ink", link = LINK_WORKINK },
}

local providerButtons = {}

for _, data in ipairs(providerData) do
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(0, providerButtonWidth, 1, 0)
	btn.BackgroundColor3 = CARD
	btn.Text = data.text
	btn.TextColor3 = SILVER
	btn.TextSize = 11
	btn.Font = Enum.Font.GothamSemibold
	btn.BorderSizePixel = 0
	btn.AutoButtonColor = false
	btn.Parent = providerWrap
	corner(btn, 9)
	stroke(btn, Color3.fromRGB(35, 40, 58), 1, 0)
	table.insert(providerButtons, btn)

	btn.MouseEnter:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.16, Enum.EasingStyle.Quint), {
			BackgroundColor3 = BTN_HOVER
		}):Play()
	end)

	btn.MouseLeave:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.16, Enum.EasingStyle.Quint), {
			BackgroundColor3 = CARD
		}):Play()
	end)

	btn.MouseButton1Click:Connect(function()
		setclipboard(data.link)
		toast("Link copied — paste it in your browser!", true)
	end)
end

local stepsWrap = Instance.new("Frame")
stepsWrap.Size = UDim2.new(1, 0, 0, 78)
stepsWrap.BackgroundTransparency = 1
stepsWrap.LayoutOrder = 8
stepsWrap.Parent = Body

local stepLayout = Instance.new("UIListLayout")
stepLayout.FillDirection = Enum.FillDirection.Vertical
stepLayout.SortOrder = Enum.SortOrder.LayoutOrder
stepLayout.Padding = UDim.new(0, 6)
stepLayout.Parent = stepsWrap

local stepInfo = {
	{ n = "1", t = "Choose your key provider below" },
	{ n = "2", t = "Complete the steps to get a key" },
	{ n = "3", t = "Paste your key above and redeem" },
}

for i, s in ipairs(stepInfo) do
	local row = Instance.new("Frame")
	row.Size = UDim2.new(1, 0, 0, 20)
	row.BackgroundTransparency = 1
	row.LayoutOrder = i
	row.Parent = stepsWrap

	local badge = Instance.new("Frame")
	badge.Size = UDim2.new(0, 18, 0, 18)
	badge.Position = UDim2.new(0, 0, 0.5, -9)
	badge.BackgroundColor3 = Color3.fromRGB(25, 100, 150)
	badge.BorderSizePixel = 0
	badge.Parent = row
	corner(badge, 99)

	local badgeTxt = Instance.new("TextLabel")
	badgeTxt.Size = UDim2.new(1, 0, 1, 0)
	badgeTxt.BackgroundTransparency = 1
	badgeTxt.Text = s.n
	badgeTxt.TextColor3 = WHITE
	badgeTxt.TextSize = 10
	badgeTxt.Font = Enum.Font.GothamBold
	badgeTxt.Parent = badge

	label(row, {
		text = s.t,
		size = 10,
		color = Color3.fromRGB(140, 148, 168),
		sz = UDim2.new(1, -26, 1, 0),
		pos = UDim2.new(0, 26, 0, 0),
	})
end

local function hoverButton(btn, normalColor)
	btn.MouseEnter:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.16, Enum.EasingStyle.Quint), {
			BackgroundColor3 = BTN_HOVER
		}):Play()
	end)
	btn.MouseLeave:Connect(function()
		TweenService:Create(btn, TweenInfo.new(0.16, Enum.EasingStyle.Quint), {
			BackgroundColor3 = normalColor
		}):Play()
	end)
end

hoverButton(RedeemBtn, BTN_BLUE)
hoverButton(MinBtn, MinBtn.BackgroundColor3)
hoverButton(CloseBtn, CloseBtn.BackgroundColor3)

local minimized = false
MinBtn.MouseButton1Click:Connect(function()
	minimized = not minimized
	if minimized then
		Body.Visible = false
		TweenService:Create(Main, TweenInfo.new(0.28, Enum.EasingStyle.Quint), {
			Size = UDim2.new(0, guiWidth, 0, 46)
		}):Play()
		MinBtn.Text = "+"
	else
		Body.Visible = true
		TweenService:Create(Main, TweenInfo.new(0.28, Enum.EasingStyle.Quint), {
			Size = UDim2.new(0, guiWidth, 0, guiHeight)
		}):Play()
		MinBtn.Text = "—"
	end
end)

DiscordLbl.MouseButton1Click:Connect(function()
	setclipboard(DISCORD)
	toast("Discord link copied!", true)
end)

local function destroyGui()
	if blur then blur:Destroy() end
	if ScreenGui then ScreenGui:Destroy() end
end

CloseBtn.MouseButton1Click:Connect(function()
	TweenService:Create(Main, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {
		Position = UDim2.new(0.5, 0, 0.58, 0),
		BackgroundTransparency = 1,
	}):Play()
	task.wait(0.28)
	destroyGui()
end)

local function toast(msg, success)
	local bg = Instance.new("Frame")
	bg.Size = UDim2.new(1, -28, 0, 34)
	bg.Position = UDim2.new(0, 14, 1, 10)
	bg.BackgroundColor3 = success and Color3.fromRGB(12, 80, 65) or Color3.fromRGB(110, 28, 38)
	bg.BorderSizePixel = 0
	bg.ZIndex = 20
	bg.Parent = Main
	corner(bg, 8)

	local txt = Instance.new("TextLabel")
	txt.Size = UDim2.new(1, -12, 1, 0)
	txt.Position = UDim2.new(0, 8, 0, 0)
	txt.BackgroundTransparency = 1
	txt.Text = msg
	txt.TextColor3 = WHITE
	txt.TextSize = 11
	txt.Font = Enum.Font.Gotham
	txt.TextXAlignment = Enum.TextXAlignment.Left
	txt.ZIndex = 21
	txt.Parent = bg

	TweenService:Create(bg, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {
		Position = UDim2.new(0, 14, 1, -44)
	}):Play()

	task.delay(2.4, function()
		if bg and bg.Parent then
			TweenService:Create(bg, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {
				Position = UDim2.new(0, 14, 1, 10)
			}):Play()
			task.wait(0.28)
			if bg and bg.Parent then
				bg:Destroy()
			end
		end
	end)
end

local checking = false
RedeemBtn.MouseButton1Click:Connect(function()
	if checking then return end

	local key = KeyInput.Text
	if #key < 10 then
		toast("Please enter a valid key.", false)
		return
	end

	checking = true
	RedeemBtn.Text = "Checking..."
	TweenService:Create(RedeemBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {
		BackgroundTransparency = 0.15
	}):Play()

	local ok, status = pcall(function()
		return api.check_key(key)
	end)

	if not ok then
		toast("API error — check your connection.", false)
		RedeemBtn.Text = "▶   Redeem"
		TweenService:Create(RedeemBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {
			BackgroundTransparency = 0
		}):Play()
		checking = false
		return
	end

	if status.code == "KEY_VALID" then
		toast("Key valid! Loading VoidHub...", true)
		RedeemBtn.Text = "✓  Authenticated"
		task.wait(1)
		destroyGui()
		script_key = key
		loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/e7573b83d61286ef49345959a81a096b.lua"))()

	elseif status.code == "KEY_HWID_LOCKED" then
		toast("Key is bound to a different HWID.", false)
		RedeemBtn.Text = "▶   Redeem"
		TweenService:Create(RedeemBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {
			BackgroundTransparency = 0
		}):Play()
		checking = false

	elseif status.code == "KEY_INCORRECT" then
		toast("Key is wrong or doesn't exist.", false)
		RedeemBtn.Text = "▶   Redeem"
		TweenService:Create(RedeemBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {
			BackgroundTransparency = 0
		}):Play()
		checking = false

	else
		toast("Failed: " .. tostring(status.message), false)
		RedeemBtn.Text = "▶   Redeem"
		TweenService:Create(RedeemBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {
			BackgroundTransparency = 0
		}):Play()
		checking = false
	end
end)

TweenService:Create(Main, TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
	Position = UDim2.new(0.5, 0, 0.5, 0),
	BackgroundTransparency = 0,
}):Play()
