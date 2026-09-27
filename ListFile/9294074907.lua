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
local mrandom = math.random;
local GetPlayers = P.GetPlayers;
local GetChildren = game.GetChildren;
local WaitForChild = game.WaitForChild;
local GetDescendants = game.GetDescendants;
local FindFirstChild = game.FindFirstChild;
local IsDescendantOf = game.IsDescendantOf;
local GetMouseLocation = UIS.GetMouseLocation;
local FindFirstChildOfClass = game.FindFirstChildOfClass;
local FindFirstAncestorOfClass = game.FindFirstAncestorOfClass;

local VEC0 = Vector3.zero;
local VEC232 = Vec3(2,3,2);
local VEC0M0 = Vec3(0, math.huge, 0);
local EMPTY_OBJECT = {Parent=nil, SeatPart=nil};
local RED = Col3.fromRGB(255, 0, 0);
local WHITE = Col3.fromRGB(255, 255, 255);

local PlaceId = game.PlaceId;

local ScriptData = {};
local Config = GG.Configs or {};

Config.Client = Config.Client or {};
Config.Client.Client = Config.Client.Client or {};
Config.SilentAim = Config.SilentAim or {};
Config.SilentAim.Target = Config.SilentAim.Target or "Head";
Config.Aimbot = Config.Aimbot or {};
Config.Aimbot.Target = Config.Aimbot.Target or "Head";
Config.Aimbot.CircleSize = Config.Aimbot.CircleSize or 90;
Config.ESP = Config.ESP or {};

return {
    Version = "OneTapV3.03";
    Function = function(CorePackage, WindLib, IntroLib, Windy, ClientPackage, CoruTask, CommonF, ESPF, PromptPackage, DownloadPackage, QueuePack, CircleF)
        local CoreConnection    = {};
        local CoreDestroyed     = false;
        local ForceFloat        = "None";

        local VECNUM            = {};
        local TimerC            = 0;
        local GTarget           = EMPTY_OBJECT;
        local AimRunning        = false;
        local AimbotTarget      = nil;
        local RaycastIgnoreList = {Cam, nil, nil};
        local Cam               = W.CurrentCamera;
        local selff             = P.LocalPlayer;
        local PSG               = selff.PlayerGui;
        local selc              = selff.Character or EMPTY_OBJECT;
        local HumSelf           = selc.Parent and FindFirstChildOfClass(selc, "Humanoid") or EMPTY_OBJECT;
        local HumRSelf          = HumSelf.RootPart or EMPTY_OBJECT;
        local PSS               = WaitForChild(selff, "PlayerScripts", 9e9);

        local VOIDPART          = Instancen("Part");
        local RESPAWNBUFF       = buffer.fromstring("\028\001");

        local GInterface        = WaitForChild(PSG, "Game Interface", 9e9);

        local cmdm              = selff:GetMouse();
        local ClientCon         = Config.Client.Client;
        local SilentAimCon      = Config.SilentAim;
        local AimbotCon         = Config.Aimbot;
        local ESPCon            = Config.ESP;

        local dist              = CommonF.dist;
        local WToView           = Cam.WorldToViewportPoint;

        local Functions         = {randomObjs={"Head", "HumanoidRootPart"}};
        local RE                = {ByteNetReliable=WaitForChild(R, "ByteNetReliable", 9e9)};
        local REQ               = {};

        ClientCon.SpinSpeed = ClientCon.SpinSpeed or 20;
        ClientCon.JumpPower = ClientCon.JumpPower or 50;
        ClientCon.SpeedMultiplier = ClientCon.SpeedMultiplier or 1;
        ClientCon["TeleportWalk Speed"] = ClientCon["TeleportWalk Speed"] or 1;

        local params = RaycastParams.new();
        params.FilterType = Enum.RaycastFilterType.Exclude;
        params.IgnoreWater = true;

        Functions.GameValidate = function()
            local PStart = WaitForChild(PSS, "Start", HUGE99);
            local SGame = WaitForChild(PStart, "Game", HUGE99);

            local RCommon = WaitForChild(R, "Common", 9e9);
            local Components = WaitForChild(RCommon, "Components", 9e9);
            local ByteNet = WaitForChild(Components, "ByteNet", 9e9);
            local process = WaitForChild(ByteNet, "process", 9e9);

            local WeaponClient = require(WaitForChild(SGame, "WeaponClient", 9e9));
            local WeaponPackets = require(WaitForChild(process, "client", 9e9));

            local o;o=LowerC(WeaponPackets.sendReliable, function(self, func, packet)
                if self ~= 33 then return o(self, func, packet); end;
                if GTarget.Parent and selc.Parent then
                    local Head = FindFirstChild(selc, "Head");
                    if not Head then return o(packet); end;

                    local origin = Head.Position;
                    local targetPos = GTarget.Position;
                    local direction = (targetPos - origin).Unit;
                    packet.origin = origin;
                    packet.direction = direction;
                    packet.position = targetPos;
                    packet.hitPart = GTarget;
                    packet.hitResult = FindFirstAncestorOfClass(GTarget, "Model");
                    packet.was360 = true;
                    packet.quickscope = true;
                end; return o(self, func, packet);
            end);
            local o2;o2=LowerC(WeaponClient.getBullets, function(...)
                if ClientCon.NoReload then
                    return 10;
                end; return o2(...);
            end);
        end;
        Functions.Respawn = function()
            if not GInterface.Deathscreen.Visible then return; end;
            RE.ByteNetReliable:FireServer(RESPAWNBUFF);
        end;
        Functions.Spin = function(bool, num)
            if not HumRSelf.Parent then return; end;
            if bool and FindFirstChild(HumRSelf, "SPIN_AB") then return; end;
            local CHs = GetChildren(HumRSelf); for i=1, #CHs do
                local v= CHs[i]; if v.Parent and v.Name == "SPIN_AB" then
                    v:Destroy();
                end;
            end; if not bool then return; end;

            num = tonumber(num) or 50;
            
            local Spin = Instancen("BodyAngularVelocity", HumRSelf);
            Spin.Name = "SPIN_AB"; Spin.MaxTorque = VEC0M0;

            if not VECNUM[num] then
                VECNUM[num] = Vec3(0,num,0);
            end; Spin.AngularVelocity = VECNUM[num];
        end;
        Functions.UpdateSpinSpeed = function(num)
            if not HumRSelf.Parent then return; end;

            local SPIN_AB = FindFirstChild(HumRSelf, "SPIN_AB");
            if not SPIN_AB then return; end;
            
            num = tonumber(num) or 50;
            if not VECNUM[num] then
                VECNUM[num] = Vec3(0,num,0);
            end;
            
            local chs = GetChildren(HumRSelf); for i=1, #chs do
                local v = chs[i]; if v and v.Name == "SPIN_AB" then
                    v.AngularVelocity = VECNUM[num];
                end;
            end;
        end;
        Functions.isWall = function(from, HumR, ignore)
            local dir = HumR.Position - from;
            params.FilterDescendantsInstances = ignore or {};
            local result = Raycast(W, from, dir, params);
            if not result then return true; end;
            if result.Instance == HumR then
                return true;
            end; local model = FindFirstAncestorOfClass(HumR, "Model");
            if model and IsDescendantOf(result.Instance, model) then
                return true;
            end; return false;
        end;
        Functions.IsInSight = function(self, HumR)
            if typeof(Cam) ~= "Instance" then return nil; end;
            if HumR.Parent == selc then return true; end;
            local camPos = Cam.CFrame.Position;
            local pos, OnScreen = WToView(Cam, HumR.Position);
            if not OnScreen then return nil; end;
            return self.isWall(camPos, HumR, {Cam, HumR.Parent, selc});
        end;
        Functions.getNearestPlayer = function(self)
            local Target = if SilentAimCon.Target == "Random" then self.randomObjs[mrandom(1, #self.randomObjs)] else SilentAimCon.Target;
            local camPos = Cam.CFrame.Position;
            local nearestTarget, shortestDistance = nil, math.huge;
            local PlayersList = GetChildren(W); for i = 1, #PlayersList do
                local targetCharacter = PlayersList[i];
                if (SilentAimCon.SelfShot and targetCharacter == selc) or targetCharacter ~= selc then
                    if IsA(targetCharacter, "Model") then
                        local Hum = targetCharacter and FindFirstChildOfClass(targetCharacter, "Humanoid");
                        local root = targetCharacter and FindFirstChild(targetCharacter, Target);
                        if root and Hum and Hum.Health > 0 then
                            if self:IsInSight(root) then
                                local distance = dist(root.Position);
                                if distance < shortestDistance then
                                    shortestDistance = distance;
                                    nearestTarget = targetCharacter;
                                end;
                            end;
                        end;
                    end;
                end;
            end; return nearestTarget, shortestDistance;
        end;
        Functions.CancelAimbot = function(Circle)
            AimbotTarget = nil; if Circle then Circle:SetColor(WHITE); end;
        end;
        Functions.Aimbot = function(self, Circle)
            local MousePos = GetMouseLocation(UIS);
            local RequiredDistance = AimbotCon.CircleSize;
            if not AimbotTarget then
                local Mob = GetChildren(W);
                for i = 1, #Mob do
                    local v = Mob[i]; v = v and v.Parent and v; if v ~= nil and v ~= selc and selc and IsA(v, "Model") then
                        local TargetPart = v and FindFirstChild(v, AimbotCon.Target);
                        local Hum = FindFirstChildOfClass(v, "Humanoid");
                        if TargetPart and Hum and Hum.Health > 0 then
                            local Vector, OnScreen = WToView(Cam, TargetPart.Position);
                            local Distance = (Vec2(MousePos.X, MousePos.Y) - Vec2(Vector.X, Vector.Y)).Magnitude;
                            local HasClear = false;
                            pcall(function()
                                RaycastIgnoreList[2] = TargetPart.Parent;
                                RaycastIgnoreList[3] = selc;
                                if not self.isWall(Cam.CFrame.Position, TargetPart, RaycastIgnoreList) then
                                    HasClear = false;
                                else
                                    HasClear = true;
                                end;
                            end); if not HasClear then continue; end;
                            if Distance < RequiredDistance and OnScreen then
                                RequiredDistance = Distance;
                                AimbotTarget = v;
                            end;
                        end;
                    end;
                end;
            else
                local TargetPart = FindFirstChild(AimbotTarget, AimbotCon.Target);
                local Hum = FindFirstChildOfClass(AimbotTarget, "Humanoid");
                local Vector, OnScreen = TargetPart and WToView(Cam, TargetPart.Position);
                if not TargetPart or not Hum or Hum.Health <= 0 then
                    return self.CancelAimbot(Circle);
                elseif (Vec2(MousePos.X, MousePos.Y) - Vec2(Vector.X, Vector.Y)).Magnitude > RequiredDistance then
                    return self.CancelAimbot(Circle);
                end;
            end;
        end;
        Functions.ESPPlayers = function()
            local Mobs = GetChildren(W); for i = 1, #Mobs do
                local v = Mobs[i]; v = v and v.Parent and v;
                if v and v ~= selc and v.Parent and IsA(v, "Model") then
                    local HumR = FindFirstChild(v, "HumanoidRootPart");
                    if not HumR then continue; end;
                    ESPF.ESP("Player", v, {
                        Color = RED,
                        Size = VEC2,
                        Text = v.Name
                    });
                end;
            end; ESPF.Visible("Player", true, ESPCon.ShowText);
        end;
        Functions.UpdateTracer = function(target)
            local PTracer = GG.ESPObjects and GG.ESPObjects.Player and GG.ESPObjects.Player.Line or {};
            local PlayersList = GetChildren(W); 
            local lineIndex = 1;
            for i = 1, #PlayersList do
                local char = PlayersList[i];
                local HumR = char and FindFirstChild(char, "HumanoidRootPart");
                if char and char ~= selc and char.Parent and HumR then
                    local v = PTracer[lineIndex];
                    if v then
                        if target and IsA(char, "Model") then
                            local pos, onScreen = WToView(Cam, HumR.Position);
                            if onScreen then
                                v.From = Vec2(Cam.ViewportSize.X / 2, Cam.ViewportSize.Y / 2);
                                v.To = Vec2(pos.X, pos.Y);
                                v.Visible = true;
                            else
                                v.Visible = false;
                            end;
                        else
                            v.Visible = false;
                        end;
                    end;
                    lineIndex = lineIndex + 1;
                end;
            end;
            for i = lineIndex, #PTracer do
                if PTracer[i] then PTracer[i].Visible = false; end;
            end;
        end;

        ScriptData.AutoData = {
            ClientTab = {
                {type="Group", dats={
                    {dat={
                        {type="Toggle", EN="Third Person", EN2="Change the camera perspective to third person.", TH1="มุมมองบุคคลที่ 3", TH2="สลับมุมมองเป็นแบบบุคคลที่ 3", Path="Client/Third Person", Bindable="+", Callback=IB_NO_VIRTUALIZE(function(state)
                            ClientCon.ThirdPerson = state;
                            if not state then
                                selff.CameraMode = Enum.CameraMode.LockFirstPerson;
                                selff.CameraMaxZoomDistance = 0.5;
                                selff.CameraMinZoomDistance = 0.5;
                            else
                                selff.CameraMode = Enum.CameraMode.Classic;
                                selff.CameraMaxZoomDistance = 128;
                                selff.CameraMinZoomDistance = 10;
                            end;
                        end)},
                        {type="Toggle", EN="Auto Respawn", EN2="Turns on auto respawn.", TH1="ออโต้เกิดใหม่", TH2="เปิดใช้งานออโต้เกิดใหม่", Bindable="+", Path="Client/AutoRespawn"},
                        {type="Toggle", EN="No Reload", EN2="Turns off reloading.", TH1="ปิดใช้งานการรีโหลด", TH2="ปิดใช้งานการรีโหลดปืน", Path="Client/NoReload"},
                        {type="Toggle", EN="No Render", EN2="Change camera subject & disable 3D rendering", TH1="ปิดการ Render", TH2="เปลี่ยนกล้องและปิดการ render 3D", Bindable="+", Path="Client/No Render", Callback=function(state)
                            ClientCon["No Render"] = state;
                            H:Set3dRenderingEnabled(not state);
                            Cam.CameraSubject = if state then VOIDPART else HumSelf;
                        end},
                        {type="Toggle", EN="Spin", EN2="Spin your character.", TH1="หมุน", TH2="หมุนตัวละคร", Path="Client/Spin"},
                        {type="Slider", EN="Spin Speed", EN2="Change the speed of the spin.", TH1="ความเร็วในการหมุน", TH2="ปรับความเร็วในการหมุน", Value={Min=1, Max=100}, Step=1, Path="Client/SpinSpeed"},
                        {type="Toggle", EN="Full Bright", EN2="Make the game brighter, easier to see or look around.", TH1="แมพสว่าง", TH2="มองเห็นง่ายขึ้น", Bindable="+", Path="Client/Full Bright"},
                        {type="Toggle", EN="Float", EN2="Make your character float in the air.", TH1="ลอย", TH2="ทำให้ตัวละครเดินบนอากาศได้", Bindable="+", Path="Client/Float"},
                        {type="Toggle", EN="Noclip", EN2="Allow you to walk through walls.", TH1="เดินทะลุกำแพง", TH2="ต้องอธิบายด้วยหรอ", Bindable="+", Path="Client/Noclip"},
                        {type="Slider", EN="Walk Speed", EN2="Change the speed of your walk.", TH1="ความเร็วในการเดิน", TH2="ปรับความเร็วการเดิน", Value={Min=1, Max=100}, Path="Client/WalkSpeed", Callback=function(value)
                            ClientCon.WalkSpeed = value;
                            ClientPackage.SetWalkSpeed(value)
                        end},
                        {type="Slider", EN="Teleport Walk Speed", EN2="Change the speed of teleport walk.", TH1="ความเร็วในการเดินแบบวาร์ป", TH2="ปรับความเร็วในการเดินแบบวาร์ป", Value={Min=1, Max=10}, Path="Client/TeleportWalk Speed"},
                        {type="Toggle", EN="Enable Teleport Walk", EN2="Enable teleport walk.", TH1="เปิดใช้งานเดินแบบวาร์ป", TH2="เปิดใช้งานเดินโดยการวาร์ปไปเรื่อยๆ", Bindable="+", Path="Client/Enable TeleportWalk"},
                        {type="Slider", EN="Jump Power", EN2="Change the power of your jump.", TH1="ความแรงในการกระโดด", TH2="ปรับความแรงในการกระโดด", Value={Min=1, Max=300}, Path="Client/JumpPower"},
                        {type="Toggle", EN="Enable Jump Power", EN2="Enable jump power modification.", TH1="เปิดใช้งานความแรงในการกระโดด", TH2="ปรับความแรงในการกระโดด", Bindable="+", Path="Client/Enable JumpPower"},
                    }, Title="Client", Open=true};
                }};
            };
            SilentAimTab = {
                {type="Paragraph", EN="Wall Check & Look Direction", EN2="These 2 are forced use by the script due to Anti Cheat. These won't be show in the setting.", TH1="เช็คกำแพง & ทิศทางที่มอง", TH2="สองอย่างนี้สคริปจะบังคับใช้เนื่องจากกันโปร 2อย่างนี้จะไม่แสดงในการตั้งค่า"},
                {type="Dropdown", EN="Target", EN2="Select where the script should aim at.", TH1="เป้าหมาย", TH2="เลือกจุดที่สคริปควรเล็ง", Values={"Head", "HumanoidRootPart"}, Path="Target"},
                {type="Toggle", EN="Self-Shot [Patched]", EN2="Allow you to shoot at your own character.", TH1="ยิงตัวเอง", TH2="แปลกดีเนอะ แต่มันได้แต้ม5555", Locked=true, Path="SelfShot"},
                {type="Toggle", EN="Auto Fire", EN2="Automatically fire when the target is in sight.", TH1="ยิงอัตโนมัติ", TH2="ยิงอัตโนมัติเมื่อเป้าหมายอยู่ในสายตา", Bindable="+", Path="Auto Fire"},
                {type="Toggle", EN="Enable", EN2="Enable silent aiming.", TH1="เปิดใช้งาน", TH2="เปิดใช้งาน silent aiming", Bindable="+", Path="Enable"},
            };
            AimbotTab = {
                {type="Paragraph", EN="Wall Check & Look Direction", EN2="These 2 are forced use by the script due to Anti Cheat. These won't be show in the setting.", TH1="เช็คกำแพง & ทิศทางที่มอง", TH2="สองอย่างนี้สคริปจะบังคับใช้เนื่องจากกันโปร 2อย่างนี้จะไม่แสดงในการตั้งค่า"},
                {type="Dropdown", EN="Target", EN2="Select where the script should aim at.", TH1="เป้าหมาย", TH2="เลือกจุดที่สคริปควรเล็ง", Values={"Head", "HumanoidRootPart"}, Path="Target"},
                {type="Space"}; {type="Space"};
                {type="Slider", Title="Circle Size", TH1="ขนาดวงกลม", Value={Min=1, Max=360}, Step=0.1, Path="CircleSize"},
                {type="Toggle", Title="Show Circle", TH1="แสดงวงกลม", Path="Show Circle"},
                {type="Space"}; {type="Space"};
                {type="Toggle", EN="Enable", EN2="You need to hold/press the key you binded to; not just click the key. Before holding the key; you have to enable it first.", TH1="เปิดใช้งาน", TH2="เปิดใช้งาน silent aiming", Bindable="++", BindToGlobal="AimKey", Path="Enable"},
            };
            ESPTab = {
                {type="Toggle", EN="Players", EN2="Show ESP players.", TH1="ผู้เล่น", TH2="เปิดใช้งาน ESP ผู้เล่น", Path="Players", Callback=function(state)
                    ESPCon.Players = state;
                    ESPF.Destroy("Player");
                end},
                {type="Space"}; {type="Space"};
                {type="Toggle", EN="Show Text", EN2="This is a charm ESP from the script package.", TH1="ข้อความ", TH2="แสดงชื่อศัตรู", Path="ShowText"},
            };
        };

        CoruTask.New("Spin", function()
            while true do
                if not ClientCon.Spin or CoreDestroyed then
                    Functions.Spin(false);
                    CoruTask.Close("Spin");
                end; Functions.Spin(ClientCon.Spin, ClientCon.SpinSpeed);
                Functions.UpdateSpinSpeed(ClientCon.SpinSpeed);
                twait(0.1);
            end;
        end);

        CoruTask.New("ESP", function()
            while true do
                if not ESPCon.Players or CoreDestroyed then
                    ESPF.Visible("Player", false);
                    CoruTask.Close("ESP");
                end; Functions.ESPPlayers();
                twait(0.1);
            end;
        end);

        local LSecureUI = function()
            local WindUI = WindLib();
            local Window = WindUI:CreateWindow({
                Title = "[FPS] OneTap",
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
                SilentAim = Window:Tab({ Title = "Silent Aim", Icon = "skull" }),
                Aimbot = Window:Tab({ Title = "Aimbot", Icon = "crosshair" }),
                ESP = Window:Tab({ Title = "ESP", Icon = "eye" }),

                ExtraDiv = Window:Divider(),
                AddOn = LoaderSettings.AllowAddOn and Window:Tab({ Title = "AddOn", Icon = "box" }),
                Themes = LoaderSettings.AllowThemesTab and Window:Tab({ Title = "Themes", Icon = "palette" }),
                Core = Window:Tab({ Title = "Core Settings", Icon = "settings" }),
            }; IntroLib.Init(WindUI, Tabs.Welcome); IntroLib:Tutorial(WindUI);
            Windy:CreateComponent(Tabs.Client, ScriptData.AutoData.ClientTab, "Client");
            Windy:CreateComponent(Tabs.SilentAim, ScriptData.AutoData.SilentAimTab, "SilentAim");
            Windy:CreateComponent(Tabs.Aimbot, ScriptData.AutoData.AimbotTab, "Aimbot");
            Windy:CreateComponent(Tabs.ESP, ScriptData.AutoData.ESPTab, "ESP");

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
                        if ClientCon["Enable Fly"] then
                            CoruTask.Handle("Fly");
                        end; if SilentAimCon.Enable then
                            local char = Functions:getNearestPlayer();
                            if char then  local Hitbox = FindFirstChild(char, "Hitbox");
                                GTarget = (Hitbox and FindFirstChild(Hitbox, "Hitbox_Head")) or FindFirstChild(char, "Head");
                                if GTarget and SilentAimCon["Auto Fire"] and oclock() - TimerC >= 0.25 then
                                    TimerC = oclock(); mouse1click();
                                end;
                            else
                                GTarget = nil;
                            end;
                        end; if ESPCon.Players then
                            CoruTask.Handle("ESP");
                        end; if ClientCon.Spin then
                            CoruTask.Handle("Spin");
                        end; if ClientCon.AutoRespawn and Functions.Respawn then
                            Functions.Respawn();
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
                    if not AimbotCir then return; end;
                    AimbotCir:SetRadius(AimbotCon.CircleSize);
                    AimbotCir:SetVisible(AimbotCon["Show Circle"]);
                    AimbotCir:SetPosition(GetMouseLocation(UIS));

                    if not AimbotCon.Enable or not AimRunning then return; end;
                    Functions:Aimbot(AimbotCir);

                    local Target = AimbotTarget and FindFirstChild(AimbotTarget, AimbotCon.Target);
                    if Target then
                        Cam.CFrame = CFr(Cam.CFrame.Position, Target.Position);
                        AimbotCir:SetColor(RED);
                    end;
                end);
                CoreConnection[6] = H.RenderStepped:Connect(function()
                    if CoreDestroyed and CoreConnection[6] then
                        CoreConnection[6]:Disconnect(); CoreConnection[6] = nil;
                        return;
                    end; Functions.UpdateTracer(ESPCon.Tracer);
                end);
                
                if selff.Character then
                    selc = selff.Character; BP = selff.Backpack;
                    HumSelf = WaitForChild(selc, "Humanoid", 9e9);
                    HumRSelf = WaitForChild(selc, "HumanoidRootPart", 9e9);
                end;

                if not CoruTask.Intialized then
                    CoruTask.Init(WindUI);
                    CoruTask.Intialized = true;

                    AimbotCir = CircleF:new(AimbotCon.CircleSize);

                    UIS.InputBegan:Connect(function(input, gpe)
                        local aimKey = GG.GlobalBinds and GG.GlobalBinds.AimKey or "RightMouseButton";
                        if input.KeyCode.Name == aimKey or input.UserInputType.Name == aimKey then
                            AimRunning = true;
                        end;
                    end);
                    UIS.InputEnded:Connect(function(input, gpe)
                        local aimKey = GG.GlobalBinds and GG.GlobalBinds.AimKey or "RightMouseButton";
                        if input.KeyCode.Name == aimKey or input.UserInputType.Name == aimKey then
                            AimRunning = false;
                            if AimbotCir then AimbotCir:SetColor(WHITE); end;
                        end;
                    end);

                    Functions.GameValidate();
                end;
            end); if OneRunCallMain then
                return true, GG.LoadingSignal:Fire(100);
            end; return false, warn(OneRunErrorMain);
        end; GG.LSecureLoad = LSecureLoad; return LSecureLoad;
    end;
};
