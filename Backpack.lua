-- Backpack.lua
-- Macht dich zum "Rucksack" an einer Zielperson

local Backpack = {}
local running = false
local targetName = nil

-- Ziel ändern
function Backpack.ChangeTarget(name)
    targetName = name
end

-- Aktivieren
function Backpack.BackpackOn()
    if running then return end
    running = true

    task.spawn(function()
        while running do
            local lp = game.Players.LocalPlayer
            local target = game.Players:FindFirstChild(targetName)

            if lp and lp.Character and target and target.Character then
                local hrp = lp.Character:FindFirstChild("HumanoidRootPart")
                local thrp = target.Character:FindFirstChild("HumanoidRootPart")

                if hrp and thrp then
                    -- Position auf Rücken + 180° Drehung (wie richtiger Backpack)
                    hrp.CFrame = thrp.CFrame * CFrame.new(0, 0.5, -1.2) * CFrame.Angles(0, math.rad(180), 0)
                end
            end

            task.wait(0.05) -- alle 0.05s updaten
        end
    end)
end

-- Deaktivieren
function Backpack.BackpackOff()
    running = false
end

return Backpack
