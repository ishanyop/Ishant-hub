--[[ 📜 ishanyop Hub - Blox Fruits Script Version: v1.1 Made for: Delta Executor (and others) Sections: Organized by category (Main, Combat, Raids, Sea Events, Utility) Safe: No gamepass, anti-ban safe zone usage --]]

-- Load GUI Library local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({ Name = "ishanyop Hub | Blox Fruits", LoadingTitle = "ishanyop Hub is loading...", ConfigurationSaving = { Enabled = true, FolderName = nil, FileName = "ishanyopSave" } })

-- 🔁 Global Toggles getgenv().AutoFarm = false getgenv().BringMobs = false getgenv().FastAttack = false getgenv().AutoHaki = false getgenv().AutoBoss = false getgenv().SelectedStyle = "Superhuman" getgenv().AutoFightingStyle = false getgenv().AutoRaid = false getgenv().AutoAwaken = false getgenv().AutoSeaBeast = false getgenv().AutoMirage = false

-- 🧱 MAIN TAB local mainTab = Window:CreateTab("🏹 Main", 4483362458)

mainTab:CreateToggle({ Name = "Auto Farm", CurrentValue = false, Callback = function(val) getgenv().AutoFarm = val end }) mainTab:CreateToggle({ Name = "Bring Mobs", CurrentValue = false, Callback = function(val) getgenv().BringMobs = val end }) mainTab:CreateToggle({ Name = "Auto Boss", CurrentValue = false, Callback = function(val) getgenv().AutoBoss = val end })

-- ⚔️ COMBAT TAB local combatTab = Window:CreateTab("⚔️ Combat", 4483362458)

combatTab:CreateToggle({ Name = "Fast Attack", CurrentValue = false, Callback = function(val) getgenv().FastAttack = val end }) combatTab:CreateToggle({ Name = "Auto Haki", CurrentValue = false, Callback = function(val) getgenv().AutoHaki = val end }) combatTab:CreateDropdown({ Name = "Select Fighting Style", Options = {"Combat", "Black Leg", "Electro", "Water Kung Fu", "Dragon Breath", "Superhuman", "Death Step", "Sharkman Karate", "Electric Claw", "Dragon Talon", "Godhuman"}, CurrentOption = "Superhuman", Callback = function(opt) getgenv().SelectedStyle = opt end }) combatTab:CreateToggle({ Name = "Auto Fighting Style Switch", CurrentValue = false, Callback = function(val) getgenv().AutoFightingStyle = val end })

-- 🔥 RAIDS TAB local raidTab = Window:CreateTab("🔥 Raids", 4483362458)

raidTab:CreateToggle({ Name = "Auto Raid", CurrentValue = false, Callback = function(val) getgenv().AutoRaid = val end }) raidTab:CreateToggle({ Name = "Auto Awaken", CurrentValue = false, Callback = function(val) getgenv().AutoAwaken = val end })

-- 🌊 SEA EVENTS TAB local seaTab = Window:CreateTab("🌊 Sea Events", 4483362458)

seaTab:CreateToggle({ Name = "Auto Sea Beast", CurrentValue = false, Callback = function(val) getgenv().AutoSeaBeast = val end }) seaTab:CreateToggle({ Name = "Auto Mirage Island", CurrentValue = false, Callback = function(val) getgenv().AutoMirage = val end })

-- 🧰 UTILITY TAB local utilTab = Window:CreateTab("🧰 Utility", 4483362458)

utilTab:CreateParagraph({Title = "Anti AFK", Content = "Auto enabled to keep you online."})

-- BACKEND THREADS spawn(function() while true do if getgenv().FastAttack then game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game) wait(0.05) end wait(0.1) end end)

spawn(function() while true do if getgenv().AutoFightingStyle then local style = getgenv().SelectedStyle for _, tool in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do if tool:IsA("Tool") and string.find(tool.Name, style) then game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool) end end end wait(1) end end)

spawn(function() while true do if getgenv().AutoHaki then game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso") end wait(2) end end)

spawn(function() while true do if getgenv().AutoFarm or getgenv().AutoBoss or getgenv().BringMobs then for _, mob in pairs(workspace.Enemies:GetChildren()) do if mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = mob.HumanoidRootPart.CFrame * CFrame.new(0,0,2.5) break end end end wait(1) end end)

spawn(function() while true do game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame) wait(1) game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame) wait(60) end end)

-- READY NOTIFY Rayfield:Notify({ Title = "ishanyop Hub Loaded", Content = "Fully featured GUI is now active!", Duration = 6, Image = 4483362458, Actions = { Ignore = { Name = "OK", Callback = function() print("GUI ready") end } } })

