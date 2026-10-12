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
local GetChildren = game.GetChildren;
local GetAttribute = game.GetAttribute;
local SetAttribute = game.SetAttribute;
local WaitForChild = game.WaitForChild;
local FindFirstChild = game.FindFirstChild;
local FindFirstChildOfClass = game.FindFirstChildOfClass;

local PlaceId = game.PlaceId;
local QUEST = CFr(-297, 10, 150);

local ScriptData = {};
local Config = GG.Configs or {};

Config.Client = Config.Client or {};
Config.Client.Client = Config.Client.Client or {};
Config.Automation = Config.Automation or {};
Config.Quest = Config.Quest or {};

return {
    Version = "AnimeZero_V3.01";
    Function = function(CorePackage, WindLib, IntroLib, Windy, ClientPackage, CoruTask, CommonF, ESPF)
        local CoreConnection    = {};
        local CoreDestroyed     = false;

        local Mobs              = {};
        local currentMap        = nil;
        local ATKOBJ            = nil;
        local Mode              = nil;
        local Cam               = W.CurrentCamera;
        local selff             = P.LocalPlayer;
        local PSG               = selff.PlayerGui;
        local selc              = selff.Character or EMPTY_OBJECT;
        local HumSelf           = selc.Parent and FindFirstChild(selc, "Humanoid") or EMPTY_OBJECT;
        local HumRSelf          = HumSelf.Parent and HumSelf.RootPart or EMPTY_OBJECT;
        local PSS               = WaitForChild(selff, "PlayerScripts", 9e9);

        local VOIDPART          = Instancen("Part");

        local Enemies           = PlaceId ~= 114574503491412 and WaitForChild(W, "enemies", 9e9);

        local cmdm              = selff:GetMouse();
        local ClientCon         = Config.Client.Client;
        local AutomationCon     = Config.Automation;
        local QuestCon          = Config.Quest;

        local Tp                = CommonF.Tp;
        local dist              = CommonF.dist;

        local REQ               = {};
        local RE                = {};
        local Functions         = {};

        ClientCon["TeleportWalk Speed"] = ClientCon["TeleportWalk Speed"] or 1;
        AutomationCon.Height = AutomationCon.Height or 8.5;
        AutomationCon.TweenSpeed = AutomationCon.TweenSpeed or 60;

        Functions.GetPing = function()
            return S.Network.ServerStatsItem["Data Ping"]:GetValue() / 1000;
        end;
        Functions.OnMobAdded = function(v)
            Mobs[v] = WaitForChild(v, "HumanoidRootPart");
        end;
        Functions.OnMobRemoved = function(v)
            Mobs[v] = nil;
        end;
        Functions.GameValidate = function()
            if PlaceId == 114574503491412 then
                REQ.packets = require(R.lobby.packets);
                return;
            end;

            local maps = require(R.global.constants.maps);
            currentMap = maps.mapsByName[maps.currentMap];
            worldMap = WaitForChild(WaitForChild(W, "World", 9e9), "Map", 9e9);

            REQ.maps = maps;
            REQ.run = require(R.game.packets.runPackets);
            REQ.char = require(R.game.packets.characterPackets);
            REQ.charCon = require(PSS.game.controllers.characterController);

            Mode = GetAttribute(W, "Mode"); if not Mode then
                W:GetAttributeChangedSignal("Mode"):Once(function()
                    Mode = GetAttribute(W, "Mode");
                end);
            end;
        end;
        Functions.Tp = function(CF, ignoreATK)
            local distance = dist(CF.Position);
            ATKOBJ = not ignoreATK and CF;
            if Tweening then return; end;

            HumRSelf.AssemblyAngularVelocity = Vector3.zero;

            if distance < 30 then
                return Tp(HumRSelf, CF);
            end; Tweening = TweenService:Create(
                HumRSelf, TweenInfo.new(
                    distance / AutomationCon.TweenSpeed,
                    Enum.EasingStyle.Linear,
                    Enum.EasingDirection.Out
                ), {CFrame = CF}
            );

            Tweening:Play();
            Tweening.Completed:Wait();
            Tweening = nil;
        end;
        Functions.Attack = function(self)
            local Pos = ATKOBJ and ATKOBJ.Position;
            if not Pos then return; end;
            if dist(Pos) <= 5 then
                if not self.ATKCD then
                    self.ATKCD = 0;
                elseif time() - self.ATKCD > 0.75 then
                    REQ.char.performM1:fire();
                    self.ATKCD = time();
                end;
            end;
        end;
        Functions.Skill = function(self)
            local Pos = ATKOBJ and ATKOBJ.Position;
            if not Pos then return; end;
            if dist(Pos) <= 5 then
                if not self.SKCD then
                    self.SKCD = 0;
                elseif time() - self.SKCD > 0.8 then
                    REQ.charCon.performSkill(1);
                    REQ.charCon.performSkill(2);
                    REQ.charCon.performSkill(3);
                    self.SKCD = time();
                end;
            end;
        end;
        Functions.ToArea = function(self, id)
            local Area = FindFirstChild(W.World.Areas, tostring(id));
            if not Area then return; end; self.Tp(GetPivot(Area));
        end;
        Functions.GetBlocker = function(self)
            if not worldMap then return; end;
            for i,d in pairs(currentMap.areas) do
                local Name = d.border; if Name then
                    local border = FindFirstChild(worldMap, Name);
                    local Rubble = border and FindFirstChild(border, "Rubble");
                    if not Rubble then continue; end;
                    local Model = Rubble.Parent;
                    local Health = GetAttribute(Model, "RubbleHealth");
                    if not Health and i ~= 1 then
                        return self:ToArea(i);
                    elseif Health and Health < 1 then
                        continue;
                    end; return Rubble, Model;
                end; if i==5 then self:ToArea(i); end;
            end; return nil;
        end;
        Functions.GetMob = function()
            for i,v in pairs(Mobs) do
                if Mode == "sololevelingraid" then
                    if #GetChildren(Enemies) ~= 1 then
                        if i.Name == 0 then
                            continue;
                        end;
                    end;
                end;
                if i.Parent and v.Parent then
                    return i,v;
                end;
            end;
        end;
        Functions.GoToPlane = function(self, Rubble, Model)
            local nearest, Dist = nil, math.huge;
            local charPos = HumRSelf.Position;
            local CHs = GetChildren(Rubble); for i=1, #CHs do
                local v=CHs[i]; if v.Parent and v.ClassName == "Model" then
                    local CModel = FindFirstChildOfClass(v, "Model");
                    if not CModel then
                        local DHs = GetChildren(v); for i=1, #DHs do
                            local c=DHs[i]; if c.Name == "Plane.084" then
                                if dist(c.Position) < Dist then
                                    Dist = dist(c.Position);
                                    nearest = c.Position;
                                end;
                            end;
                        end;
                    else
                        local DHs = GetChildren(CModel); for i=1, #DHs do
                            local c=DHs[i]; if c.Name == "Plane.084" then
                                if dist(c.Position) < Dist then
                                    Dist = dist(c.Position);
                                    nearest = c.Position;
                                end;
                            end;
                        end;
                    end;
                end;
            end; if nearest then
                self.Tp(CFr(Model.Blocker.RubbleBar.WorldPosition, nearest));
            end;
        end;
        Functions.AutomationMain = function(self)
            if PlaceId == 114574503491412 then return; end;
            if not selc.Parent or not HumRSelf.Parent or Tweening then return; end;
            local Mob, HumR = self.GetMob();
            if AutomationCon.AutoKillEnemy then
                if Mob and HumR then
                    local target = HumR.Position + Vec3(0, AutomationCon.Height, 0);
                    local CF = CFr(target, HumR.Position);
                    return self.Tp(CF);
                elseif not Mob and Mode == "spiritedawayraid" then
                    if dist(Vec3(-137, 5, -145)) < 201 then
                        self.Tp(CFr(-137, 4, -47), true);
                    end;
                end;
            end;

            if Mode ~= "hxh" then return; end;
            if not Mob and AutomationCon.AutoDestroyBorder then
                local Rubble, Model = self:GetBlocker();
                if not Rubble or not Model then return; end;
                self:GoToPlane(Rubble, Model);
            end;
        end;
        Functions.AutoVote = function()
            if PSG.StartVote.Holder.Visible then
                for i,v in pairs(getconnections(PSG.StartVote.Holder.Main.StartButton.Activated)) do
                    v.Function()
                end; twait(1);
            end;
        end;
        Functions.AutoNextRoom = function(self)
            if PlaceId == 114574503491412 then return; end;
            if not AutomationCon.AutoNextRoom then return; end;
            if Mode == "trials" and PSG.EndScreen.Enabled then
                REQ.run.endAction:fire(2);
            elseif Mode == "spiritedawayraid" then
                local Prox = FindFirstChild(W.World.Markers, "Exit");
                Prox = Prox and FindFirstChild(Prox, "ExitPrompt");
                if not Prox or not Prox.Enabled then return; end;
                self.Tp(Prox.Parent.CFrame, true);
                twait(0.3); fireproximityprompt(Prox);
            end;
        end;
        Functions.AutoRetry = function()
            if PSG.EndScreen.Enabled then
                REQ.run.endAction:fire(1);
            end;
        end;
        Functions.GetAreaHighlight = function()
            local start = time(); while time()-start < 1.5 do
                local Human = FindFirstChild(W.effects, "DeliveryTrail");
                Human = Human and FindFirstChild(Human, "AreaHighlight");
                if Human then return Human; end;
                twait(0.3);
            end; return nil;
        end;
        Functions.AutoDelivery = function(self)
            if dist(QUEST.Position) > 30 then
                Tp(HumRSelf, QUEST, 0.3);
                return;
            end;
            
            REQ.packets.deliveryAction:fire({action = "refresh", requestId=3});
            REQ.packets.deliveryAction:fire({action = "request", requestId=4});

            local Area = self.GetAreaHighlight();
            if Area then
                Tp(HumRSelf, GetPivot(Area), 0.03 + mclamp(Pings, 0, 100));
                Tp(HumRSelf, QUEST, 0.03 + mclamp(Pings, 0, 100));
            end;

            REQ.packets.deliveryAction:fire({action = "claim", requestId=13});
            REQ.packets.deliveryAction:fire({action = "claim", requestId=13});
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
                        {type="Slider", EN="Teleport Walk Speed", EN2="Change the speed of teleport walk.", TH1="ความเร็วในการเดินแบบวาร์ป", TH2="ปรับความเร็วในการเดินแบบวาร์ป", Value={Min=1, Max=50}, Path="Client/TeleportWalk Speed"},
                        {type="Toggle", EN="Enable Teleport Walk", EN2="Enable teleport walk.", TH1="เปิดใช้งานเดินแบบวาร์ป", TH2="เปิดใช้งานเดินโดยการวาร์ปไปเรื่อยๆ", Bindable="+", Path="Client/Enable TeleportWalk"},
                    }, Title="Client", Open=true};
                }};
            };
            AutomationTab = {
                {type="Toggle", EN="Auto Kill Enemies", EN2="Tween & kill all enemies including bosses.", TH1="ออโต้ฆ่ามอน", TH2="คำอธิบาย Toggle", Path="AutoKillEnemy", Bindable="+", Callback=function(state)
                    AutomationCon.AutoKillEnemy = state;
                    if not state and Tweening then
                        Tweening:Cancel();
                        Tweening = nil;
                    end;
                end};
                {type="Toggle", EN="Auto Destroy Border", EN2="Tween & destroy the border.", TH1="ออโต้ทำลายสิ่งกีดขวาง", TH2="คำอธิบาย Toggle", Path="AutoDestroyBorder", Bindable="+", Callback=function(state)
                    AutomationCon.AutoDestroyBorder = state;
                    if not state and Tweening then
                        Tweening:Cancel();
                        Tweening = nil;
                    end;
                end};
                {type="Slider", EN="Anchore Height", EN2="Adjust the height from you and mob.", TH1="ปรับความสูง", TH2="ปรับความสูงจากมอน", Path="Height", Value={Min=-15, Max=15}, Step=0.1}; {type="Space"};
                {type="Slider", EN="Tween Speed", EN2="Adjust the tween speed for 'Auto Kill Enemies' & 'Auto Destroy Border'.", TH1="ความเร็วในการวาป", TH2="ปรับความเร็วในการวาปซึ่งใช้กับ 'ออโต้ฆ่ามอน' และ 'ออโต้ทำลายสิ่งกีดขวาง'", Path="TweenSpeed", Value={Min=1, Max=60}}; {type="Space"};
                {type="Toggle", EN="Auto Vote", EN2="Auto vote start in story mode.", TH1="ออโต้โหวต", TH2="ออโต้กดโหวตเริ่มเกมใหม่ในโหมดเนื้อเรื่อง", Path="AutoVote", Bindable="+"};
                {type="Toggle", EN="Auto Retry", EN2="Auto retry at the end of the game.", TH1="ออโต้ลองอีกครั้ง", TH2="ออโต้กดลองอีกครั้งตอนจบเกม", Path="AutoRetry", Bindable="+"};
                {type="Toggle", EN="Auto Next Room", EN2="Use in other gamemode ( Trial, Spirit, Shadow ).", TH1="ออโต้ห้องถัดไป", TH2="ใช้ในบางเกมโหมด ( Trial, Spirit, Shadow )", Path="AutoNextRoom", Bindable="+"};
            };
            QuestTab = {
                {type="Toggle", EN="Auto Delivery", EN2="Teleport & complete delivery quest", TH1="ออโต้ส่งของ", TH2="วาปแล้วทำเควสส่งของ", Path="AutoDelivery", Bindable="+"};
            };
        };

        local LSecureUI = function()
            local WindUI = WindLib();
            local Window = WindUI:CreateWindow({
                Title = "Anime Zero",
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
                Automation = Window:Tab({ Title = "Automation", Icon = "cog" }),
                Quest = Window:Tab({ Title = "Quest", Icon = "box" }),

                ExtraDiv = Window:Divider(),
                AddOn = LoaderSettings.AllowAddOn and Window:Tab({ Title = "AddOn", Icon = "box" }),
                Themes = LoaderSettings.AllowThemesTab and Window:Tab({ Title = "Themes", Icon = "palette" }),
                Core = Window:Tab({ Title = "Core Settings", Icon = "settings" }),
            }; IntroLib.Init(WindUI, Tabs.Welcome); IntroLib:Tutorial(WindUI);
            Windy:CreateComponent(Tabs.Client, ScriptData.AutoData.ClientTab, "Client");
            Windy:CreateComponent(Tabs.Core, CorePackage());

            Windy:CreateComponent(Tabs.Automation, ScriptData.AutoData.AutomationTab, "Automation");
            Windy:CreateComponent(Tabs.Quest, ScriptData.AutoData.QuestTab, "Quest");

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
                        if PlaceId ~= 114574503491412 then
                            Functions:Attack();
                            Functions:Skill();

                            if AutomationCon.AutoVote then
                                Functions.AutoVote();
                            end;

                            if AutomationCon.AutoRetry then
                                Functions.AutoRetry();
                            end;
                        end;
                        
                        if QuestCon.AutoDelivery then
                            Functions:AutoDelivery();
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

                    ClientPackage.Brightness(ClientCon["Full Bright"]);
                    Pings = Functions.GetPing();
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
                    HumSelf = WaitForChild(selc, "Humanoid", 9e9);
                    HumRSelf = WaitForChild(char, "HumanoidRootPart", 9e9);
                    if Tweening then
                        Tweening:Cancel();
                        Tweening = nil;
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
                CoreConnection[5] = H.RenderStepped:Connect(function()
                    if CoreDestroyed and CoreConnection[5] then
                        CoreConnection[5]:Disconnect();
                        CoreConnection[5] = nil;
                        return;
                    end;
                    
                    Functions:AutoNextRoom();
                    Functions:AutomationMain();
                end);
                
                if selff.Character then
                    selc = selff.Character;
                    HumSelf = WaitForChild(selc, "Humanoid", 9e9);
                    HumRSelf = WaitForChild(selc, "HumanoidRootPart", 9e9);
                end;

                if not CoruTask.Intialized then
                    CoruTask.Init(WindUI);
                    CoruTask.Intialized = true;

                    VOIDPART.Position = Vec3(0, 9e9, 0);
                    VOIDPART.Anchored = true;
                    VOIDPART.Parent = W;

                    if Enemies then
                        Enemies.ChildAdded:Connect(Functions.OnMobAdded);
                        Enemies.ChildRemoved:Connect(Functions.OnMobRemoved);

                        local CHs=GetChildren(Enemies); for i=1, #CHs do
                            local v=CHs[i]; if v.Parent then
                                Functions.OnMobAdded(v);
                            end;
                        end;
                    end;

                    Functions.GameValidate();
                end;
            end); if OneRunCallMain then
                return true, GG.LoadingSignal:Fire(100);
            end; return false, warn(OneRunErrorMain);
        end; GG.LSecureLoad = LSecureLoad; return LSecureLoad;
    end;
};
