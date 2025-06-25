local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

LocalPlayer.CharacterAdded:Connect(function(newCharacter)
    Character = newCharacter
    Humanoid = Character:WaitForChild("Humanoid")
    if isSpeedHacking then
        toggleSpeedHack()
    end
end)


local isSpeedHacking = false
local originalWalkSpeed = Humanoid.WalkSpeed

local SPEED_MULTIPLIER = 1.5

local function toggleSpeedHack()
    if not Humanoid then
        print("Speed hack toggle failed: Humanoid not found.")
        return
    end

    isSpeedHacking = not isSpeedHacking

    if isSpeedHacking then
        print("Speed Hack ON. Multiplier: " .. SPEED_MULTIPLIER .. "x")
        originalWalkSpeed = Humanoid.WalkSpeed
        Humanoid.WalkSpeed = originalWalkSpeed * SPEED_MULTIPLIER
    else
        print("Speed Hack OFF")
        Humanoid.WalkSpeed = originalWalkSpeed
    end
end

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if input.KeyCode == Enum.KeyCode.Z and not gameProcessedEvent then
        toggleSpeedHack()
    end --fuck
end)
-- fuck fuck -- fuck ------ fuckkkkkkk
local function initSpeed()
    if Humanoid and originalWalkSpeed == nil then
        originalWalkSpeed = Humanoid.WalkSpeed
    end -- testing
end

initSpeed()

Humanoid.Changed:Connect(function(property)
    if property == "WalkSpeed" and not isSpeedHacking then
        originalWalkSpeed = Humanoid.WalkSpeed
    end
end)

-- Testing