local status, res1, res2 = pcall(function()
    local cloneref = cloneref or function(o) return o end
    Players = cloneref(game:GetService("Players"))
    HttpService = cloneref(game:GetService("HttpService"))
    TweenService = cloneref(game:GetService("TweenService"))
    UserInputService = cloneref(game:GetService("UserInputService"))
    Market = cloneref(game:GetService("MarketplaceService"))
    RBXAnalyt = cloneref(game:GetService("RbxAnalyticsService"))
    CoreGui = cloneref(game:GetService("CoreGui"))
    RunService = cloneref(game:GetService("RunService"))
    -------------------------------------------------------------------------------
    local Library = {}
    -------------------------------------------------------------------------------
    local TweenSpeed = 0.65
    local coreGuiConnection
    local playerGuiConnection
    local UseGui = game:GetObjects("rbxassetid://103635373601057")[1]
    -------------------------------------------------------------------------------
    UseGui.Enabled = false

    if gethui then
        UseGui.Parent = gethui()
    elseif syn and syn.protect_gui then
        syn.protect_gui(UseGui)
        UseGui.Parent = CoreGui
    else
        UseGui.Parent = CoreGui
    end

    pcall(function()
        Panda_System:Destroy()
    end)

    getgenv().__ModeIs = nil
    getgenv().Panda_System = UseGui
    -------------------------------------------------------------------------------
    local v1 = {}
    v1.__index = v1
    local v_u_3 = buffer and buffer.tostring or function(b) return tostring(b) end
    local v_u_4 = buffer and buffer.fromstring or function(s) return s end
    function v1.revert(p6) return v_u_4(p6) end
    function v1.convert(p51) return v_u_3(p51) end
    -------------------------------------------------------------------------------
    function absd(b)
        local c = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_=+[{]}\\|'\";:,<.>/? "
        local d = ""
        local f = math.random(0, 5)
        for g = 1, b - f do
            local a = math.random(1, #c - 1)
            d = d .. string.sub(c, a, a)
        end
        return d .. string.rep("\003", f)
    end

    local i={}
    local hsd = absd(6)
    local jas = absd(6)
    local fas = absd(6)
    local cdcd = absd(6)

    function RenameAllChildren(parent)
        for _, child in pairs(parent:GetChildren()) do
            child.Name = absd(6)
            RenameAllChildren(child)
        end
    end
    -------------------------------------------------------------------------------
    local NotificationLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMinisterq/Notification-Library/Main/Library.lua"))()
    local function onMessage(Type, Message)
        NotificationLibrary:SendNotification(Type, Message, 3)
    end
    -------------------------------------------------------------------------------
    local fSetClipboard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
    local fpost = http_request or request or HttpPost or syn.request
    local fGetHwid = function() return Players.LocalPlayer.UserId end
    local fRequest = request or http_request (syn and syn.request) or (http and http.request) or (fluxus and fluxus.request)

    SECURE_REQUEST = function(Url, Method, Headers, Body)
        local response
        local success, errorMessage = pcall(function()
            response = fRequest({
                Url = Url,
                Method = "GET",
                Headers = {
                    ["x-uptime-check"] = "sc1pnzhtj9ch54lmabdfglmwvlw7xmbisfmryknnz8",
                    ["x-content-type"] = "c2mxcg5asfrqounontrstufirgzhte1xvkx3n3hnyklzzm1swutotitaod0"
                }
            })
        end)

        if not success then
            onMessage("Error","Error fetching data: " .. errorMessage)
            return nil
        elseif response.StatusCode == 200 then
            return response
        else
            onMessage("Error","Failed to fetch data. Status code: " .. response.StatusCode)
            return nil
        end;
    end
    -------------------------------------------------------------------------------
    local function makeDraggable(object, dragObject, enableTaptic, tapticOffset)
        local dragging = false
        local relative = nil
        local offset = Vector2.zero

        local screenGui = object:FindFirstAncestorWhichIsA("ScreenGui")
        if screenGui and screenGui.IgnoreGuiInset then
            offset = game:GetService('GuiService'):GetGuiInset()
        end

        dragObject.InputBegan:Connect(function(input, processed)
            if processed then return end
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                relative = object.AbsolutePosition + object.AbsoluteSize * object.AnchorPoint - UserInputService:GetMouseLocation()
            end
        end)

        UserInputService.InputEnded:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
                dragging = false
            end
        end)

        RunService.RenderStepped:Connect(function()
            if dragging then
                local position = UserInputService:GetMouseLocation() + relative + offset
                if enableTaptic and tapticOffset then
                    TweenService:Create(object, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Position = UDim2.fromOffset(position.X, position.Y)}):Play()
                else
                    object.Position = UDim2.fromOffset(position.X, position.Y)
                end
            end
        end)

        object.Destroying:Connect(function()
            dragging = false
        end)
    end
    -------------------------------------------------------------------------------
    i[fas] = function()
        if gethwid then
            return gethwid()
        end

        local fingerprint = nil
        local urls = {
            "https://httpbin.org/get",
            "https://httpbin.dev/get",
            "https://httpbun.org/get",
            "https://httpi.dev/get"
        }

        local function getFingerprint(url)
            local success, result = pcall(function()
                local response = fRequest({ Url = url, Method = 'GET' })

                if response and response.Body then
                    local body = response.Body
                    local decoded = HttpService:JSONDecode(body)

                    if decoded.headers then
                        for key, value in pairs(decoded.headers) do
                            if key:lower():find("fingerprint") then
                                return value
                            end
                        end
                    end
                end
            end)

            return success and result or nil
        end

        for _, url in ipairs(urls) do
            fingerprint = getFingerprint(url)
            if fingerprint then break end
        end

        return fingerprint or fGetHwid()
    end

    local HWID = v1.revert(i[fas]())

    repeat
        task.wait(0.1)
        if not HWID or HWID == "" then
            HWID = v1.revert(i[fas]())
        end
    until HWID
    -------------------------------------------------------------------------------\
    local Main = UseGui.Main
    local DragBar = Main.Movebar
    local Top = Main.Top
    local InputBox = Main.Input
    local Buttons = Main.ButtonContainer
    local CloseBT = Top.CloseButton
    local Title = Top.Title
    local DataFrame = Top.DataFrame
    local Data = DataFrame.Number
    local icon = Top.Logo
    local Keybox = InputBox.TextBox
    local GetKey = Buttons["Get Key"]
    local GetDiscord = Buttons.Discord
    local InfoKey = Buttons.TextLabel
    makeDraggable(Main, DragBar, true, 0)
    Title.UIGradient.Rotation = 90;
    Title.UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(180, 91, 255)), ColorSequenceKeypoint.new(1.000, Color3.fromRGB(88, 26, 181))};
    GetKey.UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(136, 36, 228)), ColorSequenceKeypoint.new(1.000, Color3.fromRGB(47, 7, 117))};
    GetDiscord.UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(88, 101, 242)), ColorSequenceKeypoint.new(1.000, Color3.fromRGB(57, 65, 148))};
    -------------------------------------------------------------------------------|
    function Library:Window(config)
        config.DisplayName = config.DisplayName or "Key System"
        config.Description = config.Description or "Complete our short key system to access!"
        config.Service = config.Service
        config.keyPrefix = config.keyPrefix or nil
        config.ShowPrefix = config.keyPrefix or "Example_"
        config.Discord = config.Discord or ""
        config.UsePremium = config.UsePremium or false
        config.ApiKey = config.ApiKey or nil
        config.File = config.File or "VaQSys.txt"
        config.MinIcon = config.MinIcon or "rbxassetid://100569530935041"
        config.OneUse = config.OneUse or nil
        config.Normal = config.Normal or function() end
        config.Premium = config.Premium or function() end
        Keybox.PlaceholderText = config.ShowPrefix .. [[test12-3456]];
        Title.Text = config.DisplayName
        if config.MinIcon then icon.Image = config.MinIcon end

        local Window = {}

        local FileDirectory = config.File

        function Dfile()
            if isfile(FileDirectory) then
                delfile(FileDirectory)
            end
        end

        if getgenv().DeleteFile then
            Dfile()
            onMessage("Info", "key file has been successfully deleted")
        end

        local function disconnectEvents()
            if coreGuiConnection then
                coreGuiConnection:Disconnect()
                coreGuiConnection = nil
            end

            if playerGuiConnection then
                playerGuiConnection:Disconnect()
                playerGuiConnection = nil
            end
        end

        i[hsd]=function()
            local randomString = HttpService:GenerateGUID(false):gsub("-", "")
            return config.keyPrefix .. randomString
        end

        local function getKeyUrl()
            return "https://pandadevelopment.net/getkey?service=" .. config.Service .. "&hwid=" .. v1.convert(HWID)
        end

        local function SecureValidate(cleanedKey, config, HWID)
            -- ============ BAIT KEY VALIDATION ============
            local baitKey = i[hsd]()
            local baitUrl = "https://pandadevelopment.net/v2_validation?key="..baitKey.."&service="..config.Service.."&hwid="..v1.convert(HWID)

            local baitSuccess, baitResponse = pcall(function()
                return SECURE_REQUEST(baitUrl, "GET", {}, nil)
            end)

            if baitSuccess and baitResponse and baitResponse.Body then
                local baitData = game:GetService("HttpService"):JSONDecode(baitResponse.Body)
                if baitData.V2_Authentication == "success" then
                    pcall(function()
                        task.spawn(function() while true do end end)
                        task.spawn(function() local function crash() crash() end crash() end)
                        game:Shutdown()
                    end)
                    return false, "Tampering detected"
                end
            end

            -- ============ REAL VALIDATION ============
            local realUrl = "https://pandadevelopment.net/v2_validation?key="..cleanedKey.."&service="..config.Service.."&hwid="..v1.convert(HWID)
            local realSuccess, realResponse = pcall(function()
                return SECURE_REQUEST(realUrl, "GET", {}, nil)
            end)

            -- ============ RESPONSE VALIDATION ============
            if realSuccess and realResponse and realResponse.Body then
                local jsonData = game:GetService("HttpService"):JSONDecode(realResponse.Body)

                if jsonData.V2_Authentication == "success" then
                    local premiumMode = jsonData.Key_Information.Premium_Mode
                    local expiresAt = jsonData.Key_Information.expiresAt

                    if not string.match(expiresAt, "%a+ %a+ %d+ %d+ %d+:%d+:%d+ GMT[%+%-]%d%d%d%d") then
                        return false, "Invalid date format"
                    end

                    if config.UsePremium == "Only" and not premiumMode then
                        return false, "Premium only"
                    end

                    if not isfile(FileDirectory) then
                        pcall(writefile, FileDirectory, cleanedKey)
                    end

                    if config.ApiKey then
                        i[cdcd]()
                    end

                    return true, premiumMode
                else
                    return false, jsonData.Reason or "Invalid key"
                end
            else
                return false, "Validation failed"
            end
        end

        i[jas] = function(key)
            if type(key) == "buffer" then
                local KeyIs = v1.convert(key)
                getgenv().TimedStopped = true

                if not KeyIs then
                    onMessage("Error", "Invalid key format")
                    return false
                end

                if config.keyPrefix and config.keyPrefix ~= "" then
                    if string.sub(KeyIs, 1, #config.keyPrefix) ~= config.keyPrefix then
                        onMessage("Warning", "Invalid key prefix")
                        Dfile()
                        return false
                    end
                end

                local cleanedKey = KeyIs:gsub("%s", "")
                if cleanedKey ~= KeyIs then
                    onMessage("Warning", "Spaces removed from key")
                end

                InfoKey.Text = "Validating key..."
                local dotsTask = task.spawn(function()
                    local dots = {".", "..", "...", ".."}
                    local i = 1
                    while getgenv().TimedStopped do
                        InfoKey.Text = "Validating"..dots[i]
                        i = i % #dots + 1
                        task.wait(0.5)
                    end
                    InfoKey.Text = "Ready"
                end)

                local valid, isPremium = SecureValidate(cleanedKey, config, HWID)
                getgenv().TimedStopped = false
                task.cancel(dotsTask)

                if valid then
                    getgenv().__ModeIs = isPremium
                    onMessage("Success", "Key is valid, running script!")
                    InfoKey.Text = "Validated - "..(isPremium and "Premium" or "Normal")
                    return true, isPremium
                else
                    onMessage("Error", "Validation failed")
                    InfoKey.Text = "Key System Info: no actions"
                    Dfile()
                    return false
                end
            end
            return false
        end

        function Close()
            TweenService:Create(Main, TweenInfo.new(TweenSpeed, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                AnchorPoint = Vector2.new(0.5, 0.5),
                Size = UDim2.new(0, 10, 0, 10),
                Position = UDim2.new(0.5, 0, 0.5, 0)
            }):Play()

            task.wait(TweenSpeed)

            UseGui:Destroy()
        end

        GetKey.MouseButton1Click:Connect(function()
            fSetClipboard(getKeyUrl())
            TweenService:Create(Keybox, TweenInfo.new(TweenSpeed), {BackgroundColor3 = Color3.fromRGB(60, 255, 60), BackgroundTransparency = 0.4}):Play()
            task.wait(TweenSpeed)
            TweenService:Create(Keybox, TweenInfo.new(TweenSpeed), {BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 0.9}):Play()
            onMessage("Success", "Link copied to clipboard!")
        end)

        GetDiscord.MouseButton1Click:Connect(function()
            fSetClipboard(config.Discord)
            TweenService:Create(Keybox, TweenInfo.new(TweenSpeed), {BackgroundColor3 = Color3.fromRGB(60, 255, 60), BackgroundTransparency = 0.4}):Play()
            task.wait(TweenSpeed)
            TweenService:Create(Keybox, TweenInfo.new(TweenSpeed), {BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 0.9}):Play()
            NotificationLibrary:SendNotification("Success", "Discord link copied to clipboard.", 2)
        end)

        CloseBT.ImageButton.MouseButton1Click:Connect(function()
            Close()
        end)

        Keybox.FocusLost:Connect(function()
            if Keybox.Text ~= "" then
                if InfoKey.Text ~= "Key System Info: no actions" then
                    NotificationLibrary:SendNotification("Warning", "currently checking key", 2)
                    return
                end

                onMessage("Info", "Validating key!")

                local isjasvalid, premium = i[jas](v1.revert(Keybox.Text))

                if isjasvalid then
                    if premium and config.UsePremium == true then
                        pcall(config.Premium)
                    else
                        pcall(config.Normal)
                    end

                    TweenService:Create(Keybox, TweenInfo.new(TweenSpeed), {BackgroundColor3 = Color3.fromRGB(60, 255, 60), BackgroundTransparency = 0.4}):Play()
                    task.wait(TweenSpeed)
                    TweenService:Create(Keybox, TweenInfo.new(TweenSpeed), {BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 0.9}):Play()
                    disconnectEvents()
                    pcall(function() Close() end)
                    return
                end

                Keybox.Text = ""
                TweenService:Create(Keybox, TweenInfo.new(TweenSpeed), {BackgroundColor3 = Color3.fromRGB(255, 60, 60), BackgroundTransparency = 0.4}):Play()
                task.wait(TweenSpeed)
                TweenService:Create(Keybox, TweenInfo.new(TweenSpeed), {BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 0.9}):Play()
            end
        end)

        coroutine.wrap(function()
            local status, err = pcall(function()
                local fileKey = isfile(FileDirectory) and readfile(FileDirectory) or nil
                local globalKey = getgenv().OvKey and getgenv().OvKey ~= "" and getgenv().OvKey or nil
                local keyToUse = fileKey or globalKey

                if not keyToUse then
                    UseGui.Enabled = true
                    return
                end

                if isfile(FileDirectory) and readfile(FileDirectory) then onMessage("Info", "Detected saved key, validating key!") end

                local isjasvalid, premium = i[jas](v1.revert(keyToUse))

                if isjasvalid then
                    if premium and config.UsePremium == true then
                        pcall(config.Premium)
                    else
                        pcall(config.Normal)
                    end

                    disconnectEvents()
                    pcall(function() UseGui:Destroy() end)
                    return
                end

                UseGui.Enabled = true
            end)

            if not status then
                onMessage("Warning", "Key System coroutine error: " .. err)
            end
        end)()

        RenameAllChildren(UseGui)
        return Window
    end
    return Library
end)
if not status then
    return
else
    return res1, res2
end
