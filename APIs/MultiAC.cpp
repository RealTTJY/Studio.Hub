local GameId = game.GameId;
local PlaceId = game.PlaceId;
local UpperC = hookmetamethod;
local LowerC = hookfunction or hookfunc;
local ResetC = restorefunction or restoreclosure;
local tdefer = task.defer;
local strfind = string.find;

local function Restore(m)
    pcall(function()
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
    end);
end;

return {
    Version = "2023_ACI_2026_ForYoulol";
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
            elseif PlaceId == 96354063422506 then
                local o;o=UpperC(game, "__namecall", function(self, ...)
                    local traceBack = debug.traceback();
                    local selfString = tostring(self);
                    
                    if strfind(traceBack, "ReplicatedFirst.Loading.LocalScript") then
                        tdefer(Restore, "namecall");
                        return error("Bypassed Anti Cheat [sUNC + Specific]");
                    end
                    
                    if getnamecallmethod() == "FireServer" then
                        if strfind(selfString, "Sender") or strfind(selfString, "Sender2") then
                            return error("Bypassed Anti Cheat [sUNC + Specific]");
                        end;
                    end;
                    
                    return o(self, ...);
                end);
            end;
        elseif GameId == 5995470825 then
            local ContentProvider = game:GetService("ContentProvider");
            local str1, str2, str3 = "VirtualUser", "VirtualInputManager", "UGCValidationService";
            local o;o=LowerC(game.FindService, function(self, a)
                if a == str1 or a == str2 or a == str3 then
                    return nil;
                end; return o(self, a);
            end);

            LowerC(ContentProvider.PreloadAsync, function() end);
            LowerC(ContentProvider.GetAssetFetchStatus, function()
                return Enum.AssetFetchStatus.None;
            end);

            local getconstants = debug.getconstants or getconstants;
            local setconstant = debug.setconstant or setconstant;
            
            if getconnections then
                for i,v in pairs(getconnections(game:GetService("LogService").MessageOut)) do
                    if v.Function then
                        local cons = getconstants(v.Function);
                        for i2=1, #cons do
                            local v2=cons[i2];
                            local lens = string.len(v2);
                            if lens == 11 then
                                setconstant(v.Function, i2, "(?!)");
                            end;
                        end;
                    end;
                end;
            end;
        end; return true;
    end;
};
