local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

-- Ensure Character and parts are ready on respawn
LocalPlayer.CharacterAdded:Connect(function(newCharacter)
    Character = newCharacter
    Humanoid = Character:WaitForChild("Humanoid")
    -- Reset speed state on respawn
    if isSpeedHacking then
        toggleSpeedHack() -- Turn off if character respawns while speed hacking
    end
end)


local isSpeedHacking = false
local originalWalkSpeed = Humanoid.WalkSpeed -- Store the player's original walk speed

-- Configure your speed settings
local SPEED_MULTIPLIER = 1.5 -- Start with a low multiplier (e.g., 1.5x default speed)
-- If this isn't detected, try increasing it to 2, 3, etc.
-- If it is detected (rubberbanding/kick), decrease it.

local function toggleSpeedHack()
    -- Ensure Humanoid exists
    if not Humanoid then
        print("Speed hack toggle failed: Humanoid not found.")
        return
    end

    isSpeedHacking = not isSpeedHacking

    if isSpeedHacking then
        print("Speed Hack ON. Multiplier: " .. SPEED_MULTIPLIER .. "x")
        -- Store the current WalkSpeed just before modifying it
        originalWalkSpeed = Humanoid.WalkSpeed
        Humanoid.WalkSpeed = originalWalkSpeed * SPEED_MULTIPLIER
    else
        print("Speed Hack OFF")
        -- Restore original WalkSpeed
        Humanoid.WalkSpeed = originalWalkSpeed
    end
end

-- Keybind for toggling speed hack (e.g., 'Z')
UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    -- Ensure input is not consumed by other UI elements (like typing in chat)
    if input.KeyCode == Enum.KeyCode.Z and not gameProcessedEvent then
        toggleSpeedHack()
    end
end)

-- Initialize originalWalkSpeed in case Humanoid loads after the script starts
-- But before a keybind is pressed. This handles the initial load.
local function initSpeed()
    if Humanoid and originalWalkSpeed == nil then -- Only set if not already set
        originalWalkSpeed = Humanoid.WalkSpeed
    end
end

initSpeed() -- Call once at start

-- Also re-initialize if Humanoid is replaced (e.g. on respawn)
Humanoid.Changed:Connect(function(property)
    if property == "WalkSpeed" and not isSpeedHacking then
        -- If WalkSpeed changes when we are NOT speed hacking, update our original reference
        originalWalkSpeed = Humanoid.WalkSpeed
    end
end)