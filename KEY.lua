local function loading()
shared.LoaderTitle = 'Games Found: ' .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
shared.LoaderKeyFrames = {
[1] = {1, 15}, -- [Time (s), Percentage] 
[2] = {3, 30} -- [เวลา, เปอร์เซ็น]
}

local Metadata = {
LoaderData = {
Name = (shared.LoaderTitle or 'A Loader'),
Colors = shared.LoaderColors or {
Main = Color3.fromRGB(24, 24, 24),
Topic = Color3.fromRGB(204, 171, 52),
Title = Color3.fromRGB(204, 171, 52),
LoaderBackground = Color3.fromRGB(30, 30, 30),
LoaderSplash = Color3.fromRGB(255, 255, 255)
}
},
Keyframes = shared.LoaderKeyFrames or {
[1] = {1, 10}, -- [Time (s), Percentage]
[2] = {2, 30},
[3] = {3, 60},
[4] = {2, 80}
}
}

--
local function tweenObject(object, speed, info)
game.TweenService:Create(object, TweenInfo.new(speed, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), info):Play()
end
local function createObject(className, properties)
local instance = Instance.new(className)
local parent
for propertyName, propertyValue in pairs(properties) do
if propertyName ~= "Parent" then
instance[propertyName] = propertyValue
else
parent = propertyValue
end
end
instance.Parent = parent
return instance
end


local Core = createObject("ScreenGui", {
Name = "Core",
Parent = game.CoreGui
})
local Main = createObject("Frame", {
Name = "Main",
Parent = Core,
BackgroundColor3 = Metadata.LoaderData.Colors.Main,
BorderSizePixel = 0,
ClipsDescendants = true,
Position = UDim2.new(0.5, 0, 0.5, 0),
AnchorPoint = Vector2.new(0.5, 0.5),
Size = UDim2.new(0, 0, 0, 0),
})
local Top = createObject("TextLabel", {
Name = "Top",
TextTransparency = 1,
Parent = Main,
BackgroundColor3 = Color3.fromRGB(255, 255, 255),
BackgroundTransparency = 1,
Position = UDim2.new(0, 30, 0, 8),
Size = UDim2.new(0, 301, 0, 50),
Font = Enum.Font.GothamBold,
Text = 'Anbatukam Hub | Community',
TextColor3 = Metadata.LoaderData.Colors.Topic,
TextSize = 18,
TextXAlignment = Enum.TextXAlignment.Left,
})
local Title = createObject("TextLabel", {
Name = "Title",
Parent = Main,
TextTransparency = 1,
BackgroundColor3 = Color3.fromRGB(255, 255, 255),
BackgroundTransparency = 1,
Position = UDim2.new(0, 30, 0, 27),
Size = UDim2.new(0, 301, 0, 46),
Font = Enum.Font.GothamBold,
RichText = true,
Text = "<b>" .. Metadata.LoaderData.Name .. "</b>",
TextColor3 = Metadata.LoaderData.Colors.Title,
TextSize = 13,
TextXAlignment = Enum.TextXAlignment.Left,
})
local BG = createObject("Frame", {
Name = "BG",
Parent = Main,
AnchorPoint = Vector2.new(0.5, 0),
BackgroundTransparency = 1,
BackgroundColor3 = Metadata.LoaderData.Colors.LoaderBackground,
BorderSizePixel = 0,
Position = UDim2.new(0.5, 0, 0, 70),
Size = UDim2.new(0.8500000238418579, 0, 0, 24),
})
local Progress = createObject("Frame", {
Name = "Progress",
Parent = BG,
BackgroundColor3 = Metadata.LoaderData.Colors.LoaderSplash,
BackgroundTransparency = 1,
BorderSizePixel = 0,
Size = UDim2.new(0, 0, 0, 24),
})

local function updatePercentage(percentage)
tweenObject(Progress, 0.5, {
Size = UDim2.new((percentage / 100), 0, 0, 24)
})
end


-- timeload
tweenObject(Main, 0.25, {
Size = UDim2.new(0, 346, 0, 121)
})
wait(0.25)
tweenObject(Top, 0.5, {
TextTransparency = 0
})
tweenObject(Title, 0.5, {
TextTransparency = 0
})
tweenObject(BG, 0.5, {
BackgroundTransparency = 0
})
tweenObject(Progress, 0.5, {
BackgroundTransparency = 0
})

for i, v in pairs(Metadata.Keyframes) do
wait(v[1]);
updatePercentage(v[2])
end
updatePercentage(100)

tweenObject(Top, 0.5, {
TextTransparency = 1
})
tweenObject(Title, 0.5, {
TextTransparency = 1
})
tweenObject(BG, 0.5, {
BackgroundTransparency = 1
})
tweenObject(Progress, 0.5, {
BackgroundTransparency = 1
})
wait(0.5)
tweenObject(Main, 0.25, {
Size = UDim2.new(0, 0, 0, 0)
})
wait(0.25);
Core:Destroy()
wait(0.5)
loadscript()
end

local keyui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Frame_2 = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local Frame_3 = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local TextButton = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local Frame_4 = Instance.new("Frame")
local Frame_5 = Instance.new("Frame")
local Frame_6 = Instance.new("Frame")
local UICorner_5 = Instance.new("UICorner")
local Frame_7 = Instance.new("Frame")
local UICorner_6 = Instance.new("UICorner")
local TextButton_2 = Instance.new("TextButton")
local UICorner_7 = Instance.new("UICorner")
local Frame_8 = Instance.new("Frame")
local UICorner_8 = Instance.new("UICorner")
local Frame_9 = Instance.new("Frame")
local UICorner_9 = Instance.new("UICorner")
local TextBox = Instance.new("TextBox")
local ImageButton = Instance.new("ImageButton")
local ImageButton_2 = Instance.new("ImageButton")
local ImageLabel = Instance.new("ImageLabel")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local TextLabel_3 = Instance.new("TextLabel")

local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/TranVanBao1411/Library/retard/OrionUi.lua"))()
local PandaAuth = loadstring(game:HttpGet(('https://pandadevelopment.net/service_api/PandaAuthBeta2.lua')))()
local service_name = "anbatukamhub"

function destroyui()
keyui:Destroy()
end

keyui.Parent = game.CoreGui
keyui.Name = "Anbatukam"
keyui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Frame.Parent = keyui
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BorderColor3 = Color3.fromRGB(27, 42, 53)
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.Size = UDim2.new(0, 400, 0, 210)
UICorner.Parent = Frame
Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(204, 171, 52)
Frame_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
Frame_2.Position = UDim2.new(0, 20, 0, 150)
Frame_2.Size = UDim2.new(0, 170, 0, 41)
UICorner_2.Parent = Frame_2
Frame_3.Parent = Frame_2
Frame_3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame_3.BackgroundTransparency = 1.000
Frame_3.BorderColor3 = Color3.fromRGB(27, 42, 53)
Frame_3.BorderSizePixel = 0
Frame_3.Position = UDim2.new(0, 1, 0, 1)
Frame_3.Size = UDim2.new(0, 168, 0, 39)
UICorner_3.Parent = Frame_3
TextButton.Parent = Frame_2
TextButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TextButton.BorderColor3 = Color3.fromRGB(27, 42, 53)
TextButton.Position = UDim2.new(0, 1, 0, 1)
TextButton.Size = UDim2.new(0, 168, 0, 39)
TextButton.Font = Enum.Font.GothamBold
TextButton.Text = "GET KEY"

TextButton.MouseButton1Click:Connect(function()
    setclipboard(PandaAuth:GetLink(service_name))
      OrionLib:MakeNotification({
        Name = "Anbatukam Hub",
        Content = "Coppy Success",
        Image = "rbxassetid://15034250264",
        Time = 3
    })
end)

TextButton.TextColor3 = Color3.fromRGB(225, 225, 225)
TextButton.TextSize = 10.000
UICorner_4.Parent = TextButton

Frame_4.Parent = Frame_2
Frame_4.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
Frame_4.BackgroundTransparency = 1.000
Frame_4.BorderColor3 = Color3.fromRGB(27, 42, 53)
Frame_4.BorderSizePixel = 0
Frame_4.Size = UDim2.new(0, 387, 0, 2)
Frame_5.Parent = Frame_2
Frame_5.BackgroundColor3 = Color3.fromRGB(204, 171, 52)
Frame_5.BorderColor3 = Color3.fromRGB(27, 42, 53)
Frame_5.BorderSizePixel = 0

Frame_6.Parent = Frame
Frame_6.BackgroundColor3 = Color3.fromRGB(204, 171, 52)
Frame_6.BorderColor3 = Color3.fromRGB(27, 42, 53)
Frame_6.Position = UDim2.new(0, 210, 0, 150)
Frame_6.Size = UDim2.new(0, 170, 0, 41)
UICorner_5.Parent = Frame_6
Frame_7.Parent = Frame_6
Frame_7.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame_7.BorderColor3 = Color3.fromRGB(27, 42, 53)
Frame_7.BorderSizePixel = 0
Frame_7.Position = UDim2.new(0, 1, 0, 1)
Frame_7.Size = UDim2.new(0, 168, 0, 39)
UICorner_6.Parent = Frame_7
TextButton_2.Parent = Frame_6
TextButton_2.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TextButton_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
TextButton_2.Position = UDim2.new(0, 1, 0, 1)
TextButton_2.Size = UDim2.new(0, 168, 0, 39)
TextButton_2.Font = Enum.Font.GothamBold
TextButton_2.Text = "CHECK KEY"
local k = TextBox.Text
TextButton_2.MouseButton1Click:Connect(function()
    if PandaAuth:ValidateKey(service_name,TextBox.Text) then
        OrionLib:MakeNotification({
        Name = "Anbatukam Hub",
        Content = "Valid Key! Loading...",
        Image = "rbxassetid://15034250264",
        Time = 5
    })
        wait(1)
        PandaAuth:SaveKey("AnbatukamHub/SavedKey.json", tostring(TextBox.Text))
        destroyui()
      loading()
    else 
        OrionLib:MakeNotification({
        Name = "Anbatukam Hub",
        Content = "Invalid Key",
        Image = "rbxassetid://15034250264",
        Time = 5
    })
    end
end)

local function autocheck()
if PandaAuth:ValidateKey(service_name,TextBox.Text) then
        OrionLib:MakeNotification({
        Name = "Anbatukam Hub",
        Content = "Check Saved Key | Loading...",
        Image = "rbxassetid://15034250264",
        Time = 5
    })
        wait(2.5)
        PandaAuth:SaveKey("AnbatukamHub/SavedKey.json", tostring(TextBox.Text))
        destroyui()
      loading()
    else 
        OrionLib:MakeNotification({
        Name = "Anbatukam Hub",
        Content = "Check Saved Key Failed!",
        Image = "rbxassetid://15034250264",
        Time = 5
    })
    end
end


local checkkeylinkver = PandaAuth:LoadKey("AnbatukamHub/SavedKey.json")

TextButton_2.TextColor3 = Color3.fromRGB(225, 225, 225)
TextButton_2.TextSize = 10.000
UICorner_7.Parent = TextButton_2
Frame_8.Parent = Frame
Frame_8.BackgroundColor3 = Color3.fromRGB(204, 171, 52)
Frame_8.BorderColor3 = Color3.fromRGB(27, 42, 53)
Frame_8.Position = UDim2.new(0.0299999993, 0, 0.449999988, 0)
Frame_8.Size = UDim2.new(0.941999972, 0, 0.193232, 0)
UICorner_8.Parent = Frame_8
Frame_9.Parent = Frame_8
Frame_9.AnchorPoint = Vector2.new(0.5, 0.5)
Frame_9.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
Frame_9.BorderColor3 = Color3.fromRGB(27, 42, 53)
Frame_9.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame_9.Size = UDim2.new(0.989799976, 0, 0.899999976, 0)
UICorner_9.Parent = Frame_9
TextBox.Parent = Frame_9
TextBox.AnchorPoint = Vector2.new(0.5, 0.5)
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BackgroundTransparency = 1.000
TextBox.BorderColor3 = Color3.fromRGB(27, 42, 53)
TextBox.ClipsDescendants = true
TextBox.Position = UDim2.new(0.5, 0, 0.5, 0)
TextBox.Size = UDim2.new(0, 200, 0, 25)
TextBox.ZIndex = 5
TextBox.Font = Enum.Font.GothamBold
TextBox.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
TextBox.PlaceholderText = "PUT YOUR KEY..."
TextBox.Text = tostring(checkkeylinkver)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextScaled = true
TextBox.TextSize = 10.000
TextBox.TextWrapped = true
ImageButton.Parent = Frame
ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageButton.BackgroundTransparency = 1.000
ImageButton.BorderColor3 = Color3.fromRGB(27, 42, 53)
ImageButton.Position = UDim2.new(0, 200, 0, 0)
ImageButton.Size = UDim2.new(0, 30, 0, 30)

ImageButton.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/8wXcWRaW8r")
    OrionLib:MakeNotification({
        Name = "Anbatukam Hub",
        Content = "Coppy Success",
        Image = "rbxassetid://15034250264",
        Time = 3
    })
end)

ImageButton.Image = "http://www.roblox.com/asset/?id=12058969086"
ImageButton.ImageColor3 = Color3.fromRGB(200, 200, 200)
ImageButton_2.Parent = Frame
ImageButton_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageButton_2.BackgroundTransparency = 1.000
ImageButton_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
ImageButton_2.Position = UDim2.new(0, 165, 0, 0)
ImageButton_2.Size = UDim2.new(0, 30, 0, 30)

ImageButton_2.MouseButton1Click:Connect(function()
    setclipboard("https://youtube.com/@tranvanbao1411")
OrionLib:MakeNotification({
        Name = "Anbatukam Hub",
        Content = "Coppy Success",
        Image = "rbxassetid://15034250264",
        Time = 3
    })
end)

ImageButton_2.Image = "http://www.roblox.com/asset/?id=1275974017"
ImageButton_2.ImageColor3 = Color3.fromRGB(200, 200, 200)
ImageLabel.Parent = Frame
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.1, -29, 0.1, -5)
ImageLabel.Size = UDim2.new(0, 90, 0, 60)
ImageLabel.Image = "rbxassetid://15034250264"
TextLabel.Parent = Frame
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
TextLabel.Position = UDim2.new(0, 61, 0, 15)
TextLabel.Size = UDim2.new(0, 50, 0, 50)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.Text = ""
TextLabel.TextColor3 = Color3.fromRGB(204, 171, 52)
TextLabel.TextSize = 60.000
TextLabel_2.Parent = Frame
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
TextLabel_2.Position = UDim2.new(0, 210, 0, 15)
TextLabel_2.Size = UDim2.new(0, 50, 0, 50)
TextLabel_2.Font = Enum.Font.GothamBold
TextLabel_2.Text = "ANBATUKAM HUB | COMMUNITY"
TextLabel_2.TextColor3 = Color3.fromRGB(204, 171, 52)
TextLabel_2.TextSize = 17.000
TextLabel_3.Parent = Frame
TextLabel_3.AnchorPoint = Vector2.new(0.5, 0.5)
TextLabel_3.BackgroundTransparency = 1.000
TextLabel_3.BorderColor3 = Color3.fromRGB(27, 42, 53)
TextLabel_3.Position = UDim2.new(0.586250007, 0, 0.304761946, 0)
TextLabel_3.Size = UDim2.new(0.997500002, 0, 0.0799999982, 0)
TextLabel_3.Font = Enum.Font.GothamBold
TextLabel_3.Text = "NULL"
TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.TextSize = 17.000

local function ERJN_fake_script()
	local script = Instance.new('LocalScript', TextLabel_3)
	while wait(0.2) do
		script.Parent.Text = os.date("%H:%M:%S - %d/%m/2023") .. "  [" .. identifyexecutor() .. "]"
	end
end

coroutine.wrap(ERJN_fake_script)()

autocheck()

return keyui