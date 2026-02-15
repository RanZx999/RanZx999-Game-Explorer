# 🛡️ RanZx999 Game Explorer (Safe)

<div align="center">

![Version](https://img.shields.io/badge/version-1.0-blue.svg)
![Status](https://img.shields.io/badge/status-STABLE-success.svg)
![UI](https://img.shields.io/badge/UI-Fluent-purple.svg)
![Safe](https://img.shields.io/badge/anti--cheat-SAFE-brightgreen.svg)

**Safe Game Scanner & Explorer for Anti-Cheat Protected Games**

*Created by Mahatma Arangga (RanZx999)*

✅ **RECOMMENDED: Works on ALL games including those with anti-cheat!**

</div>

---

## ✅ **SCRIPT STATUS**

### 🟢 **STABLE & RECOMMENDED**

**Kondisi Script:**
- ✅ **Fully Working** on all Roblox games
- ✅ **Anti-cheat safe** (no metamethod hooks)
- ✅ **No errors** or crashes
- ✅ **Stable** Fluent UI
- ✅ **Tested** on multiple games
- ✅ **Actively maintained**

**Why This is Better:**
- No real-time hooks = No detection
- Pure scanning = 100% safe
- Works on protected games
- No script conflicts
- Clean & fast

**Tested & Verified On:**
- ✅ [UPDATE 1] SATU TEMBAKAN
- ✅ Arsenal
- ✅ Phantom Forces
- ✅ Jailbreak
- ✅ Any game with anti-cheat

---

## 📋 **Features**

### 🔍 **Scanner Tab**
- **Scan Everything** - Find all remotes & scripts in one click
- **Find Weapon System** - Auto-detect weapon-related items
- **Live Statistics** - Real-time count of found items
- **Smart Filtering** - Automatic weapon/damage detection

### 📡 **Remotes Tab**
- **List RemoteEvents** - All RemoteEvents with full paths
- **List RemoteFunctions** - All RemoteFunctions with full paths
- **Search Function** - Find remotes by name
- **Quick Filters** - Damage/Hit/Kill related remotes
- **Auto-Copy** - All results copy to clipboard automatically

### 💻 **Scripts Tab**
- **List LocalScripts** - Find all client-side scripts
- **List ModuleScripts** - Find all modules
- **Decompiler** - Decompile scripts (executor dependent)
- **Auto-Copy** - Decompiled code copies automatically

### 🛠️ **Tools Tab**
- **Quick Paths** - Copy common game paths
- **Load Dex Explorer** - Full instance browser
- **Load Simple Spy** - Advanced remote spy
- **Game Info** - Copy game details

---

## 🎮 **Compatibility**

### ✅ **Works On ALL Games:**
- ✅ Games with anti-cheat
- ✅ Server-sided games
- ✅ FPS games
- ✅ Simulator games
- ✅ Any Roblox game

### 📊 **Tested Games:**
| Game | Status | Notes |
|------|--------|-------|
| [UPDATE 1] SATU TEMBAKAN | ✅ Perfect | No errors |
| Arsenal | ✅ Perfect | All features work |
| Phantom Forces | ✅ Perfect | Safe to use |
| Jailbreak | ✅ Perfect | No detection |
| Da Hood | ✅ Perfect | Fully working |
| Any Game | ✅ Works | 100% compatible |

### 🔧 **Executor Compatibility:**
| Executor | Status | Notes |
|----------|--------|-------|
| Solara | ✅ Perfect | Fully supported |
| Wave | ✅ Perfect | All features work |
| Fluxus | ✅ Good | Decompiler may not work |
| Arceus X | ✅ Good | Mobile compatible |
| Delta | ✅ Perfect | Fully supported |
| Synapse X | ✅ Perfect | All features work |

---

## 📥 **Installation**

### Method 1: Loadstring (Recommended)
```lua
loadstring(game:HttpGet('https://raw.githubusercontent.com/RanZx999/RanZx999-Game-Explorer/refs/heads/main/GameExplorer_Safe.lua'))()
```

### Method 2: Direct Execute
1. Download `GameExplorer_Safe.lua`
2. Open in executor
3. Click Execute
4. Done!

---

## 🎯 **Usage Guide**

### **Quick Start (30 seconds)**
1. Execute script
2. Press **Right CTRL** to open UI
3. Tab **Scanner** → Click **"Scan Everything"**
4. Wait 2-3 seconds
5. Results ready!

### **Finding Game Exploits**

#### Step 1: Scan the Game
```
1. Click "Scan Everything"
2. Wait for completion notification
3. Check statistics
```

#### Step 2: Find Weapon System
```
1. Click "Find Weapon System"
2. Results auto-copy to clipboard
3. Paste in notepad
4. Analyze the paths
```

#### Step 3: Analyze Remotes
```
1. Tab: Remotes
2. Click "Find Damage Remotes"
3. Look for patterns:
   - DamagePlayer
   - HitRemote
   - FireGun
   - etc.
```

#### Step 4: Decompile Scripts
```
1. Tab: Scripts
2. Note weapon script names
3. Enter name in decompiler
4. Analyze source code
```

### **Example Workflow:**

**Goal: Find how shooting works**

```lua
-- Step 1: Scan
Scanner → "Scan Everything"

-- Step 2: Find weapon items
Scanner → "Find Weapon System"

-- Results might show:
[RemoteEvent] FireBullet
Path: game.ReplicatedStorage.Combat.FireBullet

[LocalScript] GunHandler
Path: game.StarterPlayer.StarterCharacterScripts.GunHandler

-- Step 3: Decompile
Scripts → Enter "GunHandler" → Decompile

-- Step 4: Analyze code
-- Now you know how the gun system works!
```

---

## 📖 **Detailed Features**

### 🔍 **Smart Scanning**

**What Gets Scanned:**
- All RemoteEvents in the game
- All RemoteFunctions in the game
- All LocalScripts (client-side)
- All ModuleScripts (shared code)

**Scan Speed:**
- Small games: 1-2 seconds
- Medium games: 2-5 seconds
- Large games: 5-10 seconds

**Results Format:**
```
[1] RemoteName
Path: game.ReplicatedStorage.Remotes.RemoteName
Parent: game.ReplicatedStorage.Remotes
```

### 🎯 **Weapon System Detection**

**Auto-detects:**
- Gun/Weapon scripts
- Shooting remotes
- Damage systems
- Fire/Combat events

**Keywords Searched:**
- "gun", "weapon", "shoot", "fire"
- "damage", "hit", "kill", "hurt"
- "combat", "bullet", "ammo"

### 📋 **Search & Filter**

**Search by Name:**
```
Input: "Damage"
Results: All remotes containing "Damage"
```

**Quick Filters:**
- Damage-related (Damage, Hit, Kill, Hurt)
- Weapon-related (Gun, Shoot, Fire)
- Custom search (any keyword)

### 💾 **Copy to Clipboard**

**Everything Auto-Copies:**
- Remote lists
- Script lists
- Search results
- Decompiled code
- Game info

**Format Example:**
```
=== REMOTE EVENTS ===

[1] DamagePlayer
Path: game.ReplicatedStorage.Combat.DamagePlayer
Parent: game.ReplicatedStorage.Combat

[2] FireWeapon
Path: game.ReplicatedStorage.Combat.FireWeapon
Parent: game.ReplicatedStorage.Combat
```

---

## 🎹 **Controls**

| Input | Action |
|-------|--------|
| **Right CTRL** | Toggle UI visibility |
| **Click & Drag Title** | Move window |
| **ESC** | Close dropdowns |

---

## 🔧 **Advanced Usage**

### **Using with Dex Explorer**

1. In Game Explorer: Tools → "Load Dex Explorer"
2. Dex opens showing full instance tree
3. Navigate to paths from Game Explorer
4. Inspect objects in detail

### **Using with Simple Spy**

1. Tools → "Load Simple Spy"
2. Simple Spy logs real-time remote calls
3. Cross-reference with Game Explorer results
4. Combine data for full analysis

### **Creating Exploits**

**Example: Creating Damage Hack**

```lua
-- From Game Explorer results:
-- Found: RemoteEvent "DamagePlayer"
-- Path: game.ReplicatedStorage.Combat.DamagePlayer

-- Create exploit:
local Remote = game.ReplicatedStorage.Combat.DamagePlayer

-- Fire with custom damage
Remote:FireServer(target, 999, "Head")
```

### **Script Template Generator**

After finding remotes, use this template:

```lua
-- Auto-generated from Game Explorer scan
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Remote References (replace with your findings)
local DamageRemote = ReplicatedStorage.Combat.DamagePlayer
local ShootRemote = ReplicatedStorage.Combat.FireWeapon

-- Your exploit code here
function AutoKill(target)
    DamageRemote:FireServer(target, 9999, "Head")
end
```

---

## 💡 **Tips & Tricks**

### **Pro Tips:**

1. **Always scan first** before doing anything
2. **Use search** to find specific remotes quickly
3. **Copy results** to notepad for reference
4. **Combine with Dex** for detailed inspection
5. **Test in private servers** first

### **Finding Hidden Remotes:**

Some games hide remotes in weird places:
```lua
-- Common locations:
game.ReplicatedStorage.*
game.ReplicatedFirst.*
game.Players.LocalPlayer.PlayerScripts.*
game.StarterPlayer.StarterPlayerScripts.*
```

### **Analyzing Patterns:**

Look for naming patterns:
```
GoodPattern:
- DamagePlayer
- FireWeapon
- UpdateHealth

BadPattern (obfuscated):
- RE_X7YH3
- Func_0291
- RemoteEvent_84
```

### **When Decompiler Fails:**

If executor doesn't support decompile:
1. Use the script name to search online
2. Check similar games for patterns
3. Use trial & error with remote calls
4. Ask community for help

---

## ⚙️ **Settings & Configuration**

### **No Configuration Needed!**

This script works out-of-the-box:
- No settings to configure
- No toggles needed
- Just scan and use!

### **Persistence:**

Results are **NOT saved** between sessions:
- Scan each time you join
- Copy important data to notepad
- Create your own reference file

---

## 🐛 **Troubleshooting**

### **UI Not Showing**
**Solution:** Press Right CTRL to toggle

### **Scan Returns 0 Results**
**Cause:** Game uses unusual structure  
**Solution:** Load Dex Explorer and search manually

### **Decompiler Not Working**
**Cause:** Executor doesn't support decompile  
**Solution:** Use different executor or skip decompile

### **Script Fails to Load**
**Cause:** Internet connection or Fluent library issue  
**Solution:** Check connection, try again

---

## 📊 **Statistics**

### **Average Scan Results:**
- Small Game: 20-50 remotes, 10-30 scripts
- Medium Game: 50-150 remotes, 30-100 scripts
- Large Game: 150-500+ remotes, 100-300+ scripts

### **Performance:**
- **CPU Usage:** Very low (scanning only)
- **Memory:** ~50-100 MB
- **Lag:** None (no real-time hooks)

---

## 📝 **Changelog**

### Version 1.0 (Current - Stable)
- ✅ Initial stable release
- ✅ Full game scanning
- ✅ Weapon system detection
- ✅ Search & filter functions
- ✅ Decompiler integration
- ✅ Fluent UI
- ✅ Anti-cheat safe
- ✅ No errors or crashes

---

## 🆚 **Comparison**

### **GameExplorer_Safe.lua vs RemoteSpy_LinoriaLib.lua**

| Feature | GameExplorer (Safe) | RemoteSpy (Deprecated) |
|---------|---------------------|------------------------|
| Anti-cheat Safe | ✅ Yes | ❌ No |
| Works on Protected Games | ✅ Yes | ❌ No |
| Real-time Logging | ❌ No | ✅ Yes |
| Metamethod Hooks | ❌ No | ⚠️ Yes |
| Error-free | ✅ Yes | ❌ No |
| UI Library | Fluent | LinoriaLib |
| **Recommended** | ✅ **YES** | ❌ NO |

---

## 👥 **Credits**

**Created by:** [Mahatma Arangga](https://github.com/ranzxx999) (RanZx999)

**UI Library:** [Fluent by dawid-scripts](https://github.com/dawid-scripts/Fluent)

**Special Thanks:**
- Roblox scripting community
- Fluent UI developers
- Beta testers
- You for using this tool!

---

## 📜 **License**

MIT License - Free to use, modify, and distribute.

---

## ⚠️ **Disclaimer**

**IMPORTANT:**

This tool is for **educational and research purposes only**.

- ⚠️ Use responsibly
- ⚠️ Don't abuse in public servers
- ⚠️ May violate Roblox ToS
- ⚠️ Use at your own risk

**We are not responsible for any consequences.**

---

## 🤝 **Contributing**

Found a bug or have a suggestion?

1. Open an issue on GitHub
2. Submit a pull request
3. Contact: [Your Contact Info]

---

## 🌟 **Support**

If this tool helped you:
- ⭐ Star the repository
- 🔄 Share with friends
- 💬 Leave feedback
- ☕ Support development

---

<div align="center">

**Made with ❤️ by Mahatma Arangga (RanZx999)**

✅ **Safe, Stable, and Recommended!** ✅

[⬆ Back to Top](#️-ranzx999-game-explorer-safe)

</div>
