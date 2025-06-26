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
end) -- test comment

local isSpeedHacking = false
local originalWalkSpeed = Humanoid.WalkSpeed

local SPEED_MULTIPLIER = 1.5
-- test comment-- test comment
local function toggleSpeedHack()
    if not Humanoid then
        print("Speed hack toggle failed: Humanoid not found.")
        return
    end
-- test comment
    isSpeedHacking = not isSpeedHacking
-- test comment
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
    end
end)

local function initSpeed()
    if Humanoid and originalWalkSpeed == nil thenalWalkSpeed == nil then
        originalWalkSpeed = Humanoid.WalkSpeed
    end -- test comment
end -- test comment
initSpeed()
initSpeed()
Humanoid.Changed:Connect(function(property)
Humanoid.Changed:Connect(function(property)
    if property == "WalkSpeed" and not isSpeedHacking theneedHacking then
        originalWalkSpeed = Humanoid.WalkSpeed
    end
end)
-- Testing