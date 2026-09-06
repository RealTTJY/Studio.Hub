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
local C = GetService(game, "CoreGui");
local H = GetService(game, "RunService");
local W = GetService(game, "Workspace");
local P = GetService(game, "Players");

local gethui = gethui or function() return C; end;

local IsA = game.IsA;
local twait = tk.wait;
local CFr = CFrame.new;
local mfloor = math.floor;
local Vec3 = Vector3.new;
local PivotTo = W.PivotTo;
local tblein = tble.insert;
local mrandom = math.random;
local TwInfo = TweenInfo.new;
local GetPlayers = P.GetPlayers;
local UpperC = hookmetamethod;
local WaitForChild = game.WaitForChild;
local GetChildren = game.GetChildren;
local GetAttribute = game.GetAttribute;
local GetDescendants = game.GetDescendants;
local FindFirstChild = game.FindFirstChild;
local FindFirstChildOfClass = game.FindFirstChildOfClass;

local VEC0 = Vector3.zero;
local VEC2 = Vec3(2,2,2);
local VEC5 = Vec3(5,5,5);
local VEC343 = Vec3(3,4,3);
local RED = Col3.new(1,0,0);
local GREEN = Col3.new(0, 1, 0);
local BLUE = Col3.new(0, 0, 1);
local PURPLE = Col3.new(1, 0, 1);
local YELLOW = Col3.new(1, 1, 0);
local ORANGE = Col3.fromRGB(255, 165, 0);
local EMPTY_OBJECT = {Parent=nil, SeatPart=nil};

local ScriptData = {};
local Config = GG.Configs or {};

Config.Client = Config.Client or {};
Config.Client.Client = Config.Client.Client or {};
Config.Generator = Config.Generator or {};
Config.Gate = Config.Gate or {};
Config.Surivor = Config.Surivor or {};

return {
    Version = "VD_V3.02";
    Function = function(CorePackage, WindLib, IntroLib, Windy, ClientPackage, CoruTask, CommonF, ESPF)
        local CoreConnection    = {};
        local CoreDestroyed     = false;
        local ForceFloat        = "None";

        local lastPosition      = Vector3.zero;
        local isMoving          = false;
        local threshold         = 0.05;
        local Cam               = W.CurrentCamera;
        local selff             = P.LocalPlayer;
        local PSG               = selff.PlayerGui;
        local selc              = selff.Character or EMPTY_OBJECT;
        local Animator          = EMPTY_OBJECT;
        local HumSelf           = selc.Parent and FindFirstChildOfClass(selc, "Humanoid") or EMPTY_OBJECT;
        local HumRSelf          = HumSelf.RootPart or EMPTY_OBJECT;
        local PSS               = WaitForChild(selff, "PlayerScripts", 9e9);
        local ControlModule     = require(WaitForChild(WaitForChild(PSS, "PlayerModule", 9e9), "ControlModule", 9e9));

        local cmdm              = selff:GetMouse();
        local ClientCon         = Config.Client.Client;
        local GenCon            = Config.Generator;
        local GateCon           = Config.Gate;
        local SurCon            = Config.Surivor;
        local Control           = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0};

        local Crosshair         = Instancen("ScreenGui", gethui());
        local CrosshairDot      = Instancen("Frame", Crosshair);
        local CrosshairCorner   = Instancen("UICorner", CrosshairDot);

        Crosshair.Name = "CenterCrosshair"
        Crosshair.IgnoreGuiInset = true;
        Crosshair.ResetOnSpawn = false;
        Crosshair.Enabled = false;
        CrosshairDot.Name = "Dot";
        CrosshairDot.Size = UDim2.fromOffset(6, 6);
        CrosshairDot.Position = UDim2.fromScale(0.5, 0.5);
        CrosshairDot.AnchorPoint = Vector2.new(0.5, 0.5);
        CrosshairDot.BackgroundColor3 = Col3.fromRGB(255, 255, 255);
        CrosshairDot.BorderSizePixel = 0;
        CrosshairCorner.CornerRadius = UDim.new(1, 0);

        local GMap              = WaitForChild(W, "Map", 9e9);

        local RRemotes          = WaitForChild(R, "Remotes", 9e9);
        local RGenerator        = WaitForChild(RRemotes, "Generator", 9e9);
        local RExit             = WaitForChild(RRemotes, "Exit", 9e9);
        local RHealing          = WaitForChild(RRemotes, "Healing", 9e9);
        local RCarry            = WaitForChild(RRemotes, "Carry", 9e9);

        local Tp                = CommonF.Tp;

        local REQ               = {};

        ClientCon.FlySpeed = ClientCon.FlySpeed or 1;
        ClientCon.WalkSpeed = ClientCon.WalkSpeed or 16;
        ClientCon.JumpPower = ClientCon.JumpPower or 50;
        ClientCon["TeleportWalk Speed"] = ClientCon["TeleportWalk Speed"] or 1;

        local RE                = {};
        local Functions         = {};

        Functions.GameValidate = function(self)
            RE.RepairEvent = WaitForChild(RGenerator, "RepairEvent");
            RE.LeverEvent = WaitForChild(RExit, "LeverEvent");
            RE.HealEvent = WaitForChild(RHealing, "HealEvent");
            RE.UnHookEvent = WaitForChild(RCarry, "UnHookEvent");
        end;
        Functions.IsOnInteraction = function()
            return (GetAttribute(selc, "repairing") or 0) > 0
                or GetAttribute(selc, "isUnhooking")
                or GetAttribute(selc, "isHealing")
                or GetAttribute(selc, "Knocked")
                or GetAttribute(selc, "IsHooked")
                or GetAttribute(selc, "IsCarried");
        end;
        Functions.GetKiller = function(self)
            local Killer = Functions.Killer or nil;
            if Killer and Killer.Parent then return Killer; end;
            local CHs = GetPlayers(P); for i=1, #CHs do
                local v=CHs[i]; if v.Character and v.Character.Parent then
                    if GetAttribute(v.Character, "Chasemusic") then
                        Killer = v.Character;
                        Functions.Killer = Killer;
                        break;
                    end;
                end;
            end; return Killer;
        end;
        Functions.IsNearKiller = function(self, genp)
            local Killer = self:GetKiller();
            if not Killer then return false; end;
            local Head = FindFirstChild(Killer, "Head");
            if not Head then return false; end;
            if (genp.Position - Head.Position).Magnitude < 31 then
                return true;
            end; return false;
        end;
        Functions.GetResueBlock = function()
            if not GAntifling or not GAntifling then
                GAntifling = FindFirstChild(GMap, "Antifling");
            end; return GAntifling and FindFirstChild(GAntifling, "RescueTp");
        end;
        Functions.GetExit = function()
            local Exit1 = FindFirstChild(GMap, "Exit1"); if Exit1 then
                local Line = FindFirstChild(Exit1, "Fininshline", true);
                if Line then return {Line}; end;
            end;

            local FinishLines, GMapC = {}, GetChildren(GMap); for i=1, #GMapC do
                local v = GMapC[i]; if v.Parent and v.Name == "Fininshline" then
                    if IsA(v, "BasePart") and v.CanTouch then
                        tblein(FinishLines, v);
                    end;
                end;
            end; return FinishLines;
        end;
        Functions.Exit = function(self)
            local Exits = self.GetExit();
            if #Exits == 0 then return; end;

            for i=1, #Exits do
                local v = Exits[i]; if v.Parent then
                    if not HumRSelf.Parent then return; end;
                    Tp(HumRSelf, v.CFrame, 0.3);
                end;
            end;
        end;
        Functions.GetGenerators = function()
            local tbl = {};

            local NGs = FindFirstChild(GMap, "newGenerators") and GetChildren(GMap.newGenerators);
            local GEs = FindFirstChild(GMap, "Gens") and GetChildren(GMap.Gens) or {};
            local Gs = FindFirstChild(GMap, "Generators") and GetChildren(GMap.Generators);

            NGs = NGs or FindFirstChild(GMap, "new Generators") and GetChildren(GMap["new Generators"]) or {};
            Gs = Gs or FindFirstChild(GMap, "Generator") and GetChildren(GMap.Generator) or {};

            for i=1, #NGs do
                local v=NGs[i]; if v.Parent then
                    tblein(tbl, v);
                end;
            end; if #tbl > 0 then return tbl; end;

            for i=1, #GEs do
                local v=GEs[i]; if v.Parent then
                    tblein(tbl, v);
                end;
            end; if #tbl > 0 then return tbl; end;

            for i=1, #Gs do
                local v=Gs[i]; if v.Parent then
                    tblein(tbl, v);
                end;
            end; return tbl;
        end;
        Functions.FireGenerator = function(self, Gen)
            if not HumRSelf.Parent or not Gen.Parent then return; end;
            if self.IsOnInteraction() or self.IsGateReady() then return; end;
            local GP = FindFirstChild(Gen, "GeneratorPoint1") or FindFirstChild(Gen, "GeneratorPoint2");
            if not GP or self:IsNearKiller(GP) then return; end;

            Tp(HumRSelf, GP.CFrame, 0.5);
            RE.RepairEvent:FireServer(GP, true);
            tk.delay(1, function()
                while true do
                    if not GenCon.Auto or (not GenCon.DisableMovement and isMoving) or (GetAttribute(Gen, "RepairProgress") or 0) >= 100 or self:IsNearKiller(GP) or CoreDestroyed then
                        RE.RepairEvent:FireServer(GP, false);
                        break;
                    end; twait(0.05);
                end;
            end); return true;
        end;
        Functions.ESPGenerator = function(Gens)
            if not GenCon.ESP or not Gens or #Gens == 0 then return; end;
            for i=1, #Gens do
                local v=Gens[i]; if v.Parent then
                    if GenCon.ESP then
                        local PrimPart = FindFirstChild(v, "HitBox");
                        if not PrimPart then continue; end;
                        local ESPObject = ESPF.ESP("Gens", PrimPart, {
                            Color = PURPLE;
                            Size = VEC5;
                            Text = "Generator";
                        });
                        if ESPObject.Label then
                            ESPObject.Label.Text = str.format("Generator\n%d%%", GetAttribute(v, "RepairProgress") or 0);
                        end;
                    end;
                end;
            end; ESPF.Visible("Gens", true, true);
        end;
        Functions.AutoGenerators = function(self, Gens)
            if not GenCon.Auto or not Gens or #Gens == 0 then return; end;
            for i=1, #Gens do
                local v=Gens[i]; if v.Parent then
                    local RepairProgress = GetAttribute(v, "RepairProgress") or 0;
                    if RepairProgress >= 100 then continue; end;

                    if GenCon.Auto then
                        self:FireGenerator(v);
                    end;
                end;
            end;
        end;
        Functions.IsGateReady = function()
            local PGSurvivor = FindFirstChild(PSG, "Survivor");
            if not PGSurvivor then return false; end;
            local PGGen = FindFirstChild(PGSurvivor, "Gen");
            if not PGGen or not FindFirstChild(PGGen, "Gencount") then return false; end;
            return PGGen.Gencount.Text == "0";
        end;
        Functions.GetGates = function()
            local tbl, GMapC = {}, GetChildren(GMap);
            for i=1, #GMapC do
                local v = GMapC[i]; if v.Name == "Gate" and v.ClassName == "Model" and v.Parent then
                    local ExitLever = FindFirstChild(v, "ExitLever");
                    local Main = ExitLever and FindFirstChild(ExitLever, "Main");
                    local Highlight = Main and FindFirstChild(Main, "Highlight");
                    if not Highlight then continue; end;
                    tblein(tbl, Main);
                end;
            end;
            
            if #tbl == 0 then
                local Exit1 = FindFirstChild(GMap, "Exit1");
                local Exit2 = FindFirstChild(GMap, "Exit2");

                local Gate1 = Exit1 and FindFirstChild(Exit1, "Main");
                local Gate2 = Exit2 and FindFirstChild(Exit2, "Main");

                if Gate1 and Gate1.Parent then
                    local ExitLever = FindFirstChild(Gate1, "ExitLever");
                    local Main = ExitLever and FindFirstChild(ExitLever, "Main");
                    local Highlight = Main and FindFirstChild(Main, "Highlight");
                    if Highlight then
                        tblein(tbl, Main);
                    end;
                end;
                if Gate2 and Gate2.Parent then
                    local ExitLever = FindFirstChild(Gate2, "ExitLever");
                    local Main = ExitLever and FindFirstChild(ExitLever, "Main");
                    local Highlight = Main and FindFirstChild(Main, "Highlight");
                    if Highlight then
                        tblein(tbl, Main);
                    end;
                end;
            end; return tbl;
        end;
        Functions.FireGate = function(self, Gate, Interaction)
            if not HumRSelf.Parent or not Gate.Parent then return; end;
            if not Interaction or GetAttribute(Interaction, "isExiting") or GetAttribute(Interaction, "isRepairing") then return; end;

            Tp(HumRSelf, Gate.CFrame, 0.5);
            RE.LeverEvent:FireServer(Gate, true);
            tk.delay(1, function()
                while true do
                    if not GateCon.Auto or not GetAttribute(Interaction, "isExiting") or (not GateCon.DisableMovement and isMoving) or (GetAttribute(Gate, "ActivationProgress") or 0) >= 100 or self:IsNearKiller(Gate) or CoreDestroyed then
                        RE.LeverEvent:FireServer(Gate, false);
                        break;
                    end; twait(0.05);
                end;
            end);
        end;
        Functions.ESPGates = function(Gates)
            if not GateCon.ESP or not Gates or #Gates == 0 then return; end;
            for i=1, #Gates do
                local v=Gates[i]; if v.Parent then
                    if GateCon.ESP then
                        local ESPObject = ESPF.ESP("Gates", v, {
                            Color = WHITE;
                            Size = VEC5;
                            Text = "Gate";
                        });

                        if ESPObject.Label then
                            ESPObject.Label.Text = str.format("Gate\n%d%%", GetAttribute(v, "ActivationProgress") or 0);
                        end;
                    end;
                end;
            end; ESPF.Visible("Gates", true, true);
        end;
        Functions.AutoGate = function(self, Gates)
            if (not GateCon.Auto and not GateCon.Exit) or not Gates or #Gates == 0 then
                if GateCon.Auto and GateCon.JustExit then
                    return self:Exit();
                end; return;
            end;

            local Interaction = selc.Parent and FindFirstChild(selc, "CheckInterractable");
            if not Interaction or GetAttribute(Interaction, "isExiting") then return; end;

            if GateCon.Exit then
                if not GateCon.Auto then
                    return self:Exit();
                end;
                for i=1, #Gates do
                    local v=Gates[i]; if v.Parent then
                        local Progress = GetAttribute(v, "ActivationProgress") or 0;
                        if Progress >= 100 then
                            return self:Exit(), twait(5);
                        end;
                    end;
                end;
            end;

            for i=1, #Gates do
                local v=Gates[i]; if v.Parent then
                    local Progress = GetAttribute(v, "ActivationProgress") or 0;
                    local IsBusy = GetAttribute(v, "IsBeingActivated");

                    if not IsBusy and Progress < 100 then
                        self:FireGate(v, Interaction);
                    end;
                end;
            end;
        end;
        Functions.STeleportTo = function(where)
            if where == "Gen" then
                local Gens = Functions.GetGenerators();
                for i=1, #Gens do
                    local v=Gens[i]; if v.Parent then
                        local RepairProgress = GetAttribute(v, "RepairProgress") or 0;
                        if RepairProgress >= 100 then continue; end;
                        local GeneratorPoint = FindFirstChild(v, "GeneratorPoint1") or FindFirstChild(v, "GeneratorPoint2");
                        if not GeneratorPoint then return false; end;
                        return Tp(HumRSelf, GeneratorPoint.CFrame, 0.5);
                    end; return;
                end;
            elseif where == "Gate" then
                local Gates = Functions.GetGates();
                for i=1, #Gates do
                    local v=Gates[i]; if v.Parent then
                        return Tp(HumRSelf, v.CFrame, 0.5);
                    end;
                end; return;
            else
                local aPS = GetPlayers(P);
                local validTargets = {};

                for i=1, #aPS do
                    local v = aPS[i];
                    if v == selff then continue; end;
                    local char = v.Character;
                    if not char then continue; end;
                    
                    if not GetAttribute(char, "Chasemusic") then
                        if where == "Random" then
                            tblein(validTargets, char);
                        elseif where == "Knocked" and GetAttribute(char, "Knocked") then
                            tblein(validTargets, char);
                        elseif where == "Hooked" and GetAttribute(char, "IsHooked") then
                            tblein(validTargets, char);
                        end;
                    end;
                end;

                if #validTargets > 0 then
                    local targetChar = validTargets[mrandom(1, #validTargets)];
                    local targetHRP = FindFirstChild(targetChar, "HumanoidRootPart") or FindFirstChild(targetChar, "Head");
                    if targetHRP and HumRSelf.Parent then
                        return Tp(HumRSelf, targetHRP.CFrame, 0.5);
                    end;
                end;
            end;
        end;
        Functions.ESPSurvivors = function(Chars)
            if not SurCon.ESP or #Chars == 0 then return; end;
            local validTargets = {}; for i=1, #Chars do
                if not SurCon.ESP then return; end;
                local char = Chars[i]; if char.Parent and char ~= selc then
                    local ChaseM = GetAttribute(char, "Chasemusic");
                    
                    local ESPObject = ESPF.ESP("Survivors", char, {
                        Color = TColor;
                        Size = VEC343;
                        Text = char.Name;
                    });

                    if not ESPObject then continue; end;

                    if not ChaseM then
                        local IsKnocked = GetAttribute(char, "Knocked");
                        local IsHooked = GetAttribute(char, "IsHooked");
                        
                        local TColor = if IsKnocked then YELLOW elseif IsHooked then ORANGE else GREEN;
                        
                        if ESPObject.Box then
                            ESPObject.Box.Color3 = TColor;
                        end;
                        if ESPObject.Label then
                            ESPObject.Label.TextColor3 = TColor;
                        end;
                        if ESPObject.Highlight then
                            ESPObject.Highlight.OutlineColor = TColor;
                            ESPObject.Highlight.FillColor = TColor;
                        end;
                    elseif ChaseM then
                        if ESPObject.Box then
                            ESPObject.Box.Color3 = RED;
                        end;
                        if ESPObject.Label then
                            ESPObject.Label.TextColor3 = RED;
                        end;
                        if ESPObject.Highlight then
                            ESPObject.Highlight.OutlineColor = RED;
                            ESPObject.Highlight.FillColor = RED;
                        end;
                    end;
                end;
            end; ESPF.Visible("Survivors", true, true);
        end;
        Functions.Revive = function(self, HumR)
            if not HumR or not HumR.Parent then return; end;

            local Interaction = selc and FindFirstChild(selc, "CheckInterractable");
            if not Interaction or GetAttribute(Interaction, "isHealing") then return; end;
            if self:IsOnInteraction() then return; end;

            Tp(HumRSelf, HumR.CFrame, 1);
            RE.HealEvent:FireServer(HumR, true);
            tk.spawn(function()
                while true do
                    if not SurCon.AutoRevive or CoreDestroyed or not HumR.Parent or not GetAttribute(Interaction, "isHealing") then
                        return RE.HealEvent:FireServer(HumR, false);
                    end; twait(0.05);
                end;
            end);
        end;
        Functions.Unhook = function()
            return nil;
        end;
        Functions.CharsActions = function(self, chars)
            if not SurCon.AutoRevive or not SurCon.AutoUnhook or #chars == 0 then return; end;
            
            for i=1, #chars do
                local v=chars[i]; if v.Parent then
                    if GetAttribute(v, "Chasemusic") then
                        continue;
                    end;

                    local IsKnocked = GetAttribute(v, "Knocked");
                    local IsHooked = GetAttribute(v, "IsHooked");

                    local HumR = FindFirstChild(v, "HumanoidRootPart");

                    if IsKnocked and SurCon.AutoRevive then
                        self:Revive(HumR);
                    elseif IsHooked and SurCon.AutoUnhook then
                        self:Unhook(v);
                    end;
                end;
            end;
        end;
        
        ScriptData.AutoData = {
            ClientTab = {
                {type="Group", dats={
                    {dat={
                        {type="Toggle", EN="Show Crosshair", EN2="Show crosshair at the center of your screen.", TH1="แสดงเป้าเล็ง", TH2="แสดงเป้าเล็งที่กลางหน้าจอ", Bindable="+", Path="Client/ShowCrosshair", Callback=function(state)
                            ClientCon.ShowCrosshair = state;
                            Crosshair.Enabled = state;
                        end},
                        {type="Toggle", EN="Faster Animation", EN2="Make animation play faster including your gun animation.", TH1="เล่นอนิเมชั่นไวขึ้น", TH2="เล่นอนิเมชั่นเร็วขึ้น รวมถึงการยิงปืนด้วย", Bindable="+", Path="Client/FasterAnims"},
                        {type="Toggle", EN="Self-Revive", EN2="Make interactions possible again but your health still drain.", TH1="ชุบตัวเอง", TH2="ทำให้สามารถเล่นเกมได้ปกติ แต่เลือดจะลดเหมือนเดิมจะกว่าจะมีคนมาชุบให้", Bindable="+", Path="SelfRevive", Callback=function(state)
                            ClientCon.SelfRevive = state;
                            if not CoruTask.Intialized then return; end;
                            if HumSelf.Health <= 20 then
                                HumSelf.Health = 100;
                            else
                                HumSelf.Health = 20;
                            end;
                        end},
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
            GeneratorTab = {
                {type="Button", EN="Teleport To Generator", EN2="Teleport to incompleted generators.", TH1="วาปไปหาเครื่องปั่นไฟ", TH2="วาปไปหาเครื่องปั่นไฟที่ยังไม่เสร็จ", Callback=function()
                    Functions.STeleportTo("Gen");
                end}, {type="Space"}; {type="Space"};
                {type="Toggle", EN="Auto Generators", EN2="Teleport & fix generators with Killer Distance Detection", TH1="ออโต้ปั่นไฟ", TH2="วาปไปปั่นไฟให้ครบ", Bindable="+", Path="Auto"},
                {type="Toggle", EN="Disable Movement Detection", EN2="Allows you to use Teleport Walk without canceling the repair progression.", TH1="ระงับการตรวจจับการเคลื่อนที่", Bindable="+", TH2="เวลาใช้เดินแบบวาปจะไม่หลุดออกจากเครื่องปั่นไฟ", Path="DisableMovement"}, {type="Space"}; {type="Space"};
                {type="Toggle", EN="ESP Generators", EN2="Show generator boxes & status", TH1="ESP เครื่องปั่นไฟ", TH2="มองเห็นเครื่องปั่นไฟ", Bindable="+", Path="ESP", Callback=function(state)
                    GenCon.ESP = state; if not state then
                        ESPF.Visible("Gens", false);
                    end;
                end},
            };
            GateTab = {
                {type="Button", EN="Teleport To Gate", EN2="Teleport to any gate as long as you already completed generators.", TH1="วาปไปทางออก", TH2="วาปไปที่ทางออกสักอัน", Callback=function()
                    Functions.STeleportTo("Gate");
                end}, {type="Space"}; {type="Space"};
                {type="Toggle", EN="Auto Open Gate", EN2="Open gates automatically.", TH1="เปิดทางออกอัตโนมัติ", TH2="เปิดทางออกให้เอง", Bindable="+", Path="Auto"},
                {type="Toggle", EN="Auto Exit Gates", EN2="If you disabled 'Auto Open Gate', this will instant escape.", TH1="ออโต้ออก", TH2="ถ้าไม่ได้เปิดออโต้เปิดทางออก จะวาปออกทันที", Bindable="+", Path="Exit"},
                {type="Toggle", EN="Just Exit", EN2="Allow you to exit the match without complete anything BRUH.. You gain point btw. You have to enable 'Auto Exit Gates' for this to work.", TH1="ออกดีกว่าช่างแม่ง", TH2="วาปออกไปเลย โดยที่ไม่ต้องปั่นไฟ แต่ต้องเปิด 'ออโต้ออก'", Bindable="+", Path="JustExit"},
                {type="Toggle", EN="Disable Movement Detection", EN2="Allows you to use Teleport Walk without canceling the gate progression.", TH1="ระงับการตรวจจับการเคลื่อนที่", TH2="เวลาใช้เดินแบบวาปจะไม่หลุดออกจากคันโยก", Bindable="+", Path="DisableMovement"}, {type="Space"}; {type="Space"};
                {type="Toggle", EN="ESP Gates", EN2="Show gate boxes & status. Only work if you completed all generators", TH1="ESP ทางออก", TH2="มองเห็นทางออก", Bindable="+", Path="ESP", Callback=function(state)
                    GateCon.ESP = state; if not state then
                        ESPF.Visible("Gates", false);
                    end;
                end},
            };
            SurivorTab = {
                {type="Button", EN="Teleport To Survivor", EN2="Teleport to any survivor randomly", TH1="วาปไปหาผู้รอดชีวิต", TH2="วาปไปหาผู้รอดชีวิตแบบสุ่มๆ", Callback=function()
                    Functions.STeleportTo("Random");
                end},
                {type="Button", EN="Teleport To Knocked", EN2="Teleport to any knocked survivor.", TH1="วาปไปหาผู้ที่ล้ม", TH2="วาปไปหาผู้รอดชีวิตที่ล้มอยู่", Callback=function()
                    Functions.STeleportTo("Knocked");
                end},
                {type="Button", EN="Teleport To Hooked", EN2="Teleport to any hooked survivor.", TH1="วาปไปหาผู้ที่โดนแขวน", TH2="วาปไปหาผู้รอดชีวิตที่โดนแขวนอยู่", Callback=function()
                    Functions.STeleportTo("Hooked");
                end}, {type="Space"}; {type="Space"};
                {type="Toggle", EN="Gun Aimbot (BETA)", EN2="Predict killer movement and change the direction of projectile", TH1="Aimbot ปืน (BETA)", TH2="เปลี่ยนทิศทางกระสุนให้โดนผู้ล่า", Bindable="+", Path="GunAimbot"},
                {type="Toggle", EN="Auto Revive Survivors", EN2="Teleport & revive survivors", TH1="ออโต้ชุบผู้รอดชีวิต", TH2="วาปไปชุบผู้รอดชีวิต", Locked=true, Path="AutoRevive"},
                {type="Toggle", EN="Auto Unhook Survivors", EN2="Teleport & unhook survivors", TH1="ออโต้ปลดผู้รอดชีวิต", TH2="วาปไปปลดผู้รอดชีวิต", Locked=true, Path="AutoUnhook"}, {type="Space"}; {type="Space"};
                {type="Toggle", EN="ESP Survivors", EN2="Show survivor boxes & status", TH1="ESP ผู้รอดชีวิต", TH2="มองเห็นผู้รอดชีวิต", Bindable="+", Path="ESP"},
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
        CoruTask.New("Generator Action", function()
            warn(pcall(function() while true do
                if (not GenCon.Auto and not GenCon.ESP) or CoreDestroyed then
                    ESPF.Visible("Gens", false);
                    CoruTask.Close("Generator Action");
                end;

                local Gens = Functions.GetGenerators();
                Functions:AutoGenerators(Gens);
                Functions.ESPGenerator(Gens);
                
                twait(0.1);
            end; end));
        end);
        CoruTask.New("Gate Action", function()
            warn(pcall(function() while true do
                if (not GateCon.Auto and not GateCon.ESP) or CoreDestroyed then
                    ESPF.Visible("Gates", false);
                    CoruTask.Close("Gate Action");
                end;

                local Gates = Functions.GetGates();
                Functions:AutoGate(Gates);
                Functions.ESPGates(Gates);
                
                twait(0.1);
            end; end));
        end);
        CoruTask.New("Player Action", function()
            warn(pcall(function() while true do
                if (not SurCon.ESP and not SurCon.AutoRevive and not SurCon.AutoUnhook) or CoreDestroyed then
                    ESPF.Visible("Survivors", false);
                    CoruTask.Close("Player Action");
                end;

                local Chars, Players = {}, GetPlayers(P);
                for i=1, #Players do
                    local v=Players[i]; if v.Parent and v.Character then
                        tble.insert(Chars, v.Character);
                    end;
                end;
                
                Functions.ESPSurvivors(Chars);
                Functions:CharsActions(Chars);

                twait(0.1);
            end; end));
        end);

        local LSecureUI = function()
            local WindUI = WindLib();
            local Window = WindUI:CreateWindow({
                Title = "Violence District",
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
                Generator = Window:Tab({Title="Generator", Icon="wrench"}),
                Gate = Window:Tab({Title="Gate", Icon="door-closed-locked"}),
                Surivor = Window:Tab({Title="Surivor", Icon="person-standing"}),

                ExtraDiv = Window:Divider(),
                AddOn = LoaderSettings.AllowAddOn and Window:Tab({ Title = "AddOn", Icon = "box" }),
                Themes = LoaderSettings.AllowThemesTab and Window:Tab({ Title = "Themes", Icon = "palette" }),
                Core = Window:Tab({ Title = "Core Settings", Icon = "settings" }),
            }; IntroLib.Init(WindUI, Tabs.Welcome); IntroLib:Tutorial(WindUI);
            Windy:CreateComponent(Tabs.Client, ScriptData.AutoData.ClientTab, "Client");
            Windy:CreateComponent(Tabs.Core, CorePackage());

            Windy:CreateComponent(Tabs.Generator, ScriptData.AutoData.GeneratorTab, "Generator");
            Windy:CreateComponent(Tabs.Gate, ScriptData.AutoData.GateTab, "Gate");
            Windy:CreateComponent(Tabs.Surivor, ScriptData.AutoData.SurivorTab, "Surivor");

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
                        if ClientCon["Enable Fly"] then
                            CoruTask.Handle("Non-Standard Fly");
                        end;
                        if GenCon.Auto or GenCon.ESP then
                            CoruTask.Handle("Generator Action");
                        end;
                        if GateCon.Auto or GateCon.Exit or GateCon.ESP then
                            CoruTask.Handle("Gate Action");
                        end;
                        if SurCon.ESP or SurCon.AutoRevive or SurCon.AutoUnhook then
                            CoruTask.Handle("Player Action");
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
                    ClientPackage.Noclip(ClientCon.Noclip, selc and GetDescendants(selc));
                    ClientPackage.Brightness(ClientCon["Full Bright"]);
                    ClientPackage.SetJumpPower(ClientCon["Enable JumpPower"], ClientCon.JumpPower, HumSelf);

                    if ClientCon.FasterAnims and Animator.Parent then
                        local Anims = Animator:GetPlayingAnimationTracks(); for i=1, #Anims do
                            local track=Anims[i]; if track then
                                track:AdjustSpeed(3);
                            end;
                        end;
                    end;
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
                    Animator = WaitForChild(HumSelf, "Animator", 9e9);
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
                CoreConnection[5] = H.RenderStepped:Connect(function()
                    if not HumRSelf.Parent then return; end;
                    local currentPosition = HumRSelf.Position;
                    local delta = currentPosition - lastPosition;
                    local horizontalSpeed = Vec3(delta.X, 0, delta.Z).Magnitude;
                    isMoving = horizontalSpeed > threshold;
                    lastPosition = currentPosition;
                end);
                
                if selff.Character then
                    selc = selff.Character;
                    HumSelf = WaitForChild(selc, "Humanoid", 9e9);
                    HumRSelf = WaitForChild(selc, "HumanoidRootPart", 9e9);
                    Animator = WaitForChild(HumSelf, "Animator", 9e9);
                    ClientPackage:WalkSpeedC(HumSelf);
                end;

                if not CoruTask.Intialized then
                    CoruTask.Init(WindUI);
                    CoruTask.Intialized = true;
                    Functions:GameValidate();

                    local o;o=UpperC(R.Remotes.Items["Twist of Fate"].Fire, "__namecall", function(self, ...)
                        if checkcaller() then return o(self, ...); end;
                        if getnamecallmethod() == "FireServer" then
                            if tostring(self) == "Fire" then
                                if self.Parent.Name == "Twist of Fate" and SurCon.GunAimbot then
                                    local args={...};
                                    local Killer = Functions.GetKiller();
                                    local Root = Killer and FindFirstChild(Killer, "HumanoidRootPart");
                                    if not Root then return o(self, ...); end;
                                    local origin = Cam.CFrame.Position

                                    local myVelocity = HumRSelf.AssemblyLinearVelocity
                                    local targetVelocity = Root.AssemblyLinearVelocity
                                    local relativeVelocity = targetVelocity - myVelocity

                                    local offset = Root.Position - origin
                                    local distance = offset.Magnitude

                                    local projectileSpeed = 150;
                                    local travelTime = distance / projectileSpeed

                                    local predictedPosition =
                                        Root.Position + relativeVelocity * travelTime

                                    args[2] = CFrame.lookAt(origin, predictedPosition).LookVector

                                    return o(self, args[1], args[2]);
                                end;
                            end;
                        end; return o(self, ...);
                    end);
                end;
            end); if OneRunCallMain then
                return true, GG.LoadingSignal:Fire(100);
            end; return false, warn(OneRunErrorMain);
        end; GG.LSecureLoad = LSecureLoad; return LSecureLoad;
    end;
};
