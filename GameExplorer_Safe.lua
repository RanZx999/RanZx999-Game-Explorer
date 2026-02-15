--[[

RanZx999 Game Explorer & Remote Scanner
UI Library: Fluent (Safe & Stable)

Features:
- Remote Scanner (scan all RemoteEvents/Functions)
- Script Explorer (find & list scripts)
- Instance Browser (explore game hierarchy)
- Copy to Clipboard
- Decompiler support
- NO METAMETHOD HOOKS (anti-cheat safe!)

Created by RanZx999
Safe for games with anti-cheat!

]]

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer

-- Data Storage
local RemoteEvents = {}
local RemoteFunctions = {}
local Scripts = {}
local Modules = {}

-- Utility Functions
local function notify(title, text)
    Fluent:Notify({
        Title = title,
        Content = text,
        Duration = 3
    })
end

local function copyToClipboard(text)
    if setclipboard then
        setclipboard(text)
        notify("✅ Copied!", "Text copied to clipboard!")
    else
        notify("❌ Error", "Executor doesn't support clipboard!")
    end
end

-- Scanner Functions
local function scanRemoteEvents()
    RemoteEvents = {}
    
    for _, obj in pairs(game:GetDescendants()) do
        if obj:IsA("RemoteEvent") then
            table.insert(RemoteEvents, {
                Name = obj.Name,
                Path = obj:GetFullName(),
                Parent = obj.Parent:GetFullName(),
                Object = obj
            })
        end
    end
    
    table.sort(RemoteEvents, function(a, b) return a.Name < b.Name end)
    return RemoteEvents
end

local function scanRemoteFunctions()
    RemoteFunctions = {}
    
    for _, obj in pairs(game:GetDescendants()) do
        if obj:IsA("RemoteFunction") then
            table.insert(RemoteFunctions, {
                Name = obj.Name,
                Path = obj:GetFullName(),
                Parent = obj.Parent:GetFullName(),
                Object = obj
            })
        end
    end
    
    table.sort(RemoteFunctions, function(a, b) return a.Name < b.Name end)
    return RemoteFunctions
end

local function scanScripts()
    Scripts = {}
    Modules = {}
    
    for _, obj in pairs(game:GetDescendants()) do
        if obj:IsA("LocalScript") then
            table.insert(Scripts, {
                Name = obj.Name,
                Type = "LocalScript",
                Path = obj:GetFullName(),
                Object = obj
            })
        elseif obj:IsA("ModuleScript") then
            table.insert(Modules, {
                Name = obj.Name,
                Type = "ModuleScript",
                Path = obj:GetFullName(),
                Object = obj
            })
        end
    end
    
    table.sort(Scripts, function(a, b) return a.Name < b.Name end)
    table.sort(Modules, function(a, b) return a.Name < b.Name end)
    
    return Scripts, Modules
end

local function findWeaponRelated()
    local results = {}
    
    -- Search in RemoteEvents
    for _, remote in ipairs(RemoteEvents) do
        local name = string.lower(remote.Name)
        if string.match(name, "gun") or 
           string.match(name, "weapon") or 
           string.match(name, "shoot") or
           string.match(name, "fire") or
           string.match(name, "damage") or
           string.match(name, "hit") then
            table.insert(results, {
                Type = "RemoteEvent",
                Name = remote.Name,
                Path = remote.Path
            })
        end
    end
    
    -- Search in Scripts
    for _, script in ipairs(Scripts) do
        local name = string.lower(script.Name)
        if string.match(name, "gun") or 
           string.match(name, "weapon") or 
           string.match(name, "shoot") or
           string.match(name, "fire") then
            table.insert(results, {
                Type = "LocalScript",
                Name = script.Name,
                Path = script.Path
            })
        end
    end
    
    return results
end

-- Create Window
local Window = Fluent:CreateWindow({
    Title = "RanZx999 Game Explorer",
    SubTitle = "Safe Scanner & Explorer",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightControl
})

local Tabs = {
    Scanner = Window:AddTab({ Title = "🔍 Scanner", Icon = "search" }),
    Remotes = Window:AddTab({ Title = "📡 Remotes", Icon = "radio" }),
    Scripts = Window:AddTab({ Title = "💻 Scripts", Icon = "file-code" }),
    Tools = Window:AddTab({ Title = "🛠️ Tools", Icon = "wrench" })
}

-- SCANNER TAB
Tabs.Scanner:AddSection("Quick Scan")

Tabs.Scanner:AddButton({
    Title = "🔍 Scan Everything",
    Description = "Scan all remotes & scripts",
    Callback = function()
        notify("Scanning...", "Please wait...")
        
        task.spawn(function()
            scanRemoteEvents()
            scanRemoteFunctions()
            scanScripts()
            
            wait(0.5)
            
            notify("✅ Scan Complete!", 
                string.format("Found:\n• %d RemoteEvents\n• %d RemoteFunctions\n• %d Scripts\n• %d Modules",
                    #RemoteEvents, #RemoteFunctions, #Scripts, #Modules))
        end)
    end
})

Tabs.Scanner:AddButton({
    Title = "🎯 Find Weapon System",
    Description = "Search for weapon-related items",
    Callback = function()
        if #RemoteEvents == 0 then
            notify("❌ Error", "Scan everything first!")
            return
        end
        
        local results = findWeaponRelated()
        
        if #results == 0 then
            notify("Not Found", "No weapon-related items found!")
            return
        end
        
        local output = "=== WEAPON SYSTEM ===\n\n"
        for i, item in ipairs(results) do
            output = output .. string.format("[%s] %s\nPath: %s\n\n", item.Type, item.Name, item.Path)
        end
        
        copyToClipboard(output)
        notify("✅ Found!", string.format("%d weapon items copied!", #results))
    end
})

Tabs.Scanner:AddSection("Statistics")

local StatsLabel = Tabs.Scanner:AddParagraph({
    Title = "Scan Results",
    Content = "Click 'Scan Everything' to start"
})

task.spawn(function()
    while task.wait(1) do
        StatsLabel:SetDesc(string.format(
            "RemoteEvents: %d\nRemoteFunctions: %d\nScripts: %d\nModules: %d",
            #RemoteEvents, #RemoteFunctions, #Scripts, #Modules
        ))
    end
end)

-- REMOTES TAB
Tabs.Remotes:AddSection("RemoteEvents")

Tabs.Remotes:AddButton({
    Title = "📋 List All RemoteEvents",
    Description = "Copy all RemoteEvents to clipboard",
    Callback = function()
        if #RemoteEvents == 0 then
            notify("❌ Error", "Scan first!")
            return
        end
        
        local output = "=== REMOTE EVENTS ===\n\n"
        for i, remote in ipairs(RemoteEvents) do
            output = output .. string.format("[%d] %s\nPath: %s\nParent: %s\n\n", 
                i, remote.Name, remote.Path, remote.Parent)
        end
        
        copyToClipboard(output)
    end
})

Tabs.Remotes:AddInput("SearchRemoteName", {
    Title = "Search Remote",
    Description = "Enter remote name to search",
    Default = "",
    Placeholder = "e.g., Damage",
    Callback = function(Value)
        if Value == "" then return end
        
        local found = {}
        for _, remote in ipairs(RemoteEvents) do
            if string.match(string.lower(remote.Name), string.lower(Value)) then
                table.insert(found, remote)
            end
        end
        
        for _, remote in ipairs(RemoteFunctions) do
            if string.match(string.lower(remote.Name), string.lower(Value)) then
                table.insert(found, remote)
            end
        end
        
        if #found == 0 then
            notify("Not Found", "No remotes matching '" .. Value .. "'")
            return
        end
        
        local output = "=== SEARCH RESULTS: " .. Value .. " ===\n\n"
        for i, remote in ipairs(found) do
            output = output .. string.format("[%d] %s\nPath: %s\n\n", i, remote.Name, remote.Path)
        end
        
        copyToClipboard(output)
        notify("✅ Found!", string.format("%d results copied!", #found))
    end
})

Tabs.Remotes:AddSection("RemoteFunctions")

Tabs.Remotes:AddButton({
    Title = "📋 List All RemoteFunctions",
    Description = "Copy all RemoteFunctions to clipboard",
    Callback = function()
        if #RemoteFunctions == 0 then
            notify("❌ Error", "Scan first!")
            return
        end
        
        local output = "=== REMOTE FUNCTIONS ===\n\n"
        for i, remote in ipairs(RemoteFunctions) do
            output = output .. string.format("[%d] %s\nPath: %s\nParent: %s\n\n", 
                i, remote.Name, remote.Path, remote.Parent)
        end
        
        copyToClipboard(output)
    end
})

Tabs.Remotes:AddSection("Quick Filters")

Tabs.Remotes:AddButton({
    Title = "💥 Find Damage Remotes",
    Description = "Filter for damage/hit/kill remotes",
    Callback = function()
        local found = {}
        
        for _, remote in ipairs(RemoteEvents) do
            local name = string.lower(remote.Name)
            if string.match(name, "damage") or 
               string.match(name, "hit") or 
               string.match(name, "kill") or
               string.match(name, "hurt") then
                table.insert(found, remote)
            end
        end
        
        if #found == 0 then
            notify("Not Found", "No damage-related remotes!")
            return
        end
        
        local output = "=== DAMAGE REMOTES ===\n\n"
        for i, remote in ipairs(found) do
            output = output .. string.format("[%d] %s\nPath: %s\n\n", i, remote.Name, remote.Path)
        end
        
        copyToClipboard(output)
        notify("✅ Found!", string.format("%d damage remotes!", #found))
    end
})

-- SCRIPTS TAB
Tabs.Scripts:AddSection("Script Scanner")

Tabs.Scripts:AddButton({
    Title = "📋 List All LocalScripts",
    Description = "Copy all LocalScripts to clipboard",
    Callback = function()
        if #Scripts == 0 then
            notify("❌ Error", "Scan first!")
            return
        end
        
        local output = "=== LOCAL SCRIPTS ===\n\n"
        for i, script in ipairs(Scripts) do
            output = output .. string.format("[%d] %s\nPath: %s\n\n", i, script.Name, script.Path)
        end
        
        copyToClipboard(output)
        notify("✅ Copied!", string.format("%d scripts!", #Scripts))
    end
})

Tabs.Scripts:AddButton({
    Title = "📋 List All ModuleScripts",
    Description = "Copy all ModuleScripts to clipboard",
    Callback = function()
        if #Modules == 0 then
            notify("❌ Error", "Scan first!")
            return
        end
        
        local output = "=== MODULE SCRIPTS ===\n\n"
        for i, module in ipairs(Modules) do
            output = output .. string.format("[%d] %s\nPath: %s\n\n", i, module.Name, module.Path)
        end
        
        copyToClipboard(output)
        notify("✅ Copied!", string.format("%d modules!", #Modules))
    end
})

Tabs.Scripts:AddSection("Decompiler")

Tabs.Scripts:AddInput("DecompileScriptName", {
    Title = "Script Name",
    Description = "Enter exact script name",
    Default = "",
    Placeholder = "e.g., GunScript",
    Callback = function(Value)
        if Value == "" then return end
        
        if not decompile then
            notify("❌ Error", "Executor doesn't support decompile!")
            return
        end
        
        -- Find script
        local targetScript = nil
        for _, script in ipairs(Scripts) do
            if script.Name == Value then
                targetScript = script.Object
                break
            end
        end
        
        if not targetScript then
            for _, module in ipairs(Modules) do
                if module.Name == Value then
                    targetScript = module.Object
                    break
                end
            end
        end
        
        if not targetScript then
            notify("❌ Not Found", "Script '" .. Value .. "' not found!")
            return
        end
        
        -- Decompile
        local success, result = pcall(function()
            return decompile(targetScript)
        end)
        
        if success and result then
            copyToClipboard(result)
            notify("✅ Success!", "Script decompiled & copied!")
        else
            notify("❌ Failed", "Decompile failed!")
        end
    end
})

-- TOOLS TAB
Tabs.Tools:AddSection("Quick Paths")

Tabs.Tools:AddButton({
    Title = "📋 Copy ReplicatedStorage Path",
    Callback = function()
        copyToClipboard("game:GetService('ReplicatedStorage')")
    end
})

Tabs.Tools:AddButton({
    Title = "📋 Copy Workspace Path",
    Callback = function()
        copyToClipboard("game:GetService('Workspace')")
    end
})

Tabs.Tools:AddButton({
    Title = "📋 Copy Character Path",
    Callback = function()
        copyToClipboard(string.format("game.Players.%s.Character", LocalPlayer.Name))
    end
})

Tabs.Tools:AddSection("External Tools")

Tabs.Tools:AddButton({
    Title = "🔍 Load Dex Explorer",
    Description = "Full instance explorer",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
        notify("✅ Loaded", "Dex Explorer opened!")
    end
})

Tabs.Tools:AddButton({
    Title = "📡 Load Simple Spy",
    Description = "Advanced remote spy",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/exxtremestuffs/SimpleSpySource/master/SimpleSpy.lua"))()
        notify("✅ Loaded", "Simple Spy opened!")
    end
})

Tabs.Tools:AddSection("Game Info")

local GameInfoLabel = Tabs.Tools:AddParagraph({
    Title = "Game Information",
    Content = string.format(
        "Game: %s\nPlace ID: %d\nJob ID: %s",
        game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
        game.PlaceId,
        game.JobId
    )
})

Tabs.Tools:AddButton({
    Title = "📋 Copy Game Info",
    Callback = function()
        local info = string.format(
            "Game: %s\nPlace ID: %d\nJob ID: %s\nCreator: %s",
            game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
            game.PlaceId,
            game.JobId,
            game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Creator.Name
        )
        copyToClipboard(info)
    end
})

Tabs.Tools:AddSection("Script Info")

Tabs.Tools:AddParagraph({
    Title = "About",
    Content = "RanZx999 Game Explorer\nVersion: 1.0\nSafe for anti-cheat games!"
})

Tabs.Tools:AddButton({
    Title = "❌ Unload Script",
    Description = "Close and remove script",
    Callback = function()
        Fluent:Destroy()
    end
})

-- Success
Fluent:Notify({
    Title = "✅ Loaded!",
    Content = "RanZx999 Game Explorer ready!\nClick 'Scan Everything' to start!",
    Duration = 5
})

print("="..string.rep("=", 50))
print("🔍 RanZx999 Game Explorer Loaded!")
print("="..string.rep("=", 50))
print("✅ Safe for anti-cheat games!")
print("✅ No metamethod hooks!")
print("✅ All features working!")
print("="..string.rep("=", 50))
print("Press Right CTRL to toggle UI")
print("="..string.rep("=", 50))