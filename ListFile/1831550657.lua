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

local IsA = game.IsA;
local twait = tk.wait;
local CFr = CFrame.new;
local strfind = str.find;
local Vec3 = Vector3.new;
local tblein = tble.insert;
local GetPivot = W.GetPivot;
local PivotTo = W.PivotTo;
local GetAttribute = game.GetAttribute;
local SetAttribute = game.SetAttribute;
local WaitForChild = game.WaitForChild;
local FindFirstChild = game.FindFirstChild;
local FindFirstChildOfClass = game.FindFirstChildOfClass;

local CF030 = CFr(0,3,0);
local CFRHY = CFr(0,100,0);
local RED = Col3.new(1,0,0);
local BLUE = Col3.new(0,0,1);
local GREEN = Col3.new(0,1,0);
local PURPLE = Col3.new(1,0,1);
local YELLOW = Col3.new(1,1,0);
local SAFESPOT = CFr(-3885, 3988, 3456);
local EMPTY_OBJECT = {Parent=nil, SeatPart=nil};
local PERSISTENT = Enum.ModelStreamingMode.Persistent;

local ScriptData = {};
local Config = GG.Configs or {};

Config.Client = Config.Client or {};
Config.Client.Client = Config.Client.Client or {};
Config.Dragon = Config.Dragon or {};
Config.Dragon.Life = Config.Dragon.Life or {};
Config.Dragon.Stats = Config.Dragon.Stats or {};
Config.Dragon.Godmode = Config.Dragon.Godmode or {};
Config.Dragon.Mood = Config.Dragon.Mood or {};
Config.Automation = Config.Automation or {};
Config.Combat = Config.Combat or {};
Config.Combat.DMGAura = Config.Combat.DMGAura or {};
Config.Combat.Death = Config.Combat.Death or {};
Config.Combat.Kill = Config.Combat.Kill or {};
Config.Teleport = Config.Teleport or {};
Config.ESP = Config.ESP or {};
Config.ESP.ShowText = Config.ESP.ShowText or {
    Players = true;
    Foods = true;
    Lakes = true;
    NPCs = true;
    GachaTokens = true;
};
Config.ESP.TextSize = Config.ESP.TextSize or {
    Players = 1;
    Foods = 15;
    Lakes = 7;
    NPCs = 1;
    GachaTokens = 20;
};
Config.ESP.TextScale = Config.ESP.TextScale or {
    Players = true;
    Foods = false;
    Lakes = true;
    NPCs = true;
    GachaTokens = true;
};
Config.ESP.TextColor = Config.ESP.TextColor or {
    Players = RED;
    Foods = GREEN;
    Lakes = BLUE;
    NPCs = YELLOW;
    GachaTokens = PURPLE;
};

return {
    Version = "CoS_JYRS_V3_This_IsA_Force_V3_ToTheDate.01";
    Function = function(CorePackage, WindLib, IntroLib, Windy, ClientPackage, CoruTask, CommonF, ESPF)
        local CoreConnection    = {};
        local CoreDestroyed     = false;

        local PlayerList        = {};
        local GObject           = {Mood={}};
        local Util              = {};
        local Nodes             = {};
        local Data              = {};
        local Cam               = W.CurrentCamera;
        local selff             = P.LocalPlayer;
        local PSG               = selff.PlayerGui;
        local selc              = selff.Character or EMPTY_OBJECT;
        local HumRSelf          = selc.Parent and FindFirstChild(selc, "HumanoidRootPart") or EMPTY_OBJECT;
        local PSS               = WaitForChild(selff, "PlayerScripts", 9e9);
        local ControlModule     = require(WaitForChild(WaitForChild(PSS, "PlayerModule", 9e9), "ControlModule", 9e9));

        local VOIDPART          = Instancen("Part");
        local SKYPART           = Instancen("Part");

        local cmdm              = selff:GetMouse();
        local ClientCon         = Config.Client.Client;
        local DragonCon         = Config.Dragon;
        local AutomationCon     = Config.Automation;
        local CombatCon         = Config.Combat;
        local TeleportCon       = Config.Teleport;
        local ESPCon            = Config.ESP;
        local FoodList          = {"Grass", "Carcass", "Ribs", "Algae", "Grapes", "Seeweed", "Fruit"};

        local dist              = CommonF.dist;
        local Tween             = CommonF.Tween;

        local REQ               = {};
        local RE                = {};
        local Functions         = {};

        ClientCon.Gravity = ClientCon.Gravity or 192.8;
        ClientCon["TeleportWalk Speed"] = ClientCon["TeleportWalk Speed"] or 1;
        CombatCon.DMGAura.SelectTarget = CombatCon.DMGAura.SelectTarget or "All";
        CombatCon.DMGAura.CreatureRange = CombatCon.DMGAura.CreatureRange or 100;
        CombatCon.Death.Escape = CombatCon.Death.Escape or 30;
        CombatCon.Death.Return = CombatCon.Death.Return or 80;

        Functions.Tp = function(Pos, cd)
            return selc.Parent and PivotTo(selc, Pos), cd and twait(cd);
        end;
        Functions.GCValidate = function(GCs)
            for i=1, #GCs do
                local v=GCs[i]; if type(v) == 'table' then
                    if rawget(v, "StartEat") then
                        GObject.ClientCharacter = v;
                    elseif rawget(v, "GetFoodFromModel") then
                        GObject.LocateFood = v;
                    elseif rawget(v, "GetTargetWater") then
                        Util.WaterControl = v;
                    elseif rawget(v, "GetGroundPosition") then
                        Util.WayPointClient = v;
                    elseif rawget(v, "GetFromModel") and not rawget(v, "NPCRemoved") then
                        if not rawget(v, "CreateNestEgg") then
                            Util.ResourceControl = v;
                        end;
                    end;
                end;
            end;
        end;
        Functions.GameValidate = function()
            Util.Stamina = require(R._replicationFolder.StaminaTracker);
            Util.Oxygen = require(R._replicationFolder.OxygenTracker);
            REQ.ShoomPile = require(R._replicationFolder.ShoomPile);

            local UPs = getupvalues(GObject.ClientCharacter.StartEat); for i=1, #UPs do
                local v=UPs[i]; if type(v) == 'table' then
                    if rawget(v, "IsLocalPlayer") then
                        if not rawget(v, "Slot") then
                            GObject.LocalData = v;
                        end;
                    elseif rawget(v, "Notify") then
                        Util.NotiControl = v;
                    elseif rawget(v, "DrownRemote") then
                        RE = v;
                    elseif rawget(v, "BloodTrail") then
                        GObject.StatsData = v;
                    end;
                end;
            end;

            local UPs = getupvalues(GObject.LocateFood.new); for i=1, #UPs do
                local v=UPs[i]; if type(v) == 'table' then
                    if rawget(v, "_runActions") then
                        Util.ProxMenu = v; continue;
                    elseif rawget(v, "MinigamesData") then
                        GObject.ClientGameData = v; continue;
                    elseif rawget(v, "unlatchAll") then
                        Util.ActiveGrabUtils = v; continue;
                    end; for obj, data in pairs(v) do
                        if typeof(obj) == 'Instance' then
                            Nodes.Foods = v; break;
                        end;
                    end; if not Nodes.Foods then
                        local count = 0; for _,_ in pairs(v) do
                            count += 1;
                        end; if count == 0 then
                            Nodes.Foods = v;
                        end;
                    end;
                end;
            end;

            local Octree = getupvalue(Util.WaterControl.getWaterNearby, 1);
            Nodes.Resources = getupvalue(Util.ResourceControl.Destroy, 1);
            Nodes.Lakes = Octree:GetAllNodes();

            SKYPART.Anchored = true;
            SKYPART.Size = Vec3(100, 10, 100);
            SKYPART.CFrame = CFr(-3877, 3980, 3459);
            SKYPART.Parent = Cam;

            GObject.ShoomPile = REQ.ShoomPile.ALL_SHOOM_PILES;
            GObject.ProxActions = getupvalue(Util.ProxMenu.Destroy, 1);
            RE.StateAilment = WaitForChild(R.Remotes, "StateAilment", 9e9);
            RE.ResourceDamage = WaitForChild(R.Remotes, "ResourceDamageRemote", 9e9);
            RE.CharactersDamage = WaitForChild(R.Remotes, "CharactersDamageRemote", 9e9);
        end;
        Functions.GameViolation = function()
            local o;o=LowerC(Util.Stamina.Increment, function(self, p1)
                return o(self, if DragonCon.Stats.InfStamina then 100 else p1);
            end);
            local o;o=LowerC(Util.Oxygen.TryDecrement, function(p1)
                if DragonCon.Stats.InfOxygen then
                    rawset(p1, "Oxygen", p1.MaxOxygen);
                end; return o(p1);
            end);
            local o;o=LowerC(Util.WayPointClient.GetGroundPosition, function(p1)
                GObject.WayPos = CFr(p1); if TeleportCon.AutoTeleportMap then
                    tk.defer(function()
                        Functions.Tp(GObject.WayPos);
                    end);
                end; return o(p1);
            end);
        end;
        Functions.OnPlayersValidate = function(plr)
            if PlayerList[plr] or plr == selff then return; end;
            PlayerList[plr] = {
                Character = plr.Character;
                Connection = plr.CharacterAdded:Connect(function(char)
                    PlayerList[plr].Character = char;
                end);
            };
        end;
        Functions.OnPlayersInvalid = function(plr)
            PlayerList[plr] = nil;
        end;
        Functions.OnCharValidate = function(selc, isV)
            if isV then GG.LoadingSignal:Wait(); end; Data.Init = false;
            local GData = WaitForChild(selc, "Data", 9e9);
            local Ailment = WaitForChild(selc, "Ailments", 9e9);
            local CurrentCharacter = nil;
            
            Data.DataFt = GetAttribute(GData, "ft") or GData:GetAttributeChangedSignal("ft"):Once(function()
                Data.DataFt = GetAttribute(GData, "ft");
            end);

            while not (CurrentCharacter and CurrentCharacter.CharacterData and CurrentCharacter.CharacterData.GetWithModifiers) do
                twait(1); CurrentCharacter = GObject.LocalData:GetCurrentCharacter();
            end;

            Data.Ailment = Ailment;
            Data.CurrentCharacter = CurrentCharacter;
            Data.CurrentSlot = GObject.LocalData:GetCurrentSlot();
            Data.CharacterData = CurrentCharacter.CharacterData;

            GG.CurrentCharacter = Data.CharacterData;
            Data.Init = true;
        end;
        Functions.IsMaxFood = function(CurrentSlot, MaxFood, Percent)
            if not MaxFood then return false; end;
            local Food = FindFirstChild(CurrentSlot, "Food");
            return if not Percent then Food.Value >= MaxFood else (Food.Value / MaxFood * 100) >= Percent;
        end;
        Functions.IsMaxThirst = function(CurrentSlot, MaxWater, Percent)
            if not MaxWater then return false; end;
            local Water = FindFirstChild(CurrentSlot, "Water");
            return if not Percent then Water.Value >= MaxWater else (Water.Value / MaxWater * 100) >= Percent;
        end;
        Functions.AutoEat = function(self, Foods, CurrentSlot, CharacterData, DataFt)
            if type(DragonCon.Life.SelectFood) ~= 'string' then return; end;
            if not CharacterData or not CharacterData.GetWithModifiers then return; end;

            local MaxFood = CharacterData:GetWithModifiers("Appetite");
            if self.IsMaxFood(CurrentSlot, MaxFood) then return; end;
            
            local tbl={}; for obj, data in pairs(Foods) do
                if typeof(obj) == 'Instance' then
                    if strfind(obj.Name, "Corrupted") then continue; end;
                    if strfind(obj.Name, DragonCon.Life.SelectFood) then
                        tblein(tbl, {
                            Model = data.Model;
                            Diet = data.Diet;
                        });
                    end;
                end;
            end;

            for i=1, #tbl do
                local v=tbl[i]; if v.Model then
                    local Model = v.Model;
                    local Pos = GetPivot(Model);
                    if v.Diet == DataFt or DataFt == "Omnivore" then
                        self.IsEating = true;
                        while not self.IsMaxFood(CurrentSlot, MaxFood) and DragonCon.Life.AutoEat do
                            local FoodAmount = GetAttribute(Model, "Value");
                            if FoodAmount == 0 then break; end;
                            if dist(Pos.Position) >= 50 then self.Tp(Pos, 0.3); end;
                            twait(0.7); RE.FoodRemote:FireServer(Model);
                        end;
                        self.IsEating = false;
                    end;
                end;
            end;
        end;
        Functions.GetBestLake = function()
            local Octree = getupvalue(Util.WaterControl.getWaterNearby, 1);

            local Nearest, Dist = nil, 9e9;
            local Nodes = Octree:GetAllNodes(); for i=1, #Nodes do
                local Node=Nodes[i]; if Node then
                    local Object = Node._object;
                    if Object and Object.WaterPosition then
                        local Model = Object.Model;
                        
                        if not Model or GetAttribute(Model, "Water") < 20 then
                            continue;
                        end;

                        local Distance = dist(Object.WaterPosition);
                        if Distance < Dist then
                            Dist = Distance;
                            Nearest = Object;
                        end;
                    end;
                end;
            end;

            return Nearest;
        end;
        Functions.AutoDrink = function(self, CurrentSlot, CharacterData)
            if not CharacterData or not CharacterData.GetWithModifiers then return; end;
            local MaxHydrate = CharacterData:GetWithModifiers("ThirstAppetite");
            if self.IsMaxThirst(CurrentSlot, MaxHydrate) then return; end;

            local Closest = Functions.GetBestLake().Model;
            if not Closest then return; end;

            while not self.IsMaxThirst(CurrentSlot, MaxHydrate) and DragonCon.Life.AutoDrink do
                local WaterAmount = GetAttribute(Closest, "Water");
                if WaterAmount < 20 then return self:AutoDrink(); end;
                twait(0.7); RE.DrinkRemote:FireServer(Closest);
            end;
        end;
        Functions.ChangeMood = function(CharacterData, target)
            if CharacterData.HasAilment and CharacterData:HasAilment(target) then
                return;
            end; RE.StateAilment:FireServer(target);
        end;
        Functions.HideScent = function(CharacterData)
            if CharacterData.HasAilment and CharacterData:HasAilment("HideScent") then
                return;
            end; RE.HideScentRemote:FireServer();
        end;
        Functions.AutoShooms = function(self, Shooms)
            for object, data in pairs(Shooms) do
                if not data:IsHidden() then
                    self.Tp(GetPivot(object)*CF030, 0.3);
                    data.ProximityMenu.Actions[1].Run();
                end;
            end
        end;
        Functions.AutoGachaToken = function()
            for data, _ in pairs(GObject.ProxActions) do
                if strfind(data.Object.Name, "Token") then
                    twait(0.3); data.Actions[1].Run();
                end;
            end;
        end;
        Functions.DMGAuraCreature = function(self, forceDist)
            if CombatCon.Kill.AutoKill and not forceDist then return; end;
            if not self.DAC then self.DAC = 0; end;
            if time() - self.DAC < 0.7 then return; end; self.DAC = time();

            local Selected = CombatCon.DMGAura.SelectTarget;
            local Distance = forceDist or CombatCon.DMGAura.CreatureRange;
            local AttackingTable = {}; for _, data in pairs(PlayerList) do
                if not (data.Character and data.Character.Parent) then continue; end;
                if (Selected == "All" or Selected == plr.Name) then
                    if dist(GetPivot(data.Character).Position) <= Distance then
                        tblein(AttackingTable, data.Character);
                    end;
                end;
            end;

            if #AttackingTable == 0 then return; end;
            RE.CharactersDamage:FireServer(AttackingTable, nil);
        end;
        Functions.DMGAuraResource = function(self, Resources, forceDist)
            if not self.DAR then self.DAR = 0; end;
            if time() - self.DAR < 0.7 then return; end; self.DAR = time();
            
            local Distance = forceDist or CombatCon.DMGAura.ResourceRange;
            local AttackingTable = {}; for obj, data in pairs(Resources) do
                if not (obj and obj.Parent) then continue; end;
                if not data:CanDamage() then continue; end;
                if dist(GetPivot(obj).Position) <= Distance then
                    tblein(AttackingTable, obj);
                end;
            end;

            if #AttackingTable == 0 then return; end;
            RE.ResourceDamage:FireServer(AttackingTable);
        end;
        Functions.HealthSafeNet = function(self, CharData)
            if not (selc.Parent and CharData and CharData.GetHealthRatio) then return; end;
            local HealthDeci = CharData:GetHealthRatio();
            local CurrentPosition = GetPivot(selc);
            local Percentage = HealthDeci * 100;

            if Percentage < CombatCon.Death.Escape then
                local TargetPosition = self.HealthTargetPosition;
                if not TargetPosition then
                    self.HealthSAavedPosition = CurrentPosition;
                    TargetPosition = CFr(CurrentPosition.X, 4000, CurrentPosition.Z);
                    SKYPART.CFrame = CFr(CurrentPosition.X, 3980, CurrentPosition.Z);
                    self.HealthTargetPosition = TargetPosition;
                end;

                if dist(TargetPosition.Position) > 100 and not self.IsEating then
                    self.Tp(TargetPosition, 0.3);
                end;
            elseif self.HealthSavedPosition and Percentage > CombatCon.Death.Return then
                self.Tp(self.HealthSavedPosition);
                self.HealthSavedPosition = nil; 
                self.HealthTargetPosition = nil;
            end;
        end;
        Functions.AutoKill = function(self)
            if not selc.Parent then return; end;
            for plr, data in pairs(PlayerList) do
                if plr == selff then continue; end;
                local char = data.Character; self.OnKilling = plr.Name;
                if not (char and char.Parent and CombatCon.Kill.AutoKill) then continue; end; twait(1.4);
                
                while char.Parent and selc.Parent and CombatCon.Kill.AutoKill and not CoreDestroyed or self.HealthSavedPosition do
                    local TargetCF = GetPivot(char);
                    self.Tp(TargetCF * CFRHY, 0.3);
                    Functions:DMGAuraCreature(120);
                end; self.OnKilling = nil;
            end;
        end;
        Functions.ESPPlayers = function()
            local POINTER = "Players"; for plr, data in pairs(PlayerList) do
                if not ESPCon.Players then break; end;
                if not (data.Character and data.Character.Parent) then continue; end;
                local HumR = FindFirstChild(data.Character, "HumanoidRootPart");
                local Data = FindFirstChild(data.Character, "Data");
                if not HumR or not HumR.Parent or not Data then continue; end;
                local ESPObject = ESPF.ESP(POINTER, HumR.Parent, {
                    Color = WHITE;
                    Size = VEC2;
                    Text = plr.Name;
                    NoStart = true;
                }); if ESPObject and ESPObject.Label then
                    local Health = GetAttribute(Data, "h");
                    local MaxHealth = GetAttribute(Data, "mh");
                    ESPObject.Label.Text = plr.Name .. "\n" .. tostring(Health) .. "/" .. tostring(MaxHealth);
                end;
            end;

            ESPF.Visible(POINTER, true, ESPCon.ShowText[POINTER]);
            ESPF.Scale(POINTER, ESPCon.TextScale[POINTER]);
            ESPF.Size(POINTER, ESPCon.TextSize[POINTER]);
            ESPF.Color(POINTER, ESPCon.TextColor[POINTER]);
        end;
        Functions.ESPFoods = function(Foods)
            local POINTER = "Foods"; for obj, data in pairs(Foods) do
                if not ESPCon.Foods then break; end;
                if not (obj and obj.Parent) then continue; end;
                local ESPObject = ESPF.ESP(POINTER, obj, {
                    Color = RED;
                    Size = VEC2;
                    Text = obj.Name;
                    NoStart = true;
                });
            end;

            ESPF.Visible(POINTER, true, ESPCon.ShowText[POINTER]);
            ESPF.Scale(POINTER, ESPCon.TextScale[POINTER]);
            ESPF.Size(POINTER, ESPCon.TextSize[POINTER]);
            ESPF.Color(POINTER, ESPCon.TextColor[POINTER]);
        end;
        Functions.ESPLakes = function(Lakes)
            local POINTER = "Lakes"; for i=1, #Lakes do
                local Lake=Lakes[i]; if Lake then
                    local Object = Lake._object;
                    if Object and Object.WaterPosition then
                        local Model = Object.Model;
                        local ESPObject = ESPF.ESP(POINTER, Model, {
                            Color = BLUE;
                            Size = VEC2;
                            Text = "Water";
                            NoStart = true;
                        });
                    end;
                end;
            end;

            ESPF.Visible(POINTER, true, ESPCon.ShowText[POINTER]);
            ESPF.Scale(POINTER, ESPCon.TextScale[POINTER]);
            ESPF.Size(POINTER, ESPCon.TextSize[POINTER]);
            ESPF.Color(POINTER, ESPCon.TextColor[POINTER]);
        end;
        Functions.ESPGachaTokens = function(ProxActions)
            local POINTER = "GachaTokens"; for data, _ in pairs(ProxActions) do
                if strfind(data.Object.Name, "Token") then
                    local ESPObject = ESPF.ESP(POINTER, data.Object, {
                        Color = PURPLE;
                        Size = VEC2;
                        Text = "Gacha";
                        NoStart = true;
                    });
                end;
            end;

            ESPF.Visible(POINTER, true, ESPCon.ShowText[POINTER]);
            ESPF.Scale(POINTER, ESPCon.TextScale[POINTER]);
            ESPF.Size(POINTER, ESPCon.TextSize[POINTER]);
            ESPF.Color(POINTER, ESPCon.TextColor[POINTER]);
        end;
        Functions.PlayersPersistence = function(isPersis)
            for _, data in pairs(PlayerList) do
                if not (data.Character and data.Character.Parent) then continue; end;
                if isPersis and data.Character.ModelStreamingMode ~= PERSISTENT then
                    local HumR = FindFirstChild(data.Character, "HumanoidRootPart");
                    data.Character.ModelStreamingMode = PERSISTENT;
                    if HumR then continue; end; warn("BEING PERSIS");
                    selff:RequestStreamAroundAsync(GetPivot(data.Character).Position, 1);
                elseif not isPersis and data.Character.ModelStreamingMode == PERSISTENT then
                    data.Character.ModelStreamingMode = Enum.ModelStreamingMode.Default;
                end;
            end;
        end;

        ScriptData.AutoData = {
            ClientTab = {
                {type="Group", dats={
                    {dat={
                        {type="Toggle", EN="No Render", EN2="Change camera subject & disable 3D rendering", TH1="ปิดการ Render", TH2="เปลี่ยนกล้องและปิดการ render 3D", Bindable="+", Path="Client/No Render", Callback=function(state)
                            ClientCon["No Render"] = state;
                            H:Set3dRenderingEnabled(not state);
                            Cam.CameraSubject = if state then VOIDPART else Cam.CameraPart;
                        end},
                        {type="Toggle", EN="Full Bright", EN2="Make the game brighter, easier to see or look around.", TH1="แมพสว่าง", TH2="มองเห็นง่ายขึ้น", Bindable="+", Path="Client/Full Bright"},
                        {type="Slider", EN="Teleport Walk Speed", EN2="Change the speed of teleport walk.", TH1="ความเร็วในการเดินแบบวาร์ป", TH2="ปรับความเร็วในการเดินแบบวาร์ป", Value={Min=1, Max=50}, Path="Client/TeleportWalk Speed"},
                        {type="Toggle", EN="Enable Teleport Walk", EN2="Enable teleport walk.", TH1="เปิดใช้งานเดินแบบวาร์ป", TH2="เปิดใช้งานเดินโดยการวาร์ปไปเรื่อยๆ", Bindable="+", Path="Client/Enable TeleportWalk"},
                        {type="Slider", EN="Gravity", EN2="Change the gravity.", TH1="แรงโน้มถ่วง", TH2="ปรับแรงโน้มถ่วง", Value={Min=0, Max=192.8}, Step=0.4, Path="Client/Gravity", Callback=function(value)
                            W.Gravity = value;
                        end},
                    }, Title="Client", Open=true};
                }};
            };
            DragonTab = {
                {type="Dropdown", EN="Select Food", EN2="Select food type that you are willing to eat.", TH1="เลือกอาหาร", TH2="เลือกประเภทอาหารที่จะกิน", Path="Life/SelectFood", Values=FoodList};
                {type="Toggle", EN="Auto Eat", EN2="Teleport & eat the food.", TH1="ออโต้กิน", TH2="วาปและกินอาหาร", Path="Life/AutoEat", Bindable="+"};
                {type="Toggle", EN="Auto Drink", EN2="Drink water from anywhere.", TH1="ออโต้ดื่มน้ำ", TH2="ดื่มน้ำจากที่ไหนก็ได้", Path="Life/AutoDrink", Bindable="+"};
                {type="Space"}; {type="Divider"}; {type="Space"};
                {type="Toggle", EN="Infinite Stamina", TH1="มานาไม่จำกัด", Path="Stats/InfStamina", Bindable="+"};
                {type="Toggle", EN="Infinite Oxygen", TH1="หายใจใต้น้ำได้ไม่จำกัด", Path="Stats/InfOxygen", Bindable="+"};
                {type="Toggle", EN="Infinite Charge", TH1="Infinite Charge", Path="Stats/InfCharge", Bindable="+"};
                {type="Toggle", EN="Infinite Moisture", TH1="Infinite Moisture", Path="Stats/InfMoisture", Bindable="+"}; {type="Space"};
                {type="Toggle", EN="Admin Buff", TH1="บัพแอดมิน", Path="Godmode/AdminImmunity", Bindable="+"};
                {type="Toggle", EN="Auto Cower", EN2="Dragon become mood become 'Cower'", TH1="ออโต้ Cower", TH2="สถานะมังกรกลายเป็น 'Cower'", Path="Mood/Cower", Bindable="+"};
                {type="Toggle", EN="Auto Aggresive", EN2="Dragon become mood become 'Aggresive'", TH1="ออโต้ Aggresive", TH2="สถานะมังกรกลายเป็น 'Aggresive'", Path="Mood/Aggresive", Bindable="+"};
                {type="Toggle", EN="Auto Hide Scent", EN2="Dragon receive the buff.", TH1="ออโต้ซ่อน Scent", TH2="มังกรได้บัพ", Path="Mood/HideScent", Bindable="+"};
            };
            AutomationTab = {
                {type="Toggle", EN="Auto Collect Shooms", EN2="Teleport & collect shooms.", TH1="ออโต้เก็บ Shooms", TH2="วาปและเก็บShooms", Path="Shooms", Bindable="+"};
                {type="Toggle", EN="Auto Collect Gacha Tokens", EN2="Teleport & collect tokens.", TH1="ออโต้เก็บโทเคน Gacha", TH2="วาปและเก็บโทเคน", Path="GachaTokens", Bindable="+"};
                {type="Space"}; {type="Divider"}; {type="Space"};
                {type="Dropdown", EN="Select Food", EN2="Select food type that you are willing to farm.", TH1="เลือกอาหาร", TH2="เลือกประเภทอาหารที่จะฟาม", Path="Farm/SelectFood", Values={}, Locked=true};
                {type="Toggle", EN="Auto Farm", EN2="Teleport & grab the food then drop at start position.", TH1="ออโต้ฟาม", TH2="วาปเก็บอาหารแล้วมาวางไว้ตรงที่เราเริ่มฟาม", Path="Farm/AutoFarm", Bindable="+", Locked=true};
                {type="Toggle", EN="Auto Donate", EN2="Grab the food then donate to the Shrine.", TH1="ออโต้โดเนท", TH2="เก็บอาหารแล้วโดเนทไปที่ Shrine", Path="Farm/AutoDonateShrine", Bindable="+", Locked=true};
            };
            CombatTab = {
                {type="Dropdown", EN="Select Target", EN2="Select a target to take actions with.", TH1="เลือกเป้าหมาย", TH2="เลือกเป้าหมายเพื่อดําเนินการ", Path="DMGAura/SelectTarget", Values={"All"}, RECall={
                    Title="Refresh"; TH1="รีเฟชร"; RECall=function()
                        local tbl={"All"}; for plr, _ in pairs(PlayerList) do
                            tblein(tbl, plr.Name);
                        end; return tbl;
                    end;
                }};
                {type="Slider", EN="Damage Aura Range ( Creatures )", EN2="The range for the 'Damage Aura Creatures'.", TH1="ระยะดาเมจออร่า ( สัตว์ )", TH2="ระยะของ 'ดาเมจออร่าสัตว์'", Path="DMGAura/CreatureRange", Value={Min=1, Max=300}};
                {type="Slider", EN="Damage Aura Range ( Resource )", EN2="The range for the 'Damage Aura Resource '.", TH1="ระยะดาเมจออร่า ( ทรัพยากร )", TH2="ระยะของ 'ดาเมจออร่าทรัพยากร '", Path="DMGAura/ResourceRange", Value={Min=1, Max=300}};
                {type="Toggle", EN="Damage Aura Creatures", EN2="Apply damage to the selected target within range.", TH1="ดาเมจออร่าสัตว์", TH2="ทำดาเมจใส่เป้าหมายที่เลือกในระยะ", Path="DMGAura/EnableCreatures", Bindable="+"};
                {type="Toggle", EN="Damage Aura Resource", EN2="Apply damage to the resources within range.", TH1="ดาเมจออร่าทรัพยากร", TH2="ทำดาเมจใส่ทรัพยากรในระยะ", Path="DMGAura/EnableResources", Bindable="+"};
                {type="Space"}; {type="Divider"}; {type="Space"};
                {type="Slider", EN="Escape Health %", EN2="% Health that you will use to teleport away from the map.", TH1="%เลือดสำหรับหนี", TH2="% เลือกที่ใช้ในการหนีไปนอกแมพ", Path="Death/Escape", Value={Min=1, Max=100}};
                {type="Slider", EN="Return Health %", EN2="% Health that you will use to teleport back to the map.", TH1="%เลือดสำหรับกลับมา", TH2="% เลือดที่ใช้ในการกลับเข้าแมพ", Path="Death/Return", Value={Min=1, Max=100}};
                {type="Toggle", EN="Anti Death", EN2="Teleport away using 'Escape Health' & teleport back using 'Return Health'", TH1="กันตาย", TH2="วาปหนีโดยใช้ 'เลือดสำหรับหนี' แล้ววาปกลับมาโดยใช้ 'เลือดสำหรับกลับมา'", Path="Death/AntiDeath", Bindable="+", Callback=function(state)
                    CombatCon.Death.AntiDeath = state;
                    
                    if not state and Functions.HealthSavedPosition then
                        Functions.Tp(Functions.HealthSavedPosition);
                    end;

                    Functions.HealthSavedPosition = nil;
                    Functions.HealthTargetPosition = nil;
                end};
                {type="Space"}; {type="Divider"}; {type="Space"};
                {type="Toggle", EN="Auto Farm Kills", EN2="Teleport & kill everyone ( Aura by 1 )", TH1="ออโต้ฟามคิว", TH2="วาปแล้วโจมตีทุกคน ( รอบตัวต่อ1คน )", Path="Kill/AutoKill", Bindable="+"};
                {type="Toggle", EN="Auto Kill Everyone", EN2="Apply damage to everyone in game. <font color=\"rgb(255, 0, 0)\">( BANNABLE )</font>", TH1="ออโต้ตีทุกคน", TH2="โจมตีทุกคนในเกม ( โดนแบน )", Path="Kill/AutoKillEveryone", Bindable="+"};
                {type="Toggle", EN="Auto Destroy All Resources", EN2="Apply damage to all resources in game. <font color=\"rgb(255, 0, 0)\">( BANNABLE )</font>", TH1="ออโต้ตีทรพยากรทั้งหมด", TH2="โจมตีทรัพยากรทั้งหมดในเกม ( โดนแบน )", Path="Kill/AutoDestroyResources", Bindable="+"};
            };
            TeleportTab = {
                {type="Toggle", EN="Auto Teleport ( Map )", EN2="Teleport after you pinned anywhere on the map.", TH1="ออโต้วาป ( แผนที่ )", TH2="วาปหลังจากที่กดปักหมุดไว้สักที่ในแผนที่", Path="AutoTeleportMap", Bindable="+"};
                {type="Button", EN="Teleport ( Map )", EN2="Teleport to the pinned.", TH1="วาป ( แผนที่ )", TH2="วาปไปที่ที่ปักหมุด", Callback=function()
                    Functions.Tp(GObject.WayPos);
                end};
                {type="Space"};
                {type="Dropdown", EN="Select Player", EN2="Select player to teleport to.", TH1="เลือกผู้เล่น", TH2="เลือกผู้เล่นที่จะวาปไปหา", Path="SelectPlayer", Values={}, RECall={
                    Title="Refresh"; TH1="รีเฟชร"; RECall=function()
                        local tbl={}; for plr, _ in pairs(PlayerList) do
                            tblein(tbl, plr.Name);
                        end; return tbl;
                    end;
                }};
                {type="Button", EN="Teleport", EN2="Teleport to the selected player.", TH1="วาป", TH2="วาปไปหาผู้เล่นที่เลือกไว้", Callback=function()
                    Functions.Tp(W.Characters:FindFirstChild(Config.Teleport.SelectPlayer):GetPivot());
                end};
            };
            ESPTab = {
                {type="Toggle", EN="Players", TH1="ผู้เล่น", Path="Players", Bindable="+", Callback=function(state)
                    ESPCon.Players = state; if not state then
                        ESPF.Visible("Players", false);
                    end;
                end};
                {type="Toggle", EN="Foods", TH1="อาหาร", Path="Foods", Bindable="+", Callback=function(state)
                    ESPCon.Foods = state; if not state then
                        ESPF.Visible("Foods", false);
                    end;
                end};
                {type="Toggle", EN="Lakes", TH1="แม่น้ำ", Path="Lakes", Bindable="+", Callback=function(state)
                    ESPCon.Lakes = state; if not state then
                        ESPF.Visible("Lakes", false);
                    end;
                end};
                {type="Toggle", EN="NPCs", TH1="NPCs", Path="NPCs", Bindable="+", Locked=true, Callback=function(state)
                    ESPCon.NPCs = state; if not state then
                        ESPF.Visible("NPCs", false);
                    end;
                end};
                {type="Toggle", EN="Gacha Tokens", TH1="โทเคน Gacha", Path="GachaTokens", Bindable="+", Callback=function(state)
                    ESPCon.GachaTokens = state; if not state then
                        ESPF.Visible("GachaTokens", false);
                    end;
                end};
            };
            AFKTab = {
                {type="Toggle", EN="Anti-AFK", TH1="กันโดนเตะAFK", Path="AntiAFK", Bindable="+"};
                {type="Space"};
                {type="Dropdown", EN="Select Type", EN2="Select Elder Type", TH1="เลือกประเภท", TH2="เลือกประเภทมังกรตอนโต", Path="ElderType", AllowNone=true, Values={}};
                {type="Slider", EN="Eat At %", EN2="Teleport & eat food if the hunger bar is below the %", TH1="กินที่ %", TH2="วาปไปกินอาหารถ้าหลอดอาหารต่ำกว่า %", Path="EatAt", Value={Min=1, Max=100}};
                {type="Slider", EN="Drink At %", EN2="Teleport & drink water if the water bar is below the %", TH1="ดื่มที่ %", TH2="คำอธิบาย Slider", Path="Client/NewSlider", Value={Min=1, Max=100}};
                {type="Toggle", EN="AFK Grow", EN2="Teleport outside the map & afk growing.", TH1="AFK โต", TH2="วาปไปนอกแมพแล้ว AFK การเจริญเติบโต", Path="AFKGrow", Bindable="+"};
            };
        };

        CoruTask.New("RequiredMovement-Main", function()
            warn(pcall(function() while true do
                local shouldNotClose = (
                    AutomationCon.Shooms
                    or DragonCon.Life.AutoEat
                    or CombatCon.Kill.AutoKill
                ) and not CoreDestroyed;

                if not shouldNotClose then
                    CoruTask.Close("RequiredMovement-Main");
                end;

                local ActiveNodes = Nodes;
                local DataFt = Data.DataFt;
                local CurrentSlot = Data.CurrentSlot;
                local CharacterData = Data.CharacterData;

                if DataFt and CharacterData and CurrentSlot then
                    local Shooms = GObject.ShoomPile;

                    if AutomationCon.Shooms and Shooms then
                        Functions:AutoShooms(Shooms);
                    end;

                    if DragonCon.Life.AutoEat and ActiveNodes.Foods then
                        Functions:AutoEat(
                            ActiveNodes.Foods,
                            CurrentSlot,
                            CharacterData,
                            DataFt
                        );
                    end;

                    if CombatCon.Kill.AutoKill  then
                        Functions:AutoKill();
                    end;
                end;

                twait(2);
            end; end));
        end);
        CoruTask.New("RequiredMovement-Sub", function()
            warn(pcall(function()
                while true do
                    if not CombatCon.Death.AntiDeath or CoreDestroyed then
                        CoruTask.Close("RequriedMovement-Sub");
                    end;

                    local CharacterData = Data.CharacterData;
                    if CharacterData and CombatCon.Death.AntiDeath then
                        Functions:HealthSafeNet(CharacterData);
                    end;

                    twait(0.07);
                end;
            end));
        end);
        CoruTask.New("NoneMovement-Main", function()
            warn(pcall(function() while true do
                local shouldNotClose = (
                    AutomationCon.GachaTokens
                    or DragonCon.Godmode.AdminImmunity
                    or DragonCon.Mood.Cower
                    or DragonCon.Mood.Aggresive
                    or DragonCon.Mood.HideScent
                    or CombatCon.DMGAura.EnableCreatures
                    or CombatCon.DMGAura.EnableResources
                    or DragonCon.Life.AutoDrink
                ) and not CoreDestroyed;

                if not shouldNotClose then
                    CoruTask.Close("NoneMovement-Main");
                end;

                local CurrentSlot = Data.CurrentSlot;
                local CharacterData = Data.CharacterData;

                if CurrentSlot and CharacterData then
                    local Ailment = Data.Ailment;
                    local Resources = Nodes.Resources;

                    if AutomationCon.GachaTokens then
                        Functions:AutoGachaToken();
                    end;

                    if DragonCon.Godmode.AdminImmunity then
                        if GetAttribute(Ailment, "AdminImmunity") ~= 100 then
                            SetAttribute(Ailment, "AdminImmunity", 100);
                        end;
                    else
                        if GetAttribute(Ailment, "AdminImmunity") ~= nil then
                            SetAttribute(Ailment, "AdminImmunity", nil);
                        end;
                    end;

                    if DragonCon.Mood.Cower then
                        Functions.ChangeMood(CharacterData, "Cower");
                    end;
                    if DragonCon.Mood.Aggresive then
                        Functions.ChangeMood(CharacterData, "Aggression");
                    end;
                    if DragonCon.Mood.HideScent then
                        Functions.HideScent(CharacterData);
                    end;

                    if CombatCon.DMGAura.EnableCreatures then
                        Functions:DMGAuraCreature();
                    end;
                    if Resources and CombatCon.DMGAura.EnableResources then
                        Functions:DMGAuraResource(Resources);
                    end;

                    if DragonCon.Life.AutoDrink then
                        Functions:AutoDrink(
                            CurrentSlot,
                            CharacterData
                        );
                    end;
                end;

                twait(0.01);
            end; end));
        end);
        CoruTask.New("ESP-Main", function()
            warn(pcall(function() while true do
                local shouldNotClose = (
                    ESPCon.Players
                    or ESPCon.Foods
                    or ESPCon.Lakes
                    or ESPCon.NPCs
                    or ESPCon.GachaTokens
                ) and not CoreDestroyed;

                if not shouldNotClose then
                    CoruTask.Close("ESP-Main");
                end;

                local Foods = Nodes.Foods;
                local Lakes = Nodes.Lakes;
                local ProxActions = GObject.ProxActions;

                if ESPCon.Players then
                    Functions.ESPPlayers();
                end;
                if ESPCon.Foods and Foods then
                    Functions.ESPFoods(Foods);
                end;
                if ESPCon.Lakes and Lakes then
                    Functions.ESPLakes(Lakes);
                end;
                if ESPCon.GachaTokens and ProxActions then
                    Functions.ESPGachaTokens(ProxActions);
                end;

                twait(0.1);
            end; end));
        end);
        CoruTask.New("Bannable-Task", function()
            warn(pcall(function() while true do
                if not (CombatCon.Kill.AutoKillEveryone and CombatCon.Kill.AutoDestroyResources and not CoreDestroyed) then
                    CoruTask.Close("Bannable-Task");
                end;

                if Data.CharacterData then
                    if CombatCon.Kill.AutoKillEveryone then
                        Functions:DMGAuraCreature(100000);
                    end;
                    if CombatCon.Kill.AutoDestroyResources then
                        Functions:DMGAuraResource(Nodes.Resources, 100000);
                    end;
                end;

                twait(0.1);
            end; end));
        end);
        CoruTask.New("Persistence-Task", function()
            warn(pcall(function() while true do
                if CoreDestroyed then
                    CoruTask.Close("Persistence-Task");
                end;

                Functions.PlayersPersistence(LoaderSettings.CreatureOfSonaria.PlayersPersistent);

                twait(0.1);
            end; end));
        end);

        local LSecureUI = function()
            local WindUI = WindLib();
            local Window = WindUI:CreateWindow({
                Title = "Creature Of Sonaria",
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

                Div1 = Window:Divider(),
                Dragon = Window:Tab({ Title = "Dragon", Icon = "flame" }),
                Automation = Window:Tab({ Title = "Automation", Icon = "cog" }),
                Combat = Window:Tab({ Title = "Combat", Icon = "sword" }),
                Teleport = Window:Tab({ Title = "Teleport", Icon = "map-pin" }),
                ESP = Window:Tab({ Title = "ESP", Icon = "eye" }),
                AFK = Window:Tab({ Title = "AFK", Icon = "user-round-check", Locked=true }),

                ExtraDiv = Window:Divider(),
                AddOn = LoaderSettings.AllowAddOn and Window:Tab({ Title = "AddOn", Icon = "box" }),
                Themes = LoaderSettings.AllowThemesTab and Window:Tab({ Title = "Themes", Icon = "palette" }),
                BHVESP = LoaderSettings.AllowESPCustomization and Window:Tab({ Title = "ESP Behaviour", Icon = "eye" }),
                Core = Window:Tab({ Title = "Core Settings", Icon = "settings" }),
            }; IntroLib.Init(WindUI, Tabs.Welcome); IntroLib:Tutorial(WindUI);
            Windy:CreateComponent(Tabs.Client, ScriptData.AutoData.ClientTab, "Client");
            Windy:CreateComponent(Tabs.Core, CorePackage());

            Windy:CreateComponent(Tabs.Dragon, ScriptData.AutoData.DragonTab, "Dragon");
            Windy:CreateComponent(Tabs.Automation, ScriptData.AutoData.AutomationTab, "Automation");
            Windy:CreateComponent(Tabs.Combat, ScriptData.AutoData.CombatTab, "Combat");
            Windy:CreateComponent(Tabs.Teleport, ScriptData.AutoData.TeleportTab, "Teleport");
            Windy:CreateComponent(Tabs.ESP, ScriptData.AutoData.ESPTab, "ESP");
            Windy:CreateComponent(Tabs.AFK, ScriptData.AutoData.AFKTab, "AFK");

            ESPF:DynamicU(Windy, Tabs.BHVESP, {
                {Title="Players", Pointer="ESP", TextPath="ShowText/Players", SizePath="TextSize/Players", ScalePath="TextScale/Players", ColorPath="TextColor/Players"},
                {Title="Foods", Pointer="ESP", TextPath="ShowText/Foods", SizePath="TextSize/Foods", ScalePath="TextScale/Foods", ColorPath="TextColor/Foods"},
                {Title="Lakes", Pointer="ESP", TextPath="ShowText/Lakes", SizePath="TextSize/Lakes", ScalePath="TextScale/Lakes", ColorPath="TextColor/Lakes"},
                {Title="NPCs", Pointer="ESP", TextPath="ShowText/NPCs", SizePath="TextSize/NPCs", ScalePath="TextScale/NPCs", ColorPath="TextColor/NPCs"},
                {Title="Gacha Tokens", Pointer="ESP", TextPath="ShowText/GachaTokens", SizePath="TextSize/GachaTokens", ScalePath="TextScale/GachaTokens", ColorPath="TextColor/GachaTokens"},
            });

            Window:SelectTab(1); Window:OnDestroy(function()
                CoreDestroyed = true;
            end);

            Window:SetToggleKey((LoaderSettings.UIKeybind and Enum.KeyCode[LoaderSettings.UIKeybind]) or Enum.KeyCode["RightShift"]);
            ScriptCache.WindUI = WindUI; ScriptCache.Window = Window;
        end; local LSecureLoad = function(AUTH_KEY)
            local OneRunCallMain, OneRunErrorMain = pcall(function()
                CoreDestroyed = false; GG.ESPF_ChangeMode = ESPF.Method;

                GG.Configs = Config;
                LSecureUI();

                tk.spawn(function()
                    while not CoreDestroyed do
                        local RequiredMovementMain = AutomationCon.Shooms
                            or DragonCon.Life.AutoEat
                            or CombatCon.Kill.AutoKill;
                        local RequiredMovementSub = CombatCon.Death.AntiDeath;
                        local NoneMovementMain = AutomationCon.GachaTokens
                            or DragonCon.Godmode.AdminImmunity
                            or DragonCon.Mood.Cower
                            or DragonCon.Mood.Aggresive
                            or DragonCon.Mood.HideScent
                            or CombatCon.DMGAura.EnableCreatures
                            or CombatCon.DMGAura.EnableResources
                            or DragonCon.Life.AutoDrink;
                        local ESPMain = ESPCon.Players
                            or ESPCon.Foods
                            or ESPCon.Lakes
                            or ESPCon.NPCs
                            or ESPCon.GachaTokens;
                        local BannableTask = CombatCon.Kill.AutoKillEveryone
                            or CombatCon.Kill.AutoDestroyResources;
                        local PersistentTask = LoaderSettings.CreatureOfSonaria.PlayersPersistent;

                        if RequiredMovementMain then
                            CoruTask.Handle("RequiredMovement-Main");
                        end;
                        if RequiredMovementSub then
                            CoruTask.Handle("RequiredMovement-Sub");
                        end;
                        if NoneMovementMain then
                            CoruTask.Handle("NoneMovement-Main");
                        end;
                        if ESPMain then
                            CoruTask.Handle("ESP-Main");
                        end;
                        if BannableTask then
                            CoruTask.Handle("Bannable-Task");
                        end;

                        CoruTask.Handle("Persistence-Task");

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

                    ClientPackage.Brightness(ClientCon["Full Bright"]);
                end);
                CoreConnection[2] = H.Heartbeat:Connect(function(delta)
                    if CoreDestroyed and CoreConnection[2] then
                        CoreConnection[2]:Disconnect(); CoreConnection[2] = nil;
                        return;
                    end; if not Cam.Parent then return; end;

                    if ClientCon["Enable TeleportWalk"] and selc.Parent then
                        local Direction = ControlModule:GetMoveVector();
                        if Direction.Magnitude > 0 then
                            local MoveDirection =
                                Cam.CFrame.LookVector * -Direction.Z +
                                Cam.CFrame.RightVector * Direction.X;

                            selc:TranslateBy(MoveDirection * ClientCon["TeleportWalk Speed"] * delta * 10);
                        end;
                    end;
                end);
                CoreConnection[3] = selff.CharacterAdded:Connect(function(char)
                    selc = char;
                    HumRSelf = WaitForChild(char, "HumanoidRootPart", 9e9);
                    Functions.OnCharValidate(char);
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
                CoreConnection[5] = P.PlayerAdded:Connect(Functions.OnPlayersValidate);
                CoreConnection[6] = P.PlayerRemoving:Connect(Functions.OnPlayersInvalid);
                
                if selff.Character then
                    selc = selff.Character;
                    HumRSelf = WaitForChild(selc, "HumanoidRootPart", 9e9);
                    tk.spawn(Functions.OnCharValidate, selc, true);
                end;

                if not CoruTask.Intialized then
                    CoruTask.Init(WindUI);
                    CoruTask.Intialized = true;

                    local CHs=P:GetPlayers(); for i=1, #CHs do
                        Functions.OnPlayersValidate(CHs[i]);
                    end;

                    Functions.GCValidate(getgc(true));
                    Functions.GameValidate();
                    Functions.GameViolation();
                end;
            end); if OneRunCallMain then
                return true, GG.LoadingSignal:Fire(100);
            end; return false, warn(OneRunErrorMain);
        end; GG.LSecureLoad = LSecureLoad; return LSecureLoad;
    end;
};
