--[[
    NEXUS HUB v1.0 — clean build from scratch
    Features: VFX · Utility · Combat · Farming · Pro UI
    Client-side only. No key system. No anti-cheat bypass. Yours.
    _Build the tool. Keep the tool. Don't ask permission from code you don't own._
--]]

-- ============ SERVICES ============
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local Lighting = game:GetService("Lighting")
local TeleportService = game:GetService("TeleportService")
local Stats = game:GetService("Stats")
local lp = Players.LocalPlayer
local camera = workspace.CurrentCamera

-- ============ COMPAT ============
local has = {
    hookmetamethod = typeof(hookmetamethod) == "function",
    getrawmetatable = typeof(getrawmetatable) == "function",
    setreadonly = typeof(setreadonly) == "function",
    newcclosure = typeof(newcclosure) == "function",
    gethui = typeof(gethui) == "function",
    setfpscap = typeof(setfpscap) == "function",
    firetouchinterest = typeof(firetouchinterest) == "function",
    setclipboard = typeof(setclipboard) == "function",
}

-- ============ CONFIG ============
local Config = {
    Theme = Color3.fromRGB(0, 255, 150),
    Accent = Color3.fromRGB(255, 60, 90),

    -- Combat
    FastAttack = false,
    FastAttackRange = 120,
    FastAttackTick = 3,
    Hitbox = false,
    HitboxSize = 5,
    HitboxMode = "All",
    HitboxTarget = "",
    ESPPlayers = false,
    ESPFruits = false,
    ESPNPCs = false,
    ESPTracers = false,

    -- Movement
    SpeedEnabled = false,
    Speed = 16,
    JumpEnabled = false,
    Jump = 50,
    Fly = false,
    FlySpeed = 80,
    Noclip = false,
    InfJump = false,

    -- Farming
    LegendarySword = false,
    FruitM1 = false,
    FruitM1Delay = 0.25,
    AutoCollectFruit = false,
    AutoStoreFruit = false,

    -- Utility
    AntiVoid = false,
    FPSUnlocker = false,

    -- VFX
    Snow = false,
    Rain = false,
    Trail = false,
    TrailColor = Color3.fromRGB(0, 255, 150),
}
getgenv().NEXUS = Config

-- ============ STATE ============
local State = {
    Character = nil,
    Root = nil,
    Humanoid = nil,
    ESPFolder = nil,
    FlyBV = nil,
    FlyBG = nil,
    HitboxOriginals = setmetatable({}, { __mode = "k" }),
    FruitRemoteCache = nil,
    NetCache = nil,
    SnowGui = nil,
    RainPart = nil,
    TrailAttachments = nil,
}

-- ============ CHARACTER BIND ============
local function onCharacter(char)
    State.Character = char
    State.Root = char:WaitForChild("HumanoidRootPart", 10)
    State.Humanoid = char:WaitForChild("Humanoid", 10)
    if State.Root then
        State.FlyBV = State.Root:FindFirstChild("NEXUS_FlyBV")
        State.FlyBG = State.Root:FindFirstChild("NEXUS_FlyBG")
    end
end
if lp.Character then onCharacter(lp.Character) end
lp.CharacterAdded:Connect(onCharacter)

-- ============ UI FOUNDATION ============
local function makeGui()
    local parent = has.gethui and gethui() or CoreGui
    local sg = Instance.new("ScreenGui")
    sg.Name = "NEXUS_HUB"
    sg.ResetOnSpawn = false
    sg.IgnoreGuiInset = true
    sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    pcall(function() sg.Parent = parent end)
    if not sg.Parent then sg.Parent = lp:WaitForChild("PlayerGui") end
    return sg
end

local ScreenGui = makeGui()

-- watermark
local watermark = Instance.new("Frame", ScreenGui)
watermark.Size = UDim2.new(0, 240, 0, 26)
watermark.Position = UDim2.new(1, -260, 0, 20)
watermark.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
watermark.BackgroundTransparency = 0.1
watermark.BorderSizePixel = 0
Instance.new("UICorner", watermark).CornerRadius = UDim.new(0, 8)
local wmStroke = Instance.new("UIStroke", watermark)
wmStroke.Color = Config.Theme
wmStroke.Thickness = 1
wmStroke.Transparency = 0.4

local wmLabel = Instance.new("TextLabel", watermark)
wmLabel.Size = UDim2.new(1, -12, 1, 0)
wmLabel.Position = UDim2.new(0, 8, 0, 0)
wmLabel.BackgroundTransparency = 1
wmLabel.Text = "NEXUS HUB v1.0"
wmLabel.TextColor3 = Config.Theme
wmLabel.Font = Enum.Font.GothamBold
wmLabel.TextSize = 11
wmLabel.TextXAlignment = Enum.TextXAlignment.Left

task.spawn(function()
    while watermark.Parent do
        local fps = math.floor(1 / math.max(RunService.RenderStepped:Wait(), 1/240))
        local ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
        wmLabel.Text = ("NEXUS HUB · %d FPS · %d ms"):format(fps, ping)
        task.wait(0.5)
    end
end)

-- main panel
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 460, 0, 520)
Main.Position = UDim2.new(0.5, -230, 0.5, -260)
Main.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
Main.BackgroundTransparency = 0.05
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.ClipsDescendants = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 14)
local mainStroke = Instance.new("UIStroke", Main)
mainStroke.Color = Config.Theme
mainStroke.Thickness = 1.5
mainStroke.Transparency = 0.4

-- breathing stroke
task.spawn(function()
    while Main.Parent do
        TweenService:Create(mainStroke, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
            {Transparency = 0.05, Thickness = 2}):Play()
        task.wait(1.5)
        TweenService:Create(mainStroke, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
            {Transparency = 0.5, Thickness = 1.5}):Play()
        task.wait(1.5)
    end
end)

-- header
local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1, 0, 0, 48)
Header.BackgroundColor3 = Color3.fromRGB(16, 16, 22)
Header.BorderSizePixel = 0
local headerFix = Instance.new("Frame", Header)
headerFix.Size = UDim2.new(1, 0, 0, 12)
headerFix.Position = UDim2.new(0, 0, 1, -12)
headerFix.BackgroundColor3 = Header.BackgroundColor3
headerFix.BorderSizePixel = 0

local Title = Instance.new("TextLabel", Header)
Title.Size = UDim2.new(1, -80, 0, 20)
Title.Position = UDim2.new(0, 16, 0, 6)
Title.BackgroundTransparency = 1
Title.Text = "NEXUS HUB"
Title.TextColor3 = Color3.fromRGB(230, 230, 240)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left

local Subtitle = Instance.new("TextLabel", Header)
Subtitle.Size = UDim2.new(1, -80, 0, 12)
Subtitle.Position = UDim2.new(0, 16, 1, -18)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "clean build · your tool"
Subtitle.TextColor3 = Config.Theme
Subtitle.TextTransparency = 0.3
Subtitle.Font = Enum.Font.Gotham
Subtitle.TextSize = 9
Subtitle.TextXAlignment = Enum.TextXAlignment.Left

local dot = Instance.new("Frame", Header)
dot.Size = UDim2.new(0, 6, 0, 6)
dot.Position = UDim2.new(1, -22, 0.5, -3)
dot.BackgroundColor3 = Config.Theme
dot.BorderSizePixel = 0
Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)

-- close btn
local CloseBtn = Instance.new("TextButton", Header)
CloseBtn.Size = UDim2.new(0, 26, 0, 26)
CloseBtn.Position = UDim2.new(1, -34, 0.5, -13)
CloseBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
CloseBtn.Text = "×"
CloseBtn.TextColor3 = Color3.fromRGB(200, 200, 210)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 16
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)
CloseBtn.MouseEnter:Connect(function()
    TweenService:Create(CloseBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(180, 40, 60)}):Play()
end)
CloseBtn.MouseLeave:Connect(function()
    TweenService:Create(CloseBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(28, 28, 36)}):Play()
end)
CloseBtn.MouseButton1Click:Connect(function()
    TweenService:Create(Main, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In),
        {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(Main.Position.X.Scale, Main.Position.X.Offset + 230, Main.Position.Y.Scale, Main.Position.Y.Offset + 260)}):Play()
    task.wait(0.35)
    ScreenGui:Destroy()
end)

-- tab bar
local TabBar = Instance.new("Frame", Main)
TabBar.Size = UDim2.new(1, -24, 0, 32)
TabBar.Position = UDim2.new(0, 12, 0, 56)
TabBar.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
TabBar.BorderSizePixel = 0
Instance.new("UICorner", TabBar).CornerRadius = UDim.new(0, 8)

local TabLayout = Instance.new("UIListLayout", TabBar)
TabLayout.FillDirection = Enum.FillDirection.Horizontal
TabLayout.Padding = UDim.new(0, 4)
TabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
TabLayout.VerticalAlignment = Enum.VerticalAlignment.Center

-- page container
local PageContainer = Instance.new("Frame", Main)
PageContainer.Size = UDim2.new(1, -24, 1, -148)
PageContainer.Position = UDim2.new(0, 12, 0, 96)
PageContainer.BackgroundTransparency = 1

local Pages = {}
local TabButtons = {}

local function makePage(name)
    local page = Instance.new("ScrollingFrame", PageContainer)
    page.Name = name
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.BorderSizePixel = 0
    page.ScrollBarThickness = 3
    page.ScrollBarImageColor3 = Config.Theme
    page.CanvasSize = UDim2.new(0, 0, 0, 0)
    page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    page.Visible = false
    local layout = Instance.new("UIListLayout", page)
    layout.Padding = UDim.new(0, 6)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    local pad = Instance.new("UIPadding", page)
    pad.PaddingRight = UDim.new(0, 6)
    pad.PaddingBottom = UDim.new(0, 12)
    return page
end

local function makeTab(name, order)
    local btn = Instance.new("TextButton", TabBar)
    btn.Size = UDim2.new(0, 0, 0, 24)
    btn.AutomaticSize = Enum.AutomaticSize.X
    btn.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(180, 180, 190)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 10
    btn.LayoutOrder = order
    local pad = Instance.new("UIPadding", btn)
    pad.PaddingLeft = UDim.new(0, 10)
    pad.PaddingRight = UDim.new(0, 10)
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

    local page = makePage(name)
    Pages[name] = page
    TabButtons[name] = btn

    btn.MouseButton1Click:Connect(function()
        for n, p in pairs(Pages) do p.Visible = (n == name) end
        for n, b in pairs(TabButtons) do
            if n == name then
                TweenService:Create(b, TweenInfo.new(0.2), {BackgroundColor3 = Config.Theme, TextColor3 = Color3.fromRGB(10, 10, 15)}):Play()
            else
                TweenService:Create(b, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(28, 28, 36), TextColor3 = Color3.fromRGB(180, 180, 190)}):Play()
            end
        end
    end)
    return btn
end

-- ============ UI COMPONENTS ============
local function section(parent, text, order)
    local l = Instance.new("TextLabel", parent)
    l.Size = UDim2.new(1, 0, 0, 16)
    l.BackgroundTransparency = 1
    l.Text = text:upper()
    l.TextColor3 = Config.Theme
    l.TextTransparency = 0.2
    l.Font = Enum.Font.GothamBold
    l.TextSize = 8
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.LayoutOrder = order
    return l
end

local function toggle(parent, label, key, order)
    local row = Instance.new("Frame", parent)
    row.Size = UDim2.new(1, 0, 0, 32)
    row.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
    row.BorderSizePixel = 0
    row.LayoutOrder = order
    Instance.new("UICorner", row).CornerRadius = UDim.new(0, 8)

    local lbl = Instance.new("TextLabel", row)
    lbl.Size = UDim2.new(1, -70, 1, 0)
    lbl.Position = UDim2.new(0, 12, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = label
    lbl.TextColor3 = Color3.fromRGB(210, 210, 220)
    lbl.Font = Enum.Font.Gotham
    lbl.TextSize = 11
    lbl.TextXAlignment = Enum.TextXAlignment.Left

    local sw = Instance.new("Frame", row)
    sw.Size = UDim2.new(0, 40, 0, 20)
    sw.Position = UDim2.new(1, -52, 0.5, -10)
    sw.BackgroundColor3 = Color3.fromRGB(35, 35, 44)
    sw.BorderSizePixel = 0
    Instance.new("UICorner", sw).CornerRadius = UDim.new(1, 0)

    local knob = Instance.new("Frame", sw)
    knob.Size = UDim2.new(0, 14, 0, 14)
    knob.Position = UDim2.new(0, 3, 0.5, -7)
    knob.BackgroundColor3 = Color3.fromRGB(200, 200, 210)
    knob.BorderSizePixel = 0
    Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

    local btn = Instance.new("TextButton", row)
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text = ""
    btn.ZIndex = 3

    local function refresh()
        if Config[key] then
            TweenService:Create(sw, TweenInfo.new(0.2), {BackgroundColor3 = Config.Theme}):Play()
            TweenService:Create(knob, TweenInfo.new(0.2), {Position = UDim2.new(1, -17, 0.5, -7)}):Play()
        else
            TweenService:Create(sw, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(35, 35, 44)}):Play()
            TweenService:Create(knob, TweenInfo.new(0.2), {Position = UDim2.new(0, 3, 0.5, -7)}):Play()
        end
    end
    btn.MouseButton1Click:Connect(function()
        Config[key] = not Config[key]
        refresh()
    end)
    refresh()
    return row
end

local function slider(parent, label, key, min, max, order)
    local row = Instance.new("Frame", parent)
    row.Size = UDim2.new(1, 0, 0, 46)
    row.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
    row.BorderSizePixel = 0
    row.LayoutOrder = order
    Instance.new("UICorner", row).CornerRadius = UDim.new(0, 8)

    local lbl = Instance.new("TextLabel", row)
    lbl.Size = UDim2.new(1, -20, 0, 16)
    lbl.Position = UDim2.new(0, 12, 0, 4)
    lbl.BackgroundTransparency = 1
    lbl.Text = label
    lbl.TextColor3 = Color3.fromRGB(210, 210, 220)
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 10
    lbl.TextXAlignment = Enum.TextXAlignment.Left

    local val = Instance.new("TextLabel", row)
    val.Size = UDim2.new(1, -20, 0, 16)
    val.Position = UDim2.new(0, 12, 0, 4)
    val.BackgroundTransparency = 1
    val.Text = tostring(Config[key])
    val.TextColor3 = Config.Theme
    val.Font = Enum.Font.GothamBold
    val.TextSize = 10
    val.TextXAlignment = Enum.TextXAlignment.Right

    local bg = Instance.new("Frame", row)
    bg.Size = UDim2.new(1, -24, 0, 4)
    bg.Position = UDim2.new(0, 12, 1, -16)
    bg.BackgroundColor3 = Color3.fromRGB(35, 35, 44)
    bg.BorderSizePixel = 0
    Instance.new("UICorner", bg).CornerRadius = UDim.new(1, 0)

    local fill = Instance.new("Frame", bg)
    fill.Size = UDim2.new(0, 0, 1, 0)
    fill.BackgroundColor3 = Config.Theme
    fill.BorderSizePixel = 0
    Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)

    local knob = Instance.new("Frame", bg)
    knob.Size = UDim2.new(0, 12, 0, 12)
    knob.Position = UDim2.new(0, -6, 0.5, -6)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knob.BorderSizePixel = 0
    Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

    local function setV(v)
        v = math.clamp(v, min, max)
        Config[key] = v
        local pct = (v - min) / (max - min)
        fill.Size = UDim2.new(pct, 0, 1, 0)
        knob.Position = UDim2.new(pct, -6, 0.5, -6)
        val.Text = tostring(math.floor(v * 100) / 100)
    end
    setV(Config[key])

    local dragging = false
    local function fromInput(input)
        local rel = (input.Position.X - bg.AbsolutePosition.X) / bg.AbsoluteSize.X
        setV(min + math.clamp(rel, 0, 1) * (max - min))
    end
    bg.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true; fromInput(input)
        end
    end)
    knob.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            fromInput(input)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    return row
end

local function input(parent, label, key, order, placeholder)
    local row = Instance.new("Frame", parent)
    row.Size = UDim2.new(1, 0, 0, 40)
    row.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
    row.BorderSizePixel = 0
    row.LayoutOrder = order
    Instance.new("UICorner", row).CornerRadius = UDim.new(0, 8)

    local lbl = Instance.new("TextLabel", row)
    lbl.Size = UDim2.new(1, -20, 0, 14)
    lbl.Position = UDim2.new(0, 12, 0, 4)
    lbl.BackgroundTransparency = 1
    lbl.Text = label
    lbl.TextColor3 = Color3.fromRGB(160, 160, 170)
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 9
    lbl.TextXAlignment = Enum.TextXAlignment.Left

    local box = Instance.new("TextBox", row)
    box.Size = UDim2.new(1, -24, 0, 20)
    box.Position = UDim2.new(0, 12, 0, 18)
    box.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
    box.BorderSizePixel = 0
    box.Text = tostring(Config[key] or "")
    box.PlaceholderText = placeholder or ""
    box.TextColor3 = Config.Theme
    box.Font = Enum.Font.Code
    box.TextSize = 10
    box.ClearTextOnFocus = false
    Instance.new("UICorner", box).CornerRadius = UDim.new(0, 4)
    box.FocusLost:Connect(function()
        Config[key] = box.Text
    end)
    return row
end

local function button(parent, label, order, fn, color)
    local b = Instance.new("TextButton", parent)
    b.Size = UDim2.new(1, 0, 0, 30)
    b.BackgroundColor3 = color or Color3.fromRGB(30, 30, 40)
    b.Text = label
    b.TextColor3 = Color3.fromRGB(230, 230, 240)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 10
    b.LayoutOrder = order
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
    b.MouseButton1Click:Connect(fn)
    return b
end

-- ============ TABS ============
makeTab("Combat", 1)
makeTab("Movement", 2)
makeTab("Farming", 3)
makeTab("Visuals", 4)
makeTab("Utility", 5)
makeTab("Settings", 6)

-- default tab
for n, p in pairs(Pages) do p.Visible = (n == "Combat") end
if TabButtons.Combat then
    TabButtons.Combat.BackgroundColor3 = Config.Theme
    TabButtons.Combat.TextColor3 = Color3.fromRGB(10, 10, 15)
end

print("[NEXUS] Part 1 loaded — UI foundation ready")
print("[NEXUS] Part 2 will add: Combat + Movement + Farming logic")
print("[NEXUS] Part 3 will add: Visuals + Utility + VFX")
