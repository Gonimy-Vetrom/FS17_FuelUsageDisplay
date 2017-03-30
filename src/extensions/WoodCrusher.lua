--
-- Better Fuel Usage
--
-- @author TyKonKet
-- @date 28/03/2017
function WoodCrusher:postLoad(savegame)
    BetterFuelUsage.print("WoodCrusher extension loaded on " .. self.typeName);
    self.getPtoPowerMultiplier = Utils.overwrittenFunction(self.getPtoPowerMultiplier, WoodCrusher.getPtoPowerMultiplier);
end

function WoodCrusher:getPtoPowerMultiplier(superFunc)
    local powerMultiplier = 1;
    if superFunc ~= nil then
        powerMultiplier = superFunc(self);
    end
    if self.crushingTime > 0 then
        powerMultiplier = powerMultiplier + 0.8;
    end
    return powerMultiplier;
end
