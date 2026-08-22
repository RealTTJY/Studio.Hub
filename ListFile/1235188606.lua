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

local emptyfunction = function(...) return; end;
local setthread = setthreadidentity or set_thread_identity or setthreadcontext or set_thread_context or emptyfunction;

local R = GetService(game, "ReplicatedStorage");
local H = GetService(game, "RunService");
local W = GetService(game, "Workspace");
local P = GetService(game, "Players");
local S = GetService(game, "Stats");

local IsA = game.IsA;
local twait = tk.wait;
local CFr = CFrame.new;
local Vec3 = Vector3.new;
local strfind = str.find;
local tdefer = tk.defer;
local mclamp = math.clamp;
local PivotTo = W.PivotTo;
local tblein = tble.insert;
local TwInfo = TweenInfo.new;
local GetChildren = game.GetChildren;
local GetAttribute = game.GetAttribute;
local WaitForChild = game.WaitForChild;
local GetDescendants = game.GetDescendants;
local FindFirstChild = game.FindFirstChild;
local GetServerTimeNow = W.GetServerTimeNow;
local FindFirstChildOfClass = game.FindFirstChildOfClass;
local FindFirstChildWhichIsA = game.FindFirstChildWhichIsA;
local GetAttributeChangedSignal = game.GetAttributeChangedSignal;

local VEC0 = Vector3.zero;
local VEC2 = Vec3(2,2,2);
local RED = Col3.new(1,0,0);
local GREEN = Col3.new(0, 1, 0);
local BLUE = Col3.new(0, 0, 1);
local YELLOW = Col3.new(1, 1, 0);
local ORANGE = Col3.fromRGB(255, 165, 0);
local CFRFISHING = CFr(-50, 0, 0);
local CFRNODE = CFr(20, 25, 0);
local TWEENINFO_1 = TwInfo(0.3);
local TWEENINFO_2 = TwInfo(0.1);
local GSTORE_CFRAME = CFr(-15, 139, 221);
local EMPTY_OBJECT = {Parent=nil, SeatPart=nil};
local PERSISTENT = Enum.ModelStreamingMode.Persistent;

local UnsafePoses = {
    Prehistoric = {
        Vec3(-746, 31, 602);
        Vec3(-546, 61, 365);
        Vec3(-839, 331, -98);
        Vec3(-278, 410, -907);
    },
    Shinrin = {
        Vec3(-737, 865, -5322);
        Vec3(-2964, 278, -1594);
        Vec3(-2724, 454, -993);
        Vec3(999, 307, 744);
        Vec3(1117, 203, 882);
        Vec3(-399, 867, -5310);
        Vec3(-254, 202, -733);
        Vec3(10, 106, -737);
    };
};
local AdditionalPoses = {
    Prehistoric = {
        Vec3(1599, 313, 1026);
    };
};

local ScriptData = {};
local Config = GG.Configs or {};

Config.Client = Config.Client or {};
Config.Client.Client = Config.Client.Client or {};
Config.Dragon = Config.Dragon or {};
Config.Economy = Config.Economy or {};
Config.Level = Config.Level or {};
Config.Fish = Config.Fish or {};
Config.Egg = Config.Egg or {};
Config.Mob = Config.Mob or {};
Config.Food = Config.Food or {};
Config.Resource = Config.Resource or {};
Config.BoneMeal = Config.BoneMeal or {};
Config.Treasure = Config.Treasure or {};
Config.Events = Config.Events or {};
Config.Events.Solstice = Config.Events.Solstice or {};

return {
    Version = "DA_V3.64";
    Function = function(CorePackage, WindLib, IntroLib, Windy, ClientPackage, CoruTask, CommonF, ESPF)
        local CoreConnection    = {};
        local CoreDestroyed     = false;
        local ForceFloat        = "None";

        local FishingClient     = nil;
        local EggNodes, ANodes  = {}, {};
        local SmoothX           = nil;
        local SmoothY           = nil;
        local SmoothZ           = nil;
        local SYNC_UPVS         = nil;
        local Cam               = W.CurrentCamera;
        local selff             = P.LocalPlayer;
        local PSG               = selff.PlayerGui;
        local selc              = selff.Character or EMPTY_OBJECT;
        local HumSelf           = selc.Parent and FindFirstChildOfClass(selc, "Humanoid") or EMPTY_OBJECT;
        local HumRSelf          = HumSelf.RootPart or EMPTY_OBJECT;
        local Seat              = HumSelf.SeatPart or EMPTY_OBJECT;
        local PSS               = WaitForChild(selff, "PlayerScripts", 9e9);
        local ControlModule     = require(WaitForChild(WaitForChild(PSS, "PlayerModule", 9e9), "ControlModule", 9e9));

        local VOIDPART          = Instancen("Part");
        local SData             = WaitForChild(selff, "Data", 9e9);
        local SDDragon          = WaitForChild(SData, "Dragons", 9e9);
        local SRemotes          = WaitForChild(selff, "Remotes", 9e9);
        local RRemotes          = WaitForChild(R, "Remotes", 9e9);
        local RepFolder         = WaitForChild(R, "_replicationFolder", 9e9);
        local RStorage          = WaitForChild(R, "Storage", 9e9);
        local GInteractions     = WaitForChild(W, "Interactions", 9e9);
        local GNodes            = WaitForChild(GInteractions, "Nodes", 9e9);
        local CurrentWorld      = WaitForChild(WaitForChild(W, "WorldSettings", 9e9), "World", 9e9).Value;

        local cmdm              = selff:GetMouse();
        local ClientCon         = Config.Client.Client;
        local DragonCon         = Config.Dragon;
        local LevelCon          = Config.Level;
        local FishCon           = Config.Fish;
        local EggCon            = Config.Egg;
        local MobCon            = Config.Mob;
        local FoodCon           = Config.Food;
        local ResourceCon       = Config.Resource;
        local BoneMealCon       = Config.BoneMeal;
        local TreasureCon       = Config.Treasure;
        local EcoCon            = Config.Economy;
        local EventsCon         = Config.Events;
        local NodeColors        = {Food=ORANGE, Resources=BLUE};
        local Control           = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0};
        local NonAnalytics3     = {type="Button", EN="Analytics 3", EN2="Please enable 'Analytics 3' module to track game data, inventory, and player statistics for reports and webhook integrations.", TH1="Analytics 3", TH2="กรุณาเปิดใช้งานโมดูล 'Analytics 3' เพื่อติดตามข้อมูลเกม สินค้าคงคลัง และสถิติผู้เล่นสำหรับรายงานและเว็บฮุก"};

        local dist              = CommonF.dist;
        local Tween             = CommonF.Tween;

        local REQ               = {};

        ClientCon.FlySpeed = ClientCon.FlySpeed or 1;
        ClientCon.WalkSpeed = ClientCon.WalkSpeed or 16;
        ClientCon.JumpPower = ClientCon.JumpPower or 50;
        ClientCon["TeleportWalk Speed"] = ClientCon["TeleportWalk Speed"] or 1;
        EcoCon.SellMode = EcoCon.SellMode or "Food";
        EcoCon.SelectWorld = EcoCon.SelectWorld or "Shinrin";
        LevelCon.RidingMode = LevelCon.RidingMode or "Flying";

        local RE                = {};

        RE.BondingExpRemote = WaitForChild(SRemotes, "BondingExpRemote", 9e9);
        RE.PoppedDiscoverIndicatorRemote = WaitForChild(RRemotes, "PoppedDiscoverIndicatorRemote", 9e9);

        local Functions = {};

        Functions.SetSync = function(self)
            if self.SetupSync then return; end; self.SetupSync = true;
            local SYNC_MODL = require(WaitForChild(RepFolder, "NotificationsClient"));
            SYNC_UPVS = getupvalues(SYNC_MODL.Notify);
        end;
        Functions.isSynced = function()
            return SYNC_UPVS[1] and SYNC_UPVS[1].DataSync or GG.ForceSync;
        end;
        Functions.GetPing = function()
            return S.Network.ServerStatsItem["Data Ping"]:GetValue() / 1000;
        end;
        Functions.SetDFly = function()
            if not Seat.Parent or not REQ.DragonClass then return false; end;
            if not Seat.Parent.Data.Flying.Value then
                REQ.DragonClass:SetFlying(true);
            end; return true;
        end;
        Functions.Tp = function(Pos)
            if not selc.Parent then return; end;
            local CurrentPos = HumRSelf.Position;
            SmoothX.p = CurrentPos.X;
            SmoothY.p = CurrentPos.Y;
            SmoothZ.p = CurrentPos.Z;
            SmoothX.t = Pos.X;
            SmoothY.t = Pos.Y;
            SmoothZ.t = Pos.Z;
            while (SmoothX.rtime > 0 or SmoothY.rtime > 0 or SmoothZ.rtime > 0) do
                local newPos = Vec3(SmoothX.p, SmoothY.p, SmoothZ.p);
                PivotTo(selc, CFr(newPos)); twait(0.01);
            end;
        end;
        Functions.GoThroughGrid = function(self)
            if not selc.Parent or not HumRSelf.Parent then return; end;
            local originalPos = HumRSelf.CFrame;
            local ChestPoses = WaitForChild(GNodes, "Treasure"):GetAttributes();
            for _, cf in pairs(ChestPoses) do
                if typeof(cf) == "CFrame" then
                    if Seat.Parent then
                        self.SetDFly(true);
                        Tween({
                            primary = Seat.Parent and Seat.Parent.PrimaryPart;
                            goal = {CFrame = cf};
                            info = TwInfo(dist(cf.Position) / 400, Enum.EasingStyle.Linear);
                        });
                    else
                        self.Roaming = false;
                    end; twait(math.max(0.2 + mclamp(self.GetPing(), 0, 0.5)));
                end;
            end; 
            
            local ExtraPoses = AdditionalPoses[CurrentWorld];
            if ExtraPoses then
                for i=1, #ExtraPoses do
                    if Seat.Parent then
                        self.SetDFly(true);
                        Tween({
                            primary = Seat.Parent and Seat.Parent.PrimaryPart;
                            goal = {CFrame = CFr(ExtraPoses[i])};
                            info = TwInfo(dist(ExtraPoses[i]) / 400, Enum.EasingStyle.Linear);
                        });
                    else
                        self.Roaming = false;
                    end; twait(math.max(0.2 + mclamp(self.GetPing(), 0, 0.5)));
                end;
            end;

            if Seat.Parent then
                Tween({
                    primary = Seat.Parent and Seat.Parent.PrimaryPart;
                    goal = {CFrame = originalPos};
                });
            end;
        end;
        Functions.RoamInitialization = function(self)
            self = self or Functions; if self.Roam then return; end;
            self.Roam = true; local function setPersistent(v)
                v.ModelStreamingMode = PERSISTENT;
            end; for _, folder in {
                WaitForChild(GNodes, "Food"),
                WaitForChild(GNodes, "Resources"),
                WaitForChild(GNodes, "BoneMeal")
            } do
                local CHs = GetChildren(folder);
                for i=1, #CHs do
                    local v=CHs[i]; if v then
                        setPersistent(v)
                    end;
                end; folder.ChildAdded:Connect(setPersistent);
            end; self:GoThroughGrid();
        end;
        Functions.GameDataInit = function(Items)
            local WorldFood, WorldResources = {}, {};
            for i, v in pairs(Items.Food) do
                if not v.Origin then continue; end;
                if not WorldFood[v.Origin] then
                    WorldFood[v.Origin] = {};
                end; tblein(WorldFood[v.Origin], i);
            end; for i, v in pairs(Items.Resources) do
                if not v.Origin then continue; end;
                if not WorldResources[v.Origin] then
                    WorldResources[v.Origin] = {};
                end; tblein(WorldResources[v.Origin], i);
            end; Items.WorldFood = WorldFood; Items.WorldResources = WorldResources;
            Items.SDResource = WaitForChild(SData, "Resources", 9e9);
            Items.IsMaxValue = function(varbase) return varbase.Value > 6000; end;
            Items.SRE = game.PlaceId == 3475397644 and WaitForChild(RRemotes, "SellItemRemote", 9e9); REQ.Items = Items;
        end;
        Functions.SolsticeInit = function(self)
            if CurrentWorld ~= "Solstice2026" then return; end;
            
            local FlowerClass = require(RepFolder.FlowerClassClient);
            local ItemClass = require(RepFolder.ItemClassClient);

            local UPs = getupvalues(FlowerClass.Destroy)[1];
            local UPs2 = getupvalues(ItemClass.Destroy)[1];

            self.Flowers = UPs;
            self.Waters = UPs2;
            self.WaterINV = SData.SolsticeEvent2026.WaterEssence;

            local WhackClass = require(RepFolder.WhackAMoleClassClient);
            local CatchClass = require(RepFolder.CatchObjectClassClient);
            local StarUPs = getupvalues(CatchClass.Init); for i=1, #StarUPs do
                local v=StarUPs[i]; if type(v) == 'table' then
                    if not rawget(v, "new") then
                        REQ.Stars = v;
                    else
                        REQ.StarClass  = v;
                    end;
                end;
            end;

            local REs = WaitForChild(RRemotes, "ClientDestructibleHitRemote", 9e9);
            local o;o=LowerC(WhackClass.new, function(...)
                if not EventsCon.Solstice.AutoWhackAMole then
                    return o(...);
                end;

                local R = o(...); if R then
                    if R.PointsToGive ~= -1 then
                        tdefer(function()
                            REs:FireServer(
                                R.Destructible.ClientDestructibleIdentifier
                            ); WhackClass.Hit(R);
                        end);
                    end;
                end;
            end);
        end;
        Functions.AutoLevel = function(where)
            if not Seat.Parent then return; end;
            warn(REQ.Riding)
            if where == "Ride" and REQ.Riding then
                local Data = REQ.Riding.GetClosest(LevelCon.RidingMode);
                warn(Data, Data and Data.Position)
                if Data and Data.Position then
                    return Tween({
                        primary = Seat.Parent.PrimaryPart,
                        goal = {CFrame = CFr(Data.Position)},
                        info = TWEENINFO_2
                    });
                end;
            elseif where == "Bond" then
                return RE.BondingExpRemote:FireServer(SDDragon[Seat.Parent.Name], "Happy");
            elseif where == "Track" then
                for Model, data in pairs(EggNodes) do
                    if data.NodeType ~= "Eggs" then continue; end;
                    if dist(data.NodePosition) > 40 then continue; end;
                    RE.PoppedDiscoverIndicatorRemote:FireServer("EggNest", data.NestValue);
                end;
            end;
        end;
        Functions.SwitchWorld = function(self, where)
            local TeleportPart = GInteractions.WorldTeleports.TeleportPad.Part;
            if dist(TeleportPart.Position) > 30 then
                Tween({
                    primary = Seat.Parent and Seat.Parent.PrimaryPart;
                    goal = {CFrame = TeleportPart.CFrame};
                }); twait(1); if dist(TeleportPart.Position) < 31 then
                    return self.TeleportRE:InvokeServer(self.WorldData[where].GameId, {}), twait(60);
                end;
            else
                return self.TeleportRE:InvokeServer(self.WorldData[where].GameId, {}), twait(60);
            end;
        end;
        Functions.GoToGeneralStore = function()
            if dist(GSTORE_CFRAME.Position) > 30 then
                Tween({
                    primary = Seat.Parent and Seat.Parent.PrimaryPart;
                    goal = {CFrame = GSTORE_CFRAME};
                }); twait(1); if dist(GSTORE_CFRAME.Position) <= 30 then
                    return true;
                end;
            end; return true;
        end;
        Functions.AutoSell = function(self, Items)
            local Data = if EcoCon.SellMode == "Food" then Items.WorldFood else Items.WorldResources;
            local Targets, SDResource = Data[EcoCon.SelectWorld] or {}, Items.SDResource;
            for i=1, #Targets do
                if not EcoCon.AutoSell then return; end;
                local v = Targets[i]; local GObject = FindFirstChild(SDResource, v);
                if GObject then
                    if Items.IsMaxValue(GObject) and CurrentWorld ~= "Lobby" and EcoCon.AllowLobbyTP then
                        return self:SwitchWorld("Lobby"), twait(60);
                    end;
                    if CurrentWorld == "Lobby" and GObject.Value > 0 then
                        if self.GoToGeneralStore() then
                            Items.SRE:FireServer({ItemName=v, Amount=GObject.Value}); twait(1.5);
                        end;
                    end;
                end;
            end; if EcoCon.AllowWorldTP and CurrentWorld ~= EcoCon.SelectWorld then
                self:SwitchWorld(EcoCon.SelectWorld); twait(60);
            end;
        end;
        Functions.FishingZone = function()
            local FishingZone = FindFirstChild(GNodes, "FishingZone", true);
            if FishingZone and Functions.SetDFly(true) then
                Tween({
                    primary = Seat.Parent and Seat.Parent.PrimaryPart;
                    goal = {CFrame = FishingZone.CFrame * CFRFISHING};
                });
            end;
        end;
        Functions.EggShouldBoost = function(a, b)
            return a < b;
        end;
        Functions.AutoEggs = function(self)
            if not HumRSelf.Parent or not selc.Parent then return; end;
            for Model, data in pairs(EggNodes) do
                if data.NodeType ~= "Eggs" then continue; end;
                local CurrentPlayer = data.CurrentPlayerValue;
                if CurrentPlayer.Value or data.HarvestedValue.Value then continue; end;
                local CurrentBoosts = data.CurrentBoostsValue;
                local RequiredBoosts = data.RequiredBoosts;
                local NodePos = data.NodePosition;
                local RModel = Model.Parent;
                while EggCon.AutoCollect do
                    if dist(NodePos) > 30 then
                        if not self.SetDFly(true) then
                            twait(0.1); continue;
                        end; if EggCon.UseAxcel then
                            self.Tp(NodePos);
                        else
                            Tween({
                                primary = Seat.Parent and Seat.Parent.PrimaryPart;
                                goal = {CFrame = CFr(NodePos)};
                            });
                        end; continue;
                    end;

                    if not CurrentPlayer.Value and not data.Started then
                        twait(1); data.OnStarted(); data.Started = true; continue;
                    end;

                    if self.EggShouldBoost(CurrentBoosts.Value, RequiredBoosts) then
                        twait(1); CurrentBoosts.Value += 1; continue;
                    else
                        twait(1); data.OnHarvest(); if not GetAttribute(RModel, "Hiding") then
                            GetAttributeChangedSignal(RModel, "Hiding"):Wait();
                        end; break;
                    end;
                end; data.Started = false;
            end;
        end;
        Functions.ESPEggs = function()
            for Model, data in pairs(EggNodes) do
                if data.NodeType ~= "Eggs" then continue; end;
                ESPF.ESP("Eggs", Model, {
                    Color = GREEN;
                    Size = VEC2;
                    Text = "Egg";
                });
            end; ESPF.Visible("Eggs", true, EggCon.ShowText);
        end;
        Functions.Breath = function()
            if not Seat.Parent then return false; end;
            local Remotes = FindFirstChild(Seat.Parent, "Remotes");
            local Data = FindFirstChild(Seat.Parent, "Data");
            if not Remotes or not Data then return false; end;
            local FireRE = FindFirstChild(Remotes, "BreathFireRemote");
            local Fire = FindFirstChild(Data, "Fire");
            local Fuel = FindFirstChild(Fire, "BreathFuel");
            if Fuel and Fuel.Value <= 2 and Fire.Value then
                FireRE:FireServer(false);
            elseif Fuel and Fuel.Value > 2 and not Fire.Value then
                FireRE:FireServer(true);
            end; return Fire.Value, FindFirstChild(Remotes, "PlaySoundRemote");
        end;
        Functions.FireNode = function(self, method, obj, delay)
            local Success, PRE = self.Breath();
            if Success and PRE then
                if method == "Destructibles" then
                    PRE:FireServer("Breath", method, obj);
                elseif method == "Mobs" then
                    PRE:FireServer("Breath", method, obj);
                end; return twait(delay or nil);
            end; twait(0.1);
        end;
        Functions.IsNodeSafe = function(nodePos)
            local BlackPos = UnsafePoses[CurrentWorld];
            if not BlackPos then return true; end;
            for i=1, #BlackPos do
                if (nodePos - BlackPos[i]).Magnitude < 200 then
                    return false;
                end;
            end; return true;
        end;
        Functions.AutoNodes = function(self, node, TConfig)
            if not HumRSelf.Parent or not selc.Parent then return; end;
            for Bill, data in pairs(ANodes) do
                if data.NodeType ~= node then continue; end;
                local DeadValue = data.DeadValue;
                if DeadValue.Value then continue; end;
                local Primary = data.PrimaryPart;
                local DropPos = data.DropPositions;
                local Position = Primary.Position;

                if not self.IsNodeSafe(Position) then
                    continue;
                end;
                
                while TConfig.AutoCollect and Seat.Parent do
                    if dist(Position) > 50 then
                        if not self.SetDFly(true) then
                            twait(math.max(0.3 + mclamp(self.GetPing(), 0, 0.5))); continue;
                        end; if TConfig.UseAxcel then
                            self.Tp(Position);
                        else
                            Tween({
                                primary = Seat.Parent and Seat.Parent.PrimaryPart;
                                goal = {CFrame = CFr(Position) * CFRNODE};
                                info = TwInfo(dist(Position) / 400, Enum.EasingStyle.Linear);
                            });
                        end; continue;
                    end;

                    if not DeadValue.Value then
                        self:FireNode("Destructibles", Primary, 0.6);
                        continue;
                    end;

                    for i,v in pairs(data.DropPositions) do
                        if not self.SetDFly(true) then
                            twait(math.max(0.3 + mclamp(self.GetPing(), 0, 0.5))); continue;
                        end; Tween({
                            primary = Seat.Parent and Seat.Parent.PrimaryPart;
                            goal = {CFrame = CFr(v)};
                            info = TWEENINFO_1;
                        });
                    end; twait(math.max(1.7 + mclamp(self.GetPing(), 0, 0.5))); break;
                end;
            end;
        end;
        Functions.ESPNodes = function(node, TConfig)
            for Bill, data in pairs(ANodes) do
                if data.NodeType ~= node then continue; end;
                if data.DeadValue.Value then continue; end;
                ESPF.ESP(node, data.Model, {
                    Color = NodeColors[node];
                    Size = VEC5;
                    Text = node;
                });
            end; ESPF.Visible(node, true, TConfig.ShowText);
        end;
        Functions.GetMobs = function()
            local ToExport, Mobs = {}, GetChildren(W.MobFolder);
            for i=1, #Mobs do
                local v=Mobs[i]; if v.Parent then
                    local BasePart = FindFirstChildWhichIsA(v, "BasePart");
                    local DeadValue = BasePart and FindFirstChild(BasePart, "Dead");
                    if not DeadValue or DeadValue.Value then continue; end;
                    local Mag = BasePart and dist(BasePart.Position);
                    tblein(ToExport, {
                        Dist=Mag,
                        Part=BasePart,
                        Dead=DeadValue,
                        Pos=BasePart.Position,
                    });
                end;
            end; tble.sort(ToExport, function(a,b) return a.Dist < b.Dist end);
            return ToExport;
        end;
        Functions.GetDrops = function(self)
            twait(0.5); local CHs = GetChildren(Cam); for i=1, #CHs do
                local v=CHs[i]; if FindFirstChild(v, "Handle") and dist(v.Handle.Position) < 60 then
                    if not self.SetDFly(true) then
                        twait(0.1); continue;
                    end; Tween({
                        primary = Seat.Parent and Seat.Parent.PrimaryPart;
                        goal = {CFrame = v.Handle.CFrame};
                        info = TWEENINFO_1;
                    });
                end;
            end;
        end;
        Functions.AutoMobs = function(self)
            local Mobs = self.GetMobs(); for i=1, #Mobs do
                local v=Mobs[i]; while MobCon.AutoFarm and Seat.Parent and v.Part.Parent do
                    if not v.Dead.Value then
                        if dist(v.Pos) > 50 then
                            if not self.SetDFly(true) then
                                twait(0.1); continue;
                            end; if MobCon.UseAxcel then
                                self.Tp(v.Pos);
                            else
                                Tween({
                                    primary = Seat.Parent and Seat.Parent.PrimaryPart;
                                    goal = {CFrame = CFr(v.Pos)};
                                });
                            end; continue;
                        end;
                        self:FireNode("Mobs", v.Part, 0.25);
                    else
                        repeat
                            self:GetDrops(); twait(1);
                        until not FindFirstChildWhichIsA(Cam, "Model"); break;
                    end;
                end;
            end;
        end;
        Functions.ChestInit = function(ChestService)
            if CurrentWorld == "Solstice2026" then return; end;
            ChestService.ChestWorldFolder = WaitForChild(WaitForChild(SData, "TreasureChests", 9e9), CurrentWorld, 9e9);
            ChestService.Seed = ChestService.GetSeedForWorld(ChestService.ChestWorldFolder);
            ChestService.ChestPoses = WaitForChild(GNodes, "Treasure"):GetAttributes();
            ChestService.OpenChestRemote = WaitForChild(SRemotes, "OpenChestRemote", 9e9);
        end;
        Functions.AutoChest = function(self, ChestService)
            if not Seat.Parent then return; end;
            local ChestWorldFolder = ChestService.ChestWorldFolder;
            for i=1, #GetChildren(ChestWorldFolder) do
                if not TreasureCon.AutoCollect then return; end;
                local chestValue = ChestWorldFolder[tostring(i)];
                if chestValue.Value then continue; end;
                local id = ChestService.GetChestPosition(
                    ChestService.Seed, i,
                    ChestService.TotalChest,
                    chestValue
                ); local cf = ChestService.ChestPoses["Position"..tostring(id)];
                if cf then
                    if self.SetDFly(true) then
                        twait(0.1);
                    end; if TreasureCon.UseAxcel then
                        self.Tp(cf);
                    else
                        Tween({
                            primary = Seat.Parent and Seat.Parent.PrimaryPart;
                            goal = {CFrame = cf};
                        });
                    end;

                    twait(1.3); if dist(cf.Position) < 30 then
                        ChestService.OpenChestRemote:InvokeServer(i, false);
                        twait(math.max(2.7 + mclamp(self.GetPing(), 0, 0.5)));
                    end;
                end;
            end;
        end;
        Functions.ESPChests = function(ChestService)
            local ChestWorldFolder = ChestService.ChestWorldFolder;
            local PartCache = ChestService.PartCache or {};
            if not ChestService.PartCache then
                for i=1, #GetChildren(ChestWorldFolder) do
                    local chestValue = ChestWorldFolder[tostring(i)];
                    local id = ChestService.GetChestPosition(
                        ChestService.Seed, i,
                        ChestService.TotalChest,
                        chestValue
                    );
                    local cf = ChestService.ChestPoses["Position"..tostring(id)];
                    local Part = Instancen("Part", W);
                    Part.Position = cf.Position;
                    Part.Anchored = true;
                    tblein(PartCache, Part);
                end; ChestService.PartCache = PartCache;
            end; for i=1, #PartCache do
                local v=PartCache[i]; if v.Parent then
                    ESPF.ESP("Chest", v, {
                        Color = YELLOW;
                        Size = VEC5;
                        Text = "Chest";
                    });
                end;
            end; ESPF.Visible("Chest", true, TreasureCon.ShowText);
        end;
        Functions.Solstice_GetEggDrop = function(self)
            local CHs = GetChildren(Cam); for i=1, #CHs do
                local v=CHs[i]; if v.Name == "SunEggEggsModel" or v.Name == "SunChaosEggModel" then
                    Tween({
                        primary = Seat.Parent and Seat.Parent.PrimaryPart,
                        goal = {CFrame = v.Egg.CFrame},
                        info = TWEENINFO_2
                    }); twait(math.max(1.7 + mclamp(self.GetPing(), 0, 0.5)));
                end;
            end;
        end;
        Functions.Solstice_AutoWater = function(self, limit, least)
            if not self.Waters then return; end;
            
            limit = limit or 1000;
            least = least or 1000;
            
            local WaterINV = self.WaterINV;

            if WaterINV.Value < least then
                while WaterINV.Value < limit do
                    for obj, data in pairs(self.Waters) do
                        if least == 1000 and not EventsCon.Solstice.AutoCollectWater then return; end;
                        if WaterINV.Value >= limit then return; end;
                        if not data.VisualMaid then continue; end;

                        local CanPickUp = data:_canPickUp();
                        if not CanPickUp or CanPickUp == "MaxCapacity" then continue; end;
                        if not data.Model or not data.Model.Parent then continue; end;

                        if dist(obj.CFrame.Position) > 30 then
                            Tween({
                                primary = Seat.Parent and Seat.Parent.PrimaryPart,
                                goal = {CFrame = obj.CFrame},
                                info = TWEENINFO_2
                            }); twait(math.max(0.3 + mclamp(self.GetPing(), 0, 0.5)));
                        end;
                        
                        data.VisualMaid._tasks[2].MainOption.Option.Run();
                    end; twait(0.1);
                end;
            end;

            return WaterINV.Value >= least;
        end;
        Functions.Solstice_AutoFlower = function(self)
            for obj, data in pairs(self.Flowers) do
                if data.CurrentProgress == 1 then continue; end;

                local FlowerCF = obj.CFrame; while EventsCon.Solstice.AutoSunflower do
                    if data.CurrentProgress < 1 then
                        if dist(FlowerCF.Position) > 30 then
                            Tween({
                                primary = Seat.Parent and Seat.Parent.PrimaryPart,
                                goal = {CFrame = FlowerCF * CFr(0, 20, 0)},
                                info = TWEENINFO_2
                            }); continue;
                        end;
                        
                        if self:Solstice_AutoWater(200, 50) then
                            data.Maid._tasks[10].MainOption.Option.Run();
                        end;
                    else
                        twait(math.max(0.3 + mclamp(self.GetPing(), 0, 0.5)));
                        self:Solstice_GetEggDrop(); break;
                    end; twait(0.1);
                end;
            end;
        end;
        Functions.Solstice_GetStarsAboutToLand = function(star)
            if not star or star.Claimed or not star.ImpactPos then
                return false;
            end;

            local elapsed = GetServerTimeNow(W) - star.SpawnTime;
            local timeUntilImpact = star.DespawnTime - elapsed;

            return timeUntilImpact;
        end;
        Functions.Solstice_StarCatch = function(self)
            if not REQ.Stars then return; end;
            
            for _, star in pairs(REQ.Stars) do
                if not EventsCon.Solstice.AutoStarCatcher then
                    return;
                end;
                
                if star.Claimed or star.StarType == "Evil" then
                    continue;
                end;

                local time = self.Solstice_GetStarsAboutToLand(star);

                if time and time <= 1 then
                    PivotTo(selc, CFr(star.ImpactPos)); repeat
                        twait(0.01);
                    until star.Claimed or not star.Model or not star.Model.Parent;
                end;
            end;
        end;

        ScriptData.AutoData = {
            ClientTab = {
                {type="Group", dats={
                    {dat={
                        {type="Toggle", EN="Auto Click Minigame", EN2="Automatically click the circle popup on your screen.", TH1="ออโต้คลิกมินิเกม", TH2="ออโต้กดวงกลมๆที่ขึ้้นตรงจอเวลาหาไข่หรือเล่นอีเว้น", Bindable="+", Path="Client/AutoClickMinigame"},
                        {type="Toggle", EN="No Render", EN2="Change camera subject & disable 3D rendering", TH1="ปิดการ Render", TH2="เปลี่ยนกล้องและปิดการ render 3D", Bindable="+", Path="Client/No Render", Callback=function(state)
                            ClientCon["No Render"] = state;
                            H:Set3dRenderingEnabled(not state);
                            Cam.CameraSubject = if state then VOIDPART else Cam.CameraPart;
                        end},
                        {type="Toggle", EN="Full Bright", EN2="Make the game brighter, easier to see or look around.", TH1="แมพสว่าง", TH2="มองเห็นง่ายขึ้น", Bindable="+", Path="Client/Full Bright"},
                        {type="Toggle", EN="Float", EN2="Make your character float in the air.", TH1="ลอย", TH2="ทำให้ตัวละครเดินบนอากาศได้", Bindable="+", Path="Client/Float"},
                        {type="Toggle", EN="Noclip", EN2="Allow you to walk through walls.", TH1="เดินทะลุกำแพง", TH2="ต้องอธิบายด้วยหรอ", Bindable="+", Path="Client/Noclip"},
                        {type="Slider", EN="Walk Speed", EN2="Change the speed of your walk.", TH1="ความเร็วในการเดิน", TH2="ปรับความเร็วการเดิน", Value={Min=1, Max=100}, Path="Client/WalkSpeed", Callback=function(value)
                            ClientCon.WalkSpeed = value;
                            ClientPackage.SetWalkSpeed(value)
                        end},
                        {type="Toggle", EN="Enable Walk Speed", EN2="Enable walk speed modification.", TH1="เปิดใช้งานความเร็วในการเดิน", TH2="ปรับความเร็วในการเดิน", Bindable="+", Path="Client/Enable WalkSpeed", Callback=function(state)
                            ClientCon["Enable WalkSpeed"] = state;
                            ClientPackage.RunWalkSpeed(state);
                        end},
                        {type="Slider", EN="Teleport Walk Speed", EN2="Change the speed of teleport walk.", TH1="ความเร็วในการเดินแบบวาร์ป", TH2="ปรับความเร็วในการเดินแบบวาร์ป", Value={Min=1, Max=10}, Path="Client/TeleportWalk Speed"},
                        {type="Toggle", EN="Enable Teleport Walk", EN2="Enable teleport walk.", TH1="เปิดใช้งานเดินแบบวาร์ป", TH2="เปิดใช้งานเดินโดยการวาร์ปไปเรื่อยๆ", Bindable="+", Path="Client/Enable TeleportWalk"},
                        {type="Slider", EN="Jump Power", EN2="Change the power of your jump.", TH1="ความแรงในการกระโดด", TH2="ปรับความแรงในการกระโดด", Value={Min=1, Max=300}, Path="Client/JumpPower"},
                        {type="Toggle", EN="Enable Jump Power", EN2="Enable jump power modification.", TH1="เปิดใช้งานความแรงในการกระโดด", TH2="ปรับความแรงในการกระโดด", Bindable="+", Path="Client/Enable JumpPower"},
                        {type="Slider", EN="Fly Speed", EN2="Change the speed of your flight.", TH1="ความเร็วในการบิน", TH2="ปรับความเร็วในการบิน", Value={Min=1, Max=10}, Path="Client/FlySpeed"},
                        {type="Toggle", EN="Enable Fly", EN2="Allow you to fly.", TH1="บิน", TH2="บินได้", Bindable="+", Path="Client/Enable Fly"},
                    }, Title="Client", Open=true};
                }};
            };
            DragonTab = {
                {type="Toggle", EN="Godmode", EN2="Immune to mobs and 'some' boss.", TH1="อมตะ", TH2="มอนและบอสบางตัวตีไม่เข้า", Path="Godmode"},
            };
            EconomyTab = {
                {type="Dropdown", EN="Select Mode", EN2="Select which Mode you want to use.", TH1="เลือกโหมด", TH2="เลือกว่าจะใช้โหมดไหน", Values={"Food", "Resources"}, Path="SellMode"},
                {type="Dropdown", EN="Select World", EN2="Sell foods/resources depend on your selected world.", TH1="เลือกโลก", TH2="ขายของตามโลกที่คุณเลือก", Values={"Lobby", "Grassland", "Jungle", "Volcano", "Tundra", "Ocean", "Desert", "Fantasy", "Toxic", "Prehistoric", "Shinrin"}, Path="SelectWorld"},
                {type="Toggle", EN="Allow Lobby Teleport", EN2="Allow the script to teleport to lobby when hit backpack limit.", TH1="อนุญาตให้วาปกลับล็อบบี้", TH2="วาปไปล็อบบี้เมื่อเต็มกระเป๋า", Path="AllowLobbyTP"},
                {type="Toggle", EN="Allow World Teleport", EN2="Allow the script to teleport to selected world after selling.", TH1="อนุญาตให้วาปไปโลก", TH2="วาปไปโลกที่เลือกไว้หลังจากขายของเสร็จ", Path="AllowWorldTP"},
                {type="Toggle", Title="Auto Sell", TH1="ออโต้ขาย", TH2="ขายของอัตโนมัติ", Path="AutoSell"},
            };
            EventsTab = (CurrentWorld == "Solstice2026" and {
                {type="Toggle", EN="Auto Sunflower", EN2="Automatically <font color=\"rgb(255, 51, 51)\">collect water essence</font> & water the sunflower.", TH1="ออโต้ดอกทานตะวัน", TH2="เก็บน้ำและรดดอกทานตะวันอัตโนมัติ", Path="Solstice/AutoSunflower"},
                {type="Toggle", EN="Auto Collect Water Essencse", EN2="Automaticall collect water essence. <font color=\"rgb(255, 51, 51)\">Do not stack this with 'Auto Sunflower'.</font>", TH1="เก็บน้ำอัตโนมัติ", TH2="เก็บน้ำอัตโนมัติ อย่าใช้ร่วมกับออโต้ทานตะวัน", Path="Solstice/AutoCollectWater"}, {type="Space"},
                {type="Toggle", EN="Auto Whack A Mole", EN2="Automatically whack a mole.", TH1="ออโต้ทุบตัวตุ่น", TH2="ทุบตัวตุ่นอัตโนมัติ", Path="Solstice/AutoWhackAMole"},
                {type="Toggle", EN="Auto Star Catcher", EN2="Automatically catch stars.", TH1="ออโต้เก็บดาว", TH2="เก็บดาวอัตโนมัติ", Path="Solstice/AutoStarCatcher"},
            }) or {};
            LevelTab = {
                {type="Toggle", EN="Bond", EN2="You need to be in petting mode for it to work.", TH1="ความผูกพัน", TH2="ต้องอยู่ในโหมดลูบหัวมังกร", Path="Bond"}, {type="Space"},
                {type="Toggle", EN="Tracking", EN2="You need to be near any egg.", TH1="ระดับการติดตาม", TH2="ต้องอยู่ใกล้ๆไข่", Path="Tracking"}, {type="Space"},
                {type="Dropdown", EN="Mode", EN2="", Values={"Flying", "Ground"}, TH1="เลือกโหมด", TH2="", Path="RidingMode"},
                {type="Toggle", EN="Riding", EN2="", TH1="ระดับการขี่", TH2="", Path="Riding"},
            };
            FishTab = {
                {type="Button", EN="Teleport To Zone", EN2="Teleport to a fishing zone", TH1="วาปไปโซนตกปลา", TH2="วาปไปที่โซนสำหรับตกปลา", Callback=Functions.FishingZone},
                {type="Toggle", EN="Auto Fish", EN2="Auto fishing", TH1="ออโต้ตกปลา", TH2="ออโต้ตกปลา", Bindable="+", Path="AutoFish"}, {type="Space"}, {type="Space"},
                {type="Toggle", EN="Legendary Potion Only", EN2="Only fish legendary potions", TH1="ตกเฉพาะโพชั่นในตำนาน", TH2="ตกเฉพาะโพชั่นในตำนาน", Path="LegendPotionOnly"}, {type="Space"}, {type="Space"},
                (Analytics3 and {} or NonAnalytics3),
            };
            EggTab = {
                {type="Toggle", EN="Use Axcel", EN2="Usage of acceleration module which required high FPS for the smoothness", TH1="ใช้ Axcel", TH2="การเร่งความเร็วที่ต้องใช้ FPS สูง", Path="UseAxcel"}, {type="Space"}, {type="Space"},
                {type="Toggle", EN="Auto Collect", EN2="Teleport & collect eggs. <font color=\"rgb(255, 51, 51)\">Don't use this with 'Auto Click Minigame'</font>.", TH1="ออโต้เก็บ", TH2="วาปเก็บไข่", Bindable="+", Path="AutoCollect"}, {type="Space"}, {type="Space"},
                {type="Toggle", EN="ESP", EN2="Show egg boxes.", TH1="ESP ไข่", TH2="มองเห็นไข่", Bindable="+", Path="ESP", Callback=function(state)
                    EggCon.ESP = state; if not state then
                        ESPF.Visible("Eggs", false);
                    end;
                end},
                {type="Toggle", EN="Show Text", EN2="Show text on ESP boxes.", TH1="โชว์ข้อความ", TH2="แสดงข้อความบน ESP ไข่", Path="ShowText"}, {type="Space"}, {type="Space"},
            };
            MobTab = {
                {type="Toggle", EN="Use Axcel", EN2="Usage of acceleration module which required high FPS for the smoothness", TH1="ใช้ Axcel", TH2="การเร่งความเร็วที่ต้องใช้ FPS สูง", Path="UseAxcel"}, {type="Space"}, {type="Space"},
                {type="Toggle", EN="Auto Farm", EN2="Teleport & kill mobs", TH1="ออโต้ฟาร์ม", TH2="วาปฆ่ามอน", Bindable="+", Path="AutoFarm"}, {type="Space"}, {type="Space"},
            };
            FoodTab = {
                {type="Toggle", EN="Use Axcel", EN2="Usage of acceleration module which required high FPS for the smoothness", TH1="ใช้ Axcel", TH2="การเร่งความเร็วที่ต้องใช้ FPS สูง", Path="UseAxcel"}, {type="Space"}, {type="Space"},
                {type="Toggle", EN="Auto Collect", EN2="Teleport & collect foods.", TH1="ออโต้เก็บ", TH2="วาปเก็บอาหาร", Bindable="+", Path="AutoCollect"}, {type="Space"}, {type="Space"},
                {type="Toggle", EN="ESP", EN2="Show food boxes.", TH1="ESP อาหาร", TH2="มองเห็นอาหาร", Bindable="+", Path="ESP", Callback=function(state) FoodCon.ESP = state; if not state then ESPF.Visible("Food", false); end; end},
                {type="Toggle", EN="Show Text", EN2="Show text on ESP boxes.", TH1="โชว์ข้อความ", TH2="แสดงข้อความบน ESP อาหาร", Path="ShowText"}, {type="Space"}, {type="Space"},
            };
            ResourceTab = {
                {type="Toggle", EN="Use Axcel", EN2="Usage of acceleration module which required high FPS for the smoothness", TH1="ใช้ Axcel", TH2="การเร่งความเร็วที่ต้องใช้ FPS สูง", Path="UseAxcel"}, {type="Space"}, {type="Space"},
                {type="Toggle", EN="Auto Collect", EN2="Teleport & collect resources.", TH1="ออโต้เก็บ", TH2="วาปเก็บทรัพยากร", Bindable="+", Path="AutoCollect"}, {type="Space"}, {type="Space"},
                {type="Toggle", EN="ESP", EN2="Show resource boxes.", TH1="ESP ทรัพยากร", TH2="มองเห็นทรัพยากร", Bindable="+", Path="ESP", Callback=function(state) ResourceCon.ESP = state; if not state then ESPF.Visible("Resource", false); end; end},
                {type="Toggle", EN="Show Text", EN2="Show text on ESP boxes.", TH1="โชว์ข้อความ", TH2="แสดงข้อความบน ESP ทรัพยากร", Path="ShowText"}, {type="Space"}, {type="Space"},
            };
            BoneMealTab = {
                {type="Toggle", EN="Use Axcel", EN2="Usage of acceleration module which required high FPS for the smoothness", TH1="ใช้ Axcel", TH2="การเร่งความเร็วที่ต้องใช้ FPS สูง", Path="UseAxcel"}, {type="Space"}, {type="Space"},
                {type="Toggle", EN="Auto Collect", EN2="Teleport & collect bone meals.", TH1="ออโต้เก็บ", TH2="วาปเก็บกระดูก", Bindable="+", Path="AutoCollect"}, {type="Space"}, {type="Space"},
                {type="Toggle", EN="ESP", EN2="Show bone meal boxes.", TH1="ESP กระดูก", TH2="มองเห็นกระดูก", Bindable="+", Path="ESP", Callback=function(state) BoneMealCon.ESP = state; if not state then ESPF.Visible("BoneMeal", false); end; end},
                {type="Toggle", EN="Show Text", EN2="Show text on ESP boxes.", TH1="โชว์ข้อความ", TH2="แสดงข้อความบน ESP กระดูก", Path="ShowText"}, {type="Space"}, {type="Space"},
            };
            TreasureTab = {
                {type="Toggle", EN="Use Axcel", EN2="Usage of acceleration module which required high FPS for the smoothness", TH1="ใช้ Axcel", TH2="การเร่งความเร็วที่ต้องใช้ FPS สูง", Path="UseAxcel"}, {type="Space"}, {type="Space"},
                {type="Toggle", EN="Auto Collect", EN2="Teleport & collect treasures.", TH1="ออโต้เก็บ", TH2="วาปเก็บสมบัติ", Bindable="+", Path="AutoCollect"}, {type="Space"}, {type="Space"},
                {type="Toggle", EN="ESP", EN2="Show treasure boxes.", TH1="ESP สมบัติ", TH2="มองเห็นสมบัติ", Bindable="+", Path="ESP", Callback=function(state) TreasureCon.ESP = state; if not state then ESPF.Visible("Chest", false); end; end},
                {type="Toggle", EN="Show Text", EN2="Show text on ESP boxes.", TH1="โชว์ข้อความ", TH2="แสดงข้อความบน ESP สมบัติ", Path="ShowText"}, {type="Space"}, {type="Space"},
            };
        };

        CoruTask.New("Non-Standard Fly", function()
            local VEC9E9, BG, BV = Vec3(9e9, 9e9, 9e9), nil, nil;
            local FSpeed, GVelo = 0, nil; while true do
                if not ClientCon["Enable Fly"] or not HumRSelf or not HumRSelf.Parent or CoreDestroyed then
                    Control = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0};
                    FSpeed = 0; if BG then BG:Destroy(); end; if BV then BV:Destroy(); end;
                    if GVelo then GVelo.Parent = HumRSelf; end; CoruTask.Close("Non-Standard Fly");
                end;

                if not GVelo then
                    GVelo = FindFirstChildOfClass(HumRSelf, "BodyVelocity");
                    if not GVelo then twait(0.1); continue; end;
                end;

                if GVelo.Parent ~= nil then
                    GVelo.Parent = nil;
                end;
                
                if not BG or not BG.Parent then
                    BG = Instancen("BodyGyro", HumRSelf);
                    BV = Instancen("BodyVelocity", HumRSelf);
                    BG.CFrame = HumRSelf.CFrame;
                    BV.MaxForce = VEC9E9;
                    BG.MaxTorque = VEC9E9;
                    BV.Velocity = VEC0;
                    BG.P = 9e4;
                end;
    
                local direction, Speed = ControlModule:GetMoveVector(), ClientCon.FlySpeed;
                Control.L = direction.X < 0 and direction.X * Speed or 0;
                Control.R = direction.X > 0 and direction.X * Speed or 0;
                Control.F = direction.Z < 0 and -direction.Z * Speed or 0;
                Control.B = direction.Z > 0 and -direction.Z * Speed or 0;

                if (Control.L + Control.R) ~= 0 or (Control.F + Control.B) ~= 0 or (Control.Q + Control.E) ~= 0 then
                    FSpeed = 50;
                elseif not (Control.L + Control.R ~= 0 or Control.F + Control.B ~= 0 or (Control.Q + Control.E) ~= 0) and FSpeed ~= 0 then
                    FSpeed = 0;
                end;

                if (Control.L + Control.R) ~= 0 or (Control.F + Control.B) ~= 0 or (Control.Q + Control.E) ~= 0 then
                    BV.Velocity = ((Cam.CFrame.LookVector * (Control.F + Control.B)) + 
                        ((Cam.CFrame * CFr(Control.L + Control.R, 
                        (Control.F + Control.B + Control.Q + Control.E) * 0.2, 0).p) - 
                        Cam.CFrame.p)) * FSpeed;
                else
                    BV.Velocity = VEC0;
                end; twait(0.1);
            end;
        end);
        CoruTask.New("Shared-Automation", function()
            setthread(8); warn(pcall(function() while true do
                if not (EggCon.AutoCollect or FoodCon.AutoCollect or ResourceCon.AutoCollect or BoneMealCon.AutoCollect or MobCon.AutoFarm or TreasureCon.Auto or EcoCon.AutoSell) or CoreDestroyed then
                    CoruTask.Close("Shared-Automation");
                end;

                if EcoCon.AutoSell then Functions:AutoSell(REQ.Items); end;
                if EggCon.AutoCollect then Functions:AutoEggs(); end;
                if FoodCon.AutoCollect then Functions:AutoNodes("Food", FoodCon); end;
                if ResourceCon.AutoCollect then Functions:AutoNodes("Resources", ResourceCon); end;
                if BoneMealCon.AutoCollect then Functions:AutoNodes("BoneMeal", BoneMealCon); end;
                if TreasureCon.AutoCollect then Functions:AutoChest(REQ.ChestService); end;
                if MobCon.AutoFarm then Functions:AutoMobs(); end;

                twait(0.1);
            end; end));
        end);
        CoruTask.New("Shared-ESP", function()
            local ESPEggs = Functions.ESPEggs;
            local ESPNodes = Functions.ESPNodes;
            local ESPChests = Functions.ESPChests;
            warn(pcall(function() while true do
                if not (EggCon.ESP or FoodCon.ESP or ResourceCon.ESP or BoneMealCon.ESP or TreasureCon.ESP) or CoreDestroyed then
                    CoruTask.Close("Shared-ESP");
                end;

                if EggCon.ESP then ESPEggs(); end;
                if FoodCon.ESP then ESPNodes("Food", FoodCon); end;
                if ResourceCon.ESP then ESPNodes("Resources", ResourceCon); end;
                if BoneMealCon.ESP then ESPNodes("BoneMeal", BoneMealCon); end;
                if TreasureCon.ESP then ESPChests(REQ.ChestService); end;

                twait(0.1);
            end; end));
        end)
        CoruTask.New("Unified-Leveling", function()
            local AutoLevel = Functions.AutoLevel; while true do
                if not (LevelCon.Bond or LevelCon.Tracking or LevelCon.Riding) or CoreDestroyed then
                    CoruTask.Close("Unified-Leveling");
                end;
                
                if LevelCon.Bond then AutoLevel("Bond"); end;
                if LevelCon.Tracking then AutoLevel("Track"); end;
                if LevelCon.Riding then AutoLevel("Ride"); end;

                twait(0.1);
            end;
        end);
        CoruTask.New("Unified-Fishing", function()
            while true do
                if not FishCon.AutoFish or CoreDestroyed then
                    CoruTask.Close("Unified-Fishing");
                end; if FishingClient then
                    if FishingClient.InZone then
                        if not FishingClient.Fishing then
                            FishingClient:StartCasting();
                        end;
                    end;
                end;
                twait(0.1);
            end;
        end);
        CoruTask.New("Solstice-Main", function()
            if CurrentWorld ~= "Solstice2026" then
                return;
            end; warn(pcall(function() while true do
                if not (EventsCon.Solstice.AutoCollectWater or EventsCon.Solstice.AutoSunflower or EventsCon.Solstice.AutoStarCatcher) or CoreDestroyed then
                    CoruTask.Close("Solstice-Main");
                end;
                
                if EventsCon.Solstice.AutoSunflower then
                    Functions:Solstice_AutoFlower();
                else
                    if EventsCon.Solstice.AutoCollectWater then
                        Functions:Solstice_AutoWater(1000, 1000);
                    end;
                end;
                if EventsCon.Solstice.AutoStarCatcher then
                    Functions:Solstice_StarCatch();
                end;

                twait(0.1);
            end; end));
        end);

        local LSecureUI = function()
            local WindUI = WindLib();
            local Window = WindUI:CreateWindow({
                Title = "Universal",
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
            local Tabs = {
                Welcome = Window:Tab({ Title = "Welcome", Icon = "smile" }),
                Client = LoaderSettings.AllowClientTab and Window:Tab({ Title = "Client", Icon = "user" }),
                Dragon = Window:Tab({ Title = "Dragon", Icon = "flame" }),
                Div1 = Window:Divider(),
                Economy = Window:Tab({ Title = "Economy", Icon = "hand-coins" }),
                Events = ScriptData.AutoData.EventsTab and Window:Tab({ Title = "Events", Icon = "sparkles" }),
                
                Div2 = Window:Divider(),
                Level = Window:Tab({ Title = "Level", Icon = "star" }),
                Fish = Window:Tab({ Title = "Fish", Icon = "fish" }),
                Egg = Window:Tab({ Title = "Egg", Icon = "egg" }),
                Mob = Window:Tab({ Title = "Mob", Icon = "cat" }),
                Food = Window:Tab({ Title = "Food", Icon = "apple" }),
                Resource = Window:Tab({ Title = "Resource", Icon = "leaf" }),
                BoneMeal = Window:Tab({ Title = "Bone Meal", Icon = "bone" }),
                Treasure = Window:Tab({ Title = "Treasure", Icon = "gem" }),

                ExtraDiv = Window:Divider(),
                AddOn = LoaderSettings.AllowAddOn and Window:Tab({ Title = "AddOn", Icon = "box" }),
                Themes = LoaderSettings.AllowThemesTab and Window:Tab({ Title = "Themes", Icon = "palette" }),
                Core = Window:Tab({ Title = "Core Settings", Icon = "settings" }),
            }; IntroLib.Init(WindUI, Tabs.Welcome); IntroLib:Tutorial(WindUI);
            Windy:CreateComponent(Tabs.Client, ScriptData.AutoData.ClientTab, "Client");
            Windy:CreateComponent(Tabs.Core, CorePackage());

            Windy:CreateComponent(Tabs.Dragon, ScriptData.AutoData.DragonTab, "Dragon");
            Windy:CreateComponent(Tabs.Economy, ScriptData.AutoData.EconomyTab, "Economy");
            Windy:CreateComponent(Tabs.Level, ScriptData.AutoData.LevelTab, "Level");
            Windy:CreateComponent(Tabs.Fish, ScriptData.AutoData.FishTab, "Fish");
            Windy:CreateComponent(Tabs.Egg, ScriptData.AutoData.EggTab, "Egg");
            Windy:CreateComponent(Tabs.Mob, ScriptData.AutoData.MobTab, "Mob");
            Windy:CreateComponent(Tabs.Food, ScriptData.AutoData.FoodTab, "Food");
            Windy:CreateComponent(Tabs.Resource, ScriptData.AutoData.ResourceTab, "Resource");
            Windy:CreateComponent(Tabs.BoneMeal, ScriptData.AutoData.BoneMealTab, "BoneMeal");
            Windy:CreateComponent(Tabs.Treasure, ScriptData.AutoData.TreasureTab, "Treasure");

            if Tabs.Events then Windy:CreateComponent(Tabs.Events, ScriptData.AutoData.EventsTab, "Events"); end;

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
                        if LoaderSettings.DragonAdventure.AutoJoinPrivateServer then
                            if CurrentWorld ~= "Lobby" then
                                if not FindFirstChild(W, "IsPrivateServer") then
                                    return R.AFKEvent:FireServer(), twait(100);
                                end;
                            end;
                        end;
                        if ClientCon["Enable Fly"] then
                            CoruTask.Handle("Non-Standard Fly");
                        end;
                        if Config.Fish.AutoFish then
                            CoruTask.Handle("Unified-Fishing");
                        end;
                        if LevelCon.Bond or LevelCon.Tracking or LevelCon.Riding then
                            CoruTask.Handle("Unified-Leveling");
                        end;
                        if EggCon.AutoCollect or FoodCon.AutoCollect or ResourceCon.AutoCollect or BoneMealCon.AutoCollect or TreasureCon.AutoCollect or MobCon.AutoFarm or EcoCon.AutoSell then
                            CoruTask.Handle("Shared-Automation");
                        end;
                        if EggCon.ESP or FoodCon.ESP or ResourceCon.ESP or BoneMealCon.ESP or TreasureCon.ESP then
                            CoruTask.Handle("Shared-ESP");
                        end;
                        if EventsCon.Solstice.AutoCollectWater or EventsCon.Solstice.AutoSunflower or EventsCon.Solstice.AutoStarCatcher then
                            CoruTask.Handle("Solstice-Main");
                        end; twait(0.1);
                    end;
                end);

                CoreConnection[1] = H.Stepped:Connect(function()
                    if CoreDestroyed and CoreConnection[1] then
                        CoreConnection[1]:Disconnect(); CoreConnection[1] = nil;
                        if CoreDestroyed and CoreConnection[3] then
                            CoreConnection[3]:Disconnect(); CoreConnection[3] = nil;
                        end; return;
                    end;

                    if not Seat.Parent and HumSelf.Parent then
                        Seat = HumSelf.SeatPart or EMPTY_OBJECT;
                    end;

                    ClientPackage.UpdatePosition(ClientCon.Float, ForceFloat, HumRSelf);
                    ClientPackage.Noclip(ClientCon.Noclip, selc and GetDescendants(selc));
                    ClientPackage.Brightness(ClientCon["Full Bright"]);
                    ClientPackage.SetJumpPower(ClientCon["Enable JumpPower"], ClientCon.JumpPower, HumSelf);
                end);
                CoreConnection[2] = H.Heartbeat:Connect(function(delta)
                    if CoreDestroyed and CoreConnection[2] then
                        CoreConnection[2]:Disconnect(); CoreConnection[2] = nil;
                        return;
                    end;

                    if ClientCon["Enable TeleportWalk"] and selc and HumSelf and HumSelf.MoveDirection.Magnitude > 0 then
                        selc:TranslateBy(HumSelf.MoveDirection * ClientCon["TeleportWalk Speed"] * delta * 10);
                    end;
                end);
                CoreConnection[3] = selff.CharacterAdded:Connect(function(char)
                    selc = char;
                    HumSelf = WaitForChild(char, "Humanoid", 9e9);
                    HumRSelf = WaitForChild(char, "HumanoidRootPart", 9e9);
                    ClientPackage:WalkSpeedC(HumSelf);
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
                    selc = selff.Character;
                    HumSelf = WaitForChild(selc, "Humanoid", 9e9);
                    HumRSelf = WaitForChild(selc, "HumanoidRootPart", 9e9);
                    ClientPackage:WalkSpeedC(HumSelf);
                end;

                if not CoruTask.Intialized then
                    local isSyncedF = Functions.isSynced;

                    Functions:SetSync();
                    CommonF.Init(GetService(game, "VirtualInputManager"));

                    if not isSyncedF() then
                        WindUI:Notify({
                            Title = "<font color='rgb(255, 255, 0)'>Syncing</font>",
                            Content = "Script is waiting for game data to be synced.",
                            Icon = "circle-alert",
                            Duration = 20,
                        }); GG.LoadingSignal:Fire("Waiting for Data to be synced.");
                        repeat twait(0.1); until isSyncedF();
                    end;
                    
                    local Items = require(WaitForChild(WaitForChild(RStorage, "Items", 9e9), "Items", 9e9));
                    local HarvestClass = require(WaitForChild(RepFolder, "HarvestNodeClassClient", 9e9));
                    local ChestService = require(WaitForChild(RepFolder, "TreasureChestsService", 9e9));
                    local ChestClient = require(WaitForChild(RepFolder, "TreasureChestsClient", 9e9));
                    local EggsClient = require(WaitForChild(RepFolder, "EggsClient", 9e9));
                    local AccelTween = require(WaitForChild(RepFolder, "AccelTween", 9e9));
                    local AntiAFKClientHelper = FindFirstChild(PSS, "AntiAFKClientHelper");
                    local GCs, UPs, NodeClass = getgc(true), nil, nil;
                    local UPs2 = getupvalues(ChestClient.SonarStart);

                    for i=1, #UPs2 do
                        local v=UPs2[i]; if type(v) == 'number' then
                            ChestService.TotalChest = v;
                            break;
                        end;
                    end;
                    
                    repeat
                        for i=1, #GCs do
                            if BreathData and FishingClient and NodeClass and REQ.Riding and REQ.DragonClass and UPs ~= nil then break; end;
                            local v=GCs[i]; if type(v) == 'table' then
                                if rawget(v, "BreathFuelValue") and v.IsLocalPlayer then
                                    BreathData = v;
                                elseif rawget(v, "ReelSignal") and rawget(v, "SnaggedSignal") then
                                    FishingClient = v;
                                elseif rawget(v, "new") and rawget(v, "_getPositionForPhase") then
                                    NodeClass = v;
                                    UPs = getupvalues(NodeClass.new);
                                elseif rawget(v, "GetClosest") and rawget(v, "_isMovementType") then
                                    REQ.Riding = v;
                                elseif rawget(v, "_setFly") then
                                    REQ.DragonClass = v;
                                end;
                            end;
                        end; if not UPs then
                            if CurrentWorld == "Solstice2026" then
                                break;
                            end; GCs = getgc(true);
                        else
                            break;
                        end; twait(0.1);
                    until BreathData and FishingClient and NodeClass and REQ.Riding and REQ.DragonClass and UPs ~= nil;
                        
                    for i=1, #UPs do
                        local v=UPs[i]; if type(v) == 'table' then
                            for Bill, data in pairs(v) do
                                if typeof(Bill) ~= 'Instance' then
                                    break;
                            end; ANodes = v; break;
                            end;
                        end;
                    end;

                    if FishingClient then
                        local o;o=LowerC(FishingClient.StartFishing, function(self, p2, p3)
                            if not FishCon.LegendPotionOnly then return o(self, p2, p3); end;
                            local FishData = p3 and p3.FishData; if FishData then
                                if not strfind(FishData.Name, "Potion") or FishData.Rarity ~= "Legendary" then
                                    tdefer(function()
                                       while FishingClient.Fishing do
                                            twait(1); FishingClient:EndFishing();
                                        end
                                    end);
                                end;
                            end;
                            return o(self, p2, p3);
                        end);

                        local o;o=LowerC(FishingClient.Click, function(self, ...)
                            if not FishCon.AutoFish or CoreDestroyed then return o(self, ...); end;
                            local gui = FindFirstChild(PSG, "FishingGui");
                            if gui and FindFirstChild(gui, "ContainerFrame") then
                                local reelingFrame = gui.ContainerFrame.ReelingFrame;
                                reelingFrame.SpinReelLabel.Rotation = reelingFrame.SpinRingFrame.Rotation;
                            end; return o(self, ...);
                        end);

                        FishingClient.SnaggedSignal:Connect(function()
                            if not FishCon.AutoFish or CoreDestroyed then return; end;
                            twait(1); FishingClient.ReelSignal:Fire();
                            tk.spawn(function()
                                while not FishingClient.Reeling do
                                    twait(0.05);
                                end; while FishingClient.Reeling do
                                    twait(1); FishingClient:Click();
                                end;
                            end);
                        end);
                    end;

                    local o1;o1=LowerC(require(R.Gamebeast.Infra.Shared.Modules.MetricCollector).ReportMetric, function(self, metric, value)
                        if metric == "PhysicsFps" then
                            local fakeFps; if math.random() <= 0.10 then
                                fakeFps = 58 + math.random() * 1.8;
                            else
                                fakeFps = 60;
                            end; return o1(self, metric, fakeFps);
                        end; return o1(self, metric, value);
                    end);
                    local o2;o2=LowerC(require(RepFolder.MobProjectile).Tick, function(p1,p2)
                        if DragonCon.Godmode then
                            p1:Destroy();
                        end; return o2(p1,p2);
                    end); if AntiAFKClientHelper then
                        AntiAFKClientHelper.Enabled = false;
                    end; if getconnections then
                        for _, v in ipairs(getconnections(selff.Idled)) do
                            v:Disable();
                        end;
                    end;

                    PSG.NodeGui.BoostFrame.ChildAdded:Connect(function(v)
                        if CoreDestroyed or not ClientCon.AutoClickMinigame then return; end;
                        if IsA(v, "Frame") and FindFirstChild(v, "ClickButton") then
                            if getconnections then
                                twait(math.max(0.3 + mclamp(Functions.GetPing(), 0, 0.1)));
                                for i,v in next, getconnections(v.ClickShadowButton.MouseButton1Down) do
                                    v.Function();
                                end; return;
                            end;
                        end;
                    end);

                    Functions:SolsticeInit(); 
                    
                    EggNodes = getupvalue(HarvestClass.getNodeFromModel, 1);
                    SmoothX = AccelTween.new(3000);
                    SmoothY = AccelTween.new(3000);
                    SmoothZ = AccelTween.new(3000);
                    VOIDPART.Position = Vec3(0, 9e9, 0);
                    VOIDPART.Anchored = true;
                    VOIDPART.Parent = W;

                    Functions.GameDataInit(tble.clone(Items));
                    Functions.ChestInit(ChestService);
                    
                    REQ.AccelTween = AccelTween;
                    REQ.ChestService = ChestService;
                    GG.InitGameData = Functions.RoamInitialization;
                    Functions.TeleportRE = WaitForChild(RRemotes, "WorldTeleportRemote");
                    Functions.WorldData = require(WaitForChild(WaitForChild(RStorage, "Worlds"), "Worlds"));
                    if LoaderSettings.DragonAdventure.RoamInitOnStartUp then Functions:RoamInitialization(); end;

                    CoruTask.Init(WindUI);
                    CoruTask.Intialized = true;
                end;
            end); if OneRunCallMain then
                return true, GG.LoadingSignal:Fire(100);
            end; return false, warn(OneRunErrorMain);
        end; GG.LSecureLoad = LSecureLoad; return LSecureLoad;
    end;
};