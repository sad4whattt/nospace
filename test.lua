-- Server-side script example
local Players = game:GetService("Players")
local MAX_ALLOWED_WALKSPEED = 30 -- Example: Default is 16, maybe allow up to 30.

game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(char)
        local humanoid = char:WaitForChild("Humanoid")
        local lastPosition = char.HumanoidRootPart.Position
        local lastCheckTime = os.time()

        game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
            -- Simple check for distance moved over time
            local currentPosition = char.HumanoidRootPart.Position
            local distanceMoved = (currentPosition - lastPosition).Magnitude
            local timeElapsed = os.time() - lastCheckTime

            if timeElapsed > 0.1 then -- Check every 0.1 seconds or so
                local currentSpeed = distanceMoved / timeElapsed

                if currentSpeed > MAX_ALLOWED_WALKSPEED then
                    warn(player.Name .. " detected moving too fast! Speed: " .. currentSpeed)
                    player:Kick("Detected high speed movement.")
                    -- Or reset their speed/position:
                    -- humanoid.WalkSpeed = MAX_ALLOWED_WALKSPEED
                    -- char.HumanoidRootPart.CFrame = CFrame.new(lastPosition)
                end

                lastPosition = currentPosition
                lastCheckTime = os.time()
            end
        end)
    end)
end)