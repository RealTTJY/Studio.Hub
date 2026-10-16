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

local TextService = GetService(game, "TextChatService");
local TweenService = GetService(game, "TweenService");
local R = GetService(game, "ReplicatedStorage");
local H = GetService(game, "RunService");
local W = GetService(game, "Workspace");
local P = GetService(game, "Players");
local S = GetService(game, "Stats");

local IsA = game.IsA;
local twait = tk.wait;
local CFr = CFrame.new;
local tblef = tble.find;
local strfind = str.find;
local Vec3 = Vector3.new;
local tblein = tble.insert;
local GetPivot = W.GetPivot;
local PivotTo = W.PivotTo;
local mclamp = math.clamp;
local GetPlayers = P.GetPlayers;
local GetChildren = game.GetChildren;
local GetAttribute = game.GetAttribute;
local SetAttribute = game.SetAttribute;
local WaitForChild = game.WaitForChild;
local DesQueue = game.QueryDescendants;
local FindFirstChild = game.FindFirstChild;
local FindFirstChildOfClass = game.FindFirstChildOfClass;
local FindFirstChildWhichIsA = game.FindFirstChildWhichIsA;

local VEC2 = Vec3(2,2,2);
local VECP = Vec3(2, 3, 2);
local VECGEN = Vec3(7, 4, -4);
local RED = Col3.new(1,0,0);
local GREEN = Col3.new(0,1,0);
local PURPLE = Col3.new(1,0,1);
local WHITE = Col3.new(1,1,1);
local ORANGE = Col3.fromRGB(255, 165, 0);
local EMPTY_OBJECT = {Parent=nil, SeatPart=nil};

local ScriptData = {};
local Config = GG.Configs or {};

Config.Client = Config.Client or {};
Config.Client.Client = Config.Client.Client or {};
Config.Survivor = Config.Survivor or {};
Config.Survivor.Generator = Config.Survivor.Generator or {};
Config.Survivor.Survivor = Config.Survivor.Survivor or {};
Config.Survivor.Visual = Config.Survivor.Visual or {};
Config.Survivor.Guest1337 = Config.Survivor.Guest1337 or {};
Config.Killer = Config.Killer or {};
Config.Killer.Killer = Config.Killer.Killer or {};
Config.Killer.Coolkidd = Config.Killer.Coolkidd or {};
Config.ESP = Config.ESP or {};
Config.ESP.ShowText = Config.ESP.ShowText or {
    Generators = true;
    Medkit = true;
    BloxyCola = true;
    K = true;
    S = true;
};
Config.ESP.TextSize = Config.ESP.TextSize or {
    Generators = 7;
    Medkit = 7;
    BloxyCola = 7;
    K = 7;
    S = 7;
};
Config.ESP.TextScale = Config.ESP.TextScale or {
    Generators = true;
    Medkit = true;
    BloxyCola = true;
    K = true;
    S = true;
};
Config.ESP.TextColor = Config.ESP.TextColor or {
    Generators = WHITE;
    Medkit = PURPLE;
    BloxyCola = ORANGE;
    K = RED;
    S = GREEN;
};

return {
    Version = "Forsaken_V3.02";
    Function = function(CorePackage, WindLib, IntroLib, Windy, ClientPackage, CoruTask, CommonF, ESPF)
        local CoreConnection    = {};
        local CoreDestroyed     = false;

        local Map               = EMPTY_OBJECT;
        local CurrentGame       = {Map=nil};
        local SMP               = EMPTY_OBJECT;
        local Killers,Survivors = nil, nil;
        local Cam               = W.CurrentCamera;
        local selff             = P.LocalPlayer;
        local PSG               = selff.PlayerGui;
        local Backpack          = selff.Backpack;
        local selc              = selff.Character or EMPTY_OBJECT;
        local HumSelf           = selc.Parent and FindFirstChild(selc, "Humanoid") or EMPTY_OBJECT;
        local HumRSelf          = HumSelf.Parent and HumSelf.RootPart or EMPTY_OBJECT;
        local PSS               = WaitForChild(selff, "PlayerScripts", 9e9);

        local VOIDPART          = Instancen("Part");

        local cmdm              = selff:GetMouse();
        local ClientCon         = Config.Client.Client;
        local SurvivorCon       = Config.Survivor;
        local KillerCon         = Config.Killer;
        local ESPCon            = Config.ESP;

        local Tp                = CommonF.Tp;
        local dist              = CommonF.dist;

        local REQ               = {};
        local RE                = {};
        local Functions         = {};

        ClientCon.JumpPower = ClientCon.JumpPower or 50;
        ClientCon["TeleportWalk Speed"] = ClientCon["TeleportWalk Speed"] or 1;
        SurvivorCon.Generator.Speed = SurvivorCon.Generator.Speed or 1.3;
        KillerCon.Killer.SelectSuvivor = KillerCon.Killer.SelectSuvivor or {};

        Functions.GetPing = function()
            return S.Network.ServerStatsItem["Data Ping"]:GetValue() / 1000;
        end;
        Functions.MapValidate = function(v, already)
            local Bound = WaitForChild(v, "MapBoundaries", 9e9);    
            Bound.ChildAdded:Connect(function(v2)
                if v2.Name == "KillerOnly" then
                    CurrentGame.KillerOnly = v2;
                elseif v2.Name == "KillerDoors" or v2.Name == "Killer Doors" then
                    CurrentGame.KillerDoors = v2;
                end;
            end);

            if already then
                CurrentGame.KillerOnly = FindFirstChild(Bound, "KillerOnly");
                CurrentGame.KillerDoors = FindFirstChild(Bound, "KillerDoors") or FindFirstChild(Bound, "Killer Doors");

                local CHs=GetChildren(v.Parent); for i=1, #CHs do
                    local F=CHs[i]; if F.Parent then
                        if strfind(F.Name, "JohnDoeTrail") then
                            CurrentGame.JTrail = F;
                        elseif strfind(F.Name, "Shadows") then
                            CurrentGame.JFoot = F;
                        end;
                    end;
                end;
            end;
            
            CurrentGame.Map = v; CurrentGame.Bound = Bound; Map = v;
        end;
        Functions.KillerValidation = function(v)
            if v == selc then return; end;
            local Humanoid = WaitForChild(v, "Humanoid", 9e9);
            local HumR = WaitForChild(v, "HumanoidRootPart", 9e9);
            local Animator = WaitForChild(Humanoid, "Animator", 9e9);

            Animator.AnimationPlayed:Connect(function(Track)
                if not SurvivorCon.Guest1337.AutoBlock and not CoreDestroyed then return; end;
                if Track.Priority == Enum.AnimationPriority.Action then
                    if dist(HumR.Position) < 11 then
                        REQ.Network:FireServerConnection(
                            "UseActorAbility",
                            "REMOTE_EVENT",
                            "Block"
                        );
                    end;
                end;
            end);
        end;
        Functions.GCValidate = function(self)
            if not selc.Parent then return; end;
            local GCs=getgc(true); for i=1, #GCs do
                local v=GCs[i]; if type(v) == 'table' then
                    if rawget(v, "StaminaLoss") and rawget(v, "Character") and v.Character == selc then
                        self.StaminaOffSet = v;
                        break;
                    end;
                end;
            end;
        end;
        Functions.GameValidate = function(self)
            W.Map.Ingame.ChildAdded:Connect(function(v)
                if v.Name == "Map" then
                    self.MapValidate(v);
                elseif strfind(v.Name, "JohnDoeTrail") then
                    CurrentGame.JTrail = v;
                elseif strfind(v.Name, "Shadows") then
                    CurrentGame.JFoot = v;
                elseif strfind(v.Name, "007n7") then
                    if SurvivorCon.Visual.RemoveFake007n7 then
                        local Username = GetAttribute(v, "Username");
                        if not Username then
                            v:GetAttributeChangedSignal("Username"):Wait();
                            Username = GetAttribute(v, "Username");
                        end; if Username == selff.Name then return; end;
                        v.Parent = nil;
                    end;
                end;
            end);

            Killers = WaitForChild(W.Players, "Killers", 9e9);
            Survivors = WaitForChild(W.Players, "Survivors", 9e9);
            
            Killers.ChildAdded:Connect(self.KillerValidation);
            local CHs=GetChildren(Killers); for i=1, #CHs do
                local v=CHs[i]; if v.Parent then
                    self.KillerValidation(v);
                end;
            end;

            REQ.Network = require(R.Modules.Network.Network);
            RE.RemoteEvent = R.Modules.Network.Network.RemoteEvent;

            Map = FindFirstChild(W.Map.Ingame, "Map") or EMPTY_OBJECT;
            if not Map.Parent then return; end; self.MapValidate(Map, true);
        end;
        Functions.OnCharValidate = function(char)
            selc = char; Backpack = selff.Backpack;
            HumSelf = WaitForChild(selc, "Humanoid", 9e9);
            HumRSelf = WaitForChild(char, "HumanoidRootPart", 9e9);
            SMP = WaitForChild(selc, "SpeedMultipliers", 9e9)
            
            tk.delay(1, function()
                Functions.OnGuest1337(char, SMP);
                Functions.OnCoolKidd(HumRSelf);
            end);
        end;
        Functions.OnGuest1337 = function(char, smp)
            selc:GetAttributeChangedSignal("TimesHit"):Connect(function()
                if not SurvivorCon.Guest1337.AutoPunch
                    or not FindFirstChild(SMP, "GuestBlocking")
                    or not GetAttribute(HumSelf, "Overheal")
                    or CoreDestroyed
                then
                    return;
                end;

                local CC,KL=nil,nil; tk.delay(0.3, function()
                    REQ.Network:FireServerConnection("UseActorAbility", "REMOTE_EVENT", "Punch");
                end);
                
                local CHs=GetChildren(Killers); for i=1, CHs do
                    local v=CHs[i]; if v.Parent then
                        if not P:GetPlayerFromCharacter(v) then
                            KL = FindFirstChild(v, "QueryHitbox");
                            break;
                        end;
                    end;
                end; if not KL then return; end;

                CC = H.RenderStepped:Connect(function()
                    if not KL.Parent or CoreDestroyed or not SurvivorCon.Guest1337.AutoPunch then
                        CC:Disconnect();
                        CC = nil;
                        return;
                    end;

                    local Pos, PosS = KL.Position, HumRSelf.Position;
                    local PosN = Vec3(Pos.X, PosS.Y, Pos.Z);
                    local CFN, Vel = CFr(PosS, PosN), nil;

                    selc:SetPrimaryPartCFrame(CFN); if not Vel then
                        HumRSelf.Velocity = CFN.LookVector * 32;
                        Vel = HumRSelf.Velocity;
                    else
                        Vel = HumRSelf.Velocity:Lerp(Vel or HumRSelf.Velocity, 0.8);
                        HumRSelf.Velocity = Vel;
                    end;
                    
                    local PunchAbility = FindFirstChild(smp, "PunchAbility")
                    if PunchAbility then
                        repeat
                            twait(0.1);
                        until not PunchAbility.Parent;
                    end; if CC then
                        CC:Disconnect();
                        CC = nil;
                    end;
                end);
            end);
        end;
        Functions.OnCoolKidd = function(humrself)
            humrself.ChildAdded:Connect(function(v)
                if not KillerCon.Coolkidd.DashControl
                    or v.Name ~= "LinearVelocity"
                    or CoreDestroyed
                then
                    return;
                end;

                local DashPower = KillerCon.Coolkidd.DashPower;
                local Original = v.LineDirection;
                v.LineDirection = Vec3(0, 0, 0);

                v:GetPropertyChangedSignal("LineVelocity"):Connect(function()
                    if not KillerCon.Coolkidd.DashControl then return; end;
                    if v.LineVelocity > 99 then return; end;
                    v.LineVelocity = v.LineVelocity * DashPower;
                end); v.LineVelocity = v.LineVelocity * DashPower;

                local CC=nil;CC=H.RenderStepped:Connect(function()
                    if not KillerCon.Coolkidd.DashControl
                        or not v.Parent
                        or CoreDestroyed
                    then
                        CC:Disconnect();
                        CC = nil;
                        return;
                    end; if HumSelf.Parent then
                        local Dir = HumSelf.MoveDirection;
                        v.LineDirection = if Dir.Magnitude > 0 then
                            Dir.Unit
                        else Original;
                    end;
                end);
            end);
        end;
        Functions.Ghost = function(bool)
            if GetAttribute(W, "ExperimentalHitboxes") ~= bool then
                SetAttribute(W, "ExperimentalHitboxes", bool);
            end;
        end;
        Functions.ApplyStamina = function(self, num)
            local StaminaOffSet = self.StaminaOffSet;
            if not StaminaOffSet then return self:GCValidate(); end;
            StaminaOffSet.StaminaLoss = num;
        end;
        Functions.GetGenerators = function()
            return Map.Parent and DesQueue(
                Map,
                ">Model#Generator:has(#Main)>#Main"
            ) or {};
        end;
        Functions.AutoFixGenerator = function(self, Gens)
            if not HumRSelf.Parent then return; end;
            local Gui = FindFirstChild(PSG, "PuzzleUI");
            if not Gui then return; end;
            for i=1, #Gens do
                local v=Gens[i];
                local Gen = v.Parent;
                
                if Gen then
                    local Progress = FindFirstChild(Gen, "Progress");
                    local REp = FindFirstChild(Gen.Remotes, "RE");
                    if not Progress or Progress.Value > 99 then continue; end;
                    if dist(v.Position) <= 10 then
                        while
                            SurvivorCon.Generator.Auto
                            and Progress.Value < 99
                            and dist(v.Position) <= 10
                            and Gui.Parent
                            and not CoreDestroyed
                        do
                            REp:FireServer();
                            twait(1.3);
                        end;
                    end;
                end;
            end;
        end;
        Functions.ESPGenerators = function(Gens)
            local POINTER = "Gen"; for i=1, #Gens do
                if not SurvivorCon.Generator.ESP then break; end;
                
                local v=Gens[i];
                local Gen = v.Parent;

                if Gen then
                    local Progress = FindFirstChild(Gen, "Progress");
                    local ESPObject = ESPF.ESP(POINTER, Gen, {
                        Color = GREEN;
                        Size = VECGEN;
                        Text = Gen.Name;
                        NoStart = true;
                    }); if ESPObject and ESPObject.Label and Progress then
                        ESPObject.Label.Text = "Generator\n(" .. tostring(Progress.Value) .. "/100)"; 
                    end;
                end;
            end;

            ESPF.Visible(POINTER, true, ESPCon.ShowText.Generators);
            ESPF.Scale(POINTER, ESPCon.TextScale.Generators);
            ESPF.Size(POINTER, ESPCon.TextSize.Generators);
            ESPF.Color(POINTER, ESPCon.TextColor.Generators);
        end;
        Functions.TpGenerator = function(Gens)
            if not selc.Parent then return; end; for i=1, #Gens do
                local v=Gens[i];
                local Gen = v.Parent;

                if Gen then
                    local Progress = FindFirstChild(Gen, "Progress");
                    if not Progress or Progress.Value > 99 then continue; end;
                    local Base = FindFirstChildWhichIsA(Gen.Positions, "BasePart");
                    if not Base then continue; end;
                    return Tp(HumRSelf, Base.CFrame);
                end;
            end;
        end;
        Functions.GetItems = function()
            return Map.Parent and DesQueue(
                Map.Parent,
                ">#Medkit,>#BloxyCola,>#Map>#Medkit,>#Map>#BloxyCola"
            ) or {};
        end;
        Functions.AutoGrabItems = function(Items)
            for i=1, #Items do
                local v=Items[i]; if v.Parent then
                    local Root = FindFirstChild(v, "ItemRoot");
                    local Prox = Root and FindFirstChild(Root, "ProximityPrompt");
                    if not Prox or not Prox.Enabled then continue; end;
                    if dist(Root.Position) <= 20 then
                        fireproximityprompt(Prox);
                    end;
                end;
            end;
        end;
        Functions.ESPItems = function(Items)
            for i=1, #Items do
                if not SurvivorCon.Survivor.ESPItems then break; end;
                local v=Items[i]; if v.Parent then
                    local Root = FindFirstChild(v, "ItemRoot");
                    if not Root then continue; end;
                    local ESPObject = ESPF.ESP(v.Name, v, {
                        Color = GREEN;
                        Size = VEC2;
                        Text = v.Name;
                        NoStart = true;
                    }); if ESPObject and ESPObject.Label then
                        ESPObject.Label.Text = v.Name.."\n(" .. tostring(math.floor(dist(Root.Position))) .. " studs)"; 
                    end;
                end;
            end;

            for i=1, 2 do
                local v = i==1 and "Medkit" or "BloxyCola";
                ESPF.Visible(v, true, ESPCon.ShowText[v]);
                ESPF.Scale(v, ESPCon.TextScale[v]);
                ESPF.Size(v, ESPCon.TextSize[v]);
                ESPF.Color(v, ESPCon.TextColor[v]);
            end;
        end;
        Functions.GetKDoors = function()
            local Doors = CurrentGame.KillerDoors;
            if not Doors or not Doors.Parent then return {}; end;
            return DesQueue(
                Doors,
                ">#Part[Material=Plastic],>Part:not(#Part):has(SpecialMesh)"
            );
        end;
        Functions.SetKDoors = function(KDoors, bool)
            for i=1, #KDoors do
                local v = KDoors[i]; if v.Parent then
                    if v.CanCollide == bool then
                        continue;
                    end; v.CanCollide = bool;
                end;
            end;
        end;
        Functions.ClearSession = function()
            CurrentGame.Map = nil;
            CurrentGame.KillerOnly = nil;
            CurrentGame.KillerDoors = nil;
        end;
        Functions.SetKOnly = function(KOnly, bool)
            local Target = if bool then nil else CurrentGame.Bound;
            if not Target or not Target.Parent or CurrentGame.KillerOnly.Parent == Target then return; end;
            pcall(function()
                CurrentGame.KillerOnly.Parent = if bool then nil else CurrentGame.Bound;
            end);
        end;
        Functions.ESPKillers = function(CHs)
            local POINTER = "K"; for i=1, #CHs do
                local v=CHs[i]; if v.Parent and v~=selc then
                    local ESPObject = ESPF.ESP(POINTER, v, {
                        Color = RED;
                        Size = VECP;
                        Text = "";
                        NoStart = true;
                    }); if ESPObject and ESPObject.Label then
                        ESPObject.Label.Text = v.Name.."\n@".. (GetAttribute(v, "Username") or "?"); 
                    end;
                end;
            end;

            ESPF.Visible(POINTER, true, ESPCon.ShowText.K);
            ESPF.Scale(POINTER, ESPCon.TextScale.K);
            ESPF.Size(POINTER, ESPCon.TextSize.K);
            ESPF.Color(POINTER, ESPCon.TextColor.K);
        end;
        Functions.SetJTrail = function(JTrail, bool)
            JTrail.Parent = if bool then nil else Map.Parent;
        end;
        Functions.SetJFoot = function(JFoot, bool)
            JFoot.Parent = if bool then nil else Map.Parent;
        end;
        Functions.AdjustSpike = function(bool)
            local Spikes = DesQueue(
                W.Map.Ingame,
                ">#SpikeCollision"
            ); for i=1, #Spikes do
                local v=Spikes[i]; if v.Parent then
                    if bool and v.Size ~= Vec3(11,3.5,3.5) then
                        v.Size = Vec3(11,3.5,3.5);
                        v.Shape = Enum.PartType.Cylinder;
                    elseif not bool and v.Size ~= Vec3(11, 5, 5) then
                        v.Size = Vec3(11, 5, 5);
                        v.Shape = Enum.PartType.Cylinder;
                    end;
                end;
            end;
        end;
        Functions.RemoveNoli = function(CHs)
            for i=1, #CHs do
                local v=CHs[i]; if v.Parent then
                    if v.Name == "Noli" then
                        if not P:GetPlayerFromCharacter(v) then
                            local Name = GetAttribute(v, "Username");
                            if not Name then continue; end;
                            RE.RemoteEvent:FireServer(
                                Name.."CloneEvent",
                                {buffer.fromstring("\"KILLED\"")}
                            );
                        end;
                    end;
                end;
            end;
        end;
        Functions.TpPlayer = function(selected)
            local CHs=GetPlayers(P); for i=1, #CHs do
                if not KillerCon.Killer.Teleport then break; end;
                local v=CHs[i];
                local Char = v.Character;
                
                if Char then
                    if tblef(selected, "All") or tblef(selected, v.Name) then
                        local HumR = FindFirstChild(Char, "QueryHitbox");
                        if not HumR or not HumR.Parent then continue; end;

                        repeat
                            Tp(HumRSelf, HumR.CFrame, 0.3);
                        until not KillerCon.Killer.Teleport;
                    end;
                end;
            end;
        end;
        Functions.ESPSurvivors = function(CHs)
            local POINTER = "S"; for i=1, #CHs do
                local v=CHs[i]; if v.Parent and v~=selc then
                    local ESPObject = ESPF.ESP(POINTER, v, {
                        Color = GREEN;
                        Size = VECP;
                        Text = "";
                        NoStart = true;
                    }); if ESPObject and ESPObject.Label then
                        ESPObject.Label.Text = v.Name.."\n@".. (GetAttribute(v, "Username") or "?"); 
                    end;
                end;
            end;

            ESPF.Visible(POINTER, true, ESPCon.ShowText.S);
            ESPF.Scale(POINTER, ESPCon.TextScale.S);
            ESPF.Size(POINTER, ESPCon.TextSize.S);
            ESPF.Color(POINTER, ESPCon.TextColor.S);
        end;

        ScriptData.AutoData = {
            ClientTab = {
                {type="Group", dats={
                    {dat={
                        {type="Toggle", EN="Ghost Mode", EN2="Invincible & godmode. Other player can attack you if they found your real character.", TH1="ถอดจิต", TH2="ล่องหนและอมตะ คนอื่นสามารถตีได้ปกติถ้าเจอร่างจริงเรา", Bindable="+", Path="Client/Ghost", Callback=function(state)
                            ClientCon.Ghost = state; if not state then
                                Functions.Ghost(true);
                                if ClientCon.GhostBack then
                                    local QueryHitbox = FindFirstChild(selc, "QueryHitbox");
                                    if not QueryHitbox then return; end;
                                    Tp(HumRSelf, QueryHitbox.CFrame);
                                end;
                            end;
                        end},
                        {type="Toggle", EN="Teleport Back", EN2="Teleport back to your real body after turn off 'Ghost'.", TH1="วาปกลับ", TH2="วาปกลับร่างจริงหลังจากปิด'ถอดจิต'", Bindable="+", Path="Client/GhostBack"}, {type="Space"};
                        {type="Toggle", EN="Infinite Stamina", EN2="Change the cost of stamina.", TH1="มานาไม่จำกัด", TH2="เปลี่ยนค่าการใช้งานมานาให้เป็น 0", Bindable="+", Path="Client/InfiniteStamina"},
                        {type="Toggle", EN="No Render", EN2="Change camera subject & disable 3D rendering", TH1="ปิดการ Render", TH2="เปลี่ยนกล้องและปิดการ render 3D", Bindable="+", Path="Client/No Render", Callback=function(state)
                            ClientCon["No Render"] = state;
                            H:Set3dRenderingEnabled(not state);
                            Cam.CameraSubject = if state then VOIDPART else HumSelf;
                        end},
                        {type="Toggle", EN="Full Bright", EN2="Make the game brighter, easier to see or look around.", TH1="แมพสว่าง", TH2="มองเห็นง่ายขึ้น", Bindable="+", Path="Client/Full Bright"},
                        {type="Slider", EN="Teleport Walk Speed", EN2="Change the speed of teleport walk.", TH1="ความเร็วในการเดินแบบวาร์ป", TH2="ปรับความเร็วในการเดินแบบวาร์ป", Value={Min=1, Max=50}, Path="Client/TeleportWalk Speed"},
                        {type="Toggle", EN="Enable Teleport Walk", EN2="Enable teleport walk.", TH1="เปิดใช้งานเดินแบบวาร์ป", TH2="เปิดใช้งานเดินโดยการวาร์ปไปเรื่อยๆ", Bindable="+", Path="Client/Enable TeleportWalk"},
                        {type="Slider", EN="Jump Power", EN2="Change the power of your jump.", TH1="ความแรงในการกระโดด", TH2="ปรับความแรงในการกระโดด", Value={Min=1, Max=300}, Path="Client/JumpPower"},
                        {type="Toggle", EN="Enable Jump Power", EN2="Enable jump power modification.", TH1="เปิดใช้งานความแรงในการกระโดด", TH2="ปรับความแรงในการกระโดด", Bindable="+", Path="Client/Enable JumpPower"},
                    }, Title="Client", Open=true};
                }}; {type="Space"};
                {type="Button", EN="Enable Roblox Chat", EN2="Show Roblox chat in the match.", TH1="แสดงแชท Roblox", TH2="แสดงช่องแชท Roblox ในเกม", Callback=function()
                    TextService.ChatWindowConfiguration.Enabled = true;
                end}; {type="Space"};
            };
            SurvivorTab = {
                {type="Toggle", EN="Auto Generator", EN2="Fix generators, when you enter the generator.", TH1="ออโต้ปั่นไฟ", TH2="ซ่อมเครื่องปั่นไฟเมื่อคุณเข้าใกล้", Path="Generator/Auto", Bindable="+"};
                {type="Toggle", EN="ESP Generator", EN2="Show generator's box.", TH1="ESP เครื่องปั่นไฟ", TH2="แสดงเครื่องปั่นไฟ", Path="Generator/ESP", Bindable="+"};
                {type="Slider", EN="Speed", EN2="Time taken to complete each generator", TH1="ความเร็ว", TH2="เวลาที่ใช้ในการปั่นไฟ", Path="Generator/Speed", Value={Min=1.3, Max=2}, Step=0.1};
                {type="Button", EN="Teleport", EN2="Teleport to the generator.", TH1="วาป", TH2="วาปไปหาเครื่องปั่นไฟ", Callback=function()
                    local Gens = Functions.GetGenerators();
                    if Gens then Functions.TpGenerator(Gens); end;
                end};
                {type="Space"}; {type="Divider"}; {type="Space"};
                {type="Toggle", EN="Auto Grab Items", EN2="Grab nearby items..", TH1="ออโต้หยิบของ", TH2="หยิบของที่อยู่ใกล้ตัว", Path="Survivor/AutoGrabItems", Bindable="+"};
                {type="Toggle", EN="ESP Items", EN2="Show item's box.", TH1="ESP ไอเทม", TH2="แสดงไอเทม", Path="Survivor/ESPItems", Bindable="+"};
                {type="Space"}; {type="Divider"}; {type="Space"};  
                {type="Toggle", EN="Auto Escape", EN2="Nosferatu's Hook.", TH1="ออโต้หลบหนี", TH2="Hook ของ Nosferatu", Path="Survivor/AutoEscape", Bindable="+"};
                {type="Toggle", EN="Auto Disarm", EN2="Azure's Trap.", TH1="ออโต้ปลดกับดัก", TH2="กับดักของ Azure", Path="Survivor/AutoDisarm", Bindable="+"};
                {type="Toggle", EN="ESP Killers", EN2="Show killer's box.", TH1="ESP ฆาตกร", TH2="มองเห็นฆาตกร", Path="Survivor/ESPKillers", Bindable="+"};
                {type="Space"}; {type="Divider"}; {type="Space"};
                {type="Toggle", EN="Auto Block", EN2="Guest 1337.", TH1="ออโต้บล็อค", TH2="Guest 1337", Path="Guest1337/AutoBlock", Bindable="+"};
                {type="Toggle", EN="Auto Punch", EN2="After Guest 1337 successfully blocked.", TH1="ออโต้ต่อย", TH2="หลังจาก Guest 1337 บล็อกได้สำเร็จ", Path="Guest1337/AutoPunch", Bindable="+"};
                {type="Space"}; {type="Divider"}; {type="Space"};
                {type="Toggle", EN="Remove Killer Walls", EN2="Hide the red walls.", TH1="ลบกำแพงฆาตกร", TH2="ซ่อนกำแพงสีแดง", Path="Visual/RemoveKillerWalls", Bindable="+", Callback=function(state)
                    SurvivorCon.Visual.RemoveKillerWalls = state; if not state then
                        twait(1); local KDoors = Functions.GetKDoors(); if #KDoors>0 then
                            Functions.SetKDoors(KDoors, true);
                        end;
                    end;
                end};
                {type="Toggle", EN="Remove Trails", EN2="John Doe's.", TH1="ลบ Trails", TH2="ของ John Doe", Path="Visual/RemoveJohnTrails", Bindable="+", Callback=function(state)
                    SurvivorCon.Visual.RemoveJohnTrails = state; if not state then
                        local JTrail = CurrentGame.JTrail; if JTrail then
                            Functions.SetJTrail(JTrail, false);
                        end;
                    end;
                end};
                {type="Toggle", EN="Remove Footprints", EN2="John Doe's Digital Footprints.", TH1="ลบรอบเท้า", TH2="Digital Footprints ของ John Doe", Path="Visual/RemoveJohnFootprints", Bindable="+", Callback=function(state)
                    SurvivorCon.Visual.RemoveJohnFootprints = state; if not state then
                        local JFoot = CurrentGame.JFoot; if JFoot then
                            Functions.SetJFoot(JFoot, false);
                        end;
                    end;
                end};
                {type="Toggle", EN="Smaller Spikes", EN2="John Doe's spike.", TH1="หนามที่เล็กลง", TH2="หนามของ John Doe", Path="Visual/SmallSpikeJohn", Bindable="+"};
                {type="Toggle", EN="Remove Fake Noli", EN2="Hide fake Noli from the game.", TH1="ลบ Noli ตัวปลอม", TH2="ซ่อน Noli ตัวปลอมจากเกม", Path="Visual/RemoveFakeNoli", Bindable="+"};
                {type="Toggle", EN="Remove 007n7 Clone", EN2="Hide fake 007n7 from the game.", TH1="ลบ 007n7 ตัวปลอม", TH2="ซ่อน 007n7 ตัวปลอมจากเกม", Path="Visual/RemoveFake007n7", Bindable="+"};
                {type="Space"}; {type="Divider"}; {type="Space"};
            };
            KillerTab = {
                {type="Dropdown", EN="Select Survivors", EN2="Select survivor you want to teleport to.", TH1="เลือกผู้เล่น", TH2="เลือกผู้เล่นที่จะวาปไปหา", Multi=true, AllowNone=true, Values={"All"}, Path="Killer/SelectSuvivor", RECall={
                    Title="Refresh",
                    RECall=function()
                        local tbl, CHs={"All"}, GetPlayers(P); for i=1, #CHs do
                            tblein(tbl, CHs[i].Name);
                        end; return tbl;
                    end;
                }};
                {type="Toggle", EN="Teleport", EN2="Teleport to selected players.", TH1="วาป", TH2="วาปไปหาผู้เล่นที่เลือก", Path="Killer/Teleport", Bindable="+"};
                {type="Toggle", EN="ESP Survivors", EN2="Show survivor's box", TH1="ESP ผู้รอดชีวิต", TH2="มองเห็นผู้รอดชีวิต", Path="Killer/ESPSurvivors", Bindable="+"};
                {type="Space"};
                {type="Slider", EN="Coolkidd's Dash Power", EN2="Make dashing further.", TH1="มอดความเร็วแดช Coolkidd", TH2="ทำให้แดชไปไกลขึ้น", Value={Min=1; Max=3}, Path="Coolkidd/DashPower"};
                {type="Toggle", EN="Coolkidd's Dash Mod", EN2="Make dashing controllable.", TH1="มอดการแดช Coolkidd", TH2="ทำให้ควบคุมการแดชได้", Path="Coolkidd/DashControl", Bindable="+"};
            };
        };

        CoruTask.New("FastThread-Main", function()
            warn(pcall(function() while true do
                local shouldNotClose = SurvivorCon.Generator.ESP
                    or SurvivorCon.Survivor.AutoGrabItems
                    or SurvivorCon.Visual.RemoveKillerWalls
                    or SurvivorCon.Survivor.ESPKillers
                    or SurvivorCon.Visual.RemoveJohnTrails
                    or SurvivorCon.Visual.RemoveJohnFootprints
                    or SurvivorCon.Visual.SmallSpikeJohn
                    or KillerCon.Killer.ESPSurvivors
                    or ClientCon.Ghost

                if not shouldNotClose or CoreDestroyed then
                    CoruTask.Close("FastThread-Main");
                end;

                if CurrentGame.Map then
                    if CurrentGame.Map ~= Map then
                        Functions:ClearSession();
                        twait(0.1); continue;
                    end;

                    local KillerOnly = CurrentGame.KillerOnly;
                    local JTrail = CurrentGame.JTrail;
                    local JFoot = CurrentGame.JFoot;

                    if ClientCon.Ghost then
                        Functions.Ghost(false);
                    end;

                    local Gens = Functions.GetGenerators(); if #Gens>0 then
                        if SurvivorCon.Generator.ESP then
                            Functions.ESPGenerators(Gens);
                        end;
                    end;
                
                    local Items = Functions.GetItems(); if #Items>0 then
                        if SurvivorCon.Survivor.AutoGrabItems then
                            Functions.AutoGrabItems(Items);
                        end;
                        if SurvivorCon.Survivor.ESPItems then
                            Functions.ESPItems(Items);
                        end;
                    end;

                    local KDoors = Functions.GetKDoors(); if #KDoors>0 then
                        if SurvivorCon.Visual.RemoveKillerWalls then
                            Functions.SetKDoors(KDoors, false);
                        end;
                    end; if KillerOnly then
                        Functions.SetKOnly(
                            KillerOnly,
                            SurvivorCon.Visual.RemoveKillerWalls
                        );
                    end;

                    if SurvivorCon.Survivor.ESPKillers or SurvivorCon.Visual.RemoveFakeNoli then
                        local CHs=GetChildren(Killers);
                        
                        if SurvivorCon.Survivor.ESPKillers then
                            Functions.ESPKillers(CHs);
                        end; if SurvivorCon.Visual.RemoveFakeNoli then
                            Functions.RemoveNoli(CHs);
                        end;
                    end;

                    if SurvivorCon.Visual.RemoveJohnTrails and JTrail then
                        Functions.SetJTrail(JTrail, true);
                    end;

                    if SurvivorCon.Visual.RemoveJohnFootprints and JFoot then
                        Functions.SetJFoot(JFoot, true);
                    end;

                    if SurvivorCon.Visual.SmallSpikeJohn then
                        Functions.AdjustSpike(SurvivorCon.Visual.SmallSpikeJohn);
                    end;

                    if KillerCon.Killer.ESPSurvivors then
                        Functions.ESPSurvivors(GetChildren(Survivors));
                    end;
                end;

                twait(0.1);
            end; end));
        end);
        CoruTask.New("RequiredMovement-Main", function()
            warn(pcall(function() while true do
                local shouldNotClose = KillerCon.Killer.Teleport;
                
                if not shouldNotClose or CoreDestroyed then
                    CoruTask.Close("RequiredMovement-Main");
                end;

                if KillerCon.Killer.Teleport then
                    Functions.TpPlayer(KillerCon.Killer.SelectSuvivor);
                end;

                twait(0.1);
            end; end));
        end);
        CoruTask.New("Task-Generator", function()
            while true do
                if not SurvivorCon.Generator.Auto or CoreDestroyed then
                    CoruTask.Close("Task-Generator");
                end;
                
                local Gens = Functions.GetGenerators();
                if Gens then Functions:AutoFixGenerator(Gens); end;

                twait(0.1);
            end;
        end);

        local LSecureUI = function()
            local WindUI = WindLib();
            local Window = WindUI:CreateWindow({
                Title = "Forsaken",
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
                Survivor = Window:Tab({ Title = "Survivor", Icon = "user-round-check" }),
                Killer = Window:Tab({ Title = "Killer", Icon = "skull" }),

                ExtraDiv = Window:Divider(),
                AddOn = LoaderSettings.AllowAddOn and Window:Tab({ Title = "AddOn", Icon = "box" }),
                Themes = LoaderSettings.AllowThemesTab and Window:Tab({ Title = "Themes", Icon = "palette" }),
                BHVESP = LoaderSettings.AllowESPCustomization and Window:Tab({ Title = "ESP Behaviour", Icon = "eye" }),
                Core = Window:Tab({ Title = "Core Settings", Icon = "settings" }),
            }; IntroLib.Init(WindUI, Tabs.Welcome); IntroLib:Tutorial(WindUI);
            Windy:CreateComponent(Tabs.Client, ScriptData.AutoData.ClientTab, "Client");
            Windy:CreateComponent(Tabs.Core, CorePackage());

            Windy:CreateComponent(Tabs.Survivor, ScriptData.AutoData.SurvivorTab, "Survivor");
            Windy:CreateComponent(Tabs.Killer, ScriptData.AutoData.KillerTab, "Killer");

            ESPF:DynamicU(Windy, Tabs.BHVESP, {
                {Title="Generators", Pointer="ESP", TextPath="ShowText/Generators", SizePath="TextSize/Generators", ScalePath="TextScale/Generators", ColorPath="TextColor/Generators"},
                {Title="Medkit", Pointer="ESP", TextPath="ShowText/Medkit", SizePath="TextSize/Medkit", ScalePath="TextScale/Medkit", ColorPath="TextColor/Medkit"},
                {Title="BloxyCola", Pointer="ESP", TextPath="ShowText/BloxyCola", SizePath="TextSize/BloxyCola", ScalePath="TextScale/BloxyCola", ColorPath="TextColor/BloxyCola"},
                {Title="Killers", Pointer="K", TextPath="ShowText/Killers", SizePath="TextSize/Killers", ScalePath="TextScale/Killers", ColorPath="TextColor/Killers"},
            });

            Window:SelectTab(1); Window:OnDestroy(function()
                CoreDestroyed = true;
            end);

            Window:SetToggleKey((LoaderSettings.UIKeybind and Enum.KeyCode[LoaderSettings.UIKeybind]) or Enum.KeyCode["RightShift"]);
            ScriptCache.WindUI = WindUI; ScriptCache.Window = Window;
        end; local LSecureLoad = function(AUTH_KEY)
            local OneRunCallMain, OneRunErrorMain = pcall(function()
                CoreDestroyed = false; GG.ESPF_ChangeMode = ESPF.Method;
                ClientCon.JumpPower = HumSelf and HumSelf.JumpPower or 50;

                GG.Configs = Config;
                LSecureUI();

                tk.spawn(function()
                    while not CoreDestroyed do
                        local FastThread = SurvivorCon.Generator.ESP
                            or SurvivorCon.Survivor.AutoGrabItems
                            or SurvivorCon.Survivor.ESPItems
                            or SurvivorCon.Visual.RemoveKillerWalls
                            or SurvivorCon.Survivor.ESPKillers
                            or SurvivorCon.Visual.RemoveJohnTrails
                            or SurvivorCon.Visual.RemoveJohnFootprints
                            or SurvivorCon.Visual.SmallSpikeJohn
                            or SurvivorCon.Visual.RemoveFakeNoli
                            or KillerCon.Killer.ESPSurvivors
                            or ClientCon.Ghost;
                        local RequiredMovement = KillerCon.Killer.Teleport;

                        if FastThread then
                            CoruTask.Handle("FastThread-Main");
                        end;
                        if RequiredMovement then
                            CoruTask.Handle("RequiredMovement-Main");
                        end;
                        if SurvivorCon.Generator.Auto then
                            CoruTask.Handle("Task-Generator");
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

                    ClientPackage.Brightness(ClientCon["Full Bright"]);
                    ClientPackage.SetJumpPower(ClientCon["Enable JumpPower"], ClientCon.JumpPower, HumSelf);
                    Pings = Functions.GetPing();

                    Functions:ApplyStamina(
                        if ClientCon.InfiniteStamina then
                            -10
                        else 10
                    );
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
                CoreConnection[3] = selff.CharacterAdded:Connect(Functions.OnCharValidate);
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
                    Functions.OnCharValidate(selff.Character);
                end;

                if not CoruTask.Intialized then
                    CoruTask.Init(WindUI);
                    CoruTask.Intialized = true;

                    VOIDPART.Position = Vec3(0, 9e9, 0);
                    VOIDPART.Anchored = true;
                    VOIDPART.Parent = W;

                    Functions:GCValidate();
                    Functions:GameValidate();
                end;
            end); if OneRunCallMain then
                return true, GG.LoadingSignal:Fire(100);
            end; return false, warn(OneRunErrorMain);
        end; GG.LSecureLoad = LSecureLoad; return LSecureLoad;
    end;
};
