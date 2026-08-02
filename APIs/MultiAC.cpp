local GameId = game.GameId;
local PlaceId = game.PlaceId;
local UpperC = hookmetamethod;
local LowerC = hookfunction or hookfunc;
local ResetC = restorefunction or restoreclosure;
local tdefer = task.defer;

local function Restore(m)
    if m == "namecall" and getrawmetatable then
        local rawMeta = getrawmetatable(game);
        if rawMeta and rawMeta.__namecall then
            return ResetC(rawMeta.__namecall);
        end;
    elseif m == "index" and getrawmetatable then
        local rawMeta = getrawmetatable(game);
        if rawMeta and rawMeta.__index then
            return ResetC(rawMeta.__index);
        end;
    end;
end;

return {
    Version = "2023_ACI_2026_Skip";
    Function = function(selff, selc)
        if GameId == 2294168059 then
            if PlaceId == 15962819441 then
                local o;o=UpperC(game, "__namecall", function(self, ...)
                    if getnamecallmethod() == "FireServer" then
                        local name = tostring(self);
                        if name == "Sender" or name == "Sender2" then
                            tdefer(Restore, "namecall");
                            return wait(9e9);
                        end;
                    end; return o(self, ...);
                end);
            end;
        end; return true;
    end;
};
