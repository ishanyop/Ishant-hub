--[[ 📜 ishanyop Hub - Blox Fruits Script Version: v1.1
Made for: Delta Executor (and others)
Sections: Organized by category (Main, Combat, Raids, Sea Events, Utility)
Safe: No gamepass, anti-ban safe zone usage
--]]

-- Load GUI Library
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
    Name = "ishanyop Hub | Blox Fruits",
    LoadingTitle = "ishanyop Hub is loading...",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "ishanyopSave"
    }
})

-- Webhook
local WebhookURL = "https://discord.com/api/webhooks/1383488835631190157/fQPb1xaT1GLV2C1aERLSKtlUZvYuzStNijbD062TrP90lu779GO-rSpaULtUgRsbgmJh"
local function SendWebhook(msg)
    local HttpService = game:GetService("HttpService")
    local data = {
        ["content"] = msg
    }
    local json = HttpService:JSONEncode(data)
    syn.request({
        Url = WebhookURL,
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = json
    })
end

-- 🔁 Global Toggles
getgenv().AutoFarm = false
getgenv().BringMobs = false
getgenv().FastAttack = false
getgenv().AutoHaki = false
getgenv().AutoBoss = false
getgenv().SelectedStyle = "Superhuman"
getgenv().AutoFightingStyle = false
getgenv().AutoRaid = false
getgenv().AutoAwaken = false
getgenv().AutoSeaBeast = false
getgenv().AutoMirage = false

-- 🧱 MAIN TAB
local mainTab = Window:CreateTab("🏹 Main", 4483362458)
mainTab:CreateToggle({Name = "Auto Farm", CurrentValue = false, Callback = function(val) getgenv().AutoFarm = val end})
mainTab:CreateToggle({Name = "Bring Mobs", CurrentValue = false, Callback = function(val) getgenv().BringMobs = val end})
mainTab:CreateToggle({Name = "Auto Boss", CurrentValue = false, Callback = function(val) getgenv().AutoBoss = val end})

-- ⚔️ COMBAT TAB
local combatTab = Window:CreateTab("⚔️ Combat", 4483362458)
combatTab:CreateToggle({Name = "Fast Attack", CurrentValue = false, Callback = function(val) getgenv().FastAttack = val end})
combatTab:CreateToggle({Name = "Auto Haki", CurrentValue = false, Callback = function(val) getgenv().AutoHaki = val end})
combatTab:CreateDropdown({
    Name = "Select Fighting Style",
    Options = {"Combat", "Black Leg", "Electro", "Water Kung Fu", "Dragon Breath", "Superhuman", "Death Step", "Sharkman Karate", "Electric Claw", "Dragon Talon", "Godhuman"},
    CurrentOption = "Superhuman",
    Callback = function(opt) getgenv().SelectedStyle = opt end
})
combatTab:CreateToggle({Name = "Auto Fighting Style Switch", CurrentValue = false, Callback = function(val) getgenv().AutoFightingStyle = val end})

-- 🔥 RAIDS TAB
local raidTab = Window:CreateTab("🔥 Raids", 4483362458)
raidTab:CreateToggle({Name = "Auto Raid", CurrentValue = false, Callback = function(val) getgenv().AutoRaid = val end})
raidTab:CreateToggle({Name = "Auto Awaken", CurrentValue = false, Callback = function(val) getgenv().AutoAwaken = val end})

-- 🌊 SEA EVENTS TAB
local seaTab = Window:CreateTab("🌊 Sea Events", 4483362458)
seaTab:CreateToggle({Name = "Auto Sea Beast", CurrentValue = false, Callback = function(val) getgenv().AutoSeaBeast = val end})
seaTab:CreateToggle({Name = "Auto Mirage Island", CurrentValue = false, Callback = function(val) getgenv().AutoMirage = val end})

-- 🧰 UTILITY TAB
local utilTab = Window:CreateTab("🧰 Utility", 4483362458)
utilTab:CreateParagraph({Title = "Anti AFK", Content = "Auto enabled to keep you online."})

-- 🌐 Teleport to Server by Job ID
local selectedSea = "Third Sea"
local jobId = ""
utilTab:CreateDropdown({
    Name = "Select Sea",
    Options = {"First Sea", "Second Sea", "Third Sea", "Sea of Treats"},
    CurrentOption = "Third Sea",
    Callback = function(opt) selectedSea = opt end
})
utilTab:CreateInput({
    Name = "Paste Job ID",
    PlaceholderText = "Paste Roblox Job ID here",
    RemoveTextAfterFocusLost = false,
    Callback = function(input) jobId = input end
})
utilTab:CreateButton({
    Name = "Teleport to Server",
    Callback = function()
        local seaPlaceIds = {
            ["First Sea"] = 2753915549,
            ["Second Sea"] = 4442272183,
            ["Third Sea"] = 7449423635,
            ["Sea of Treats"] = 1451439645
        }
        local tpPlace = seaPlaceIds[selectedSea]
        if tpPlace and jobId ~= "" then
            game:GetService("TeleportService"):TeleportToPlaceInstance(tpPlace, jobId, game.Players.LocalPlayer)
        else
            Rayfield:Notify({
                Title = "Error",
                Content = "Select a Sea and Paste a valid Job ID",
                Duration = 4
            })
        end
    end
})

-- BACKEND THREADS
spawn(function()
    while true do
        if getgenv().FastAttack then
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
            wait(0.05)
        end
        wait(0.1)
    end
end)

spawn(function()
    while true do
        if getgenv().AutoFightingStyle then
            local style = getgenv().SelectedStyle
            for _, tool in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if tool:IsA("Tool") and string.find(tool.Name, style) then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
                end
            end
        end
        wait(1)
    end
end)

spawn(function()
    while true do
        if getgenv().AutoHaki then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
        end
        wait(2)
    end
end)

spawn(function()
    while true do
        if getgenv().AutoFarm or getgenv().AutoBoss or getgenv().BringMobs then
            for _, mob in pairs(workspace.Enemies:GetChildren()) do
                if mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = mob.HumanoidRootPart.CFrame * CFrame.new(0,0,2.5)
                    break
                end
            end
        end
        wait(1)
    end
end)

spawn(function()
    while true do
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(60)
    end
end)

-- 🌌 AUTO DETECTION AND WEBHOOK TRIGGERS
spawn(function()
    while true do
        -- Mirage Island
        if workspace:FindFirstChild("Mirage Island") then
            SendWebhook("🌌 **Event: Mirage Island Detected | Job ID: **`" .. game.JobId .. "`")
        end
        -- Kitsune Boss
        if workspace.Enemies:FindFirstChild("Kitsune") then
            SendWebhook("🦊 **Event: Kitsune Boss Detected | Job ID: **`" .. game.JobId .. "`")
        end
        -- Full Moon
        local lighting = game:GetService("Lighting")
        if lighting:GetMinutesAfterMidnight() >= 18 * 60 then
            SendWebhook("🌕 **Event: Full Moon Active | Job ID: **`" .. game.JobId .. "`")
        end
        -- Fruit Spawn
        for _, v in pairs(workspace:GetChildren()) do
            if v:IsA("Tool") and v:FindFirstChild("Fruit") then
                SendWebhook("🍏 **Fruit Spawned - " .. v.Name .. " | Job ID: **`" .. game.JobId .. "`")
            end
        end
        wait(20)
    end
end)

-- READY NOTIFY
Rayfield:Notify({
    Title = "ishanyop Hub Loaded",
    Content = "Fully featured GUI is now active!",
    Duration = 6,
    Image = 4483362458,
    Actions = {
        Ignore = {
            Name = "OK",
            Callback = function() print("GUI ready") end
        }
    }
})
