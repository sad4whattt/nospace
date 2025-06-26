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
-- test comment
    if isSpeedHacking thenacking then
        originalWalkSpeed = Humanoid.WalkSpeed= Humanoid.WalkSpeed
        Humanoid.WalkSpeed = originalWalkSpeed * SPEED_MULTIPLIER * SPEED_MULTIPLIER
    else
        print("Speed Hack OFF")print("Speed Hack OFF")
        Humanoid.WalkSpeed = originalWalkSpeediginalWalkSpeed
    end
end
UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if input.KeyCode == Enum.KeyCode.Z and not gameProcessedEvent then
        toggleSpeedHack()
    end
end)
local function initSpeed()
local function initSpeed()
    if Humanoid and originalWalkSpeed == nil thenalWalkSpeed == nil thenalWalkSpeed == nil thenalWalkSpeed == nil then
        originalWalkSpeed = Humanoid.WalkSpeed
    end
end
initSpeed()
    end
endnnect(function(property)t(function(property)
Humanoid.Changed:Connect(function(property)nction(property)
    if property == "WalkSpeed" and not isSpeedHacking theneedHacking theneedHacking theneedHacking then
        originalWalkSpeed = Humanoid.WalkSpeed
    end
end)
