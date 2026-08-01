local GG=GG; if not GG then return game:GetService("Players").LocalPlayer:Kick("[TTJY Studio] : Really? Your account is now at risk for the next ban wave."); end;

local ScriptCache = GG.ScriptCache;
local LoaderSettings = GG.LoaderSettings;
local userIdentify = ScriptCache.userIdentify;
local LowerC = hookfunction or hookfunc;
local GetService = game.GetService;
local Instancen = Instance.new;
local Vec3 = Vector3.new;
local str = string;
local tble = table;
local Col3 = Color3;
local tk = task;

local R = GetService(game, "ReplicatedStorage");
local H = GetService(game, "RunService");
local W = GetService(game, "Workspace");
local P = GetService(game, "Players");
local S = GetService(game, "Stats");

local twait = tk.wait;
local CFr = CFrame.new;
local Vec3 = Vector3.new;
local PivotTo = W.PivotTo;
local mfloor = math.floor;
local tblef = tble.find;
local strfind = str.find;
local tblein = tble.insert;
local GetPivot = W.GetPivot;
local GetChildren = game.GetChildren;
local GetAttribute = game.GetAttribute;
local WaitForChild = game.WaitForChild;
local GetDescendants = game.GetDescendants;
local FindFirstChild = game.FindFirstChild;
local PropChangeSignal = game.GetPropertyChangedSignal;
local FindFirstChildOfClass = game.FindFirstChildOfClass;
local FindFirstChildWhichIsA = game.FindFirstChildWhichIsA;
local GetAttributeChangedSignal = game.GetAttributeChangedSignal;

local VEC3 = Vec3(3,3,3);
local VEC2 = Vec3(2,2,2);
local VEC252 = Vec3(2,5,2);
local VEC10 = Vec3(10, 10, 10);
local CFR9E9 = CFr(0, 9e9, 0);
local RED = Col3.fromRGB(255, 0, 0);
local BLUE = Col3.fromRGB(0, 0, 255);
local GREEN = Col3.fromRGB(0, 255, 0);
local YELLOW = Col3.fromRGB(255, 255, 0);
local WHITE = Col3.fromRGB(255, 255, 255);
local EMPTY_OBJECT = {Parent=nil, SeatPart=nil};
local PERSISTENT = Enum.ModelStreamingMode.Persistent;

local PlaceId = game.PlaceId;

local ScriptData = {};
local Config = GG.Configs or {};

Config.Client = Config.Client or {};
Config.Client.Client = Config.Client.Client or {};
Config.B1C4 = Config.B1C4 or {};
Config.B1C4.Map4 = Config.B1C4.Map4 or {};
Config.B2C1 = Config.B2C1 or {};
Config.B2C1.City = Config.B2C1.City or {};
Config.B2C1.City.ESP = Config.B2C1.City.ESP or {};
Config.B2C1.Rat = Config.B2C1.Rat or {};
Config.B2C1.Rat.ESP = Config.B2C1.Rat.ESP or {};
Config.B2C1.Village = Config.B2C1.Village or {};
Config.B2C1.Village.ESP = Config.B2C1.Village.ESP or {};
Config.B2C1.Ship = Config.B2C1.Ship or {};
Config.B2C1.Ship.ESP = Config.B2C1.Ship.ESP or {};
Config.B2C2 = Config.B2C2 or {};
Config.B2C2.Meat = Config.B2C2.Meat or {};
Config.B2C2.Meat.ESP = Config.B2C2.Meat.ESP or {};
Config.B2C2.Lever = Config.B2C2.Lever or {};
Config.B2C2.Lever.ESP = Config.B2C2.Lever.ESP or {};
Config.B2C2.Cook = Config.B2C2.Cook or {};
Config.B2C2.Kid = Config.B2C2.Kid or {};
Config.B2C2.Kid.ESP = Config.B2C2.Kid.ESP or {};
Config.B2C2.Nagisa = Config.B2C2.Nagisa or {};
Config.B2C3 = Config.B2C3 or {};
Config.B2C3.Maze = Config.B2C3.Maze or {};
Config.B2C3.Maze.ESP = Config.B2C3.Maze.ESP or {};
Config.B2C3.Larves = Config.B2C3.Larves or {};
Config.B2C3.Larves.ESP = Config.B2C3.Larves.ESP or {};
Config.B2C3.Boss = Config.B2C3.Boss or {};
Config.B3C1 = Config.B3C1 or {};
Config.B3C1.City = Config.B3C1.City or {};
Config.B3C1.City.ESP = Config.B3C1.City.ESP or {};
Config.B3C1.School = Config.B3C1.School or {};
Config.B3C1.School.ESP = Config.B3C1.School.ESP or {};
Config.B3C1.IJO = Config.B3C1.IJO or {};
Config.B3C1.IJO.ESP = Config.B3C1.IJO.ESP or {};
Config.B3C1.Water = Config.B3C1.Water or {};
Config.B3C1.Water.ESP = Config.B3C1.Water.ESP or {};

return {
    Version = "TheMimicV3.B4";
    Function = function(CorePackage, WindLib, IntroLib, Windy, ClientPackage, CoruTask, CommonF, ESPF, PromptPackage)
        local CoreConnection    = {};
        local CoreDestroyed     = false;
        local ForceFloat        = "None";

        local Cam               = W.CurrentCamera;
        local selff             = P.LocalPlayer;
        local PSG               = selff.PlayerGui;
        local BP                = selff.Backpack or EMPTY_OBJECT;
        local selc              = selff.Character or EMPTY_OBJECT;
        local HumSelf           = selc.Parent and FindFirstChildOfClass(selc, "Humanoid") or EMPTY_OBJECT;
        local HumRSelf          = HumSelf.RootPart or EMPTY_OBJECT;
        local PSS               = WaitForChild(selff, "PlayerScripts", 9e9);

        local VOIDPART          = Instancen("Part");

        local cmdm              = selff:GetMouse();
        local ClientCon         = Config.Client.Client;
        local B1C4Con           = Config.B1C4;
        local B2C2Con           = Config.B2C2;
        local B2C3Con           = Config.B2C3;
        local B3C1Con           = Config.B3C1;
        local NonAnalytics3     = {type="Button", EN="Analytics 3", EN2="Please enable 'Analytics 3' module to track game data, inventory, and player statistics for reports and webhook integrations.", TH1="Analytics 3", TH2="กรุณาเปิดใช้งานโมดูล 'Analytics 3' เพื่อติดตามข้อมูลเกม สินค้าคงคลัง และสถิติผู้เล่นสำหรับรายงานและเว็บฮุก"};
        local ArgsCraft         = {[1] = 0;[2] = {["__args"] = {};["__tree"] = {[1] = "CraftingService";[2] = "Interact"};["__callType"] = 0}};

        local Chapter           = if PlaceId == 6296321810 or PlaceId == 6479231833 or PlaceId == 6301638949 or PlaceId == 6480994221 then "B1C1"
                                  elseif PlaceId == 6373539583 or PlaceId == 6485055338 or PlaceId == 6406571212 or PlaceId == 6485055836 or PlaceId == 6425178683 or PlaceId == 6485056556 then "B1C2"
                                  elseif PlaceId == 6472459099 or PlaceId == 6688734180 or PlaceId == 6682163754 or PlaceId == 6688734313 or PlaceId == 6682164423 or PlaceId == 6688734395 then "B1C3"
                                  elseif PlaceId == 7251865082 or PlaceId == 7265396387 or PlaceId == 7251866503 or PlaceId == 7265396805 or PlaceId == 7251867155 or PlaceId == 7265397072 or PlaceId == 7251867574 or PlaceId == 7265397848 then "B1C4"
                                  elseif PlaceId == 8056702588 then "B2C1"
                                  elseif PlaceId == 13489800654 then "B2C2"
                                  elseif PlaceId == 15962819441 then "B2C3"
                                  elseif PlaceId == 96354063422506 then "B2C4"
                                  elseif PlaceId == 128715637193371 then "B3C1"
                                  elseif PlaceId == 6243699076 then "Lobby"
                                  else nil;

        local GameAI, GameAI2   = nil, nil;

        local dist              = CommonF.dist;
        local Tp                = CommonF.Tp;
        local HumanoidEquip     = CommonF.HumanoidEquip;
        local Tween             = CommonF.Tween;
        local Anchored          = CommonF.Anchored;
        local distOf            = CommonF.distOf;

        local RE                = {};
        local REQ               = {};
        local Functions         = {};

        ClientCon.JumpPower = ClientCon.JumpPower or 50;
        ClientCon.SpeedMultiplier = ClientCon.SpeedMultiplier or 1;
        ClientCon["TeleportWalk Speed"] = ClientCon["TeleportWalk Speed"] or 1;

        Functions.GetPing = function()
            return S.Network.ServerStatsItem["Data Ping"]:GetValue() / 1000;
        end;
        Functions.GameValidate = function(self)
            if PlaceId == 6243699076 then
                WaitForChild(selc, "AntiFly", 9e9).Enabled = false;
            end; if Chapter == "B1C4" then
                WaitForChild(PSS, "Anti-Fly", 9e9).Enabled = false;
                WaitForChild(PSS, "Anti-Speed", 9e9).Enabled = false;
            end; if PlaceId == 7251867574 or PlaceId == 7265397848 then
                local Katana = FindFirstChild(BP, "Katana") or FindFirstChild(selc, "Katana");
                if not Katana then
                    Katana = WaitForChild(BP, "Katana", 9e9);
                end; self.Katana = Katana;
            end; if Chapter == "B2C3" then
                local BoneSword = FindFirstChild(BP, "Bone Sword") or FindFirstChild(selc, "Bone Sword");
                if not BoneSword then
                    tk.defer(function() self.BoneSword = WaitForChild(BP, "Bone Sword", 9e9); end);
                else self.BoneSword = BoneSword; end;
            end; if Chapter == "B3C1" then
                local Gun = FindFirstChild(BP, "Gun") or FindFirstChild(selc, "Gun");
                if not Gun then
                    tk.defer(function() self.Gun = WaitForChild(BP, "Gun", 9e9); end);
                else self.Gun = Gun; end;
            end; if self.AlreadyInit then return; end; self.AlreadyInit = true;
            if Chapter == "B2C1" or Chapter == "B2C2" then
                local DynamicControl, GCs = nil, getgc(true);
                for i=1, #GCs do
                    local v=GCs[i]; if type(v) == 'function' then
                        if debug.info(v, "n") == "DynamicControl" then
                            DynamicControl = v; break;
                        end;
                    elseif type(v) == 'table' then
                        if rawget(v, "TakeOver") then
                            self.TakeOver = v;
                        end;
                    end;
                end; local UPs = getupvalues(DynamicControl);
                for i=1, #UPs do
                    local f1=UPs[i]; if type(f1) == 'function' then
                        local UPs2 = getupvalues(f1);
                        for i2=1, #UPs2 do
                            local v=UPs2[i2]; if type(v) == 'table' and (v.Interactable or v.Safe) then
                                self.u18 = v; break;
                            end;
                        end;
                    end;
                end;
            elseif Chapter == "B2C3" then
                local GamemodeMode = GetAttribute(W, "GamemodeMode");
                if not GamemodeMode then
                    GetAttributeChangedSignal(W, "GamemodeMode"):Once(function()
                        GamemodeMode = GetAttribute(W, "GamemodeMode");
                    end);
                end; self.GameMode = GamemodeMode;
                self.OneRunHouseClicked = {};
            end;
        end;
        Functions.FreeCam = function(self, isFree)
            Cam = W.CurrentCamera;

            if self.TakeOver then
                self.TakeOver:TakeOver(not isFree);
            end;

            if Chapter == "B2C1" then
                if isFree then
                    Cam.CameraType = Enum.CameraType.Scriptable;
                end;
            end;
        end;
        Functions.FirePrompt = function(self, args)
            local Prompt = args.Prompt;
            local EndAt = args.EndAt;
            local LookAt = args.LookAt;

            if not Prompt then return; end;
            local Max = Prompt.MaxActivationDistance;
            Prompt.MaxActivationDistance = 250;
            Prompt.RequiresLineOfSight = false;
            
            self:FreeCam(true);
            Cam.CFrame = CFr(EndAt.Position, LookAt);
            Tp(HumRSelf, EndAt, 0.3);
            Prompt:InputHoldBegin();
            H.RenderStepped:Wait();

            Tp(HumRSelf, args.Safe);
            tk.delay(Prompt.HoldDuration - 0.2, function()
                Tp(HumRSelf, EndAt);
            end); twait(Prompt.HoldDuration);
            Prompt:InputHoldEnd(); twait(0.1)

            self:FreeCam(false);
            Prompt.MaxActivationDistance = Max;
        end;
        Functions.ToolNow = function(self, index)
            if not selc.Parent then return false; end;
            local Tool = self[index]; if Tool and Tool.Parent ~= selc then
                HumanoidEquip(HumSelf, Tool);
            elseif not Tool then
                return false;
            end; return Tool;
        end;
        Functions.ToolActive = function(self, index)
            local Tool = self:ToolNow(index); if Tool then
                return Tool:Activate();
            end; return;
        end;
        Functions.AutoCompleteBook1 = function()
            if PlaceId == 6296321810 or PlaceId == 6479231833 then
                return Tp(HumRSelf, CFr(3507, 37.65, -1539.45));
            elseif PlaceId == 6301638949 or PlaceId == 6480994221 then
                return Tp(HumRSelf, CFr(1274.95, 199.54, -2537.93));
            end;
            if PlaceId == 6373539583 or PlaceId == 6485055338 then
                return Tp(HumRSelf, CFr(64.88, 55.28, -1590));
            elseif PlaceId == 6406571212 or PlaceId == 6485055836 then
                return Tp(HumRSelf, CFr(235.17, 101.94, -590));
            elseif PlaceId == 6425178683 or PlaceId == 6485056556 then
                return Tp(HumRSelf, CFr(829.97, 72.49, -353.46));
            end;
            if PlaceId == 6472459099 or PlaceId == 6688734180 then
                return Tp(HumRSelf, CFr(2411.93, -23.03, 2300));
            elseif  PlaceId == 6682163754 or PlaceId == 6688734313 then
                return Tp(HumRSelf, CFr(245.69, 31.72, 450));
            elseif  PlaceId == 6682164423 or PlaceId == 6688734395 then
                return Tp(HumRSelf, CFr(-651, 648.99, -1014.35), 5), Tp(HumRSelf, CFr(-644.07, 947.82, -1490));
            end;
            if PlaceId == 7251865082 or PlaceId == 7265396387 then
                return Tp(HumRSelf, CFr(91, -48.35, -1416.24));
            elseif PlaceId == 7251866503 or PlaceId == 7265396805 then
                local CHs = GetChildren(W.Butterflies); for i=1, #CHs do
                    local v=CHs[i]; if v.Parent then
                        Tp(HumRSelf, v.CFrame, 0.3);
                        fireproximityprompt(v.ProximityPrompt, 1);
                    end;
                end;
            elseif PlaceId == 7251867155 or PlaceId == 7265397072 then
                local CHs = GetChildren(W.GameInfo.PuzzleItems); for i=1, #CHs do
                    local v=CHs[i]; if v.Parent and v.ProximityPrompt.Enabled then
                        Tp(HumRSelf, v.CFrame, 0.3); fireproximityprompt(v.ProximityPrompt);
                    end;
                end; Tp(HumRSelf, CFr(688.41, 28.37, 2251.57), 0.3);
                local Burner = W.Well.Burner; for i=1, 6 do
                    fireproximityprompt(Burner.ProximityPrompt);
                end;
            end;
        end;
        Functions.ESPMonsterBook1 = function(state)
            if not state then return ESPF.Visible("Monster", false); else
                if GameAI then
                    local CHs = GetChildren(GameAI); for i=1, #CHs do
                        local v=CHs[i]; if v.Parent then
                            ESPF.ESP("Monster", v, {
                                Color = RED;
                                Size = VEC10;
                                Text = v.Name;
                            });
                        end;
                    end;
                end; if GameAI2 then
                    local CHs = GetChildren(GameAI2); for i=1, #CHs do
                        local v=CHs[i]; if v.Parent and v.ClassName == "Model" then
                            ESPF.ESP("Monster", v, {
                                Color = RED;
                                Size = VEC10;
                                Text = v.Name;
                            });
                        end;
                    end;
                end; if Chapter == "B1C3" then
                    local Omu = FindFirstChild(W, "omukadeMAIN");
                    local DMGP = Omu and FindFirstChild(Omu, "damagepart");
                    if DMGP then DMGP.Transparency = 0; end;
                    if Omu then ESPF.ESP("Monster", DMGP, {
                        Color = RED;
                        Size = VEC10;
                        Text = "Train Chu Chu LOL";
                    }); end;
                end; ESPF.Visible("Monster", true,  true);
            end; return;
        end;
        Functions.ESPItemsBook1 = function(state)
            if not state then return ESPF.Visible("Items", false); else
                local Givers = FindFirstChild(W, "Givers");
                if Givers then
                    local CHs = GetChildren(Givers); for i=1, #CHs do
                        local v=CHs[i]; if v.Parent and v.ClassName == "Model" then
                            ESPF.ESP("Items", v, {
                                Color = WHITE;
                                Size = VEC2;
                                Text = v.Name;
                            });
                        end;
                    end;
                end; if Chapter == "B1C2" or PlaceId == 6682164423 or PlaceId == 6688734395 then
                    local CHs = GetChildren(W); for i=1, #CHs do
                        local v=CHs[i]; if v.Parent and v.ClassName == "Model" then
                            if v.Name ~= "Key1" and v.Name ~= "Butterfly" and not FindFirstChild(v, "ProxPart") then continue; end;
                            ESPF.ESP("Items", v, {
                                Color = WHITE;
                                Size = VEC2;
                                Text = v.Name;
                            });
                        end;
                    end;
                elseif PlaceId == 6472459099 or PlaceId == 6688734180 then
                    local CHs = GetChildren(W); for i=1, #CHs do
                        local v=CHs[i]; if v.Parent then
                            if v.Name ~= "Butterfly" and v.Name ~= "Crowbar" and v.Name ~= "Blade" then continue; end;
                            ESPF.ESP("Items", v, {
                                Color = WHITE;
                                Size = VEC2;
                                Text = v.Name;
                            });
                        end;
                    end; ESPF.ESP("Items", FindFirstChild(W.OfferItem, "Sword"), {
                        Color = GREEN;
                        Size = VEC2;
                        Text = "Place sword here";
                    });
                elseif PlaceId == 6682163754 or PlaceId == 6688734313 then
                    local CHs = GetChildren(W.BellFolder); for i=1, #CHs do
                        local v=CHs[i]; if v.Parent then
                            local Prox = FindFirstChild(v, "ProximityPrompt");
                            if not Prox then continue; end;
                            local ESPObject = ESPF.ESP("Items", v, {
                                Color = if Prox.Enabled then YELLOW else GREEN;
                                Size = VEC2;
                                Text = v.Name;
                            }); PropChangeSignal(Prox, "Enabled"):Connect(function()
                                ESPObject.UpdateColor(GREEN);
                            end);
                        end;
                    end;
                elseif PlaceId == 7251865082 or PlaceId == 7265396387 then
                    local CHs = GetChildren(W); for i=1, #CHs do
                        local v=CHs[i]; if v.Parent then
                            local Prox = FindFirstChild(v, "ProxPart");
                            if Prox then 
                                ESPF.ESP("Items", Prox, {
                                    Color = WHITE;
                                    Size = VEC2;
                                    Text = Prox.ProximityPrompt.ObjectText;
                                });
                            elseif FindFirstChild(v, "Model") and FindFirstChild(v.Model, "Model") then
                                local Prox = FindFirstChild(v.Model.Model, "ProxPart", true);
                                if not Prox then continue; end;
                                ESPF.ESP("Items", Prox, {
                                    Color = WHITE;
                                    Size = VEC2;
                                    Text = Prox.ProximityPrompt.ObjectText;
                                });
                            end;
                        end;
                    end;
                elseif PlaceId == 7251866503 or PlaceId == 7265396805 then
                    local CHs = GetChildren(W.Butterflies); for i=1, #CHs do
                        local v=CHs[i]; if v.Parent then
                            local ESPObject = ESPF.ESP("Items", v, {
                                Color = WHITE;
                                Size = VEC2;
                                Text = v.Name;
                            });
                        end;
                    end;
                elseif PlaceId == 7251867155 or PlaceId == 7265397072 then
                    local CHs, CHs2 = GetChildren(W), GetChildren(W.GameInfo.PuzzleItems);
                    for i=1, #CHs do
                        local v=CHs[i]; if v.Parent and v.ClassName == "Model" then
                            if v.Name == "Model" and FindFirstChild(v, "Spirit") then
                                ESPF.ESP("Items", v.Spirit.ProxPart, {
                                    Color = WHITE;
                                    Size = VEC2;
                                    Text = "Butterfly";
                                });
                            elseif v.Name == "Key" then
                                ESPF.ESP("Items", v, {
                                    Color = WHITE;
                                    Size = VEC2;
                                    Text = v.Name;
                                });
                            end;
                        end;
                    end; for i=1, #CHs2 do
                        local v=CHs2[i]; if v.Parent then
                            local Prox = FindFirstChild(v, "ProximityPrompt");
                            local ESPObject = ESPF.ESP("Items", v, {
                                Color = if Prox.Enabled then YELLOW else GREEN;
                                Size = VEC2;
                                Text = "Cursed Item";
                            }); PropChangeSignal(Prox, "Enabled"):Connect(function()
                                ESPObject.UpdateColor(if Prox.Enabled then YELLOW else GREEN);
                            end);
                        end;
                    end;
                elseif PlaceId == 7251867574 or PlaceId == 7265397848 then
                    local CHs = GetChildren(W.GameHearts); for i=1, #CHs do
                        local v=CHs[i]; if v.Parent then
                            local HPs = FindFirstChild(v, "Health");
                            if not HPs then continue; end;
                            local ESPObject = ESPF.ESP("Items", v, {
                                Color = if HPs.Value > 0 then YELLOW else GREEN;
                                Size = VEC2;
                                Text = v.Name;
                            }); PropChangeSignal(HPs, "Value"):Connect(function()
                                ESPObject.UpdateColor(if HPs.Value > 0 then YELLOW else GREEN);
                            end);
                        end;
                    end;
                end;
            end; ESPF.Visible("Items", true, true);
        end;
        Functions.B2C1Validate = function(self, obj, from)
            if self[obj] then return true; end;
            local Connections = getconnections(obj[from]); for i=1, #Connections do
                local vf=Connections[i]; if type(vf.Function) == 'function' then
                    local Cons = getconstants(vf.Function); for ri=1, #Cons do
                        local Con=Cons[ri]; if type(Con) == 'string' then
                            local Lowerest = str.lower(Con);
                            if Lowerest == 'billboardgui' or Lowerest == 'highlight' then
                                debug.setconstant(vf.Function, ri, "TJYS");
                            end;
                        end;
                    end;
                end;
            end; self[obj]=true;
            return self[obj];
        end;
        Functions.B2C1Get = function(self, obj)
            local B2C1Cache = self.B2C1Cache;
            if not B2C1Cache then
                B2C1Cache = {};
                self.B2C1Cache = B2C1Cache;
            end; if not B2C1Cache[obj] then
                local parts = str.split(obj, ".");
                local resolvedParts = {};
                local skipNext = false;
                for i = 1, #parts do
                    if skipNext then
                        skipNext = false;
                    else
                        local part = parts[i];
                        if i < #parts and tonumber(parts[i+1]) and not tonumber(part) then
                            part = part .. "." .. parts[i+1];
                            skipNext = true;
                        end;
                        tblein(resolvedParts, part);
                    end;
                end;
                parts = resolvedParts;

                local current = game;
                local startIdx = 1;
                if parts[1] == "Workspace" or parts[1] == "workspace" then
                    current = W;
                    startIdx = 2;
                end;
                warn("Start current: " .. tostring(current))
                for i = startIdx, #parts do
                    local name = parts[i];
                    local scrambled = self.u18 and self.u18[name] or name;
                    warn(string.format("Step %d: looking for %q (scrambled: %q)", i, name, scrambled))
                    current = current and FindFirstChild(current, scrambled);
                    warn(string.format("Found at step %d: %s", i, tostring(current)))
                    if not current then break; end;
                end; B2C1Cache[obj] = current;
                warn("Final cache result: " .. tostring(current))
            end; return B2C1Cache[obj];
        end;
        Functions.B2C1Func = function(self, where)
            if not HumRSelf.Parent then return; end;
            if where == "City/Complete" then
                return Tp(HumRSelf, CFr(-1783, 11, -4297));
            elseif where == "Rat/Book" then
                local Object = self:B2C1Get("Workspace.Section2.BookRead.Book");
                if not Object then return; end; local Interact = FindFirstChild(Object, "Interact");
                local Prox = Interact and FindFirstChildOfClass(Interact, "ProximityPrompt");
                if not Prox or not Prox.Enabled then return; end;
                return Tp(HumRSelf, Interact.CFrame, 0.3), fireproximityprompt(Prox);
            elseif where == "Rat/Rat" then
                local Object = self:B2C1Get("Workspace.Section2.Rats");
                local Well = self:B2C1Get("Workspace.Section2.Interactable.PoisonedWell.ProximityPrompt");
                local Bell = self:B2C1Get("Workspace.Section2.Interactable.Bell.ProximityPrompt");
                if not Object or not Well or not Bell then return; end;
                local CHs = GetChildren(Object); for i=1, #CHs do
                    local v=CHs[i]; if v.Parent then
                        local Prox = FindFirstChild(v, "Cube");
                        Prox = Prox and FindFirstChildOfClass(Prox, "ProximityPrompt");
                        if not Prox then continue; end;
                        Tp(HumRSelf, Prox.Parent.CFrame, 0.3)
                        fireproximityprompt(Prox);
                        Tp(HumRSelf, Well.Parent.CFrame, 0.3);
                        fireproximityprompt(Well); twait(5);
                        Tp(HumRSelf, Bell.Parent.CFrame, 0.3);
                        fireproximityprompt(Bell); break;
                    end;
                end;
            elseif where == "Rat/Exit" then
                local Object = self:B2C1Get("Workspace.Section2.Interactable.Exit.ProximityPrompt");
                if not Object or not Object.Enabled then return; end;
                Tp(HumRSelf, Object.Parent.CFrame, 0.3); fireproximityprompt(Object);
            elseif where == "Rat/Run" then
                Tween({primary = HumRSelf; goal = { CFrame = CFr(-960.842529, -44.0736237, -3597.06372) }});
            elseif where == "Nagisa/Auto" then
                ForceFloat = true; CommonF.Tween({ primary = HumRSelf; goal = { CFrame = CFr(208.665894, 573.239563, -345.685211) } });
                twait(3); CommonF.Tween({ primary = HumRSelf; goal = { CFrame = CFr(595.243896, 582.230713, -344.577911) } }); ForceFloat = "None";
            elseif where == "Nagisa/Run" then
                ForceFloat = true; CommonF.Tween({ primary = HumRSelf; goal = { CFrame = CFr(3868.31982, 153.007477, 17.1698914) } }); ForceFloat = "None";
            elseif where == "Vil/Zone" then
                Tween({primary = HumRSelf; goal = { CFrame = CFr(4590.5249, 507.557373, 4480.6499) }});
            elseif where == "Vil/Talk" then
                Tp(HumRSelf, CFr(-326.344421, 23.1051254, 3662.32056));
            elseif where == "Vil/Key" then
                Tp(HumRSelf, CFr(-401.797424, 3070.25, 3864.77979), 1);
                local Object = self:B2C1Get("Workspace.Section4");
                if not Object then return; end;
                local Items = FindFirstChild(Object, "Items");
                local Key = Items and FindFirstChild(Items, "Key1");
                local Prox = Key and FindFirstChildOfClass(Key, "ProximityPrompt");
                if not Prox then return; end;
                Tp(HumRSelf, Key.CFrame, 0.3); fireproximityprompt(Prox);
            elseif where == "Vil/PaintTp" then
                Tp(HumRSelf, CFr(-249.45462, 3067.58838, 4218.84766));
            elseif where == "Vil/Pics" then
                local Object = self:B2C1Get("Workspace.Section4.Puzzle.Hints");
                if not Object then return; end; local CHs = GetChildren(Object);
                
                if not self.Hints then
                    self.Hints = Object.ChildAdded:Connect(function(v)
                        if v.ClassName == "Model" then
                            v.ModelStreamingMode = PERSISTENT;
                        end;
                    end);

                    for i=1, #CHs do
                        local v=CHs[i]; if v.Parent and v.ClassName == "Model" then
                            v.ModelStreamingMode = PERSISTENT;
                        end;
                    end;

                    self.Cords = {
                        CFr(-267.697571, 3070.85718, 4213.41504),
                        CFr(590.236572, 3070.94922, 4420.93457),
                        CFr(-675.159424, 3071.0813, 4998.77686),
                        CFr(-392.277039, 3071.03931, 3888.39697),
                        CFr(-10.6637068, 3070.17041, 4711.52637),
                    };
                end;

                for i=1, #self.Cords do
                    local v=self.Cords[i];
                    Tp(HumRSelf, v, 2);
                end;
            elseif where == "Vil/House" then
                local Object = self:B2C1Get("Workspace.Section4.HouseTeleporters.MainHouse.Enter.Teleporter.ProximityPrompt");
                if not Object or not Object.Enabled then return; end;
                Tp(HumRSelf, Object.Parent.CFrame, 0.3); for i=1, 2 do
                    fireproximityprompt(Object); twait(0.3);
                end;
            elseif where == "Vil/Candle" then
                local Hints = self:B2C1Get("Workspace.Section4.Puzzle.Hints");
                local Images = self:B2C1Get("Workspace.Section4.Puzzle.Frames");
                local Candles = self:B2C1Get("Workspace.Section4.Puzzle.Candles");
                if not Hints or not Images or not Candles then return; end;
                local Orb = self:B2C1Get("Workspace.Section4.Puzzle.Gem.Seishin.Orb.ProximityPrompt");
                if not Orb then
                    local Pics4, Names = {}, {};
                    local CHs = GetChildren(Hints); for i=1, #CHs do
                        local v=CHs[i]; if v.Parent then
                            local Image = FindFirstChild(v, "Image");
                            if not Image then continue; end;
                            tblein(Pics4, Image.Decal.Texture);
                        end;
                    end;

                    CHs = GetChildren(Images); for i=1, #CHs do
                        local v=CHs[i]; if v.Parent then
                            local Image = FindFirstChild(v, "Image");
                            if not Image then continue; end;
                            if tblef(Pics4, Image.Decal.Texture) then
                                tblein(Names, v.Name);
                            end;
                        end;
                    end;

                    CHs = GetChildren(Candles); for i=1, #CHs do
                        local v=CHs[i]; if v.Parent then
                            if tblef(Names, v.Name) then
                                local Candle = FindFirstChild(v, "Candle");
                                local Wax = Candle and FindFirstChild(Candle, "Wax");
                                local Prox = Wax and FindFirstChildOfClass(Wax, "ProximityPrompt");
                                if not Prox or not Prox.Enabled then continue; end;
                                Tp(HumRSelf, Wax.CFrame, 0.3); fireproximityprompt(Prox);
                            end;
                        end;
                    end; twait(1);
                end; Orb = self:B2C1Get("Workspace.Section4.Puzzle.Gem.Seishin.Orb.ProximityPrompt");
                if Orb and Orb.Enabled then
                    Tp(HumRSelf, Orb.Parent.CFrame, 0.3);
                    fireproximityprompt(Orb);
                end; self:B2C1Func("Vil/Talk");
            elseif where == "Ship/Enter" then
                Tp(HumRSelf, CFr(-1250, 4, 6299.65));
            elseif where == "Ship/Candle" then
                local Rituals = self:B2C1Get("Workspace.Section5.RitualLight");
                if not Rituals then return; end; local CHs = GetChildren(Rituals);
                
                if not self.Rituals then
                    self.Rituals = Rituals.ChildAdded:Connect(function(v)
                        if v.ClassName == "Model" then
                            v.ModelStreamingMode = PERSISTENT;
                        end;
                    end);

                    for i=1, #CHs do
                        local v=CHs[i]; if v.Parent and v.ClassName == "Model" then
                            v.ModelStreamingMode = PERSISTENT;
                        end;
                    end;

                    self.Cords = {
                        CFr(-6064, 547, 7146),
                        CFr(-6821, 759, 6431),
                        CFr(-5443, 461, 6336),
                    };

                    for i=1, #self.Cords do
                        local v=self.Cords[i];
                        Tp(HumRSelf, v, 0.3);
                    end; CHs=GetChildren(Rituals);
                end; for i=1, #CHs do
                    local v=CHs[i]; if v.Parent then
                        local Prox = FindFirstChildWhichIsA(v, "ProximityPrompt", true);
                        if not Prox or not Prox.Enabled then continue; end;
                        ForceFloat = true;
                        self:FirePrompt({
                            Safe = Prox.Parent.CFrame * CFr(0, -10, 0);
                            Prompt = Prox;
                            LookAt = Prox.Parent.Position;
                            EndAt = Prox.Parent.CFrame * CFr(0, 3, 0);
                        });
                    end; ForceFloat = "None";
                end;
            elseif where == "Ship/Run" then
                Tp(HumRSelf, CFr(-6318.51, 418.696014, 6332.39));
            end;
        end;
        Functions.B2C1ESP = function(self, where, state)
            if not state then
                return ESPF.Visible(where, false);
            elseif where == "City/Key" then
                local Object = self:B2C1Get("Workspace.Section1.Items.Key");
                if not Object then return; end;
                ESPF.ESP(where, Object, {
                    Color = WHITE;
                    Size = VEC2;
                    Text = "Key";
                });
            elseif where == "Rat/Book" then
                local Object = self:B2C1Get("Workspace.Section2.BookRead.Book");
                if not Object then return; end; local ESPObject = ESPF.ESP(where, Object, {
                    Color = YELLOW;
                    Size = VEC2;
                    Text = "Book";
                }); local Interact = FindFirstChild(Object, "Interact"); if Interact then
                    Interact.Destroying:Connect(function()
                        ESPObject.UpdateColor(GREEN);
                    end);
                else
                    ESPObject.UpdateColor(GREEN);
                end;
            elseif where == "Rat/Futakuchi" then
                local Object = self:B2C1Get("Workspace.Section2.Monsters.Futakuchi");
                if not Object then return; end; if self:B2C1Validate(Object, "DescendantAdded") then
                    ESPF.ESP(where, Object, {
                        Color = RED;
                        Size = VEC10;
                        Text = "Futakuchi";
                    });
                end;
            elseif where == "Rat/Rat" then
                local Object = self:B2C1Get("Workspace.Section2.Rats");
                if not Object then return; end;
                local CHs = GetChildren(Object); for i=1, #CHs do
                    local v=CHs[i]; if v.Parent then
                        local Prox = FindFirstChild(v, "Cube");
                        Prox = Prox and FindFirstChildOfClass(Prox, "ProximityPrompt");
                        if not Prox then continue; end;
                        local ESPObject = ESPF.ESP(where, Prox.Parent, {
                            Color = if Prox.Enabled then YELLOW else GREEN;
                            Size = VEC2;
                            Text = "Rat";
                        }); if not ESPObjects[Prox] then
                            ESPObjects[Prox] = PropChangeSignal(Prox, "Enabled"):Connect(function()
                                ESPObject.UpdateColor(if Prox.Enabled then YELLOW else GREEN);
                            end);
                        end;
                    end;
                end;
            elseif where == "Vil/Kurobozu" then
                local Object = self:B2C1Get("Workspace.Section4.Monsters.Kurobozu");
                if not Object then return; end; if self:B2C1Validate(Object, "DescendantAdded") then
                    ESPF.ESP(where, Object, {
                        Color = RED;
                        Size = VEC10;
                        Text = "Kurobozu";
                    });
                end;
            elseif where == "Vil/Ohaguro" then
                local Object = self:B2C1Get("Workspace.Section4.Monsters.Ohaguro");
                if not Object then return; end; if self:B2C1Validate(Object, "DescendantAdded") then
                    ESPF.ESP(where, Object, {
                        Color = RED;
                        Size = VEC10;
                        Text = "Ohaguro";
                    });
                end;
            elseif where == "Ship/Monsters" then
                local Object = self:B2C1Get("Workspace.Section5.Monsters");
                if not Object then return; end;
                local CHs = GetChildren(Object);
                for i=1, #CHs do
                    local v=CHs[i]; if v.Parent then
                        if self:B2C1Validate(v, "DescendantAdded") then
                            ESPF.ESP(where, v, {
                                Color = RED;
                                Size = VEC10;
                                Text = v.Name;
                            });
                        end;
                    end;
                end;
            end; ESPF.Visible(where, true, true);
        end;
        Functions.GetFromCook = function(Givers, name)
            local Object = Givers and FindFirstChild(Givers, name);
            if not Object then return; end;
            local Handle = FindFirstChild(Object, "Handle");
            local Prox = Handle and FindFirstChildOfClass(Handle, "ProximityPrompt");
            if not Prox then return; end;
            Tp(HumRSelf, Handle.CFrame, 0.3);
            fireproximityprompt(Prox);
        end;
        Functions.PlaceCoun = function(Counter)
            local CHs = GetChildren(Counter); for i=1, #CHs do
                local v=CHs[i]; if v.Parent then
                    local Prox = FindFirstChildOfClass(v, "ProximityPrompt");
                    if not Prox then continue; end;
                    Tp(HumRSelf, Prox.Parent.CFrame, 0.3);
                    return fireproximityprompt(Prox);
                end;
            end;
        end;
        Functions.ToStove = function(Prox)
            Tp(HumRSelf, Prox.Parent.CFrame, 0.3);
            fireproximityprompt(Prox);
        end;
        Functions.TurnInFood = function(prompt)
            prompt.Parent.Parent.CanCollide = false; prompt.Enabled = true;
            Tp(HumRSelf, prompt.Parent.Parent.CFrame * CFr(0, -3, 0), 0.3);
            fireproximityprompt(prompt);
        end;
        Functions.B2C2Func = function(self, where)
            if where == "Statue" then
                local Object = self:B2C1Get("Workspace.Section1.UmiBozuSeeking_Intro_02"); warn(Object)
                if not Object then return; end; local Hitbox = FindFirstChild(Object, "Hitbox_Entrance");
                if FindFirstChild(Hitbox, "TouchInterest") then
                    firetouchinterest(HumRSelf, Hitbox, 0);
                end; Tween({
                    primary = HumRSelf;
                    goal = {CFrame = CFr(-520, 30, -87.29)};
                }); Tp(HumRSelf, CFr(-520, 30, -87.2), 0.3);
                Anchored(HumRSelf, true);
                Tp(HumRSelf, CFr(-520, 30, -87.2), 30);
                Anchored(HumRSelf, false);
                Tp(HumRSelf, CFr(-551, 30, -87.29));
            elseif where == "Crounch" then
                local DoorA = self:B2C1Get("Workspace.Section2.Build.ProxDoorA.DoorFrame.ProximityPrompt"); if DoorA then
                    Tp(HumRSelf, DoorA.Parent.CFrame, 0.3);
                    fireproximityprompt(DoorA); ForceFloat = true;
                    repeat twait(0.1) until self:B2C1Get("Workspace.Section2.Build.ProxDoorB.DoorFrame");
                    local DoorB = self:B2C1Get("Workspace.Section2.Build.ProxDoorB.DoorFrame.ProximityPrompt");
                    if DoorB then
                        Tp(HumRSelf, DoorB.Parent.CFrame, 0.3);
                        fireproximityprompt(DoorB);
                    end; ForceFloat = false;
                end; Tp(HumRSelf, CFr(-3952.85, 700, 317.7), 70);

                local DoorL = self:B2C1Get("Workspace.Section2.TeleportDoor.PROMPTINHERE.ProximityPrompt");
                if not DoorL then return; end;
                Tp(HumRSelf, DoorL.Parent.CFrame, 0.3);
                fireproximityprompt(DoorL);
            elseif where == "Meat/Talk" then
                Tp(HumRSelf, CFr(-4443, 711, 1164)); WindUI:Notify({
                    Title = "<font color='rgb(255,0,0)'>ALERT</font>",
                    Content = "If you just collected meats, wait 11 seconds before talk to this NPC",
                    Icon = "circle-alert",
                    Duration = 11,
                })
            elseif where == "Meat/TpMeat" then
                local MeatRF = self:B2C1Get("Workspace.Section2.Rooms");
                if not MeatRF then return; end;
                for _, v in pairs(GetChildren(MeatRF)) do
                    if v.Name == "RestaurantRoom" then
                        local MeatF = FindFirstChild(v, "Meat");
                        if MeatF then
                            local MeatFChild = GetChildren(MeatF);
                            for i=1, #MeatFChild do
                                if MeatFChild[i].Transparency == 0 then
                                    return CommonF.Tp(HumRSelf, MeatFChild[i].CFrame);
                                end;
                            end;
                        end;
                    end;
                end;
            elseif where == "Meat/Exit" then
                local Object = self:B2C1Get("Workspace.Section2.Rooms.EndRoom.DoorTele.DoorFrame.ProximityPrompt");
                if not Object then return; end;
                Tp(HumRSelf, Object.Parent.CFrame, 0.3);
                fireproximityprompt(Object);
            elseif where == "Meat/Run" then
                ForceFloat = false; Tp(HumRSelf, CFr(-4590, 843.64, -35.54));
                twait(14); ForceFloat = true; tk.spawn(function()
                    Tween({primary = HumRSelf; goal = {CFrame = CFr(-5364, 682.12, 29.63)}});
                end); twait(2); ForceFloat = "None";
            elseif where == "Lever/Enter" then
                Tp(HumRSelf, CFr(-11035, -81.4, -12.56));
            elseif where == "Lever/Auto" then
                local Object = self:B2C1Get("Workspace.Section3.GATE_SYSTEM_01.Levers");
                if not Object then return; end; local CHs = GetChildren(Object);
                for i=1, #CHs do
                    local v=CHs[i]; if v.Parent then
                        local Lever = FindFirstChild(v, "Lever");
                        local Prox = Lever and FindFirstChildOfClass(Lever, "ProximityPrompt");
                        if not Prox or not Prox.Enabled then continue; end;
                        Tp(HumRSelf, Lever.CFrame, 0.3);
                        fireproximityprompt(Prox);
                    end;
                end; return twait(6), Tp(HumRSelf, CFr(-10060, 484.1, -9.52));
            elseif where == "Math" then
                Tp(HumRSelf, CFr(-2005.8, 968.25, -4909.48));
            elseif where == "Cook/Run" then
                return Tween({primary = HumRSelf; goal = {
                    CFrame = CFr(-3345.78, 1205, -6794.84)};
                    info = TweenInfo.new(
                        3,
                        Enum.EasingStyle.Linear,
                        Enum.EasingDirection.Out,
                        0,
                        false,
                        0
                    )
                }), twait(4), Tp(HumRSelf, CFr(-3347.32, 1205, -6824));
            elseif where == "Cursed/1" then
                Tween({primary = HumRSelf; goal = {CFrame = CFr(-4250.71, 613.7, -968.13)}});
            elseif where == "Cursed/2" then
                Tween({primary = HumRSelf; goal = {CFrame = CFr(-4079.71, 613.7, -968.13)}});
            elseif where == "Cursed/Remove" then
                local Object = self:B2C1Get("Workspace.Section3.5.GAMESTART");
                if not Object then return; end;
                Object.CanTouch = false;
            elseif where == "Kid/Find" then
                local Object = self:B2C1Get("Workspace.Section4.Daughter.IndicatorPic");
                if not Object then return; end;
                Tp(HumRSelf, Object.CFrame, 0.3);
                Tp(HumRSelf, CFr(-4334.81299, 690.94397, -2363.2771));
            elseif where == "Kid/Gate" then
                local Object = self:B2C1Get("Workspace.Section4.Door.Glowing");
                if not Object then return; end;
                Tp(HumRSelf, Object.CFrame);
            elseif where == "Kid/Notes" then
                local Object = self:B2C1Get("Workspace.Section4.SlenderGame.Notes");
                if not Object then return; end; local CHs = GetChildren(Object);
                for i=1, #CHs do
                    local v=CHs[i]; if v.Parent then
                        local Prox = FindFirstChildOfClass(v, "ProximityPrompt");
                        if not Prox and not Prox.Enabled then continue; end;
                        Tp(HumRSelf, v.CFrame, 0.3); fireproximityprompt(Prox);
                    end;
                end;
            end;
        end;
        Functions.B2C2ESP = function(self, where, state)
            if not state then
                return ESPF.Visible(where, false);
            elseif where == "Meat/Ashina" then
                local Object = self:B2C1Get("Workspace.Section2.Monsters.Ashina");
                if not Object then return; end; if self:B2C1Validate(Object, "DescendantAdded") then
                    ESPF.ESP(where, Object, {
                        Color = RED;
                        Size = VEC10;
                        Text = "Ashina";
                    });
                end;
            elseif where == "Meat/Meats" then
                local MeatRF = self:B2C1Get("Workspace.Section2.Rooms");
                if not MeatRF then return; end;
                for _, v in pairs(GetChildren(MeatRF)) do
                    if v.Name == "RestaurantRoom" then
                        local MeatF = FindFirstChild(v, "Meat");
                        if MeatF then
                            local MeatFChild = GetChildren(MeatF);
                            for i=1, #MeatFChild do
                                if MeatFChild[i].Transparency == 0 then
                                    ESPF.ESP(where, MeatFChild[i], {
                                        Color = WHITE;
                                        Size = VEC2;
                                        Text = "Meat";
                                    });
                                end;
                            end;
                        end;
                    end;
                end;
            elseif where == "Lever/Levers" then
                local Object = self:B2C1Get("Workspace.Section3.GATE_SYSTEM_01.Levers");
                if not Object then return; end; local CHs = GetChildren(Object);
                for i=1, #CHs do
                    local v=CHs[i]; if v.Parent then
                        local Lever = FindFirstChild(v, "Lever");
                        local Prox = Lever and FindFirstChildOfClass(Lever, "ProximityPrompt");
                        if not Prox or not Prox.Enabled then continue; end;
                        ESPF.ESP(where, Lever, {
                            Color = WHITE;
                            Size = VEC2;
                            Text = "Lever";
                        });
                    end;
                end;
            elseif where == "Math" then
                local MidANumber, MidBNumber = nil;
                local SymbolsAImage1, SymbolsAImage2 = nil;
                local SymbolsBImage1, SymbolsBImage2 = nil;
                local SymbolsANumber1, SymbolsANumber2 = nil;
                local SymbolsBNumber1, SymbolsBNumber2 = nil;
                local Descen = GetDescendants(W);
                for i,v in ipairs(Descen) do
                    if v.ClassName == "TextLabel" and v.Parent.ClassName == "SurfaceGui" and v.Parent.Parent.Name == "MiddleNumber" and v.Parent.Parent.Parent.Name == "SymbolsA" then
                        MidANumber = v.Text;
                    end;
                    if v.ClassName == "TextLabel" and v.Parent.ClassName == "SurfaceGui" and v.Parent.Parent.Name == "MiddleNumber" and v.Parent.Parent.Parent.Name == "SymbolsB" then
                        MidBNumber = v.Text;
                    end;
                    if v.ClassName == "ImageLabel" and v.Parent.ClassName == "SurfaceGui" and v.Parent.Parent.Name == "SymbolHolder" and v.Parent.Parent.Parent.Name == "SymbolsA" then
                        SymbolsAImage1 = v.Image;
                    end;
                    if v.ClassName == "ImageLabel" and v.Parent.ClassName == "SurfaceGui" and v.Parent.Parent.Name == "SymbolHolder" and v.Parent.Parent.Parent.Name == "SymbolsB" then
                        SymbolsBImage1 = v.Image;
                    end;
                end; for i,v in ipairs(Descen) do
                    if v.ClassName == "ImageLabel" and v.Parent.ClassName == "SurfaceGui" and v.Parent.Parent.Name == "SymbolHolder" and v.Parent.Parent.Parent.Name == "SymbolsA" then
                        if v.Image ~= SymbolsAImage1 then
                            SymbolsAImage2 = v.Image;
                        end;
                    end;
                    if v.ClassName == "ImageLabel" and v.Parent.ClassName == "SurfaceGui" and v.Parent.Parent.Name == "SymbolHolder" and v.Parent.Parent.Parent.Name == "SymbolsB" then
                        if v.Image ~= SymbolsBImage1 then
                            SymbolsBImage2 = v.Image;
                        end;
                    end;
                end; for i,v in ipairs(Descen) do
                    if v.ClassName == "ImageLabel" and FindFirstChild(v.Parent, "TextLabel") then
                        if v.Image == SymbolsAImage1 then
                            SymbolsANumber1 = v.Parent:WaitForChild("TextLabel").Text;
                        end;
                    end;
                    if v.ClassName == "ImageLabel" and FindFirstChild(v.Parent, "TextLabel") then
                        if v.Image == SymbolsAImage2 then
                            SymbolsANumber2 = v.Parent:WaitForChild("TextLabel").Text;
                        end;
                    end;
                    if v.ClassName == "ImageLabel" and FindFirstChild(v.Parent, "TextLabel") then
                        if v.Image == SymbolsBImage1 then
                            SymbolsBNumber1 = v.Parent:WaitForChild("TextLabel").Text;
                        end;
                    end;
                    if v.ClassName == "ImageLabel" and FindFirstChild(v.Parent, "TextLabel") then
                        if v.Image == SymbolsBImage2 then
                            SymbolsBNumber2 = v.Parent:WaitForChild("TextLabel").Text;
                        end;
                    end;
                end;
                local Answer1 = tostring(MidANumber - (SymbolsANumber1 + SymbolsANumber2));
                local Answer2 = tostring(MidBNumber - (SymbolsBNumber1 + SymbolsBNumber2));
                for i,v in ipairs(Descen) do
                    if v.ClassName == "TextLabel" and v.Parent.Parent.Parent.Name == "Kanji" then
                        for _, sec in ipairs(Descen) do
                            if sec.Name == "SymbolHolder[Empty]" and sec.Parent.Name == "SymbolsA" then
                                if v.Text == Answer1 then
                                    local HackImage1 = v.Parent:Clone();
                                    HackImage1.Parent = sec;
                                end;
                            end;
                            if sec.Name == "SymbolHolder[Empty]" and sec.Parent.Name == "SymbolsB" then
                                if v.Text == Answer2 then
                                    local HackImage2 = v.Parent:Clone();
                                    HackImage2.Parent = sec;
                                end;
                            end;
                        end;
                    end;
                end;
            elseif where == "Kid/Mother" then
                local Object = Functions:B2C1Get("Workspace.Section4.Monsters.Mother.HumanoidRootPart");
                if not Object then return; end; if self:B2C1Validate(Object, "DescendantAdded") then
                    ESPF.ESP(where, Object, {
                        Color = RED;
                        Size = VEC10;
                        Text = "Mother";
                    });
                end;
            end; ESPF.Visible(where, true, true)
        end;
        Functions.B2C3CanCraft = function(CHs)
            local Count=0; for i=1, #CHs do
                local v=CHs[i]; if v.Parent then
                    if v.Name == "Stick" or v.Name == "Cloth" then
                        Count += 1;
                    end;
                end;
            end; return Count >= 3;
        end;
        Functions.B2C3Click = function(self, name)
            if not tblef(self.OneRunHouseClicked, name) then
                tblein(self.OneRunHouseClicked, name);
                R.Packages.Packet.PacketFunction:InvokeServer(0, {
                    __args = { [1] = name },
                    __tree = { [1] = "IspyService", [2] = "Clicked" },
                    __callType = 0
                }); twait();
            end;
        end;
        Functions.B2C3Func = function(self, where)
            if where == "Gozu" then
                Tp(HumRSelf, CFr(-582, 38, 417));
            elseif where == "Heart/Talk" then
                Tp(HumRSelf, CFr(-138, 45, 79));
            elseif where == "Heart/Auto" then
                local Hearts = GetChildren(W.Section1.Puzzle.Hearts); for i=1, #Hearts do
                    local v=Hearts[i]; if v.Parent then
                        local Prox = FindFirstChild(v, "ProximityPrompt");
                        if not Prox or not Prox.Enabled then continue; end;
                        Tp(HumRSelf, v.Heart.CFrame, 0.3); fireproximityprompt(Prox);
                    end;
                end;
                
                local CHs = GetChildren(W.Section1.Puzzle.SpinModel); for i=1, #CHs do
                    local arm=CHs[i]; if arm.Parent and arm.ClassName == "Model" then
                        local BeatingHeart = FindFirstChild(arm, "BeatingHeart");
                        local Heart = BeatingHeart and FindFirstChild(BeatingHeart, "Heart");
                        local Prox = Heart and FindFirstChild(Heart, "ProximityPrompt");
                        if not Prox or not Prox.Enabled then continue; end;
                        local BPHeart = FindFirstChild(BP, "Heart"); if BPHeart then
                            HumanoidEquip(HumSelf, BPHeart);
                        end; Tp(HumRSelf, Heart.CFrame, 0.3); fireproximityprompt(Prox);
                    end;
                end;
            elseif where == "Heart/Run" then
                ForceFloat = true; Tp(HumRSelf, CFr(-101, 42, -395), 0.3);
                local CHs=GetChildren(W.Section1.Maze.Doors2); for i=1, #CHs do
                    local v=CHs[i]; if v.Parent then
                        local Main = FindFirstChild(v, "MAIN");
                        if not Main or dist(Main.Position) > 30 then continue; end;
                        fireproximityprompt(Main.ProximityPrompt); break;
                    end;
                end; ForceFloat = "None";
            elseif where == "Maze/Craft" then
                local Holes = GetChildren(W.Section1.Maze.Holes);
                local Tables = GetChildren(W.Section1.Maze.Crafting.Tables);
                
                ForceFloat = true; for i=1, #Holes do
                    local v=Holes[i]; if v.Parent then
                        local Prox = FindFirstChild(v, "ProximityPrompt");
                        if not Prox or not Prox.Enabled then continue; end;
                        Tp(HumRSelf, v.CFrame, 0.3); fireproximityprompt(Prox);
                    end; if self.B2C3CanCraft(GetChildren(BP)) then break; end;
                end; Tp(HumRSelf, CFr(-78, 4, -442), 1);
                
                for i=1, #Tables do
                    local v=Tables[i]; if v.Parent then
                        local Root = FindFirstChild(v, "RootPart");
                        if dist(Root.Position) > 30 then continue; end;
                        local Prox = FindFirstChild(Root, "ProximityPrompt");
                        if not Prox or not Prox.Enabled then continue; end;
                        Tp(HumRSelf, Root.CFrame, 0.3);
                        fireproximityprompt(Prox);
                        R.Packages.Packet.PacketFunction:InvokeServer(unpack(ArgsCraft));
                        twait(0.3); PSG.Crafting.Frame.Visible = false; break;
                    end;
                end; ForceFloat = "None";
            elseif where == "Maze/Fire" then
                local Maze = W.Section1.Maze;
                local GrinDemon = if self.GameMode == "Normal" then Maze.GrinDemon else Maze.GrinDemonNM;
                local CHs = GetChildren(Maze.Crafting.ArmFlames); for i=1, #CHs do
                    local v=CHs[i]; if v.Parent then
                        local Flame = FindFirstChild(v, "UndyingFlame");
                        if distOf(Flame, GrinDemon.HumanoidRootPart, 20) then continue; end;
                        local Prox = Flame and FindFirstChild(Flame, "ProximityPrompt");
                        if not Prox or not Prox.Enabled then continue; end;
                        Tp(HumRSelf, Flame.CFrame, 0.3); fireproximityprompt(Prox); break;
                    end;
                end;
            elseif where == "Maze/Escape" then
                Tp(HumRSelf, CFr(-74, 5.2, -880));
            elseif where == "Bell/Zone" then
                Tp(HumRSelf, CFr(-325.5, 15, -1114));
            elseif where == "Bell/Flys" then
                for amount=1, 2 do
                    local Flies = GetChildren(W.Section2.FlyNoobs.Flies); for i=1, #Flies do
                        local Area=Flies[i]; if Area.Parent then
                            local CHs=GetChildren(Area); for ri=1, #CHs do
                                local v=CHs[ri]; if v.Parent and v.ClassName == "Model" then
                                    local Hitbox = FindFirstChild(v, "FlyHitbox");
                                    if not Hitbox or v.eyes.Transparency == 1 then continue; end;
                                    if self:ToolNow("BoneSword") then
                                        Tp(HumRSelf, Hitbox.CFrame);
                                        self:ToolActive("BoneSword");
                                        twait(3);
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            elseif where == "Bell/Auto" then
                local Bells, Colors, IsSoundPlay, Remote = W.Section2.Bells, {
                    Black = Col3.fromRGB(17, 17, 17);
                    White = Col3.fromRGB(248, 248, 248); 
                    Red = Col3.fromRGB(248, 0, 0);
                }, function(sound)
                    return sound.IsPlaying or sound.TimePosition > 0;
                end, R.Packages.Packet.PacketFunction;

                local AddChild = function(Bell)
                    local Buttons = WaitForChild(Bell, "2", 10);
                    local Base = WaitForChild(Buttons, "Base");
                    local Select = WaitForChild(Base, "Select");
                    local PlayerSelect = WaitForChild(Base, "PlayerSelect");
                    local ProximityPrompt = WaitForChild(Base, "ProximityPrompt");
                    local BellModel = WaitForChild(Bell, "BellModel");
                    local BellAnimationController = WaitForChild(BellModel, "AnimationController");
                    local HandMinions = WaitForChild(Bell, "HandMinions");
                    
                    local IsFinished = false; BellAnimationController.AnimationPlayed:Once(function()
                        IsFinished = true;
                    end);

                    local ThreadLoop, Pattern, Threads = false, {}, {};
                    local CHs=GetChildren(Buttons); for i=1, #CHs do
                        local Button=CHs[i]; if Button.Parent and Button.Name == "Buttons" then
                            Threads[#Threads + 1] = PropChangeSignal(Button, "Color"):Connect(function()
                                if Button.Color == Colors.White then
                                    tk.delay(0.1 + math.clamp(self.GetPing(), 0, 0.5), function()
                                        if IsSoundPlay(Select) then
                                            Pattern[#Pattern + 1] = Button;
                                        end;
                                    end);
                                elseif Button.Color == Colors.Red then
                                    Pattern = {};
                                end;
                            end);
                        end;
                    end;

                    Threads[#Threads + 1] = H.Heartbeat:Connect(function()
                        if GetAttribute(HandMinions, "Health") <= 0 or GetAttribute(HandMinions, "CanDamage") then
                            IsFinished = true; tk.defer(function()
                                for i=1, #Threads do
                                    Threads[i]:Disconnect();
                                end;
                            end);
                        end; if IsFinished then
                            return;
                        end; if #Pattern >= 5 and not ThreadLoop then
                            ThreadLoop = true; twait(1 + math.clamp(self.GetPing(), 0, 0.5));
                            for index = 1, #Pattern do
                                local Button = Pattern[index];
                                Remote:InvokeServer(0, {
                                    __args = {[1] = Button,},
                                    __tree = {
                                        [1] = "PuzzleService",
                                        [2] = "Clicked",
                                    }, __callType = 0,
                                }); twait(0.03);
                            end; Remote:InvokeServer(0, {
                                __args = {},
                                __tree = {
                                    "PuzzleService",
                                    "ExitPuzzle"
                                }, __callType = 0
                            }); twait(0.3); Pattern = {}; ThreadLoop = false;
                        end;
                    end);
                end;

                local CHs = GetChildren(Bells); for i=1, #CHs do
                    local v=CHs[i]; if v.Parent then
                        AddChild(v);
                    end;
                end;

                local DodoMeki = W.Section2.Monster.Dodomeki.Head; repeat 
                    local AllCompleted = true;
                        local CHs = GetChildren(Bells); for i=1, #CHs do
                        local v=CHs[i]; if v.Parent then
                            local Obj2 = FindFirstChild(v, "2");
                            local HandMinions = FindFirstChild(v, "HandMinions");
                            if not Obj2 or not HandMinions then continue; end;
                            local Base = FindFirstChild(Obj2, "Base");
                            local Prompt = Base and FindFirstChild(Base, "ProximityPrompt");
                            local Hitbox = FindFirstChild(HandMinions, "Hitbox1");
                            
                            if Prompt and Hitbox and GetAttribute(HandMinions, "Health") > 0 then
                                AllCompleted = false; while GetAttribute(HandMinions, "Health") > 0 and v.Parent do
                                    if DodoMeki.CFrame.Position.Y <= 60 then return; end;
                                    if not GetAttribute(HandMinions, "CanDamage") then
                                        Tp(HumRSelf, Obj2.CFrame, 0.5);
                                        if Prompt.Enabled then
                                            fireproximityprompt(Prompt);
                                            twait(5.3);
                                        end;
                                    elseif not PSG.QuickTime.GrabbedUI.Visible then
                                        if self:ToolNow("BoneSword") then
                                            Tp(HumRSelf, Hitbox.CFrame);
                                            self:ToolActive("BoneSword");
                                        end;
                                    end; twait(0.1);
                                end;
                            end;
                        end;
                    end; twait(1);
                until DodoMeki.Head.CFrame.Position.Y <= 60 or AllCompleted;
            elseif where == "Bell/Puzzle" then
                local CHs=GetChildren(W.Section2.PuzzleDoor.Doors); for i=1, #CHs do
                    local v=CHs[i]; if v.Parent then
                        local Shapes = FindFirstChild(v, "Shapes");
                        local Combos = Shapes and FindFirstChild(Shapes, "Combos");
                        if not Combos or Combos.Position.Y < 0 then continue; end;
                        local SurfaceGui = FindFirstChild(Combos, "SurfaceGui");
                        if not SurfaceGui then continue; end;
                        local CHs2 = GetChildren(SurfaceGui);
                        if #CHs2 == 0 then continue; end;
                        local rv={}; for ri=1, #CHs2 do
                            tblein(rv, CHs2[ri].Name);
                        end; Tp(HumRSelf, Combos.CFrame, 0.3);
                        fireproximityprompt(v.DoorDetector.ProximityPrompt);
                        return R.Packages.Packet.PacketFunction:InvokeServer(0, {
                            __args = {[1] = rv},
                            __tree = {
                                [1] = "DoorPuzzleService",
                                [2] = "Clicked",
                            },
                            __callType = 0,
                        });
                    end;
                end;
            elseif where == "Bell/TpDoor" then
                local CHs=GetChildren(W.Section2.PuzzleDoor.Doors); for i=1, #CHs do
                    local v=CHs[i]; if v.Parent then
                        local Shapes = FindFirstChild(v, "Shapes");
                        local Combos = Shapes and FindFirstChild(Shapes, "Combos");
                        if not Combos or Combos.Position.Y < 0 then continue; end;
                        local SurfaceGui = FindFirstChild(Combos, "SurfaceGui");
                        if not SurfaceGui then continue; end;
                        local CHs2 = GetChildren(SurfaceGui);
                        if #CHs2 == 0 then continue; end;
                        return Tp(HumRSelf, Combos.CFrame, 0.3);
                    end;
                end;
            elseif where == "Bell/Run" then
                Tp(HumRSelf, CFr(-3888, -55, -2289));
            elseif where == "Enzukai/Enter" then
                local CHs = { W["Section2.5"].MindGame.Intro.Trigger, W["Section2.5"].MindGame.Intro.Trigger2 };
                for i=1, #CHs do
                    local v=CHs[i]; if v.Parent then
                        Tp(HumRSelf, v.CFrame, 0.3);
                    end;
                end;
            elseif where == "Enzukai/Auto" then
                local CHs = GetChildren(W["Section2.5"].MindGame.Boats); for i=1, #CHs do
                    local v=CHs[i]; if v.Parent then
                        local Assign = FindFirstChild(v, "AssignedPlayer");
                        if Assign.Value ~= selff then continue; end;
                        local Enzukai = FindFirstChild(v, "EnzukaiGame");
                        local Root = Enzukai and FindFirstChild(Enzukai, "RootPart");
                        local ProxAt = Root and FindFirstChild(Root, "PromptAttachment");
                        local Prox = ProxAt and FindFirstChild(ProxAt, "ProximityPrompt");
                        while Prox and Prox.Parent and Enzukai.Parent do
                            if Prox.Enabled then
                                fireproximityprompt(Prox);
                            end; twait(0.1);
                        end; break;
                    end;
                end;
            elseif where == "Father/Isamu" then
                W.Section3.IsamuAI.Hitbox.CanTouch = false;
            elseif where == "Father/Auto" then
                Tp(HumRSelf, CFr(1136, 30, -2400));
            elseif where == "Train" then
                Tp(HumRSelf, W["Section3.5"].GhostTrain.TrainTrigger.CFrame);
            elseif where == "Larves" then
                local Dog = W.Section4.DogWall.RootPart.ProximityPrompt;
                local CHs = GetChildren(W.Section4.HotPotato.Givers); for i=1, #CHs do
                    local v=CHs[i]; if v.Parent then
                        local Root = FindFirstChild(v, "RootPart");
                        local Prox = Root and FindFirstChild(Root, "ProximityPrompt");
                        if not Prox or not Prox.Enabled then continue; end;
                        Tp(HumRSelf, Root.CFrame, 0.3); fireproximityprompt(Prox); break;
                    end;
                end; Tp(HumRSelf, Dog.Parent.CFrame, 0.3); fireproximityprompt(Dog);
            elseif where == "Mud" then
                Tp(HumRSelf, W["Section4.5"].TeleportToSection5.CFrame);
            elseif where == "Yurei/House" then
                local CHs = GetChildren(W.Section5.ISPY.Houses); for i=1, #CHs do
                    local v=CHs[i]; if v.Parent then
                        local Player = FindFirstChild(v, "Player");
                        local Root = Player and FindFirstChild(Player, "HumanoidRootPart");
                        local Prox = Root and FindFirstChild(Root, "ProximityPrompt");
                        if not Prox or not Prox.Enabled then continue; end;
                        Tp(HumRSelf, Root.CFrame, 0.3); fireproximityprompt(Prox); break;
                    end;
                end;
            elseif where == "Yurei/Click" then
                local CHs = GetChildren(W.Section5.ISPY.Houses); for i=1, #CHs do
                    local v=CHs[i]; if v.Parent then
                        local Player = FindFirstChild(v, "Player");
                        local Root = Player and FindFirstChild(Player, "HumanoidRootPart");
                        if dist(Root.Position) > 50 then continue; end;

                        local Items = GetChildren(v.Items); for index=1, #Items do
                            local ItemName, Text = Items[index].Name, PSG.Section5.TextLabel.Text;
                            if strfind(Text, ItemName) then
                                self:B2C3Click(ItemName, v.Name);
                            elseif strfind(Text, "Teddy Bear") and ItemName == "TeddyBear" then
                                self:B2C3Click(ItemName, v.Name);
                            elseif strfind(Text, "Traditional Lantern") and ItemName == "TraditionalLantern" then
                                self:B2C3Click(ItemName, v.Name);
                            elseif strfind(Text, "Japanese Stone Lantern") and ItemName == "JapaneseStoneLantern" then
                                self:B2C3Click(ItemName, v.Name);
                            elseif strfind(Text, "Rubber Duck") and ItemName == "RubberDuck" then
                                self:B2C3Click(ItemName, v.Name);
                            elseif strfind(Text, "Working Lantern") and ItemName == "WorkingLantern" then
                                self:B2C3Click(ItemName, v.Name);
                            elseif strfind(Text, "Sun Symbol") and ItemName == "SunSymbol" then
                                self:B2C3Click(ItemName, v.Name);
                            elseif strfind(Text, "Kintoru Head") and ItemName == "KintoruHead" then
                                self:B2C3Click(ItemName, v.Name);
                            elseif strfind(Text, "Mail Box") and ItemName == "MailBox" then
                                self:B2C3Click(ItemName, v.Name);
                            elseif strfind(Text, "Rice Barrel") and ItemName == "RiceBarrel" then
                                self:B2C3Click(ItemName, v.Name);
                            end; twait(0.3);
                        end;
                    end;
                end;
            elseif where == "Boss/TpSafe" then
                if self:B2C3Func("Boss/Map") then
                    Tp(HumRSelf, CFr(3078, 17, -540));
                end;
            elseif where == "Boss/Map" then
                if self.MapC then return true; end; self.MapC = true;
                local CHs = GetChildren(W.Section5.Boss.Build); for i=1, #CHs do
                    local v=CHs[i]; if v.Parent then
                        if v.Name == "c01-15k" or v.Name == "InvisWall" then
                            v:Destroy();
                        end;
                    end;
                end; return true;
            elseif where == "Boss/Katanas" then
                if self:B2C3Func("Boss/Map") then
                    local CHs, CO = GetChildren(W.Section5.Boss.Katanas), 0; for i=1, #CHs do
                        if CO > 4 then return; end; ForceFloat = true;
                        local v=CHs[i]; if v.Parent and v.Transparency == 0 then
                            Tp(HumRSelf, v.CFrame * CFr(15,0,0), 0.3);
                            fireproximityprompt(v.ProximityPrompt); CO+=1;
                        end; ForceFloat = "None";
                    end; Functions:B2C3Func("Boss/TpSafe");
                end;
            elseif where == "Hell/Run" then
                Tp(HumRSelf, CFr(-1697, 246, 7806));
            end;
        end;
        Functions.B2C3ESP = function(self, where, state)
            if not state then
                return ESPF.Visible(where, false);
            elseif where == "Maze/GrinDemon" then
                local Maze = W.Section1.Maze;
                local GrinDemon = if self.GameMode == "Normal" then Maze.GrinDemon else Maze.GrinDemonNM;
                if not GrinDemon then return; end;
                ESPF.ESP(where, GrinDemon, {
                    Color = RED;
                    Size = VEC10;
                    Text = "Grin Demon";
                });
            elseif where == "Larves/Larves" then
                local CHs = GetChildren(W.Section4.HotPotato.Givers); for i=1, #CHs do
                    local v=CHs[i]; if v.Parent then
                        local Root = FindFirstChild(v, "RootPart");
                        local Prox = Root and FindFirstChild(Root, "ProximityPrompt");
                        if not Prox then continue; end;
                        local ESPObject = ESPF.ESP(where, Root, {
                            Color = if Prox.Enabled then YELLOW else GREEN;
                            Size = VEC2;
                            Text = "Larves";
                        }); if not ESPObject.ChangeSignal then
                            ESPObject.ChangeSignal = PropChangeSignal(Prox, "Enabled"):Connect(function()
                                ESPObject.UpdateColor(if Prox.Enabled then YELLOW else GREEN);
                            end);
                        end;
                    end;
                end;
            elseif where == "Larves/Soldier" then
                local CMs = {
                    W.Section4.StatueMonsters.Left,
                    W.Section4.StatueMonsters.Right,
                }; for i=1, #CMs do
                    local CHs = GetChildren(CMs[i]); for ri=1, #CHs do
                        local v=CHs[ri]; if v.Parent then
                            ESPF.ESP(where, v, {
                                Color = RED;
                                Size = VEC10;
                                Text = "Soldier";
                            });
                        end;
                    end;
                end;
            elseif where == "Larves/Boogey" then
                local BoogeymanAI = FindFirstChild(W.Section4.Monster, "BoogeymanAI");
                if not BoogeymanAI then return; end;
                ESPF.ESP(where, BoogeymanAI, {
                    Color = RED;
                    Size = VEC10;
                    Text = "Boogeyman";
                });
            end; ESPF.Visible(where, true, true);
        end;
        Functions.B3C1Func = function(self, where)
            if where == "City/Kill" then
                local CHs=GetChildren(W.Section1.Grunts); for i=1, #CHs do
                    local v=CHs[i]; if v.Parent and v.ClassName == "Model" then
                        local sRE = FindFirstChild(v, "RemoteEvent");
                        if not sRE then continue; end;
                        while v.Parent and sRE.Parent do
                            if self:ToolNow("Gun") then
                                local Pivot = GetPivot(v);
                                Tp(HumRSelf, Pivot*CFr(0, 40, 0), 0.1);
                                CAMERAREPLICA = Pivot;
                                R.GunAction:FireServer("fire");
                                sRE:FireServer();
                            end; twait(0.1);
                        end; CAMERAREPLICA = nil;
                    end;
                end;
            elseif where == "City/Body" then
                local Bodies = GetChildren(W.Section1.DeadCivilians); for i=1, #Bodies do
                    local v = Bodies[i]; if v.Parent then
                        local Prox = FindFirstChild(v, "HumanoidRootPart");
                        Prox = Prox and FindFirstChild(Prox, "ProximityPrompt");
                        if Prox then
                            Tp(HumRSelf, Prox.Parent.CFrame, 0.3);
                            fireproximityprompt(Prox);
                        end;
                    end;
                end; return Tp(HumRSelf, CFr(81, 9.3, 224));
            elseif where == "City/Mika" then
                Tp(HumRSelf, W.Section1.Monster.Trigger.CFrame);
            elseif where == "City/Hideo" then
                Tp(HumRSelf, GetPivot(W.Section1.HideoScene.Hideo2));
            elseif where == "School/Med" then
                local Prompt = W.Section2.Items.Bandage.Handle.ProximityPrompt;
                Tp(HumRSelf, Prompt.Parent.CFrame, 0.3);
                return fireproximityprompt(Prompt);
            elseif where == "School/Med" then
                local Prompt = W.Section2.Items.Bandage.Handle.ProximityPrompt;
                Tp(HumRSelf, Prompt.Parent.CFrame, 0.3);
                return fireproximityprompt(Prompt);
            elseif where == "School/Hideo" then
                local sRE = R.modules.Packet.Reliable;
                sRE:FireServer("Section2/HideoMinigameStarted");
                sRE:FireServer("Section2/HideoHealed");
                return sRE:FireServer("Section2/HideoMinigameEnded");
            elseif where == "School/Locker" then
                Tp(HumRSelf, CFr(143, 20, 504));
            elseif where == "School/Spider" then
                local CHs = GetChildren(W.Section2.MAINOBJECTIVE2.Spiders); for i=1, #CHs do
                    local v=CHs[i]; if v.Name ~= "AkariSpider" then continue; end;
                    local Hitbox = FindFirstChild(v, "Hitbox");
                    if not Hitbox then continue; end;
                    local sRE = FindFirstChild(Hitbox, "RemoteEvent");
                    if not sRE then continue; end;
                    Tp(HumRSelf, Hitbox.CFrame, 0.3);

                    for ri=1, 20 do
                        if not Hitbox.Parent or not sRE.Parent then
                            break;
                        end;

                        if self:ToolNow("Gun") then
                            CAMERAREPLICA = Hitbox.CFrame;
                            R.GunAction:FireServer("fire");
                            sRE:FireServer(); twait(0.1);
                        end;
                    end;
                end; CAMERAREPLICA = nil;
            elseif where == "School/Exit" then
                Tp(HumRSelf, CFr(175, 8, 508));
            elseif where == "Forest/Cave" then
                Tp(HumRSelf, W.Section3.Trigger.CFrame, 1);
                Tp(HumRSelf, W.Section3.OBJECTIVE.Trigger2.CFrame);
            elseif where == "Forest/Generator" then
                local CHs = GetChildren(W.Section3.OBJECTIVE.Circuits); for i=1, #CHs do
                    local v=CHs[i]; if v.Parent and v.Name == "CircuitPillar" then
                        v.CollisionPart.CanCollide = false;
                        Tp(HumRSelf, v.CollisionPart.CFrame, 0.3);
                        fireproximityprompt(v.PromptPart.ProximityPrompt);
                        twait(1); for i=1, 3 do
                            R.modules.Packet.Reliable:FireServer(
                                "Section3/CircuitRoundComplete",
                                v
                            );
                        end;
                    end;
                end;
            elseif where == "IJO/Keycard" then
                local Prompt = W.Section4.Lab.Floor1.Entrance.IDCARD.ProximityPrompt;
                Tp(HumRSelf, Prompt.Parent.CFrame, 0.3); fireproximityprompt(Prompt);
            elseif where == "IJO/PASS" then
                local Director = FindFirstChild(W.Section4.Lab.Floor1.Objective.DirectorSpawn, "Director");
                if not Director then return WindUI:Notify({
                    Title = "<font color='rgb(255,0,0)'>ALERT</font>",
                    Content = "Turn on the computer first. Also wait for the dialogue.",
                    Icon = "circle-alert",
                    Duration = 5,
                }); end;
                local Card = FindFirstChild(Director, "IDCARD2");
                if Card then
                    Tp(HumRSelf, Card.CFrame, 0.3);
                    fireproximityprompt(Card.ProximityPrompt, 1);

                    local Prompt = W.Section4.Lab.LockedDoors.MetalDoor.IDSCAN.Prompt.ProximityPrompt;
                    Tp(HumRSelf, Prompt.Parent.CFrame, 0.3);
                    fireproximityprompt(Prompt, 1);
                end; local PASS = W.Section4.Lab.Floor1.Objective.StickyNote.PASSWORD.SurfaceGui.RandomNumber;
                Tp(HumRSelf, CFr(-3424, -300, 4315), 0.3);
                R.modules.Packet.Unreliable:FireServer(
                    "Section4/LaptopSubmit",
                    PASS.Text
                );
            elseif where == "IJO/C4" then
                local CHs=GetChildren(W.Section4.Lab.Floor1.Objective2.C4Explode); for i=1, #CHs do
                    local v=CHs[i]; if v.Parent and v.Name == "C4Bomb" then
                        local Prox = FindFirstChild(v, "ProximityPrompt");
                        if not Prox or not Prox.Enabled then continue; end;
                        Tp(HumRSelf, v.CFrame, 0.3);
                        fireproximityprompt(Prox, 1);
                    end;
                end;
            elseif where == "IJO/C4_2" then
                Tween({primary = HumRSelf; goal = { CFrame = CFr(-4147, 107, 2154) }, info=TweenInfo.new(3)});
                Tween({primary = HumRSelf; goal = { CFrame = CFr(-4143, 107, 2501) }, info=TweenInfo.new(3)});
                local CHs = GetChildren(W.Section4.Lab.Floor1.Objective3.C4Explode); for i=1, #CHs do
                    local v=CHs[i]; if v.Parent and v.Name == "C4Bomb" then
                        local Prox = FindFirstChild(v, "ProximityPrompt");
                        if not Prox or not Prox.Enabled then continue; end;
                        Tp(HumRSelf, v.CFrame, 0.3);
                        fireproximityprompt(Prox, 1);
                    end;
                end;
            elseif where == "IJO/Terminal" then
                local CHs=GetChildren(W.Section4.Lab.CleanseRoomObjective.ShapeTerminals); for i=1, #CHs do
                    local v=CHs[i]; if v.Parent and v.Name == "Terminal" then
                        local Prox = FindFirstChild(v, "PromptPart");
                        Prox = Prox and FindFirstChild(Prox, "ProximityPrompt");
                        if not Prox or not Prox.Enabled then continue; end;
                        Tp(HumRSelf, Prox.Parent.CFrame, 0.3);
                        fireproximityprompt(Prox); twait(0.3);
                        R.modules.Packet.Reliable:FireServer(
                            "ShapeTerminal/RoundComplete",
                            v
                        );
                        R.modules.Packet.Reliable:FireServer(
                            "ShapeTerminal/Release",
                            v
                        );
                    end;
                end;
            elseif where == "IJO/Valve" then
                local CHs=GetChildren(W.Section4.Lab.CleanseRoomObjective.Valves); for i=1, #CHs do
                    local v=CHs[i]; if v.Parent and v.ClassName == "Model" then
                        local Icon = v.Notification.Icon;
                        if not Icon.Enabled then continue; end;
                        local Chs = GetChildren(v);
                        while Icon.Enabled do
                            Tp(HumRSelf, Icon.Parent.CFrame, 0.3); for i=1, #Chs do
                                local v2 = Chs[i]; if v2 and v2.Name == "Turners" then
                                    local Prompt = FindFirstChild(v2, "Right");
                                    if Prompt then
                                        fireproximityprompt(Prompt);
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            elseif where == "IJO/Threat" then
                R.modules.Packet.Reliable:FireServer("Section4/LockdownSkillCheckHit");
            elseif where == "Water/Main" then
                local MainSwitch = W.Section5.MainObjective.PowerSwitch.RootPart.ProximityPrompt;
                Tp(HumRSelf, MainSwitch.Parent.CFrame, 0.3);
                fireproximityprompt(MainSwitch, 1);
            elseif where == "Water/Wire" then
                local sRE = R.modules.Packet.Reliable;
                local CHs = GetChildren(W.Section5.MainObjective.Boxes);

                for i=1, #CHs do
                    local box=CHs[i]; if box.Parent and box.Name == "WireBox" then
                        if box.PromptPart.ProximityPrompt.Enabled then
                            Tp(HumRSelf, box.PromptPart.CFrame, 0.3);
                            sRE:FireServer("Section5/WireBoxClaim", box);
                            sRE:FireServer("Section5/WireBoxClaim", box);

                            for _,v in pairs(GetChildren(box.Bolt)) do
                                if v.Name == "Screw" then
                                    sRE:FireServer("Section5/WireBoxScrewDone", v);
                                end;
                            end; for _,v in pairs(GetChildren(box.Cuttable)) do
                                if v.Name == "Cut" then
                                    sRE:FireServer("Section5/WireBoxCutDone", v);
                                end;
                            end;

                            sRE:FireServer("Section5/WireBoxComplete", box);
                            box.PromptPart.ProximityPrompt.Enabled = false;
                        end;
                    end;
                end;
            end;
        end;
        Functions.B3C1ESP = function(self, where, state)
            if not state then
                return ESPF.Visible(where, false);
            elseif where == "City/Gatas" then
                local CHs=GetChildren(W.Section1.Grunts); for i=1, #CHs do
                    local v=CHs[i]; if v.Parent and v.ClassName == "Model" then
                        ESPF.ESP(where, v, {
                            Color = RED;
                            Size = VEC10;
                            Text = v.Name;
                        });
                    end;
                end;
            elseif where == "City/Bodies" then
                local Bodies = GetChildren(W.Section1.DeadCivilians); for i=1, #Bodies do
                    local v = Bodies[i]; if v.Parent then
                        local Prox = FindFirstChild(v, "HumanoidRootPart");
                        Prox = Prox and FindFirstChild(Prox, "ProximityPrompt");
                        local ESPObject = ESPF.ESP(where, v, {
                            Color = if Prox then YELLOW else GREEN;
                            Size = VEC10;
                            Text = v.Name;
                        }); if Prox and not ESPObject.PropChange then
                            ESPObject.PropChange = Prox.Destroying:Once(function()
                                ESPObject.UpdateColor(GREEN);
                            end);
                        end;
                    end;
                end;
            elseif where == "Akari" then
                local Akari = FindFirstChild(W.Section2.Monster, "AkariNM") or FindFirstChild(W.Section2.Monster, "Akari");
                Akari = Akari or FindFirstChild(W.Section2.Rage, "AkariRageNM", true) or FindFirstChild(W.Section2.Rage, "AkariRage", true);
                if not Akari then return; end; ESPF.ESP(where, Akari, {
                    Color = RED;
                    Size = VEC10;
                    Text = Akari.Name;
                });
            elseif where == "Mizuno" then
                ESPF.ESP(where, W.Section3.Monster.Mizuno, {
                    Color = RED;
                    Size = VEC10;
                    Text = "Mizuno";
                });
            elseif where == "HogoGuntai" then
                ESPF.ESP(where, W.Section4.Monster.HogoGuntai, {
                    Color = RED;
                    Size = VEC10;
                    Text = "HogoGuntai";
                });
            elseif where == "Baigai" then
                ESPF.ESP(where, W.Section5.Monster.Baigai, {
                    Color = RED;
                    Size = VEC10;
                    Text = "Baigai";
                });
            end; ESPF.Visible(where, true, true);
        end;

        ScriptData.AutoData = {
            ClientTab = {
                {type="Group", dats={
                    {dat={
                        {type="Toggle", EN="No Render", EN2="Change camera subject & disable 3D rendering", TH1="ปิดการ Render", TH2="เปลี่ยนกล้องและปิดการ render 3D", Bindable="+", Path="Client/No Render", Callback=function(state)
                            ClientCon["No Render"] = state;
                            H:Set3dRenderingEnabled(not state);
                            Cam.CameraSubject = if state then VOIDPART else HumSelf;
                        end},
                        {type="Toggle", EN="Full Bright", EN2="Make the game brighter, easier to see or look around.", TH1="แมพสว่าง", TH2="มองเห็นง่ายขึ้น", Bindable="+", Path="Client/Full Bright"},
                        {type="Toggle", EN="Float", EN2="Make your character float in the air.", TH1="ลอย", TH2="ทำให้ตัวละครเดินบนอากาศได้", Bindable="+", Path="Client/Float"},
                        {type="Toggle", EN="Noclip", EN2="Allow you to walk through walls.", TH1="เดินทะลุกำแพง", TH2="ต้องอธิบายด้วยหรอ", Bindable="+", Path="Client/Noclip"},
                        {type="Slider", EN="Walk Speed", EN2="Change the speed of your walk.", TH1="ความเร็วในการเดิน", TH2="ปรับความเร็วการเดิน", Value={Min=1, Max=100}, Path="Client/WalkSpeed", Locked=Chapter=="B3C1", Callback=function(value)
                            ClientCon.WalkSpeed = value;
                            ClientPackage.SetWalkSpeed(value)
                        end},
                        {type="Toggle", EN="Enable Walk Speed", EN2="Enable walk speed modification.", TH1="เปิดใช้งานความเร็วในการเดิน", TH2="ปรับความเร็วในการเดิน", Bindable="+", Path="Client/Enable WalkSpeed", Locked=Chapter=="B3C1", Callback=function(state)
                            ClientCon["Enable WalkSpeed"] = state;
                            ClientPackage.RunWalkSpeed(state);
                        end},
                        {type="Slider", EN="Teleport Walk Speed", EN2="Change the speed of teleport walk.", TH1="ความเร็วในการเดินแบบวาร์ป", TH2="ปรับความเร็วในการเดินแบบวาร์ป", Value={Min=1, Max=10}, Path="Client/TeleportWalk Speed"},
                        {type="Toggle", EN="Enable Teleport Walk", EN2="Enable teleport walk.", TH1="เปิดใช้งานเดินแบบวาร์ป", TH2="เปิดใช้งานเดินโดยการวาร์ปไปเรื่อยๆ", Bindable="+", Path="Client/Enable TeleportWalk"},
                        {type="Slider", EN="Jump Power", EN2="Change the power of your jump.", TH1="ความแรงในการกระโดด", TH2="ปรับความแรงในการกระโดด", Value={Min=1, Max=300}, Path="Client/JumpPower"},
                        {type="Toggle", EN="Enable Jump Power", EN2="Enable jump power modification.", TH1="เปิดใช้งานความแรงในการกระโดด", TH2="ปรับความแรงในการกระโดด", Bindable="+", Path="Client/Enable JumpPower"},
                    }, Title="Client", Open=true};
                }};
            };
            PlaceholderTab = (Chapter == "Lobby" and {
                {type="Paragraph", Title="Information", Desc="The Mimic script is now Internal Base which make it smoother and safer to use. To unlock other tab like Control I or Rage I, you must join the main game first. There are a few settings in Core Settings that you can use for The Mimic."},
            });
            EgaoTab = (Chapter == "Lobby" and {
                
            });
            PackB1C1 = (Chapter == "B1C1" and {
                Tabs={
                    {Tab={at="B1C1", Title="Main", Icon="book-open", Path="B1C1"}, Data={
                        {type="Button", EN="Auto Complete Game", EN2="Teleport to the end of the game.", TH1="ออโต้จบเกม", TH2="วาปไปที่ด่านสุดท้ายของเกม", Callback=Functions.AutoCompleteBook1}; {type="Space"},
                        {type="Toggle", EN="ESP Items", EN2="Show item's box & name", Path="ESP/Items", TH1="ESP ไอเทม", TH2="มองเห็นไอเทม", Callback=Functions.ESPItemsBook1};
                        {type="Toggle", EN="ESP Monsters", EN2="Show monster's hitbox & name", Path="ESP/Monsters", TH1="ESP ผี", TH2="มองเห็นผี", Callback=Functions.ESPMonsterBook1};
                    }}; {Tab={at="B1C1Sec", Title="Sections", Icon="map-pinned"}, Data={}};
                };
            });
            PackB1C2 = (Chapter == "B1C2" and {
                Tabs={
                    {Tab={at="B1C2", Title="Main", Icon="book-open", Path="B1C2"}, Data={
                        {type="Button", EN="Auto Complete Game", EN2="Teleport to the end of the game.", TH1="ออโต้จบเกม", TH2="วาปไปที่ด่านสุดท้ายของเกม", Callback=Functions.AutoCompleteBook1}; {type="Space"},
                        {type="Toggle", EN="ESP Items", EN2="Show item's box & name", Path="ESP/Items", TH1="ESP ไอเทม", TH2="มองเห็นไอเทม", Callback=Functions.ESPItemsBook1};
                        {type="Toggle", EN="ESP Monsters", EN2="Show monster's hitbox & name", Path="ESP/Monsters", TH1="ESP ผี", TH2="มองเห็นผี", Callback=Functions.ESPMonsterBook1};
                    }}; {Tab={at="B1C2Sec", Title="Sections", Icon="map-pinned"}, Data={}};
                };
            });
            PackB1C3 = (Chapter == "B1C3" and {
                Tabs={
                    {Tab={at="B1C3", Title="Main", Icon="book-open", Path="B1C3"}, Data={
                        {type="Button", EN="Auto Complete Game", EN2="Teleport to the end of the game.", TH1="ออโต้จบเกม", TH2="วาปไปที่ด่านสุดท้ายของเกม", Callback=Functions.AutoCompleteBook1}; {type="Space"},
                        {type="Toggle", EN="ESP Items", EN2="Show item's box & name", Path="ESP/Items", TH1="ESP ไอเทม", TH2="มองเห็นไอเทม", Callback=Functions.ESPItemsBook1};
                        {type="Toggle", EN="ESP Monsters", EN2="Show monster's hitbox & name", Path="ESP/Monsters", TH1="ESP ผี", TH2="มองเห็นผี", Callback=Functions.ESPMonsterBook1};
                    }}; {Tab={at="B1C3Sec", Title="Sections", Icon="map-pinned"}, Data={}};
                };
            });
            PackB1C4 = (Chapter == "B1C4" and {
                Tabs= ((PlaceId == 7251865082 or PlaceId == 7265396387) and {
                    {Tab={at="B1C4", Title="Map 1", Icon="book-open", Path="B1C4"}, Data={
                        {type="Button", EN="Auto Complete Game", EN2="Teleport to the end of the game.", TH1="ออโต้จบเกม", TH2="วาปไปที่ด่านสุดท้ายของเกม", Callback=Functions.AutoCompleteBook1};
                        {type="Toggle", EN="ESP Monsters", EN2="Show monster's hitbox & name", Path="Map1/ESP/Monsters", TH1="ESP ผี", TH2="มองเห็นผี", Callback=Functions.ESPMonsterBook1};
                        {type="Toggle", EN="ESP Items", EN2="Show item's box & name", Path="Map1/ESP/Items", TH1="ESP ไอเทม", TH2="มองเห็นไอเทม", Callback=Functions.ESPItemsBook1};
                    }};
                }) or ((PlaceId == 7251866503 or PlaceId == 7265396805) and {
                    {Tab={at="B1C4", Title="Map 2", Icon="book-open", Path="B1C4"}, Data={
                        {type="Button", EN="Auto Complete Game", EN2="Teleport to the end of the game.", TH1="ออโต้จบเกม", TH2="วาปไปที่ด่านสุดท้ายของเกม", Callback=Functions.AutoCompleteBook1};
                        {type="Toggle", EN="ESP Monsters", EN2="Show monster's hitbox & name", Path="Map2/ESP/Monsters", TH1="ESP ผี", TH2="มองเห็นผี", Callback=Functions.ESPMonsterBook1};
                        {type="Toggle", EN="ESP Butterflies", EN2="Show item's box & name", Path="Map2/ESP/Items", TH1="ESP ไอเทม", TH2="มองเห็นไอเทม", Callback=Functions.ESPItemsBook1};
                    }};
                }) or ((PlaceId == 7251867155 or PlaceId == 7265397072) and {
                    {Tab={at="B1C4", Title="Map 3", Icon="book-open", Path="B1C4"}, Data={
                        {type="Button", EN="Auto Complete Game", EN2="Teleport to the end of the game.", TH1="ออโต้จบเกม", TH2="วาปไปที่ด่านสุดท้ายของเกม", Callback=Functions.AutoCompleteBook1};
                        {type="Toggle", EN="ESP Monsters", EN2="Show monster's hitbox & name", Path="Map3/ESP/Monsters", TH1="ESP ผี", TH2="มองเห็นผี", Callback=Functions.ESPMonsterBook1};
                        {type="Toggle", EN="ESP Items", EN2="Show item's box & name", Path="Map3/ESP/Items", TH1="ESP ไอเทม", TH2="มองเห็นไอเทม", Callback=Functions.ESPItemsBook1};
                    }};
                }) or ((PlaceId == 7251867574 or PlaceId == 7265397848) and {
                    {Tab={at="B1C4", Title="Map 4", Icon="book-open", Path="B1C4"}, Data={
                        {type="Toggle", EN="Auto Kill Sama", EN2="Automatically destroy hearts.", TH1="ออโต้ทำลายหัวใจ", TH2="ทำลายหัวใจผี", Path="Map4/AutoKillSama"};
                        {type="Toggle", EN="Auto Kill Saigomo", EN2="Automatically kill saigomo.", TH1="ออโต้ฆ่า Saigomo", TH2="ออโต้ฆ่าผี", Path="Map4/AutoKillSaigomo"};
                        {type="Toggle", EN="ESP Monsters", EN2="Show monster's hitbox & name", Path="Map4/ESP/Monsters", TH1="ESP ผี", TH2="มองเห็นผี", Callback=Functions.ESPMonsterBook1};
                        {type="Toggle", EN="ESP Hearts", EN2="Show item's box & name", Path="Map4/ESP/Items", TH1="ESP ไอเทม", TH2="มองเห็นไอเทม", Callback=Functions.ESPItemsBook1}; {type="Space"};
                    }};
                });
            });
            PackB2C1 = (Chapter == "B2C1" and {
                Tabs={
                    {Tab={at="B2C1", Title="City", Icon="book-open", Path="B2C1"}, Data={
                        {type="Button", EN="Auto Complete", EN2="Teleport to Senzai.", TH1="ออโต้ผ่านด่าน", TH2="วาปไปหา Senzai", Callback=function()
                            Functions:B2C1Func("City/Complete");
                        end}; {type="Space"},
                        {type="Toggle", EN="ESP Key", EN2="Show key's box & name", TH1="ESP กุญแจ", TH2="มองเห็นกุญแจ", Path="City/ESP/Key", Callback=function(state)
                            B2C1Con.City.ESP.Key = state;
                            Functions:B2C1ESP("City/Key", state);
                        end},
                    }};
                    {Tab={at="B2C1", Title="Rat", Icon="book-open", Path="B2C1"}, Data={
                        {type="Button", EN="Read Book", EN2="Teleport & read the book.", TH1="อ่านหนังสือ", TH2="วาปไปอ่านหนังสือ", Callback=function()
                            Functions:B2C1Func("Rat/Book");
                        end};
                        {type="Button", EN="Auto Rat", EN2="Teleport to collect rats & ring the bell.", TH1="ออโต้หนู", TH2="วาปไปเก็บหนูแล้วสั่นระฆัง", Callback=function()
                            Functions:B2C1Func("Rat/Rat");
                        end};
                        {type="Button", EN="Exit", EN2="Teleport & exit.", TH1="ออก", TH2="วาปไปกดออก", Callback=function()
                            Functions:B2C1Func("Rat/Exit");
                        end};
                        {type="Button", EN="Run", EN2="Tween to the exit in chase sequence.", TH1="วิ่ง", TH2="ค่อยๆบินไปที่ทางออกในด่านวิ่งหนู", Callback=function()
                            Functions:B2C1Func("Rat/Run");
                        end}; {type="Space"},
                        {type="Toggle", EN="ESP Book", EN2="Show book's box & name", TH1="ESP หนังสือ", TH2="มองเห็นหนังสือ", Path="Rat/ESP/Book", Callback=function(state)
                            B2C1Con.Rat.ESP.Book = state;
                            Functions:B2C1ESP("Rat/Book", state);
                        end};
                        {type="Toggle", EN="ESP Futakuchi", EN2="Show Futakuchi's box & name", TH1="ESP Futakuchi", TH2="มองเห็น Futakuchi", Path="Rat/ESP/Futakuchi", Callback=function(state)
                            B2C1Con.Rat.ESP.Futakuchi = state;
                            Functions:B2C1ESP("Rat/Futakuchi", state);
                        end};
                        {type="Toggle", EN="ESP Rat", EN2="Show rats' box & name", TH1="ESP หนู", TH2="มองเห็นหนู", Path="Rat/ESP/Rat", Callback=function(state)
                            B2C1Con.Rat.ESP.Rat = state;
                            Functions:B2C1ESP("Rat/Rat", state);
                        end};
                    }};
                    {Tab={at="B2C1", Title="Nagisa", Icon="book-open", Path="B2C1"}, Data={
                        {type="Button", EN="Auto Complete", EN2="Teleport to the cave entrance.", TH1="ออโต้ผ่านด่าน", TH2="วาปไปทางเข้าถ้ำ", Callback=function()
                            Functions:B2C1Func("Nagisa/Auto");
                        end};
                        {type="Button", EN="Auto Run", EN2="Tween to the cave exit in the chase sequence.", TH1="ออโต้วิ่ง", TH2="ค่อยๆบินไปที่ทางออกในด่านวิ่ง", Callback=function()
                            Functions:B2C1Func("Nagisa/Run");
                        end},
                    }};
                    {Tab={at="B2C1", Title="Village", Icon="book-open", Path="B2C1"}, Data={
                        {type="Button", EN="Teleport To Main Village", EN2="Tween to the main village. <font color='rgb(255,0,0)'>[1]</font>", TH1="วาปเข้าหมู่บ้าน", TH2="ค่อยๆบินไปที่หมู่บ้านหลัก <font color='rgb(255,0,0)'>[1]</font>", Callback=function()
                            Functions:B2C1Func("Vil/Zone");
                        end};
                        {type="Button", EN="Talk", EN2="Talk to the npc. <font color='rgb(255,0,0)'>[2]</font>", TH1="คุย", TH2="วาปไปหา NPC <font color='rgb(255,0,0)'>[2]</font>", Callback=function()
                            Functions:B2C1Func("Vil/Talk");
                        end};
                        {type="Button", EN="Get Key", EN2="Teleport & grab the key. <font color='rgb(255,0,0)'>[3]</font>", TH1="เก็บกุญแจ", TH2="วาปไปเก็บกุญแจ <font color='rgb(255,0,0)'>[3]</font>", Callback=function()
                            Functions:B2C1Func("Vil/Key");
                        end}; {type="Space"},

                        {type="Button", EN="Paint", EN2="Teleport to the house. <font color='rgb(255,0,0)'>[4]</font>", TH1="วาด", TH2="วาปไปที่จุดวาด <font color='rgb(255,0,0)'>[3]</font>", Callback=function()
                            Functions:B2C1Func("Vil/PaintTp");
                        end};
                        {type="Button", EN="Auto Paint", EN2="Paint for you. <font color='rgb(255,0,0)'>[5]</font>", TH1="ออโต้วาด", TH2="วาดให้ <font color='rgb(255,0,0)'>[3]</font>", Locked=true, Callback=function()
                            Functions:B2C1Func("Vil/Paint");
                        end}; {type="Space"},
                        
                        {type="Button", EN="Get Pictures", EN2="Intilize model <font color='rgb(255,0,0)'>[6]</font>", TH1="เก็บข้อมูลรูปภาพ", TH2="ตั้งค่าโมเดลเกม <font color='rgb(255,0,0)'>[6]</font>", Callback=function()
                            Functions:B2C1Func("Vil/Pics");
                        end};
                        {type="Button", EN="Enter House", EN2="Teleport to the main house. <font color='rgb(255,0,0)'>[7]</font>", TH1="เข้าบ้าน", TH2="วาปไปบ้านหลัก <font color='rgb(255,0,0)'>[7]</font>", Callback=function()
                            Functions:B2C1Func("Vil/House");
                        end};
                        {type="Button", EN="Auto Candles", EN2="Teleport & light the candle for you. <font color='rgb(255,0,0)'>[8]</font>", TH1="เทียน", TH2="วาปไปจุดเทียน <font color='rgb(255,0,0)'>[8]</font>", Callback=function()
                            Functions:B2C1Func("Vil/Candle");
                        end}; {type="Space"},

                        {type="Toggle", EN="ESP Kurobozu", EN2="Show box & name", TH1="ESP Kurobozu", TH2="มองเห็น Kurobozu", Path="Vil/ESP/Kurobozu", Callback=function(state)
                            B2C1Con.Village.ESP.Kurobozu = state;
                            Functions:B2C1ESP("Vil/Kurobozu", state);
                        end};
                        {type="Toggle", EN="ESP Ohaguro", EN2="Show box & name", TH1="ESP Ohaguro", TH2="มองเห็น Ohaguro", Path="Vil/ESP/Ohaguro", Callback=function(state)
                            B2C1Con.Village.ESP.Ohaguro = state;
                            Functions:B2C1ESP("Vil/Ohaguro", state);
                        end};
                    }};
                    {Tab={at="B2C1", Title="Ship", Icon="book-open", Path="B2C1"}, Data={
                        {type="Button", EN="Enter Ship", EN2="Teleport to the trigger.", TH1="เข้าเรือ", TH2="วาปไปที่ทางเข้าเรือ", Callback=function()
                            Functions:B2C1Func("Ship/Enter");
                        end};
                        {type="Button", EN="Auto Candle", EN2="Teleport & light the candle.", TH1="ออโต้เทียน", TH2="วาปและจุดเทียน", Callback=function()
                            Functions:B2C1Func("Ship/Candle");
                        end};
                        {type="Button", EN="Auto Run", EN2="Tween to the exit in the chase sequence.", TH1="ออโต้วิ่ง", TH2="ค่อยๆบินไปที่ทางออกในด่านวิ่ง", Callback=function()
                            Functions:B2C1Func("Ship/Run");
                        end}; {type="Space"};
                        {type="Toggle", EN="ESP Monsters", EN2="Show box & name", TH1="ESP ผี", TH2="มองเห็นผี", Path="Ship/ESP/Monsters", Callback=function(state)
                            B2C1Con.Ship.ESP.Monsters = state;
                            Functions:B2C1ESP("Ship/Monsters", state);
                        end};
                    }};
                };
            });
            PackB2C2 = (Chapter == "B2C2" and {
                Tabs={
                    {Tab={at="B2C2", Title="Statue", Icon="book-open", Path="B2C2"}, Data={
                        {type="Button", EN="Auto Complete", EN2="Tween to the gate and wait 30 seconds.", TH1="ออโต้ผ่านด่าน", TH2="บินไปที่ประตูแล้วรอประมาณ 30 วินาที", Callback=function()
                            Functions:B2C2Func("Statue");
                        end};
                    }};
                    {Tab={at="B2C2", Title="Crounch", Icon="book-open", Path="B2C2"}, Data={
                        {type="Button", EN="Auto Complete", EN2="Tween to the door and wait around 70 seconds.", TH1="ออโต้ผ่านด่าน", TH2="บินไปที่ประตูแล้วรอประมาณ 70 วินาที", Callback=function()
                            Functions:B2C2Func("Crounch");
                        end};
                    }};
                    {Tab={at="B2C2", Title="Meat", Icon="book-open", Path="B2C2"}, Data={
                        {type="Button", EN="Talk", EN2="Teleport to the NPC but does not talk for you due to anti cheat.", TH1="คุย", TH2="วาปไปหา NPC แต่จะไม่คุยให้เรื่องจากกันโปร", Callback=function()
                            Functions:B2C2Func("Meat/Talk");
                        end};
                        {type="Button", EN="Teleport To Meat", EN2="Teleport the meat but does not collect for you.", TH1="วาปไปหาเนื้อ", TH2="วาปไปหาเนื้อ แต่จะไม่เก็บให้", Callback=function()
                            Functions:B2C2Func("Meat/TpMeat");
                        end};
                        {type="Button", EN="Exit", EN2="Teleport to the exit door &  interact for you.", TH1="ออก", TH2="วาปไปที่ประตูทางออกแล้วกดออกให้", Callback=function()
                            Functions:B2C2Func("Meat/Exit");
                        end};
                        {type="Button", EN="Auto Run", EN2="Tween to the exit door.", TH1="ออโต้วิ่ง", TH2="ค่อยๆบินไปที่ประตูทางออก", Callback=function()
                            Functions:B2C2Func("Meat/Run");
                        end}; {type="Space"}, {type="Space"},
                        {type="Toggle", EN="ESP Ashina", EN2="Show Ashina's hitbox", TH1="ESP Ashina", TH2="มองเห็น Ashina", Path="Meat/ESP/Ashina", Callback=function(state)
                            B2C2Con.Meat.ESP.Ashina = state;
                            Functions:B2C2ESP("Meat/Ashina", state);
                        end};
                        {type="Toggle", EN="ESP Meats", EN2="Show meat's box", TH1="ESP เนื้อ", TH2="มองเห็นเนื้อ", Path="Meat/ESP/Meats", Callback=function(state)
                            B2C2Con.Meat.ESP.Meats = state;
                            Functions:B2C2ESP("Meat/Meats", state);
                        end};
                    }};
                    {Tab={at="B2C2", Title="Lever", Icon="book-open", Path="B2C2"}, Data={
                        {type="Button", EN="Enter Zone", EN2="Teleport & Interact with white door.", TH1="วาปเข้าด่าน", TH2="วาปไปที่ประตูสีขาวแล้วกดออกให้", Callback=function()
                            return Functions:B2C2Func("Lever/Enter");
                        end};
                        {type="Button", EN="Auto Levers", EN2="Teleport & Interact with levers.", TH1="ออโต้สับคันโยก", TH2="ออโต้สับคันโยกด้วยการวาป", Callback=function()
                            return Functions:B2C2Func("Lever/Auto");
                        end}; {type="Space"};
                        {type="Toggle", EN="ESP Levers", EN2="Show lever's box & name", TH1="ESP คันโยก", TH2="มองเห็นคันโยก", Path="Lever/ESP/Levers", Callback=function(state)
                            B2C2Con.Lever.ESP.Levers = state;
                            Functions:B2C2ESP("Lever/Levers", state);
                        end};
                    }};
                    {Tab={at="B2C2", Title="Math", Icon="book-open", Path="B2C2"}, Data={
                        {type="Button", EN="Auto Complete", EN2="Teleport you to the cooking area ( Skip current section ).", TH1="ออโต้ผ่านด่าน", TH2="วาปไปที่ด่านถัดไป ( ข้ามด่านปัจจุบัน )", Callback=function()
                            return Functions:B2C2Func("Math");
                        end};
                        {type="Button", EN="Reveal Number", EN2="Create the correct symbol at the exit door.", TH1="แสดงตัวเลขที่ถูกต้อง", TH2="สร้างสัญลักษ์ที่ถูกต้องที่ประตูทางออก. ", Callback=function()
                            return Functions:B2C2ESP("Math", true);
                        end};
                    }};
                    {Tab={at="B2C2", Title="Gordon Ramsey", Icon="book-open", Path="B2C2"}, Data={
                        {type="Toggle", EN="Auto Complete", EN2="Cooking food for you. This isn't instant toggle so if you want to turn it off; You have to wait. ( Singleplayer )", TH1="ออโต้ผ่านด่าน", TH2="ทำอาหารให้แต่ใช้ได้แค่เวลาเล่นคนเดียว เวลากดปิดจะไม่ปิดทันที", Path="Cook/AutoCook"};
                        {type="Button", EN="Auto Run", EN2="Tween to the exit of this cave.", TH1="ออโต้วิ่ง", TH2="ค่อยๆบินไปที่ทางออกถ้ำ", Callback=function()
                            return Functions:B2C2Func("Cook/Run");
                        end};
                    }};
                    {Tab={at="B2C2", Title="Cursed", Icon="book-open", Path="B2C2"}, Data={
                        {type="Button", EN="Auto Complete", EN2="Tween you to the entrance of Cursed Zone 2.", TH1="ออโต้ผ่านด่าน", TH2="วาปไปที่ประตูทางเข้าด่าน 2", Callback=function()
                            return Functions:B2C2Func("Cursed/1");
                        end}; {type="Space"};
                        {type="Button", EN="Enter Zone", EN2="Tween you to Cursed Zone 2.", TH1="เข้าด่าน2", TH2="บินไปที่ด่าน 2", Callback=function()
                            return Functions:B2C2Func("Cursed/2");
                        end};
                        {type="Button", EN="Remove Monster", EN2="This is client side so if you are with your friend, tell them not to go to 2nd floor. You must click this before enter 2nd floor to make it work.", TH1="ลบผีทิ้ง", TH2="ต้องกดก่อนเดินขึ้นไปข้างบน และถ้ามากับเพื่อนบอกให้เพื่อนอยู่แต่ด้านล่าง", Callback=function()
                            return Functions:B2C2Func("Cursed/Remove");
                        end};
                    }};
                    {Tab={at="B2C2", Title="Kid", Icon="book-open", Path="B2C2"}, Data={
                        {type="Button", EN="Find Kid", EN2="Teleport to the kid.", TH1="หาเด็ก", TH2="วาปไปหาเด็ก", Callback=function()
                            return Functions:B2C2Func("Kid/Find");
                        end};
                        {type="Button", EN="Teleport To Gate", EN2="Teleport & Interact with white door.", TH1="วาปเข้าประตู", TH2="วาปเข้าประตูสีขาว", Callback=function()
                            return Functions:B2C2Func("Kid/Gate");
                        end};
                        {type="Toggle", EN="Anti Mother", EN2="Teleport to safe spot when mother is near.", TH1="หลบแม่", TH2="วาปกลับจุดเกิดเวลาเจอแม่", Path="Kid/Anti Mother"};
                        {type="Toggle", EN="ESP Mother", EN2="Show mother's hitbox.", TH1="ESP แม่", TH2="มองเห็นแม่", Path="Kid/ESP/Mother", Callback=function(state)
                            B2C2Con.Kid.ESP.Mother = state;
                            return Functions:B2C2ESP("Kid/Mother", state);
                        end}; {type="Space"}; {type="Space"};
                        {type="Button", EN="Auto Collect Notes", EN2="Teleport & Collect notes.", TH1="ออโต้เก็บโน๊ต", TH2="วาปและเก็บโน๊ต", Callback=function()
                            return Functions:B2C2Func("Kid/Notes");
                        end};
                    }};
                    {Tab={at="B2C2", Title="Nagisa", Icon="book-open", Path="B2C2"}, Data={
                        {type="Toggle", EN="Auto Get Cannon Balls", EN2="Teleport & Grab cannon balls when out of it.", TH1="ออโต้หยิบลูกปืนใหญ่", TH2="วาปและหยิบลูกปืนใหญ่เมื่อเหลือ 0", Path="Nagisa/Auto Get Cannon Balls"};
                        {type="Toggle", EN="Anti Nagisa Beam", EN2="Teleport to safe spot when nagisa uses her beam.", TH1="ออโต้หลบกลิ่นปาก", TH2="วาปไปที่ปลอดภัยเวลามันพ่นกลิ่นปาก", Path="Nagisa/Anti Nagisa Beam"}; {type="Space"};
                        {type="Toggle", EN="Auto Kill Nagisa Serpent", EN2="Teleport & Spam katana", TH1="ออโต้ฆ่า Nagisa Serpent", TH2="วาปและสแปมดาบ", Path="Nagisa/Auto Kill Nagisa Serpent"}; {type="Space"};
                    }};
                };
            });
            PackB2C3 = (Chapter == "B2C3" and {
                Tabs={
                    {Tab={at="B2C3", Title="Gozu & Mezu", Icon="book-open", Path="B2C3"}, Data={
                        {type="Button", EN="Auto Complete", EN2="Teleport the the entrance", TH1="ออโต้ผ่านด่าน", TH2="วาปไปที่ทางเข้า", Callback=function()
                            return Functions:B2C3Func("Gozu");
                        end};
                    }};
                    {Tab={at="B2C3", Title="Heart", Icon="book-open", Path="B2C3"}, Data={
                        {type="Button", EN="Talk", EN2="Teleport to the NPC.", TH1="คุย", TH2="วาปไปหา NPC", Callback=function()
                            return Functions:B2C3Func("Heart/Talk");
                        end};
                        {type="Button", EN="Auto Hearts", EN2="Teleport & Collect hearts.", TH1="ออโต้เก็บหัวใจ", TH2="วาปเก็บหัวใจ", Callback=function()
                            return Functions:B2C3Func("Heart/Auto");
                        end}; {type="Space"};
                        {type="Button", EN="Auto Run", EN2="Teleport to the exit in the chase sequence.", TH1="ออโต้วิ่ง", TH2="วาปไปที่ทางออกในด่านวิ่ง", Callback=function()
                            return Functions:B2C3Func("Heart/Run");
                        end};
                    }};
                    {Tab={at="B2C3", Title="Maze", Icon="book-open", Path="B2C3"}, Data={
                        {type="Button", EN="Auto Craft", EN2="Teleport, collect items and craft a torch for you.", TH1="ออโต้คราฟ", TH2="วาปเก็บไอเทมมาคราฟแท่งไฟ", Callback=function()
                            return Functions:B2C3Func("Maze/Craft");
                        end};
                        {type="Button", EN="Get Fire", EN2="Teleport & light up your torch. You must equip your torch to use this.", TH1="จุดไฟ", TH2="วาปไปจุดไฟแต่ต้องถือแท่งไฟก่อน", Callback=function()
                            return Functions:B2C3Func("Maze/Fire");
                        end};
                        {type="Button", EN="Escape", EN2="Teleport to the exit.", TH1="ออก", TH2="วาปไปที่ทางออก", Callback=function()
                            return Functions:B2C3Func("Maze/Escape");
                        end}; {type="Space"};
                        {type="Toggle", EN="ESP Monster", EN2="Show monster's hitbox.", TH1="ESP ผี", TH2="มองเห็นผี", Path="Maze/ESP/GrinDemon", Callback=function(state)
                            B2C3Con.Maze.ESP.GrinDemon = state;
                            return Functions:B2C3ESP("Maze/GrinDemon", state);
                        end};
                    }};
                    {Tab={at="B2C3", Title="Bell", Icon="book-open", Path="B2C3"}, Data={
                        {type="Button", EN="Enter Zone", EN2="Teleport to the cutscene.", TH1="วาปเข้าด่าน", TH2="วาปไปที่คัตซีน", Callback=function()
                            return Functions:B2C3Func("Bell/Zone");
                        end};
                        {type="Button", EN="Kill All Flys", EN2="Teleport & kill all flys.", TH1="ออโต้ฆ่าแมลง", TH2="วาปฆ่าแมลง", Callback=function()
                            return Functions:B2C3Func("Bell/Flys");
                        end};
                        {type="Button", EN="Auto Bell", EN2="Auto ring the bell and attack the monster.", TH1="ออโต้ระฆัง", TH2="ออโต้ตีระฆังและเดี่ยวกับผี", Callback=function()
                            return WindUI:Notify({
                                Title = "<font color='rgb(255,0,0)'>WARNING</font>",
                                Content = "Hold on, Script is Intilizing, Do not press again.",
                                Icon = "circle-alert",
                                Duration = 10,
                            }), tk.delay(15, function()
                                return WindUI:Notify({
                                    Title = "<font color='rgb(255,0,0)'>WARNING</font>",
                                    Content = "Trust the process lol, it seem like it's not working but it actually work.",
                                    Icon = "circle-alert",
                                    Duration = 10,
                                });
                            end), Functions:B2C3Func("Bell/Auto");
                        end}; {type="Space"};
                        {type="Button", EN="Teleport To Door", EN2="Teleport to the puzzle door but does not complete for you.", TH1="วาปไปที่ประตู", TH2="วาปไปที่ประตูเพื่อแก้ปริศนา", Callback=function()
                            return Functions:B2C3Func("Bell/TpDoor");
                        end};
                        {type="Button", EN="Auto Complete Puzzle", EN2="Auto complete the puzzle but you have to be near the door.", TH1="ออโต้แก้ปริศนา", TH2="ออโต้แก้ปริศนาแต่ต้องอยู่ใกล้ประตู", Callback=function()
                            return Functions:B2C3Func("Bell/Puzzle");
                        end};
                        {type="Button", EN="Auto Run", EN2="Teleport to the exit.", TH1="ออโต้วิ่ง", TH2="วาปไปที่ทางออก", Callback=function()
                            return Functions:B2C3Func("Bell/Run");
                        end};
                    }};
                    {Tab={at="B2C3", Title="Enzukai", Icon="book-open", Path="B2C3"}, Data={
                        {type="Button", EN="Enter Zone", EN2="Teleport to enzukai.", TH1="วาปเข้าด่าน", TH2="วาปไปที่ผี", Callback=function()
                            return Functions:B2C3Func("Enzukai/Enter");
                        end};
                        {type="Button", EN="Auto Complete", EN2="Auto interact with Enzukai.", TH1="ออโต้ผ่านด่าน", TH2="ออโต้คุยกับผีตอนอยู่บนแพ", Callback=function()
                            return Functions:B2C3Func("Enzukai/Auto");
                        end};
                    }};
                    {Tab={at="B2C3", Title="Father", Icon="book-open", Path="B2C3"}, Data={
                        {type="Button", EN="Disable Isamu", EN2="Ignore his action bro he's not gonna kill us.", TH1="เพิกเฉยต่อการโจมตีของ Isamu", TH2="สนใจทำไมก็แค่ผีตัวนึง", Callback=function()
                            return Functions:B2C3Func("Father/Isamu");
                        end};
                        {type="Button", EN="Teleport To Safe Spot", EN2="Your sanity will drain but last long enough to survive each night.", TH1="วาปไปจุดที่ปลอดภัย", TH2="ค่าสติจะลดไวขึ้นแต่ก็อยู่ได้นานพอสำหรับคืนถัดไป", Callback=function()
                            return Functions:B2C3Func("Father/Auto");
                        end};
                    }};
                    {Tab={at="B2C3", Title="Train", Icon="book-open", Path="B2C3"}, Data={
                        {type="Button", EN="Enter Zone", EN2="Teleport to the arrival area.", TH1="วาปเข้าด่าน", TH2="วาปไปที่รถไฟ", Callback=function()
                            return Functions:B2C3Func("Train");
                        end};
                    }};
                    {Tab={at="B2C3", Title="Larves", Icon="book-open", Path="B2C3"}, Data={
                        {type="Button", EN="Auto Complete", EN2="Teleport to the exit.", TH1="ออโต้ผ่านด่าน", TH2="วาปไปทางออก", Callback=function()
                            return Functions:B2C3Func("Larves");
                        end}; {type="Space"};
                        {type="Toggle", EN="ESP Larves", EN2="Show larve's hitbox.", TH1="ESP หนอน", TH2="มองเห็นหนอน", Path="Larves/ESP/Larves", Callback=function(state)
                            B2C3Con.Larves.ESP.Larves = state;
                            return Functions:B2C3ESP("Larves/Larves", state);
                        end};
                        {type="Toggle", EN="ESP Soldier", EN2="Show soldier's hitbox.", TH1="ESP ทหาร", TH2="มองเห็นทหาร", Path="Larves/ESP/Soldier", Callback=function(state)
                            B2C3Con.Larves.ESP.Soldier = state;
                            return Functions:B2C3ESP("Larves/Soldier", state);
                        end};
                        {type="Toggle", EN="ESP Boogey", EN2="Show Boogeyman's hitbox.", TH1="ESP บูกี้แมน", TH2="มองเห็นบูกี้แมน", Path="Larves/ESP/Boogey", Callback=function(state)
                            B2C3Con.Larves.ESP.Boogey = state;
                            return Functions:B2C3ESP("Larves/Boogey", state);
                        end};
                    }};
                    {Tab={at="B2C3", Title="Mud", Icon="book-open", Path="B2C3"}, Data={
                        {type="Button", EN="Auto Complete", EN2="Teleport to the exit.", TH1="ออโต้ผ่านด่าน", TH2="วาปไปทางออก", Callback=function()
                            return Functions:B2C3Func("Mud");
                        end};
                    }};
                    {Tab={at="B2C3", Title="Yurei", Icon="book-open", Path="B2C3"}, Data={
                        {type="Button", EN="Teleport To House", EN2="Teleport to the house; right at the interaction.", TH1="วาปเข้าบ้าน", TH2="วาปไปที่บ้าน จุดที่เอาไว้แก้ปริศนา", Callback=function()
                            return Functions:B2C3Func("Yurei/House");
                        end};
                        {type="Button", EN="Auto Click Items", EN2="Click all cursed items.", TH1="ออโต้กดไอเทม", TH2="ออโต้กดคลิกไอเทมที่ถูกต้อง", Callback=function()
                            return Functions:B2C3Func("Yurei/Click");
                        end};
                    }};
                    {Tab={at="B2C3", Title="Boss", Icon="book-open", Path="B2C3"}, Data={
                        {type="Toggle", EN="Auto Complete", EN2="Auto kill Yurei. Do not turn this on before the fight has started.", TH1="ออโต้ผ่านด่าน", TH2="ออโต้ฆ่าผี ห้ามเปิดก่อนที่สงครามจะเริ่ม", Path="Boss/AutoKillYurei"}; {type="Space"};
                        {type="Button", EN="Clear Map", EN2="Remove map's border.", TH1="เคลียพื้นที่", TH2="ลบกำแพงแมพออก", Callback=function()
                            return Functions:B2C3Func("Boss/Clear");
                        end};
                        {type="Button", EN="Teleport To Safe Spot", EN2="Teleport you outside the border.", TH1="วาปไปจุดที่ปลอดภัย", TH2="วาปออกไปนอกกำแพงแมพ", Callback=function()
                            return Functions:B2C3Func("Boss/TpSafe");
                        end};
                        {type="Button", EN="Get Katanas", EN2="Teleport & grab katanas", TH1="เก็บดาบ", TH2="วาปเก็บดาบ", Callback=function()
                            return Functions:B2C3Func("Boss/Katanas");
                        end};
                    }};
                    {Tab={at="B2C3", Title="Hell", Icon="book-open", Path="B2C3"}, Data={
                        {type="Button", EN="Auto Run", EN2="Teleport to the exit.", TH1="ออโต้ผ่านด่าน", TH2="วาปไปทางออก", Callback=function()
                            return Functions:B2C3Func("Hell/Run");
                        end};
                    }};
                };
            });
            PackB3C1 = (Chapter == "B3C1" and {
                Tabs={
                    {Tab={at="B3C1", Title="City", Icon="book-open", Path="B3C1"}, Data={
                        {type="Button", EN="Kill All Gatas", EN2="Teleport & fire a shot with client validation.", TH1="ยิง Gatas", TH2="วาปไปยิง Gatas พร้อมการยืนยันจาก Client", Callback=function()
                            return Functions:B3C1Func("City/Kill");
                        end};
                        {type="Button", EN="Interact All Dead Bodies", EN2="Teleport to dead bodies and interact.", TH1="รายงานศพ", TH2="วาปไปรายงานศพ", Callback=function()
                            return Functions:B3C1Func("City/Body");
                        end};
                        {type="Button", EN="Teleport To Mika", EN2="Watch she's gone.", TH1="วาปไปหา Mika", TH2="ไปดูฉากสิ้นหวัง", Callback=function()
                            return Functions:B3C1Func("City/Mika");
                        end};
                        {type="Button", EN="Teleport To Hideo/Door", EN2="Tell Hideo a sad story.", TH1="วาปไปหา Hideo", TH2="ไปเล่าเรื่องราวสิ้นหวัง", Callback=function()
                            return Functions:B3C1Func("City/Hideo");
                        end}; {type="Space"}; {type="Space"};
                        {type="Toggle", EN="ESP Gatas", EN2="Show Gatas' hitbox", TH1="ESP Gatas", TH2="มองเห็น Gatas", Path="City/ESP/Gatas", Callback=function(state)
                            B3C1Con.City.ESP.Gatas = state;
                            return Functions:B3C1ESP("City/Gatas", state);
                        end};
                        {type="Toggle", EN="ESP Dead Bodies", EN2="Show dead bodies", TH1="ESP ศพ", TH2="มองเห็นศพ", Path="City/ESP/Bodies", Callback=function(state)
                            B3C1Con.City.ESP.Bodies = state;
                            return Functions:B3C1ESP("City/Bodies", state);
                        end};
                    }};
                    {Tab={at="B3C1", Title="School", Icon="book-open", Path="B3C1"}, Data={
                        {type="Button", EN="Grab Medical Kit", EN2="Teleport to Medical Kit and grab it.", TH1="หยิบกล่องปฐมพยาบาล", TH2="วาปไปหยิบกล่องปฐมพยาบาล", Callback=function()
                            return Functions:B3C1Func("School/Med");
                        end};
                        {type="Button", EN="Teleport To Hideo", EN2="Teleport to Hideo.", TH1="วาปไปหา Hideo", TH2="วาปไปหา Hideo", Callback=function()
                            return Functions:B3C1Func("School/Hideo");
                        end};
                        {type="Button", EN="Heal Hideo", EN2="Teleport to him before use this.", TH1="รักษา Hideo", TH2="วาปก่อน แล้วค่อยกด ไม่งั้นใช้ไม่ได้หรือโดนแบน", Callback=function()
                            return Functions:B3C1Func("School/Heal");
                        end};
                        {type="Button", EN="Teleport To Locker", EN2="Teleport to locker.", TH1="วาปไปที่ล็อกเกอร์", TH2="วาปไปที่ล็อกเกอร์", Callback=function()
                            return Functions:B3C1Func("School/Locker");
                        end};
                        {type="Button", EN="Auto Kill Spiders", EN2="Teleport & shoot at the spiders.", TH1="ออโต้ฆ่าแมงมุม", TH2="วาปไปยิงแมงมุม", Callback=function()
                            return Functions:B3C1Func("School/Spider");
                        end};
                        {type="Button", EN="Exit", EN2="Teleport to exit door.", TH1="ออก", TH2="วาปไปที่ประตูทางออก", Callback=function()
                            return Functions:B3C1Func("School/Exit");
                        end}; {type="Space"}; {type="Space"};
                        {type="Toggle", EN="ESP Akari", EN2="Show Akari's hitbox.", TH1="ESP Akari", TH2="มองเห็น Akari", Path="School/ESP/Akari", Callback=function(state)
                            B3C1Con.School.ESP.Akari = state;
                            return Functions:B3C1ESP("Akari", state);
                        end};
                    }};
                    {Tab={at="B3C1", Title="Forest", Icon="book-open", Path="B3C1"}, Data={
                        {type="Button", EN="Teleport To IJO Entrance", EN2="Teleport to the cave entrance for cutscene.", TH1="วาปไปที่ทางเข้าถ้ำ", TH2="วาปไปที่ทางเข้าถ้ำเพื่อเริ่มฉากต่อสู้", Callback=function()
                            return Functions:B3C1Func("Forest/Cave");
                        end};
                        {type="Button", EN="Auto Fix Generators", EN2="Teleport & fix generators.", TH1="ซ่อม Generator", TH2="วาปไปซ่อม Generator", Callback=function()
                            return Functions:B3C1Func("Forest/Generator");
                        end}; {type="Space"}; {type="Space"};
                        {type="Toggle", EN="ESP Mizuno", EN2="Show Mizuno's hitbox.", TH1="ESP Mizuno", TH2="มองเห็น Mizuno", Locked=true, Path="Forest/ESP/Mizuno", Callback=function(state)
                            B3C1Con.Forest.ESP.Mizuno = state;
                            return Functions:B3C1ESP("Mizuno", state);
                        end};
                    }};
                    {Tab={at="B3C1", Title="IJO", Icon="book-open", Path="B3C1"}, Data={
                        {type="Button", EN="Grab Keycard", EN2="Teleport & collect keycard.", TH1="เก็บคีย์การ์ด", TH2="วาปไปเก็บคีย์การ์ด", Callback=function()
                            return Functions:B3C1Func("IJO/Keycard");
                        end};
                        {type="Button", EN="Enter Codes", EN2="Teleport & enter the code.", TH1="ใส่รหัส", TH2="วาปและใส่รหัส", Callback=function()
                            return Functions:B3C1Func("IJO/PASS");
                        end}; {type="Space"}; {type="Space"};
                        {type="Button", EN="Place C4 (1)", EN2="Teleport & place C4.", TH1="วางระเบิด C4", TH2="วาปไปวางระเบิด C4", Callback=function()
                            return Functions:B3C1Func("IJO/C4");
                        end};
                        {type="Button", EN="Place C4 (2)", EN2="Teleport & place C4 at Netamo.", TH1="วางระเบิด C4 ที่ผี", TH2="วาปไปวางระเบิด C4 ที่ผี", Callback=function()
                            return Functions:B3C1Func("IJO/C4_2");
                        end}; {type="Space"}; {type="Space"};
                        {type="Button", EN="Activate Terminals", EN2="Teleport & activate terminals.", TH1="เปิด terminals", TH2="วาปไปเปิด terminals", Callback=function()
                            return Functions:B3C1Func("IJO/Terminal");
                        end};
                        {type="Button", EN="Turn Valves", EN2="Teleport & turn valves.", TH1="เปิดวาล์ว", TH2="วาปไปเปิดวาล์ว", Callback=function()
                            return Functions:B3C1Func("IJO/Valve");
                        end};
                        {type="Button", EN="Hit Skill Check", EN2="Enter the 'Lock Threat' minigame by yourself. Only press this button by the amout of circles on screen.", TH1="กดสกิล", TH2="กดเพื่อเริ่มมินิเกม 'Lock Threat' ด้วยตัวเองแล้วค่อยกดออโต้ตามจำนวนวงกลมบนหน้าจอ", Callback=function()
                            return Functions:B3C1Func("IJO/Threat");
                        end}; {type="Space"}; {type="Space"};
                        {type="Toggle", EN="ESP HogoGuntai", EN2="Show HogoGuntai's hitbox.", TH1="ESP HogoGuntai", TH2="มองเห็น HogoGuntai", Path="IJO/ESP/HogoGuntai", Callback=function(state)
                            B3C1Con.IJO.ESP.HogoGuntai = state;
                            return Functions:B3C1ESP("HogoGuntai", state);
                        end};
                    }};
                    {Tab={at="B3C1", Title="Water", Icon="book-open", Path="B3C1"}, Data={
                        {type="Button", EN="Main Switch", EN2="Teleport & interact with the main switch.", TH1="เปิดสวิตช์หลัก", TH2="วาปไปเปิดสวิตช์หลัก", Callback=function()
                            return Functions:B3C1Func("Water/Main");
                        end};
                        {type="Button", EN="Auto Wire", EN2="Teleport & interact with the all boxes.", TH1="เสียบสายไฟอัตโนมัติ", TH2="วาปไปเสียบสายไฟอัตโนมัติ", Callback=function()
                            return Functions:B3C1Func("Water/Wire");
                        end}; {type="Space"}; {type="Space"};
                        {type="Toggle", EN="ESP Baigai", EN2="Show Baigai's hitbox.", TH1="ESP Baigai", TH2="มองเห็น Baigai", Path="Water/ESP/Baigai", Callback=function(state)
                            B3C1Con.Water.ESP.Baigai = state;
                            return Functions:B3C1ESP("Baigai", state);
                        end};
                    }};
                };
            });
        };

        GG.FuckYOUUUUUUUUUUUUUUUUU = Functions;

        CoruTask.New("B1C4@Sama", function()
            if PlaceId ~= 7251867574 and PlaceId ~= 7265397848 then
                return;
            end;
            
            local SAFESAMA = CFr(2823, 155, 2490); while true do
                local CHs=GetChildren(W.GameHearts); for i=1, #CHs do
                    if not B1C4Con.Map4.AutoKillSama or CoreDestroyed then
                        CoruTask.Close("Sama");
                    end; local v=CHs[i]; if v.Parent then
                        local Root = FindFirstChild(v, "Root");
                        if not Root then continue; end;
                        local CFH = Root.CFrame;
                        while not FindFirstChild(v, "Destroyed") and B1C4Con.Map4.AutoKillSama and not CoreDestroyed do
                            while Cam.FieldOfView > 71 do
                                Tp(HumRSelf, SAFESAMA); twait(0.03);
                            end;

                            while selc.Parent and Functions:ToolNow("Katana") and Cam.FieldOfView < 72 and not FindFirstChild(v, "Destroyed") do
                                Tp(HumRSelf, CFH); Functions:ToolActive("Katana"); twait(0.1);
                            end; twait(0.1);
                        end;
                    end;
                end; twait(0.1);
            end;
        end);
        CoruTask.New("B1C4@Saigomo", function()
            if PlaceId ~= 7251867574 and PlaceId ~= 7265397848 then
                return;
            end;
            
            local SaiConnection = nil;
            local SAFESAIGOMO = CFr(2718.18, 266.32, 2537.03);
            local BossBattle = WaitForChild(W, "BossBattle", 9e9);
            local Saigomo = WaitForChild(BossBattle, "Saigomo", 9e9);
            local HumRSai = WaitForChild(Saigomo, "HumanoidRootPart", 9e9);
            local Sound = WaitForChild(HumRSai, "roar", 9e9);

            if Sound and Sound.Parent then
                local CHs = {
                    WaitForChild(Saigomo, "SpiderHitbox", 9e9),
                    WaitForChild(Saigomo, "hitbox1", 9e9),
                    WaitForChild(Saigomo, "hitbox2", 9e9),
                }; for i=1, #CHs do
                    local v=CHs[i]; if v.Parent then
                        local Touch = WaitForChild(v, "TouchInterest", 9e9);
                        if Touch then Touch:Destroy(); end;
                    end;
                end; Saigomo.SpiderHitbox.Size = Vec3(50, 50, 50);
            end;

            while true do
                if not B1C4Con.Map4.AutoKillSaigomo or CoreDestroyed then
                    if SaiConnection then
                        SaiConnection:Disconnect();
                        SaiConnection = nil;
                    end; CoruTask.Close("Saigomo");
                end; if not SaiConnection then
                    SaiConnection = H.Heartbeat:Connect(function()
                        if not selc.Parent or not HumRSelf.Parent then return; end;
                        if not Sound.Parent or not HumRSai.Parent then return; end;

                        if Sound.IsPlaying then
                            Tp(HumRSelf, SAFESAIGOMO);
                        else
                            if Functions:ToolNow("Katana") then
                                Tp(HumRSelf, HumRSai.CFrame + HumRSai.CFrame.RightVector*-20);
                                Functions:ToolActive("Katana");
                            end;
                        end;
                    end);
                end; twait(0.1);
            end;
        end);
        CoruTask.New("B2C2@Cook", function()
            if Chapter ~= "B2C1" then
                CoruTask.Close("Cook");
            end;
            
            local matches = {};
            local selected = nil;
            local selectedObj = nil;

            local GetFromCook = Functions.GetFromCook;
            local PlaceCoun = Functions.PlaceCoun;
            local ToStove = Functions.ToStove;
            local TurnInFood = Functions.TurnInFood;
            
            while true do
                if not B2C2Con.Cook.AutoCook then
                    CoruTask.Close("Cook");
                end; if not PSG.CookingUI.Timer.Visible then
                    twait(0.1); continue;
                end; if not ScriptCache.BarrierCook then
                    local Folder = Functions:B2C1Get("Workspace.Section3.Build2");
                    if not Folder then twait(0.1); continue; end;
                    local CHs = GetChildren(Folder); for i=1, #CHs do
                        local v = CHs[i]; if v.Name == "Barrier" and dist(v.Position) <= 100 then
                            v:Destroy();
                        end;
                    end; ScriptCache.BarrierCook = true;
                end;

                local Orders = Functions:B2C1Get("Workspace.Section3.Cooking.Orders");
                if not Orders then twait(0.1); continue; end; local CHs = GetChildren(Orders);
                local Givers = Functions:B2C1Get("Workspace.Section3.Cooking.Givers");
                local Stoves = Functions:B2C1Get("Workspace.Section3.Cooking.Stoves.stove.Detector.ProximityPrompt");
                local Counter = Functions:B2C1Get("Workspace.Section3.Cooking.WoodenCounters.WoodenCounter");
                local ChefPrompt = Functions:B2C1Get("Workspace.Section3.Cooking.TurnInFood.Detector.ProximityPrompt");

                for i=1, #CHs do
                    local v = CHs[i]; if v.Parent then
                        tblein(matches, v.Name);
                    end;
                end; if #matches > 0 then
                    selected = math.random(1, #matches);
                    selectedObj = matches[selected];
                    matches = {};
                    if selectedObj == "Ham Stew" then
                        GetFromCook(Givers, "Pot");
                        PlaceCoun(Counter);
                        GetFromCook(Givers, "Ham");
                        PlaceCoun(Counter);
                        GetFromCook(Givers, "Sausage");
                        PlaceCoun(Counter);
                        PlaceCoun(Counter);
                        ToStove(Stoves); twait(10);
                        if not B2C2Con.Cook.AutoCook or CoreDestroyed then
                            continue;
                        end; GetFromCook(Givers, "Bowl");
                        PlaceCoun(Counter);
                        ToStove(Stoves);
                        PlaceCoun(Counter);
                        PlaceCoun(Counter);
                        TurnInFood(ChefPrompt);
                    elseif selectedObj == "Chicken Soup" then
                        GetFromCook(Givers, "Pot");
                        PlaceCoun(Counter);
                        GetFromCook(Givers, "Chicken");
                        PlaceCoun(Counter);
                        GetFromCook(Givers, "Wrapped Meat");
                        PlaceCoun(Counter);
                        GetFromCook(Givers, "Cheese");
                        PlaceCoun(Counter);
                        PlaceCoun(Counter);
                        ToStove(Stoves); twait(10);
                        if not B2C2Con.Cook.AutoCook or CoreDestroyed then
                            continue;
                        end; GetFromCook(Givers, "Bowl");
                        PlaceCoun(Counter);
                        ToStove(Stoves);
                        PlaceCoun(Counter);
                        PlaceCoun(Counter);
                        TurnInFood(ChefPrompt);
                    elseif selectedObj == "Spaghetti N Eyeballs" then
                        GetFromCook(Givers, "Bowl");
                        PlaceCoun(Counter);
                        GetFromCook(Givers, "Eyeball");
                        PlaceCoun(Counter);
                        GetFromCook(Givers, "Spaghetti");
                        PlaceCoun(Counter);
                        PlaceCoun(Counter);
                        TurnInFood(ChefPrompt);
                    end;
                end; twait(0.1);
            end;
        end);
        CoruTask.New("B2C2@Mother", function()
            if Chapter ~= "B2C2" then
                return;
            end; while true do
                if not B2C2Con.Kid["Anti Mother"] or CoreDestroyed then
                    CoruTask.Close("Mother");
                end;

                local Object = Functions:B2C1Get("Workspace.Section4.Monsters.Mother.HumanoidRootPart");
                if Object then
                    if Object.Parent.Parent then
                        if dist(Object.Position) <= 150 then
                            Tp(HumRSelf, CFr(-4334.81299, 690.94397, -2363.2771));
                        end;
                    else
                        return;
                    end;
                end; twait(0.1);
            end;
        end);
        CoruTask.New("B2C2@Cannon&Lazer", function()
            if Chapter ~= "B2C2" then return; end;
            local SAFEPOS = CFr(1982.58, 100, -4780.12); while true do
                if not (B2C2Con.Nagisa["Auto Get Cannon Balls"] or B2C2Con.Nagisa["Anti Nagisa Beam"]) or CoreDestroyed then
                    CoruTask.Close("B2C2@Cannon&Lazer");
                end;

                local BallGiver = Functions:B2C1Get("Workspace.Section5.BATTLESHIP.BallGivers.BallGiver.Interact.ProximityPrompt");
                local Laser = Functions:B2C1Get("Workspace.Section5.BOSS.NureMain.POISON");

                if BallGiver and Laser then
                    if B2C2Con.Nagisa["Auto Get Cannon Balls"] then
                        if PSG.BossFight.Ammo.Text == "0" and Laser.Transparency ~= 0.5 then
                            Tp(HumRSelf, BallGiver.Parent.CFrame, 0.3); for i=1, 5 do
                                fireproximityprompt(BallGiver, 1);
                            end;
                        end
                    end;
                    if B2C2Con.Nagisa["Anti Nagisa Beam"] then
                        if Laser.Transparency ~= 1 then
                            Tp(HumRSelf, SAFEPOS);
                        end;
                    end;
                end; twait(0.1);
            end;
        end);
        CoruTask.New("B2C2@Serpent", function()
            if Chapter ~= "B2C2" then return; end;

            local ShouldPause = false;
            local SAFEPOS = CFr(1972, 100, -4772);

            while true do
                if not B2C2Con.Nagisa["Auto Kill Nagisa Serpent"] or CoreDestroyed then
                    if Connection then
                        ShouldPause = false;
                        Connection:Disconnect();
                        Connection = nil;
                    end; CoruTask.Close("B2C2@Serpent");
                end;
                
                if Connection then twait(0.1); continue; end;
                local Object = Functions:B2C1Get("Workspace.Section5.Stage2BOSS.NureStage2.TailHitbox1");
                if not Object then twait(0.1); continue; end;
                
                Connection = H.RenderStepped:Connect(function()
                    if not selc.Parent or not HumRSelf.Parent then return; end;
                    if ShouldPause then return; end; if Object then
                        if not Functions:ToolNow("Cutlass") then
                            local Cutlass = Functions:B2C1Get("Workspace.Section5.BATTLESHIP.CutlassGiverModel.cutlass.ProximityPrompt");
                            if Cutlass and Cutlass.Enabled then
                                ShouldPause = true;
                                Tp(HumRSelf, Cutlass.Parent.CFrame, 0.3);
                                fireproximityprompt(Cutlass);
                            end;

                            if not Functions.Cutlass then
                                Functions.Cutlass = WaitForChild(BP, "Cutlass", 3);
                            end; ShouldPause = false;
                        else
                            if not FindFirstChild(Object, "TouchInterest") then
                                Tp(HumRSelf, Object.CFrame);
                                Functions:ToolActive("Cutlass");
                            else
                                Tp(HumRSelf, SAFEPOS);
                            end;
                        end;
                    end;
                end); twait(0.1);
            end;
        end);
        CoruTask.New("B2C3@Yurei", function()
            if Chapter ~= "B2C3" then return; end;

            local Yurei = nil;
            local BZONE = Vec3(3009, 17, -416);

            repeat twait(0.1); until Functions.GameMode ~= nil; if Functions.GameMode == "Normal" then
                Yurei = WaitForChild(W.Section5.Boss.MonsterFolder, "Yurei", 9e9);
            else
                Yurei = WaitForChild(W.Section5.Boss.MonsterFolder, "YureiNM", 9e9);
            end;

            while true do
                if not B2C3Con.Boss["AutoKillYurei"] or CoreDestroyed then
                    Functions:FreeCam(false);
                    Tp(HumRSelf, CFr(BZONE), 0.3);
                    CoruTask.Close("B2C3@Yurei");
                end;

                if PSG.BossFight.Enabled then
                    if dist(BZONE) < 600 then
                        local Katana = FindFirstChild(BP, "Katana") or FindFirstChild(selc, "Katana");
                        if not Katana then
                            Functions:B2C3Func("Boss/Katanas");
                            continue;
                        else
                            Functions.Katana=Katana;
                            if Functions:ToolNow("Katana") then
                                Functions:FreeCam(true); ForceFloat = true;
                                Tp(HumRSelf, Yurei.Body.CFrame * CFr(0, -40, 0), 0.3);
                                Cam.CFrame = CFr(selc.Head.Position, Yurei.Body.Position);
                                Functions:ToolActive("Katana");
                            end; Functions:FreeCam(false); ForceFloat = "None";
                        end;
                    end;
                else
                    Tp(HumRSelf, CFr(BZONE), 0.3);
                end; twait(0.1);
            end;
        end);

        local LSecureUI = function()
            local WindUI = WindLib();
            local Window = WindUI:CreateWindow({
                Title = "The Mimic",
                Folder = "TTJYStudio",
                Transparent = true,
                Theme = "Dark",
                Acrylic = LoaderSettings.AllowAcrylicBlur,
                SideBarWidth = 200,
                HasOutline = true,
                NewElements = true,
                OpenButton = {
                    Title = "TTJY Hub",
                    CornerRadius = UDim.new(1,0),
                    StrokeThickness = 3,
                    Enabled = true,
                    Draggable = true,
                    OnlyMobile = false,
                    Color = ColorSequence.new(Col3.fromHex("#30FF6A"), Col3.fromHex("#e7ff2f"))
                }, Topbar = {
                    Height = 44,
                    ButtonsType = "Mac",
                },
            });
            local Tabs = {}; Tabs = {
                Welcome = Window:Tab({ Title = "Welcome", Icon = "smile" }),
                Client = LoaderSettings.AllowClientTab and Window:Tab({ Title = "Client", Icon = "user" }),
                
                Div1 = Window:Divider(),
                PlaceholderTab = if ScriptData.AutoData.PlaceholderTab then Window:Tab({ Title = "Information", Icon = "star" }) else false,
                EgaoTab = Window:Tab({ Title = "Egao", Icon = "smile", Locked=true }),
                B1C1 = Windy:CreateDynamic(Window, Tabs, ScriptData.AutoData.PackB1C1),
                B1C2 = Windy:CreateDynamic(Window, Tabs, ScriptData.AutoData.PackB1C2),
                B1C3 = Windy:CreateDynamic(Window, Tabs, ScriptData.AutoData.PackB1C3),
                B1C4 = Windy:CreateDynamic(Window, Tabs, ScriptData.AutoData.PackB1C4),
                B2C1 = Windy:CreateDynamic(Window, Tabs, ScriptData.AutoData.PackB2C1),
                B2C2 = Windy:CreateDynamic(Window, Tabs, ScriptData.AutoData.PackB2C2),
                B2C3 = Windy:CreateDynamic(Window, Tabs, ScriptData.AutoData.PackB2C3),
                B3C1 = Windy:CreateDynamic(Window, Tabs, ScriptData.AutoData.PackB3C1),

                ExtraDiv = Window:Divider(),
                AddOn = LoaderSettings.AllowAddOn and Window:Tab({ Title = "AddOn", Icon = "box" }),
                Themes = LoaderSettings.AllowThemesTab and Window:Tab({ Title = "Themes", Icon = "palette" }),
                Core = Window:Tab({ Title = "Core Settings", Icon = "settings" }),
            }; IntroLib.Init(WindUI, Tabs.Welcome); IntroLib:Tutorial(WindUI);
            Windy:CreateComponent(Tabs.Client, ScriptData.AutoData.ClientTab, "Client");

            Windy:CreateComponent(Tabs.PlaceholderTab, ScriptData.AutoData.PlaceholderTab, "IGNORE");

            Windy:CreateComponent(Tabs.Core, CorePackage());

            Window:SelectTab(1); Window:OnDestroy(function()
                CoreDestroyed = true;
            end);

            Window:SetToggleKey((LoaderSettings.UIKeybind and Enum.KeyCode[LoaderSettings.UIKeybind]) or Enum.KeyCode["RightShift"]);
            ScriptCache.WindUI = WindUI; ScriptCache.Window = Window;
        end; local LSecureLoad = function(AUTH_KEY)
            local OneRunCallMain, OneRunErrorMain = pcall(function()
                CoreDestroyed = false; GG.ESPF_ChangeMode = ESPF.Method;
                ClientCon.WalkSpeed = HumSelf and HumSelf.WalkSpeed or 16;
                ClientCon.JumpPower = HumSelf and HumSelf.JumpPower or 50;

                GG.Configs = Config;
                LSecureUI();

                tk.spawn(function()
                    while not CoreDestroyed do
                        if B1C4Con.Map4.AutoKillSama then
                            CoruTask.Handle("B1C4@Sama");
                        end;
                        if B1C4Con.Map4.AutoKillSaigomo then
                            CoruTask.Handle("B1C4@Saigomo");
                        end;
                        if Chapter == "B2C2" then
                            if B2C2Con.Cook.AutoCook then
                                CoruTask.Handle("B2C2@Cook");
                            end;
                            if B2C2Con.Kid["Anti Mother"] then
                                CoruTask.Handle("B2C2@Mother");
                            end;
                            if B2C2Con.Nagisa["Auto Get Cannon Balls"] or B2C2Con.Nagisa["Anti Nagisa Beam"] then
                                CoruTask.Handle("B2C2@Cannon&Lazer");
                            end;
                            if B2C2Con.Nagisa["Auto Kill Nagisa Serpent"] then
                                CoruTask.Handle("B2C2@Serpent");
                            end;
                            if B2C3Con.Boss["AutoKillYurei"] then
                                CoruTask.Handle("B2C3@Yurei");
                            end;
                        end;
                        twait(0.1);
                    end;
                end);

                CoreConnection[1] = H.Stepped:Connect(function()
                    if CoreDestroyed and CoreConnection[1] then
                        CoreConnection[1]:Disconnect(); CoreConnection[1] = nil;
                        if CoreDestroyed and CoreConnection[3] then
                            CoreConnection[3]:Disconnect(); CoreConnection[3] = nil;
                        end; return;
                    end;

                    ClientPackage.UpdatePosition(ClientCon.Float, ForceFloat, HumRSelf);
                    ClientPackage.Noclip(ClientCon.Noclip, selc.Parent and GetDescendants(selc));
                    ClientPackage.Brightness(ClientCon["Full Bright"]);
                    ClientPackage.SetJumpPower(ClientCon["Enable JumpPower"], ClientCon.JumpPower, HumSelf);
                end);
                CoreConnection[2] = H.Heartbeat:Connect(function(delta)
                    if CoreDestroyed and CoreConnection[2] then
                        CoreConnection[2]:Disconnect(); CoreConnection[2] = nil;
                        return;
                    end;

                    if ClientCon["Enable TeleportWalk"] and selc.Parent and HumSelf.Parent and HumSelf.MoveDirection.Magnitude > 0 then
                        selc:TranslateBy(HumSelf.MoveDirection * ClientCon["TeleportWalk Speed"] * delta * 10);
                    end;
                end);
                CoreConnection[3] = selff.CharacterAdded:Connect(function(char)
                    selc = char; BP = selff.Backpack;
                    HumSelf = WaitForChild(char, "Humanoid", 9e9);
                    HumRSelf = WaitForChild(char, "HumanoidRootPart", 9e9);
                    Functions:GameValidate(); if Chapter ~= "B3C1" then
                        ClientPackage:WalkSpeedC(HumSelf);
                    end;
                end);
                CoreConnection[4] = H.RenderStepped:Connect(function()
                    if not GG.ESPObjects or LoaderSettings.ESPMode ~= "2D" then return; end;
                    for _, TargetClass in pairs(GG.ESPObjects) do
                        for _, Data in pairs(TargetClass) do
                            if not Data.Visualize then continue; end;
                            Data:Visualize(Cam);
                        end;
                    end;
                end);
                
                if selff.Character then
                    selc = selff.Character; BP = selff.Backpack;
                    HumSelf = WaitForChild(selc, "Humanoid", 9e9);
                    HumRSelf = WaitForChild(selc, "HumanoidRootPart", 9e9);
                    Functions:GameValidate(); if Chapter ~= "B3C1" then
                        ClientPackage:WalkSpeedC(HumSelf);
                    end;
                end;

                if not CoruTask.Intialized then
                    CoruTask.Init(WindUI);
                    CoruTask.Intialized = true;

                    GameAI = FindFirstChild(W, "GameAI");
                    GameAI2 = FindFirstChild(W, "GameAI2");
                end;
            end); if OneRunCallMain then
                return true, GG.LoadingSignal:Fire(100);
            end; return false, warn(OneRunErrorMain);
        end; GG.LSecureLoad = LSecureLoad; return LSecureLoad;
    end;
};
