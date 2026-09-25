local GG=GG; if not GG then return game:GetService("Players").LocalPlayer:Kick("[TTJY Studio] : Really? Your account is now at risk for the next ban wave."); end;

local QUEUE_INFO = GG.QUEUE_INFO or {};
local ScriptCache = GG.ScriptCache;
local LoaderSettings = GG.LoaderSettings;
local userIdentify = ScriptCache.userIdentify;
local LowerC = hookfunction or hookfunc;
local GetService = game.GetService;
local Instancen = Instance.new;
local Vec3 = Vector3.new;
local Vec2 = Vector2.new;
local str = string;
local tble = table;
local Col3 = Color3;
local tk = task;

local UIS = GetService(game, "UserInputService");
local R = GetService(game, "ReplicatedStorage");
local H = GetService(game, "RunService");
local W = GetService(game, "Workspace");
local P = GetService(game, "Players");

local IsA = game.IsA;
local twait = tk.wait;
local CFr = CFrame.new;
local oclock = os.clock;
local Raycast = W.Raycast;
local tblein = tble.insert;
local mrandom = math.random;
local GetPlayers = P.GetPlayers;
local GetChildren = game.GetChildren;
local WaitForChild = game.WaitForChild;
local GetAttribute = game.GetAttribute;
local GetDescendants = game.GetDescendants;
local FindFirstChild = game.FindFirstChild;
local IsDescendantOf = game.IsDescendantOf;
local GetMouseLocation = UIS.GetMouseLocation;
local FindFirstChildOfClass = game.FindFirstChildOfClass;
local FindFirstAncestorOfClass = game.FindFirstAncestorOfClass;

local VEC0 = Vector3.zero;
local RED = Col3.new(1,0,0);
local WHITE = Col3.new(1,1,1);
local EMPTY_OBJECT = {Parent=nil, SeatPart=nil};

local PlaceId = game.PlaceId;

local ScriptData = {};
local Config = GG.Configs or {};

Config.Client = Config.Client or {};
Config.Client.Client = Config.Client.Client or {};
Config.SilentAim = Config.SilentAim or {};
Config.Aimbot = Config.Aimbot or {};
Config.ESP = Config.ESP or {};

return {
    Version = "HyperSV3.06";
    Function = function(CorePackage, WindLib, IntroLib, Windy, ClientPackage, CoruTask, CommonF, ESPF, PromptPackage, DownloadPackage, QueuePack, CircleF)
        local CoreConnection    = {};
        local CoreDestroyed     = false;
        local ForceFloat        = "None";

        local AimbotTarget      = EMPTY_OBJECT;
        local AimRunning        = false;
        local CameraController  = nil;
        local GTarget           = EMPTY_OBJECT;
        local Cam               = W.CurrentCamera;
        local selff             = P.LocalPlayer;
        local PSG               = selff.PlayerGui;
        local selc              = selff.Character or EMPTY_OBJECT;
        local HumSelf           = selc.Parent and FindFirstChildOfClass(selc, "Humanoid") or EMPTY_OBJECT;
        local HumRSelf          = HumSelf.RootPart or EMPTY_OBJECT;
        local PSS               = WaitForChild(selff, "PlayerScripts", 9e9);

        local VOIDPART          = Instancen("Part");

        local cmdm              = selff:GetMouse();
        local ClientCon         = Config.Client.Client;
        local SilentAimCon      = Config.SilentAim;
        local AimbotCon         = Config.Aimbot;
        local ESPCon            = Config.ESP;

        SilentAimCon.Target = SilentAimCon.Target or "Head";
        AimbotCon.Target = AimbotCon.Target or "Head";
        AimbotCon.CircleSize = AimbotCon.CircleSize or 180;

        local dist              = CommonF.dist;
        local WToView           = Cam.WorldToViewportPoint;

        local IgnoreModel       = WaitForChild(W, "IgnoreThese", 9e9);

        local AimbotCir         = CircleF:new(AimbotCon.CircleSize);

        local Functions         = {randomObjs={"Head", "HumanoidRootPart"}};
        local REQ               = {};

        ClientCon.JumpPower = ClientCon.JumpPower or 50;
        ClientCon["TeleportWalk Speed"] = ClientCon["TeleportWalk Speed"] or 1;

        local params = RaycastParams.new();
        params.FilterType = Enum.RaycastFilterType.Exclude;
        params.IgnoreWater = true;

        Functions.GameValidate = function(self, gc)
            if not self.HookedMousePos then
                for i=1, #gc do
                    local v=gc[i]; if type(v) == 'table' and rawget(v, "GetMousePos") then
                        local o;o=LowerC(v.GetMousePos, function(...)
                            GTarget = self.GetNearestTarget(self, W.Mobs, 10000, false);
                            if not SilentAimCon.Enable then return o(...); end;
                            return (GTarget.Parent and GTarget.Position) or o(...);
                        end);
                    end;
                end; self.HookedMousePos = true;
            end;

            for i=1, #gc do
                local v=gc[i]; if type(v) == 'table' then
                    if not self.HookedCanHit and rawget(v, "CanHit") then
                        local o;o=LowerC(v.CanHit, function(...)
                            if not SilentAimCon.Enable then
                                return o(...);
                            end; return (GTarget.Parent and GTarget) or o(...);
                        end); self.HookedCanHit = true;
                    elseif type(rawget(v, "Hit")) == 'function' and not isfunctionhooked(v.Hit) then
                        pcall(function()
                            local o;o=LowerC(v.Hit, function(v1, ...)
                                if not SilentAimCon.Enable or not GTarget.Parent then
                                    GTarget = EMPTY_OBJECT;
                                    return o(v1, ...);
                                end;

                                local args = {...};
                                args[1] = GTarget;
                                args[2] = GTarget.Position;
                                GTarget = EMPTY_OBJECT;

                                return o(v1, unpack(args));
                            end);
                        end);
                    end;
                end;
            end;

            tk.spawn(function()
                local Arms = WaitForChild(IgnoreModel, "MyArms", 9e9);
                local Controller = WaitForChild(Arms, "AnimationController", 9e9);
                local Animator = FindFirstChildOfClass(Controller, "Animator");
                local Anims = Animator and FindFirstChild(Arms, "Anims");

                if not Anims then return; end;

                while true do
                    if not Animator.Parent or not Arms.Parent then return; end;
                    if ClientCon.InstantReload then
                        local CHs = Animator:GetPlayingAnimationTracks();

                        for i=1, #CHs do
                            local v=CHs[i]; if v then
                                pcall(track.AdjustSpeed, track, 9e9);
                            end;
                        end;
                    end; twait(0.1);
                end;
            end);
        end;
        Functions.isWall = function(from, HumR, ignore)
            params.FilterDescendantsInstances = ignore or {};
            
            local dir = HumR.Position - from;
            local result = Raycast(W, from, dir, params);

            if not result then return true; end;
            if result.Instance == HumR then return true; end;

            local model = FindFirstAncestorOfClass(HumR, "Model");
            if model and IsDescendantOf(result.Instance, model) then
                return true;
            end; return false;
        end;
        Functions.IsInSight = function(self, HumR)
            if typeof(Cam) ~= 'Instance' then return nil; end;
            local camPos = Cam.CFrame.Position;
            
            local pos, OnScreen = WToView(Cam, HumR.Position);
            if not OnScreen then
                return nil;
            elseif SilentAimCon.WallCheck then
                return self.isWall(camPos, HumR, {Cam, HumR.Parent, selc, IgnoreModel});
            end; return true;
        end;
        Functions.GetNearestTarget = function(self, folder, maxDist, deb)
            local camPos, closest, closestDist = Cam.CFrame.Position, EMPTY_OBJECT, maxDist;
            if not SilentAimCon.IgnoreBots then
                local CHs = GetChildren(folder); for i=1, #CHs do
                    local v=CHs[i]; if v.Parent and v.ClassName == "Model" then
                        local Team = GetAttribute(v, "Team");
                        if v == selc or (Team ~= -1 and Team == GetAttribute(selc, "Team")) then
                            continue;
                        end;

                        local Hum = FindFirstChildOfClass(v, "Humanoid");
                        local HumR = FindFirstChild(v, SilentAimCon.Target);

                        if HumR and Hum and Hum.Health > 0 then
                            if self.IsInSight(self, HumR) then
                                local dista = (HumR.Position - camPos).Magnitude;
                                if dista < closestDist then
                                    closestDist = dista;
                                    closest = HumR;
                                end;
                            end;
                        end;
                    end;
                end;
            end; if not deb and (not closest.Parent or not closestDist) and not SilentAimCon.IgnorePlayers then
                return self.GetNearestTarget(self, W, 10000, true);
            end; return closest, closestDist;
        end;
        Functions.Aimbot = function(self)
            local RequiredDistance = AimbotCon.CircleSize;
            if not AimbotTarget.Parent then
                local Mob = if not AimbotCon.IgnoreBots then GetChildren(W.Mobs) else {};
                local Mob2 = if not AimbotCon.IgnorePlayers then GetPlayers(P) else {};

                for i=1, #Mob2 do
                    tblein(Mob, FindFirstChild(W, Mob2[i].Name));
                end;

                for i=1, #Mob do
                    local v=Mob[i]; if v and v.Parent and v ~= selc and selc.Parent then
                        local TargetPart = v.Parent and FindFirstChild(v, AimbotCon.Target);
                        if not TargetPart or not FindFirstChildOfClass(v, "Humanoid") then continue; end;
                        local Team = if v.Parent then GetAttribute(v, "Team") else nil;
                        if Team ~= -1 and Team == GetAttribute(selc, "Team") then continue; end;
                        local Vector, OnScreen = WToView(Cam, TargetPart.Position);
                        local MousePosition = GetMouseLocation(UIS);
                        local MousePosXY = Vec2(MousePosition.X, MousePosition.Y);
                        local TargetPosXY = Vec2(Vector.X, Vector.Y);
                        local Distance = (MousePosXY-TargetPosXY).Magnitude;

                        if AimbotCon.WallCheck then
                            local IsNotWall = false; pcall(function()
                                IsNotWall = if not self.isWall(Cam.CFrame.Position, TargetPart, {Cam, TargetPart.Parent, selc, IgnoreModel}) then false else true;
                            end);

                            if not IsNotWall then continue; end;
                        end;

                        if Distance < RequiredDistance and OnScreen then
                            RequiredDistance = Distance;
                            AimbotTarget = v;
                        end;
                    end;
                end;
            else
                local TargetPart = FindFirstChild(AimbotTarget, AimbotCon.Target);
                local Hum = FindFirstChild(AimbotTarget, "Humanoid");
                if not Hum or not Hum.Parent or Hum.Health <= 0 then
                    return self.CancelAimbot(AimbotCir);
                elseif TargetPart then
                    local MousePosition = GetMouseLocation(UIS);
                    local Vector, OnScreen = WToView(Cam, TargetPart.Position);
                    local MousePosXY = Vec2(MousePosition.X, MousePosition.Y);
                    local TargetPosXY = Vec2(Vector.X, Vector.Y);
                    local Distance = (MousePosXY-TargetPosXY).Magnitude;

                    if Distance > RequiredDistance then
                        return self.CancelAimbot(AimbotCir);
                    end;
                end;
            end;
        end;
        Functions.CancelAimbot = function()
            AimbotTarget = EMPTY_OBJECT; return AimbotCir:SetColor(WHITE);
        end;
        Functions.UpdateCamState = function(target)
            if not ClientCon.ThirdPerson then return; end;
            if not CameraController then
                local GCs = getgc(true); for i=1, #GCs do
                    local v=GCs[i]; if type(v) == 'table' then
                        if rawget(v, "ToggleCamUpdate") then
                            CameraController = v;
                            break;
                        end;
                    end;
                end;
            end;

            CameraController:ToggleCamUpdate(target);
            CameraController:ToggleCharTransparency(not target and 0 or 1);
        end;
        Functions.ESPBot = function()
            if not ESPCon.Bots or not selc.Parent then return; end;
            local Mobs = GetChildren(W.Mobs); for i=1, #Mobs do
                local v=Mobs[i]; if v.Parent and v.ClassName == "Model" then
                    local HumR = FindFirstChild(v, "HumanoidRootPart");
                    local Team = v and GetAttribute(v, "Team");
                    if (Team ~= -1 and Team == GetAttribute(selc, "Team")) or not HumR then continue; end;

                    ESPF.ESP("Bot", v, {
                        Color = RED;
                        Size = VEC232;
                        Text = v.Name;
                    });
                end;
            end; ESPF.Visible("Bot", true, ESPCon.ShowText);
        end;
        Functions.ESPPlayer = function()
            if ESPCon.Players or not selc.Parent then return; end;
            local PlayersList = GetPlayers(P); for i=1, #PlayersList do
                local plr = PlayersList[i]; if plr.Character then
                    local v=FindFirstChild(W, plr.Name); if v then
                        if v.ClassName == "Model" then
                            local HumR = FindFirstChild(v, "HumanoidRootPart");
                            local Team = GetAttribute(v, "Team");
                            if (Team ~= -1 and Team == GetAttribute(selc, "Team")) or v == selc or not HumR then continue; end;

                            ESPF.ESP("Player", v, {
                                Color = RED;
                                Size = VEC232;
                                Text = plr.Name;
                            });
                        end;
                    end;
                end;
            end; ESPF.Visible("Player", true, ESPCon.ShowText);
        end;

        ScriptData.AutoData = {
            ClientTab = {
                {type="Group", dats={
                    {dat={
                        {type="Toggle", EN="Third Person", EN2="Make the camera switch between first person and third person.", TH1="มุมมองบุคคลที่สาม", TH2="เปลี่ยนมุมกล้องเป็นบุคคลที่สาม", Bindable="+", Path="Client/ThirdPerson", Callback=IB_NO_VIRTUALIZE(function(state)
                            ClientCon.ThirdPerson = state;
                            Functions.UpdateCamState(not state);
                            if not CameraController then return; end;
                            if not Cam or not HumSelf.Parent then return; end;
                            Cam.CameraType = Enum.CameraType.Custom;
                            Cam.CameraSubject = HumSelf;
                            if not state then
                                CameraController:ToggleCamUpdate(true);
                                CameraController:ToggleCharTransparency(1);
                            end;
                        end)},
                        {type="Toggle", EN="No Render", EN2="Change camera subject & disable 3D rendering", TH1="ปิดการ Render", TH2="เปลี่ยนกล้องและปิดการ render 3D", Bindable="+", Path="Client/No Render", Callback=function(state)
                            ClientCon["No Render"] = state;
                            H:Set3dRenderingEnabled(not state);
                            Cam.CameraSubject = if state then VOIDPART else HumSelf;
                        end},
                        {type="Toggle", EN="Instant Reload", EN2="Faster reloading. This function was not approved by TTJY, which means we don't know whether it will be detected.", TH1="รีโหลดปืนทันที", TH2="รีโหลดเร็วขึ้น; ฟังก์ชันนี้ไม่ได้รับการอนุมัติจาก TTJY ซึ่งหมายความว่าเราไม่ทราบว่าจะถูกตรวจพบหรือไม่", Path="Client/InstantReload"},
                        {type="Toggle", EN="Full Bright", EN2="Make the game brighter, easier to see or look around.", TH1="แมพสว่าง", TH2="มองเห็นง่ายขึ้น", Bindable="+", Path="Client/Full Bright"},
                        {type="Toggle", EN="Float", EN2="Make your character float in the air.", TH1="ลอย", TH2="ทำให้ตัวละครเดินบนอากาศได้", Bindable="+", Path="Client/Float"},
                        {type="Slider", EN="Teleport Walk Speed", EN2="Change the speed of teleport walk.", TH1="ความเร็วในการเดินแบบวาร์ป", TH2="ปรับความเร็วในการเดินแบบวาร์ป", Value={Min=1, Max=10}, Path="Client/TeleportWalk Speed"},
                        {type="Toggle", EN="Enable Teleport Walk", EN2="Enable teleport walk.", TH1="เปิดใช้งานเดินแบบวาร์ป", TH2="เปิดใช้งานเดินโดยการวาร์ปไปเรื่อยๆ", Bindable="+", Path="Client/Enable TeleportWalk"},
                        {type="Slider", EN="Jump Power", EN2="Change the power of your jump.", TH1="ความแรงในการกระโดด", TH2="ปรับความแรงในการกระโดด", Value={Min=1, Max=300}, Path="Client/JumpPower"},
                        {type="Toggle", EN="Enable Jump Power", EN2="Enable jump power modification.", TH1="เปิดใช้งานความแรงในการกระโดด", TH2="ปรับความแรงในการกระโดด", Bindable="+", Path="Client/Enable JumpPower"},
                    }, Title="Client", Open=true};
                }};
            };
            SilentAimTab = {
                {type="Dropdown", EN="Target", EN2="Select where the script should aim at.", TH1="เป้าหมาย", TH2="เลือกจุดที่สคริปควรเล็ง", Values={"Head", "HumanoidRootPart"}, Path="Target"},
                {type="Toggle", EN="Wall Check", EN2="You can turn this off in Sniper gamemode; Don't abuse it.", TH1="เช็คกำแพง", TH2="สามารถปิดได้ในโหมด Sniper แต่ก็อย่าใช้บ่อยดีกว่า", Path="WallCheck"},
                {type="Toggle", EN="Ignore Bots", EN2="Blocking the script from silent aiming at bots.", TH1="ไม่สนใจบอท", TH2="ป้องกัน silent aiming บอท", Path="IgnoreBots"},
                {type="Toggle", EN="Ignore Players", EN2="Blocking the script from silent aiming at players.", TH1="ไม่สนใจผู้เล่น", TH2="ป้องกัน silent aiming ผู้เล่น", Path="IgnorePlayers"},
                {type="Toggle", EN="Enable", EN2="Enable silent aiming.", TH1="เปิดใช้งาน", TH2="เปิดใช้งาน silent aiming", Bindable="+", Path="Enable"},
            };
            AimbotTab = {
                {type="Dropdown", EN="Target", EN2="Select where the script should aim at.", TH1="เป้าหมาย", TH2="เลือกจุดที่สคริปควรเล็ง", Values={"Head", "HumanoidRootPart"}, Path="Target"},
                {type="Toggle", EN="Wall Check", EN2="You can turn this off in Sniper gamemode; Don't abuse it.", TH1="เช็คกำแพง", TH2="สามารถปิดได้ในโหมด Sniper แต่ก็อย่าใช้บ่อยดีกว่า", Path="WallCheck"},
                {type="Toggle", EN="Ignore Bots", EN2="Blocking the script from silent aiming at bots.", TH1="ไม่สนใจบอท", TH2="ป้องกัน silent aiming บอท", Path="IgnoreBots"},
                {type="Toggle", EN="Ignore Players", EN2="Blocking the script from silent aiming at players.", TH1="ไม่สนใจผู้เล่น", TH2="ป้องกัน silent aiming ผู้เล่น", Path="IgnorePlayers"},
                {type="Space"}; {type="Space"};
                {type="Slider", Title="Circle Size", TH1="ขนาดวงกลม", Value={Min=1, Max=360}, Step=0.1, Path="CircleSize"},
                {type="Toggle", Title="Show Circle", TH1="แสดงวงกลม", Path="ShowCircle"},
                {type="Space"}; {type="Space"};
                {type="Toggle", EN="Enable", EN2="You need to hold/press the key you binded to; not just click the key. Before holding the key; you have to enable it first.", TH1="เปิดใช้งาน", TH2="เปิดใช้งาน silent aiming", Bindable="++", BindToGlobal="AimKey", Path="Enable"},
            };
            ESPTab = {
                {type="Toggle", EN="Bots", EN2="Show ESP bots.", TH1="บอท", TH2="เปิดใช้งาน ESP บอท", Path="Bots", Callback=function(state)
                    ESPCon.Bots = state;
                    ESPF.Destroy("Bot");
                end},
                {type="Toggle", EN="Players", EN2="Show ESP players.", TH1="ผู้เล่น", TH2="เปิดใช้งาน ESP ผู้เล่น", Path="Players", Callback=function(state)
                    ESPCon.Players = state;
                    ESPF.Destroy("Player");
                end},
                {type="Space"}; {type="Space"};
                {type="Toggle", EN="Show Text", EN2="This is a charm ESP from the script package.", TH1="ข้อความ", TH2="แสดงชื่อศัตรู", Path="ShowText"},
            };
        };

        CoruTask.New("ESP-Main", function()
            pcall(function() while true do
                if not (ESPCon.Bots and ESPCon.Players) or CoreDestroyed then
                    CoruTask.Close("ESP-Main");
                end;

                Functions.ESPBot();
                Functions.ESPPlayer();

                twait(0.1);
            end; end);
        end);

        local LSecureUI = function()
            local WindUI = WindLib();
            local Window = WindUI:CreateWindow({
                Title = "Hypershot",
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
                SilentAim = Window:Tab({Title="Silent Aim", Icon="skull"}),
                Aimbot = Window:Tab({Title="Aimbot", Icon="crosshair"}),
                ESP = Window:Tab({Title="ESP", Icon="eye"}),

                ExtraDiv = Window:Divider(),
                AddOn = LoaderSettings.AllowAddOn and Window:Tab({ Title = "AddOn", Icon = "box" }),
                Themes = LoaderSettings.AllowThemesTab and Window:Tab({ Title = "Themes", Icon = "palette" }),
                Core = Window:Tab({ Title = "Core Settings", Icon = "settings" }),
            }; IntroLib.Init(WindUI, Tabs.Welcome); IntroLib:Tutorial(WindUI);
            Windy:CreateComponent(Tabs.Client, ScriptData.AutoData.ClientTab, "Client");
            Windy:CreateComponent(Tabs.Core, CorePackage());

            Windy:CreateComponent(Tabs.SilentAim, ScriptData.AutoData.SilentAimTab, "SilentAim");
            Windy:CreateComponent(Tabs.Aimbot, ScriptData.AutoData.AimbotTab, "Aimbot");
            Windy:CreateComponent(Tabs.ESP, ScriptData.AutoData.ESPTab, "ESP");

            Window:SelectTab(1); Window:OnDestroy(function()
                CoreDestroyed = true;
            end);

            Window:SetToggleKey((LoaderSettings.UIKeybind and Enum.KeyCode[LoaderSettings.UIKeybind]) or Enum.KeyCode["RightShift"]);
            ScriptCache.WindUI = WindUI; ScriptCache.Window = Window;
        end; local LSecureLoad = function(AUTH_KEY)
            local OneRunCallMain, OneRunErrorMain = pcall(function()
                CoreDestroyed = false; GG.ESPF_ChangeMode = ESPF.Method;
                ClientCon.JumpPower = HumSelf and HumSelf.JumpPower or 50;
                AimbotCir:SetColor(RED); AimbotCir:SetThickness(2);

                GG.Configs = Config;
                LSecureUI();

                tk.spawn(function()
                    while not CoreDestroyed do
                        if ESPCon.Bots or ESPCon.Players then
                            CoruTask.Handle("ESP-Main");
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

                    ClientPackage.UpdatePosition(ClientCon.Float, ForceFloat, HumRSelf);
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
                    Functions:GameValidate(getgc(true));
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
                        CoreConnection[5]:Disconnect(); CoreConnection[5] = nil;
                        return;
                    end;

                    AimbotCir:SetRadius(AimbotCon.CircleSize);
                    AimbotCir:SetVisible(AimbotCon.ShowCircle);
                    AimbotCir:SetPosition(GetMouseLocation(UIS));

                    if not AimbotCon.Enable or not AimRunning then return; end;
                    Functions:Aimbot();

                    local Target = AimbotTarget.Parent and FindFirstChild(AimbotTarget, AimbotCon.Target);
                    if not Target then return; end;

                    Cam.CFrame = CFr(Cam.CFrame.Position, Target.Position);
                    AimbotCir:SetColor(RED);
                end);
                
                if selff.Character then
                    selc = selff.Character; BP = selff.Backpack;
                    HumSelf = WaitForChild(selc, "Humanoid", 9e9);
                    HumRSelf = WaitForChild(selc, "HumanoidRootPart", 9e9);
                    Functions:GameValidate(getgc(true));
                end;

                if not CoruTask.Intialized then
                    CoruTask.Init(WindUI);
                    CoruTask.Intialized = true;

                    local GlobalBinds = GG.GlobalBinds or {};
                    UIS.InputBegan:Connect(function(input, gpe)
                        local aimKey = GlobalBinds.AimKey;
                        if input.KeyCode.Name == aimKey or input.UserInputType.Name == aimKey then
                            AimRunning = true;
                            Functions.UpdateCamState(false);
                        end;
                    end);
                    UIS.InputEnded:Connect(function(input, gpe)
                        local aimKey = GlobalBinds.AimKey;
                        if input.KeyCode.Name == aimKey or input.UserInputType.Name == aimKey then
                            AimRunning = false;
                            AimbotCir:SetColor(WHITE);
                            Functions.UpdateCamState(not ClientCon.ThirdPerson);
                        end;
                    end);
                end;
            end); if OneRunCallMain then
                return true, GG.LoadingSignal:Fire(100);
            end; return false, warn(OneRunErrorMain);
        end; GG.LSecureLoad = LSecureLoad; return LSecureLoad;
    end;
};
