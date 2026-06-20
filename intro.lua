local TweenService = game:GetService("TweenService")

local function p()
    local LocalPlayer = game.Players.LocalPlayer

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "IntroAnimationGui"
    screenGui.IgnoreGuiInset = true
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.Parent = LocalPlayer.PlayerGui

    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundColor3 = Color3.fromRGB(10, 10, 12)
    bg.BackgroundTransparency = 0
    bg.BorderSizePixel = 0
    bg.Parent = screenGui

    for i = 1, 8 do
        local line = Instance.new("Frame")
        line.Size = UDim2.new(1, 0, 0, math.random(1, 2))
        line.Position = UDim2.new(0, 0, math.random(0, 100) / 100, 0)
        line.BackgroundColor3 = Color3.fromRGB(103, 255, 196)
        line.BackgroundTransparency = 1
        line.BorderSizePixel = 0
        line.ZIndex = 2
        line.Parent = bg
        task.spawn(function()
            task.wait(math.random(2, 8) / 10)
            line.BackgroundTransparency = 0.7
            TweenService:Create(line, TweenInfo.new(math.random(3, 6) / 10), {BackgroundTransparency = 1}):Play()
        end)
    end

    local center = Instance.new("Frame")
    center.Size = UDim2.new(0.4, 0, 0.4, 0)
    center.Position = UDim2.new(0.3, 0, 0.3, 0)
    center.BackgroundTransparency = 1
    center.ZIndex = 3
    center.Parent = screenGui

    local logo = Instance.new("ImageLabel")
    logo.Size = UDim2.new(0.3, 0, 0.5, 0)
    logo.Position = UDim2.new(0.35, 0, 0.05, 0)
    logo.BackgroundTransparency = 1
    logo.Image = "rbxassetid://92537129824930"
    logo.ImageColor3 = Color3.fromRGB(103, 255, 196)
    logo.ScaleType = Enum.ScaleType.Fit
    logo.ImageTransparency = 1
    logo.ZIndex = 4
    logo.Parent = center

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0.2, 0)
    title.Position = UDim2.new(0, 0, 0.6, 0)
    title.BackgroundTransparency = 1
    title.Text = "IRON DOORS"
    title.Font = Enum.Font.GothamBold
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextScaled = true
    title.TextTransparency = 1
    title.ZIndex = 4
    title.Parent = center

    local accentLine = Instance.new("Frame")
    accentLine.Size = UDim2.new(0, 0, 0, 1)
    accentLine.Position = UDim2.new(0.5, 0, 0.82, 0)
    accentLine.BackgroundColor3 = Color3.fromRGB(103, 255, 196)
    accentLine.BorderSizePixel = 0
    accentLine.BackgroundTransparency = 0
    accentLine.ZIndex = 4
    accentLine.Parent = center

    local sub = Instance.new("TextLabel")
    sub.Size = UDim2.new(1, 0, 0.12, 0)
    sub.Position = UDim2.new(0, 0, 0.86, 0)
    sub.BackgroundTransparency = 1
    sub.Text = "good luck"
    sub.Font = Enum.Font.Code
    sub.TextColor3 = Color3.fromRGB(103, 255, 196)
    sub.TextScaled = true
    sub.TextTransparency = 1
    sub.ZIndex = 4
    sub.Parent = center

    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://9145201982"
    sound.Volume = 1.2
    sound.Parent = screenGui

    task.wait(0.5)
    sound:Play()

    TweenService:Create(logo, TweenInfo.new(1.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        ImageTransparency = 0,
        Size = UDim2.new(0.36, 0, 0.56, 0),
        Position = UDim2.new(0.32, 0, 0.02, 0)
    }):Play()

    task.wait(0.4)

    TweenService:Create(title, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        TextTransparency = 0,
        Position = UDim2.new(0, 0, 0.57, 0)
    }):Play()

    task.wait(0.3)

    TweenService:Create(accentLine, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(0.6, 0, 0, 1),
        Position = UDim2.new(0.2, 0, 0.82, 0)
    }):Play()

    TweenService:Create(sub, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        TextTransparency = 0.2
    }):Play()

    task.wait(3.5)

    local fadeInfo = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
    TweenService:Create(logo, fadeInfo, {ImageTransparency = 1, Size = UDim2.new(0.2, 0, 0.4, 0), Position = UDim2.new(0.4, 0, 0.1, 0)}):Play()
    TweenService:Create(title, fadeInfo, {TextTransparency = 1}):Play()
    TweenService:Create(sub, fadeInfo, {TextTransparency = 1}):Play()
    TweenService:Create(accentLine, fadeInfo, {BackgroundTransparency = 1, Size = UDim2.new(0, 0, 0, 1), Position = UDim2.new(0.5, 0, 0.82, 0)}):Play()
    TweenService:Create(bg, fadeInfo, {BackgroundTransparency = 1}):Play()

    task.wait(1.5)
    screenGui:Destroy()
end

p()
