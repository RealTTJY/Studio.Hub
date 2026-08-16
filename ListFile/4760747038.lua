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
local tblein = tble.insert;
local tbler = tble.remove;
local tblef = tble.find;
local strfind = str.find;
local TwInfo = TweenInfo.new;
local GetPivot = W.GetPivot;
local GetChildren = game.GetChildren;
local GetAttribute = game.GetAttribute;
local WaitForChild = game.WaitForChild;
local GetDescendants = game.GetDescendants;
local FindFirstChild = game.FindFirstChild;
local FindFirstChildOfClass = game.FindFirstChildOfClass;

local VEC0 = Vector3.zero;
local VEC2 = Vec3(2,2,2);
local RED = Col3.new(1,0,0);
local WHITE = Col3.new(1, 1, 1);
local GREEN = Col3.new(0, 1, 0);
local BLUE = Col3.new(0, 0, 1);
local YELLOW = Col3.new(1, 1, 0);
local Purple = Col3.fromRGB(255, 0, 255);
local ORANGE = Col3.fromRGB(255, 165, 0);
local EMPTY_OBJECT = {Parent=nil, SeatPart=nil};
local PERSISTENT = Enum.ModelStreamingMode.Persistent;

local PlaceId = game.PlaceId;

local ScriptData = {};
local Config = GG.Configs or {};

Config.Client = Config.Client or {};
Config.Client.Client = Config.Client.Client or {};
Config.Rooms = Config.Rooms or {};
Config.Rooms.ESP = Config.Rooms.ESP or {};
Config.Rooms.ShowText = Config.Rooms.ShowText or {};
Config.Rooms.TextSize = Config.Rooms.TextSize or {};
Config.Rooms.TextScale = Config.Rooms.TextScale or {
    RedLumin = true;
    GreenLumin = true;
    WhiteLumin = true;
    PurpleLumin = true;
    WormLumin = true;
};
Config.Rooms.TextColor = Config.Rooms.TextColor or {
    RedLumin = RED;
    GreenLumin = GREEN;
    WhiteLumin = WHITE;
    PurpleLumin = Purple;
    WormLumin = BLUE;
};

return {
    Version = "WonderWhyV3.02";
    Function = function(CorePackage, WindLib, IntroLib, Windy, ClientPackage, CoruTask, CommonF, ESPF, PromptPackage)
        local CoreConnection    = {};
        local CoreDestroyed     = false;
        local ForceFloat        = "None";

        local activeMobs        = {};
        local Cam               = W.CurrentCamera;
        local selff             = P.LocalPlayer;
        local PSG               = selff.PlayerGui;
        local BP                = selff.Backpack;
        local selc              = selff.Character or EMPTY_OBJECT;
        local HumSelf           = selc.Parent and FindFirstChildOfClass(selc, "Humanoid") or EMPTY_OBJECT;
        local HumRSelf          = HumSelf.RootPart or EMPTY_OBJECT;
        local Seat              = HumSelf.SeatPart or EMPTY_OBJECT;
        local PSS               = WaitForChild(selff, "PlayerScripts", 9e9);
        local ControlModule     = require(WaitForChild(WaitForChild(PSS, "PlayerModule", 9e9), "ControlModule", 9e9));

        local cmdm              = selff:GetMouse();
        local ClientCon         = Config.Client.Client;
        local RoomsCon          = Config.Rooms;
        local RoomsConESP       = RoomsCon.ESP;
        local Control           = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0};

        local GeneratedMap      = EMPTY_OBJECT;
        local RShared           = WaitForChild(R, "Shared", 9e9);

        local Tp                = CommonF.Tp;
        local dist              = CommonF.dist;
        local Tween             = CommonF.Tween;

        local REQ               = {};

        ClientCon.FlySpeed = ClientCon.FlySpeed or 1;
        ClientCon.WalkSpeed = ClientCon.WalkSpeed or 16;
        ClientCon.JumpPower = ClientCon.JumpPower or 50;
        ClientCon["TeleportWalk Speed"] = ClientCon["TeleportWalk Speed"] or 1;
        RoomsCon.TextSize.RedLumin = RoomsCon.TextSize.RedLumin or 1;
        RoomsCon.TextSize.GreenLumin = RoomsCon.TextSize.GreenLumin or 1;
        RoomsCon.TextSize.WhiteLumin = RoomsCon.TextSize.WhiteLumin or 1;
        RoomsCon.TextSize.PurpleLumin = RoomsCon.TextSize.PurpleLumin or 1;
        RoomsCon.TextSize.WormLumin = RoomsCon.TextSize.WormLumin or 1;

        local RE                = {};
        local Functions         = {};

        Functions.GameDataInit = function(self)
            local NPCs = WaitForChild(W, "_NPCS_", 9e9);
            local CHs = GetChildren(NPCs); for i=1, #CHs do
                tblein(activeMobs, CHs[i]);
            end;

            NPCs.ChildAdded:Connect(function(new)
                local index = tblef(activeMobs, new);
                if index then return; end;
                tblein(activeMobs, new);
            end);
            NPCs.ChildRemoved:Connect(function(old)
                local index = tblef(activeMobs, old);
                if not index then return; end;
                tbler(activeMobs, index);
            end);
        end;
        Functions.GetSellPart = function(self)
            local SellPart = self.SellPart; if SellPart and SellPart.Parent then
                return SellPart;
            end;

            local ExitRoom = GeneratedMap.Parent and FindFirstChild(GeneratedMap, "ExitRoom");
            local Scriptable = ExitRoom and FindFirstChild(ExitRoom, "Scriptable");
            local SellButton = Scriptable and FindFirstChild(Scriptable, "SellButton");

            if not SellButton then return; end;
            Tp(HumRSelf, GetPivot(SellButton), 0.3);
            SellPart = WaitForChild(Scriptable, "SELLPART", 3);

            self.SellPart = SellPart;
            return SellPart;
        end;
        Functions.SellTP = function(self)
            local SellPart = self:GetSellPart();
            if not SellPart then return; end;
            Tween({
                primary = HumRSelf;
                goal = {CFrame = CFr(SellPart.Position)};
                info = TwInfo(1, Enum.EasingStyle.Linear);
            }); twait(0.3);
            return SellPart;
        end;
        Functions.GetSpawnPart = function()
            return GeneratedMap.Parent and FindFirstChild(GeneratedMap, "SpawnRoom")
        end;
        Functions.IsBagFull = function()
            local capacity = REQ.InventoryController._luminCapacity;
            if capacity == nil then return false; end;
            return #REQ.InventoryController._bagOrder >= capacity;
        end;
        Functions.InteractNPCs = function(self)
            local WasAutoCollect = RoomsCon.AutoCollectLumin;
            
            local sortedLumins = {}; for i=1, #activeMobs do
                local v=activeMobs[i]; if v and v.Parent then
                    local Harmless = GetAttribute(v, "HarmlessState");
                    if Harmless then
                        if strfind(v.Name, "Lumin") then
                            local Prim = v.PrimaryPart;
                            if not Prim then continue; end;
                            tblein(sortedLumins, v);
                        end;
                    end;
                end;
            end; tble.sort(sortedLumins, function(a, b)
                return dist(a.PrimaryPart.Position) < dist(b.PrimaryPart.Position);
            end); for i=1, #sortedLumins do
                local v = sortedLumins[i];
                local Prim = v.PrimaryPart;

                if not self.IsBagFull() then
                    if RoomsCon.AutoCollectLumin then
                        Tween({
                            primary = HumRSelf;
                            goal = {CFrame = CFr(Prim.Position)};
                            info = TwInfo(dist(Prim.Position) / 300, Enum.EasingStyle.Linear);
                        }); twait(0.3);
                    end;

                    if RoomsCon.LuminAura or RoomsCon.AutoCollectLumin then
                        if dist(Prim.Position) <= 30 then
                            REQ.Network.Game.GrabLumin:Fire(GetAttribute(v, "NetworkId"));
                        end;
                    end;
                end;
            end;

            if RoomsCon.AutoSellLumin then
                local SellPart = self:SellTP();
                if not SellPart then return; end;
                if dist(SellPart.Position) < 51 then
                    local CHs = GetChildren(BP); for i=1, #CHs do
                        local v=CHs[i]; if v.Parent then
                            REQ.Network.Inventory.DropItem:Fire(v);
                        end;
                    end;
                end;

                local Prox = SellPart.Parent.SellButton.Button.ProximityPrompt;
                
                Tween({
                    primary = HumRSelf;
                    goal = {CFrame = CFr(Prox.Parent.Position)};
                    info = TwInfo(1, Enum.EasingStyle.Linear);
                }); twait(0.3);
                
                for i=1, 3 do
                    fireproximityprompt(Prox);
                end;
            end;

            if not WasAutoCollect then return; end;
            local SpawnRoom = self.GetSpawnPart();
            if not SpawnRoom then return; end;
            Tp(HumRSelf, GetPivot(SpawnRoom));
        end;
        Functions.ESPNPCs = function(self)
            for i=1, #activeMobs do
                local v=activeMobs[i]; if v and v.Parent then
                    local Harmless = GetAttribute(v, "HarmlessState");
                    if Harmless then
                        if strfind(v.Name, "Lumin") then
                            local LuminColor = v.Name:gmatch("%a+")();
                            local ESPObject = ESPF.ESP(LuminColor .. "Lumin", v, {
                                Color = WHITE;
                                Size = VEC2;
                                Text = v.Name;
                                NoStart = true;
                            });
                        end;
                    end;
                end;
            end;

            for i,v in pairs({
                RedLumin = RoomsConESP.RedLumin;
                GreenLumin = RoomsConESP.GreenLumin;
                WhiteLumin = RoomsConESP.WhiteLumin;
                PurpleLumin = RoomsConESP.PurpleLumin;
                WormLumin = RoomsConESP.WormLumin;
            }) do
                if v then
                    ESPF.Visible(i, true, RoomsCon.ShowText[i]);
                    ESPF.Scale(i, RoomsCon.TextScale[i]);
                    ESPF.Size(i, RoomsCon.TextSize[i]);
                    ESPF.Color(i, RoomsCon.TextColor[i]);
                end;
            end;
        end;
        Functions.ChaseEscape = function()
            local CurrentChase = FindFirstChild(W, "CurrentChase");
            if not CurrentChase then return; end;
            local MoleChase = FindFirstChild(CurrentChase, "MoleChase");
            local WormChase = FindFirstChild(CurrentChase, "WormChase");
            if MoleChase then
                for i=1, 2 do
                    pcall(function()
                        Tp(HumRSelf, GetPivot(workspace.CurrentChase.MoleChase.EndTrackRoom.ColorfulBlock1));
                        Tp(HumRSelf, GetPivot(MoleChase.EndTrackRoom.Misc.Track));
                    end); twait(1);
                end;
            elseif WormChase then
                warn(pcall(function()
                    Tp(HumRSelf, GetPivot(WormChase.dropperandtriplewormrun.ColorfulBlock1));
                    Tp(HumRSelf, GetPivot(WormChase.EverythingThatNeedsScripts.CartEnd.Track));
                end));
            end;
        end;

        ScriptData.AutoData = {
            ClientTab = {
                {type="Group", dats={
                    {dat={
                        {type="Toggle", EN="Infinite Stamina", EN2="Infinite stamina on local player.", TH1="Stamina ไม่จำกัด", TH2="Infinite Stamina on local player.", Bindable="+", Path="Client/InfStamina", Callback=function(state)
                            selff:SetAttribute("InfiniteStamina", state);
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
            RoomsTab = {
                {type="Toggle", EN="Auto Collect Lumin", EN2="Teleport & grab lumins.", TH1="ออโต้เก็บลูมิน", TH2="วาปและเก็บลูมิน", Bindable="+", Path="AutoCollectLumin"},
                {type="Toggle", EN="Auto Sell Lumin", EN2="Teleport & sell lumins.", TH1="ออโต้ขายลูมิน", TH2="วาปและขายลูมิน", Bindable="+", Path="AutoSellLumin"},
                {type="Toggle", EN="Grab Lumin Aura", EN2="Grab nearby lumins.", TH1="เก็บลูมินออร่า", TH2="เก็บลูมินรอบๆตัว", Bindable="+", Path="LuminAura"}, {type="Space"}; {type="Divider"}; {type="Space"};
                {type="Button", EN="Teleport To Sell Room", EN2="Instant teleport to sell room.", TH1="วาปไปที่ห้องขาย", TH2="ไปที่ห้องขายแบบทันที", Callback=function()
                    Functions:SellTP();
                end},
                {type="Button", EN="Teleport To Spawn Room", EN2="Instant teleport to spawn.", TH1="วาปไปที่ห้องเกิด", TH2="ไปที่ห้องเกิดแบบทันที", Callback=function()
                    local SpawnRoom = Functions.GetSpawnPart();
                    if not SpawnRoom then return; end;
                    Tp(HumRSelf, GetPivot(SpawnRoom));
                end}, {type="Space"}; {type="Divider"}; {type="Space"};
                {type="Toggle", EN="ESP Green Lumins", EN2="Show green lumin's box.", TH1="ESP ลูมินสีเขียว", TH2="มองเห็นลูมินสีเขียว", Bindable="+", Path="ESP/GreenLumin", Callback=function(state)
                    RoomsConESP.GreenLumin = state; if not state then
                        ESPF.Visible("GreenLumin", false, false);
                    end;
                end},
                {type="Toggle", EN="ESP Red Lumins", EN2="Show red lumin's box.", TH1="ESP ลูมินสีแดง", TH2="มองเห็นลูมินสีแดง", Bindable="+", Path="ESP/RedLumin", Callback=function(state)
                    RoomsConESP.RedLumin = state; if not state then
                        ESPF.Visible("RedLumin", false, false);
                    end;
                end},
                {type="Toggle", EN="ESP White Lumins", EN2="Show white lumin's box.", TH1="ESP ลูมินสีขาว", TH2="มองเห็นลูมินสีขาว", Bindable="+", Path="ESP/WhiteLumin", Callback=function(state)
                    RoomsConESP.WhiteLumin = state; if not state then
                        ESPF.Visible("WhiteLumin", false, false);
                    end;
                end},
                {type="Toggle", EN="ESP Purple Lumins", EN2="Show purple lumin's box.", TH1="ESP ลูมินสีม่วง", TH2="มองเห็นลูมินสีม่วง", Bindable="+", Path="ESP/PurpleLumin", Callback=function(state)
                    RoomsConESP.PurpleLumin = state; if not state then
                        ESPF.Visible("PurpleLumin", false, false);
                    end;
                end},
                {type="Toggle", EN="ESP Worm Lumins", EN2="Show worm lumin's box.", TH1="ESP หนอนลูมิน", TH2="มองเห็นหนอนลูมิน", Bindable="+", Path="ESP/WormLumin", Callback=function(state)
                    RoomsConESP.WormLumin = state; if not state then
                        ESPF.Visible("WormLumin", false, false);
                    end;
                end},
            };
            ChaseTab = (DevID and {
                {type="Button", EN="Teleport To End Room", EN2="Make sure you start the chase sequence first.", TH1="วาปไปที่ห้องสุดท้าย", TH2="อย่าลืมเริ่มการไล่ล่าก่อนวาป", Callback=function(state)
                    Functions:ChaseEscape();
                end}, 
            }) or {
                {type="Button", EN="WARNING", EN2="Developer ID is needed to access this feature.", TH1="คำเตือน", TH2="ต้องใช้บัญชีของผู้พัฒนาโปรเพื่อเข้าถึงฟังชั่นนี้"}
            };
        };

        CoruTask.New("Fly", function()
            local BG = Instancen("BodyGyro", HumRSelf);
            local BV = Instancen("BodyVelocity", HumRSelf);
            local VEC9E9 = Vec3(9e9, 9e9, 9e9);
            local FSpeed = 0; while true do
                if not ClientCon["Enable Fly"] or not HumRSelf or not HumRSelf.Parent or CoreDestroyed then
                    Control = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0};
                    FSpeed = 0; if BG then BG:Destroy(); end; if BV then BV:Destroy(); end; CoruTask.Close("Fly");
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
        CoruTask.New("NPC-Main", function()
            warn(pcall(function()
            if PlaceId ~= 107085682317132 then
                return;
            end;

            while true do
                if not (RoomsCon.AutoCollectLumin or RoomsCon.LuminAura or RoomsCon.AutoSellLumin) or CoreDestroyed then
                    CoruTask.Close("NPC-Main");
                end;

                Functions:InteractNPCs();

                twait(0.1);
            end; end));
        end);
        CoruTask.New("NPC-ESP", function()
            warn(pcall(function()
            if PlaceId ~= 107085682317132 then
                return;
            end; while true do
                if not (RoomsCon.ESP.RedLumin or RoomsCon.ESP.GreenLumin or RoomsCon.ESP.WhiteLumin or RoomsCon.ESP.PurpleLumin or RoomsCon.ESP.WormLumin) or CoreDestroyed then
                    CoruTask.Close("NPC-ESP");
                end;

                Functions:ESPNPCs();

                twait(0.1);
            end; end));
        end)

        local LSecureUI = function()
            local WindUI = WindLib();
            local Window = WindUI:CreateWindow({
                Title = "Wonderland",
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
                Rooms = Window:Tab({ Title = "Rooms", Icon = "box" }),
                Chase = Window:Tab({ Title = "Chase", Icon = "box" }),

                ExtraDiv = Window:Divider(),
                AddOn = LoaderSettings.AllowAddOn and Window:Tab({ Title = "AddOn", Icon = "box" }),
                Themes = LoaderSettings.AllowThemesTab and Window:Tab({ Title = "Themes", Icon = "palette" }),
                BHVESP = LoaderSettings.AllowESPCustomization and Window:Tab({ Title = "ESP Behaviour", Icon = "eye" }),
                Core = Window:Tab({ Title = "Core Settings", Icon = "settings" }),
            }; IntroLib.Init(WindUI, Tabs.Welcome); IntroLib:Tutorial(WindUI);
            Windy:CreateComponent(Tabs.Client, ScriptData.AutoData.ClientTab, "Client");
            Windy:CreateComponent(Tabs.Core, CorePackage());

            Windy:CreateComponent(Tabs.Rooms, ScriptData.AutoData.RoomsTab, "Rooms");
            Windy:CreateComponent(Tabs.Chase, ScriptData.AutoData.ChaseTab, "Chase");
            
            ESPF:DynamicU(Windy, Tabs.BHVESP, {
                {Title="Red Lumin", Pointer="Rooms", TextPath="ShowText/RedLumin", SizePath="TextSize/RedLumin", ScalePath="TextScale/RedLumin", ColorPath="TextColor/RedLumin"},
                {Title="Green Lumin", Pointer="Rooms", TextPath="ShowText/GreenLumin", SizePath="TextSize/GreenLumin", ScalePath="TextScale/GreenLumin", ColorPath="TextColor/GreenLumin"},
                {Title="White Lumin", Pointer="Rooms", TextPath="ShowText/WhiteLumin", SizePath="TextSize/WhiteLumin", ScalePath="TextScale/WhiteLumin", ColorPath="TextColor/WhiteLumin"},
                {Title="Purple Lumin", Pointer="Rooms", TextPath="ShowText/PurpleLumin", SizePath="TextSize/PurpleLumin", ScalePath="TextScale/PurpleLumin", ColorPath="TextColor/PurpleLumin"},
                {Title="Worm Lumin", Pointer="Rooms", TextPath="ShowText/WormLumin", SizePath="TextSize/WormLumin", ScalePath="TextScale/WormLumin", ColorPath="TextColor/WormLumin"},
            });

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
                        end;

                        if RoomsCon.LuminAura or RoomsCon.AutoCollectLumin or RoomsCon.AutoSellLumin then
                            CoruTask.Handle("NPC-Main");
                        end;
                        if RoomsCon.ESP.RedLumin or RoomsCon.ESP.GreenLumin or RoomsCon.ESP.WhiteLumin or RoomsCon.ESP.PurpleLumin or RoomsCon.ESP.WormLumin then
                            CoruTask.Handle("NPC-ESP");
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

                    if not Seat.Parent and HumSelf.Parent then
                        Seat = HumSelf.SeatPart or EMPTY_OBJECT;
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

                    if ClientCon["Enable TeleportWalk"] and selc.Parent and HumSelf and HumSelf.MoveDirection.Magnitude > 0 then
                        selc:TranslateBy(HumSelf.MoveDirection * ClientCon["TeleportWalk Speed"] * delta * 10);
                    end;
                end);
                CoreConnection[3] = selff.CharacterAdded:Connect(function(char)
                    selc = char; BP = selff.Backpack;
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
                    selc = selff.Character; BP = selff.Backpack;
                    HumSelf = WaitForChild(selc, "Humanoid", 9e9);
                    HumRSelf = WaitForChild(selc, "HumanoidRootPart", 9e9);
                    ClientPackage:WalkSpeedC(HumSelf);
                end;

                if not CoruTask.Intialized then
                    CoruTask.Init(WindUI);
                    CoruTask.Intialized = true;

                    if PlaceId == 107085682317132 then
                        Functions:GameDataInit();

                        GeneratedMap = WaitForChild(W, "GeneratedMap", 9e9);

                        REQ.Network = require(WaitForChild(RShared, "Network", 9e9));
                        REQ.InventoryController = require(R.Client.Core.Inventory.InventoryController);
                    end;
                end;
            end); if OneRunCallMain then
                return true, GG.LoadingSignal:Fire(100);
            end; return false, warn(OneRunErrorMain);
        end; GG.LSecureLoad = LSecureLoad; return LSecureLoad;
    end;
};