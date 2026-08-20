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
local tblein = tble.insert;
local GetChildren = game.GetChildren;
local GetAttribute = game.GetAttribute;
local WaitForChild = game.WaitForChild;
local GetDescendants = game.GetDescendants;
local FindFirstChild = game.FindFirstChild;
local FindFirstChildOfClass = game.FindFirstChildOfClass;

local VEC3 = Vec3(3,3,3);
local VEC252 = Vec3(2,5,2);
local CFR9E9 = CFr(0, 9e9, 0);
local RED = Col3.fromRGB(255, 0, 0);
local BLUE = Col3.fromRGB(0, 0, 255);
local YELLOW = Col3.fromRGB(255, 255, 0);
local WHITE = Col3.fromRGB(255, 255, 255);
local EMPTY_OBJECT = {Parent=nil, SeatPart=nil};

local ScriptData = {};
local Config = GG.Configs or {};

Config.Client = Config.Client or {};
Config.Client.Client = Config.Client.Client or {};
Config.Ticket = Config.Ticket or {};
Config.Game = Config.Game or {};

return {
    Version = "Evade_V3.49";
    Function = function(CorePackage, WindLib, IntroLib, Windy, ClientPackage, CoruTask, CommonF, ESPF)
        local CoreConnection    = {};
        local CoreDestroyed     = false;
        local ForceFloat        = "None";

        local Cam               = W.CurrentCamera;
        local selff             = P.LocalPlayer;
        local PSG               = selff.PlayerGui;
        local selc              = selff.Character or EMPTY_OBJECT;
        local HumSelf           = selc.Parent and FindFirstChildOfClass(selc, "Humanoid") or EMPTY_OBJECT;
        local HumRSelf          = HumSelf.RootPart or EMPTY_OBJECT;

        local GameTimeUI        = nil;
        local VOIDPART          = Instancen("Part");

        local cmdm              = selff:GetMouse();
        local ClientCon         = Config.Client.Client;
        local TicketCon         = Config.Ticket;
        local GameCon           = Config.Game;
        local NonAnalytics3     = {type="Button", EN="Analytics 3", EN2="Please enable 'Analytics 3' module to track game data, inventory, and player statistics for reports and webhook integrations.", TH1="Analytics 3", TH2="กรุณาเปิดใช้งานโมดูล 'Analytics 3' เพื่อติดตามข้อมูลเกม สินค้าคงคลัง และสถิติผู้เล่นสำหรับรายงานและเว็บฮุก"};

        local REvents           = WaitForChild(R, "Events", 9e9);

        local dist              = nil;
        local Tp                = CommonF.Tp;

        dist = function(pos)
            if not HumRSelf.Parent then return 9e9; end;
            return (pos - HumRSelf.Position).Magnitude;
        end;

        local RE                = {};
        local REQ               = {};
        local Functions         = {};

        ClientCon.JumpPower = ClientCon.JumpPower or 50;
        ClientCon.SpeedMultiplier = ClientCon.SpeedMultiplier or 1;
        ClientCon["TeleportWalk Speed"] = ClientCon["TeleportWalk Speed"] or 1;
        GameCon.ReviveTime = GameCon.ReviveTime or 1.5;
        
        RE.Interact              = WaitForChild(REvents, "Interact", 9e9);
        RE.SetPlayerMode      = WaitForChild(REvents, "SetPlayerMode", 9e9);

        Functions.GameDataInit = function(self)
            if self.AlreadyInit then return end; self.AlreadyInit = true;
            while not (REQ.Contexts and REQ.JumpReact and REQ.CharService and REQ.InteractService and REQ.MovementStat) do
                local GCs = getgc(true); for i=1, #GCs do
                    if REQ.Contexts and REQ.JumpReact and REQ.CharService and REQ.InteractService and REQ.MovementStat then break; end;
                    local v=GCs[i]; if type(v) == 'table' then
                        if rawget(v, 1) and type(v[1]) == 'table' and rawget(v[1], "CollectableIDs") then
                            REQ.Contexts = v;
                        elseif rawget(v, "JumpReact") and typeof(v.JumpReact.JumpReact) == 'function' then
                            REQ.JumpReact = v;
                        elseif rawget(v, "GetCharacters") then
                            REQ.CharService = v;
                        elseif rawget(v, "StartActivate") and rawget(v, "KeyUsed") then
                            REQ.InteractService = v;
                        elseif rawget(v, "SpeedChange") and type(v.SpeedChange) == 'function' then
                            REQ.MovementStat = v;
                        end;
                    end;
                end; twait(0.1);
            end;

            local DataReg = require(R.Objects.Game.Character.DataRegistry);
            local o;o=LowerC(DataReg.Get, function(p1, value)
                if value == "ReviveLength" then
                    return GameCon.ReviveTime;
                end; return o(p1, value);
            end);
            local o;o=LowerC(REQ.JumpReact.JumpReact, function(p1, jump)
                if not ClientCon.AllowHolding then return o(p1, jump); end;
                if p1.CanJump ~= false then
                    p1.JumpHeldDown = true;
                    p1:UpdateCanJump();
                    p1:AttemptJump();
                    if jump ~= true then
                        p1.CanJump = false;
                        H.Heartbeat:wait();
                        p1.CanJump = true;
                    end;
                end;
            end);
            local o;o=LowerC(REQ.InteractService.KeyUsed, function(p1, p2)
                if GameCon.ReviveAura and p2.Key == "Interact" and p2.KeyCode == Enum.KeyCode.E then
                    return nil;
                end; return o(p1, p2);
            end);
            local o;o=LowerC(REQ.MovementStat.SpeedChange, function(self, state, value)
                if (state ~= "State" and state ~= "Emote") or not ClientCon["Enable SpeedMultiplier"] then return o(self, state, value); end;
                return o(self, state, tonumber(ClientCon.SpeedMultiplier));
            end);
        end;
        Functions.SelfRevive = function(SetPlayerMode, Chars)
            if not SetPlayerMode.Parent then return; end; for i=1, #Chars do
                local v=Chars[i]; if v.Done and v.Local then
                    if v.State.State == "Downed" then
                        return SetPlayerMode:FireServer(true), twait(math.max(1 + math.clamp(Functions.GetPing(), 0, 0.5)));
                    end;
                end;
            end;
        end;
        Functions.GetPing = function()
            return S.Network.ServerStatsItem["Data Ping"]:GetValue() / 1000;
        end;
        Functions.GetTimer = function(Timer)
            local min, sec = Timer.Text:match("^(%d+):([0-5]?%d)$");
            min = tonumber(min) or 0;
            sec = tonumber(sec) or 0;
            return min * 60 + sec;
        end;
        Functions.SetTimer = function(self, isCountUp)
            local Timer = FindFirstChild(GameTimeUI, "Timer");
            local Cloned = FindFirstChild(GameTimeUI, "Cloned");
            if not Timer then return; end; if isCountUp then
                if not Cloned or not Cloned.Parent then
                    Cloned = Timer:Clone();
                    Cloned.Name = "Cloned";
                    Cloned.Parent = GameTimeUI;
                    Cloned.TextColor3 = RED;
                end;

                local Time = self.GetTimer(Timer);
                Cloned.Text = str.format("%d:%02d", math.floor(Time / 60), Time % 60);
                Cloned.Visible = true;
                Timer.Visible = false;
            elseif GameTimeUI then
                GameTimeUI.Visible = true;
                Timer.Visible = true;
                if Cloned then
                    Cloned.Visible = false;
                end;
            end;
        end;
        Functions.AutoTicket = function(Contexts)
            for i=1, #Contexts do
                local v=Contexts[i]; if type(v) == 'table' then
                    for id, collectable in pairs(v.CollectableIDs) do
                        local Position = collectable.CollectableData.Position;
                        Tp(HumRSelf, CFr(Position), math.max(0.5 + math.clamp(Functions.GetPing(), 0, 0.5)));
                    end;
                end;
            end;
        end;
        Functions.ESPTicket = function(Contexts)
            for i=1, #Contexts do
                local v=Contexts[i]; if type(v) == 'table' then
                    for id, collectable in pairs(v.CollectableIDs) do
                        local Model = collectable:GetCollectableModel();
                        if Model and Model.Parent then
                            ESPF.ESP("Tickets", Model, {
                                Color = BLUE;
                                Size = VEC3;
                                Text = "Ticket";
                            });
                        end;
                    end;
                end;
            end; ESPF.Visible("Tickets", true, TicketCon.ShowText);
        end;
        Functions.TpSafeSpot = function()
            return Tp(HumRSelf, CFR9E9);
        end;
        Functions.TpDowned = function(Chars)
            for i=1, #Chars do
                local v=Chars[i]; if type(v) == 'table' and v.Done and not v.Local then
                    if v.State.State == "Downed" and v.PrimaryPart then
                        while v.State.State == "Downed" and v.PrimaryPart.Parent and v.PrimaryPart.Parent.Parent and GameCon.TeleportToDownedPlayer and not CoreDestroyed do
                            Tp(HumRSelf, CFr(v.PrimaryPart.Position), 0.3);
                        end;
                    end;
                end;
            end;
        end;
        Functions.ReviveAura = function(Chars)
            for i=1, #Chars do
                local v=Chars[i]; if type(v) == 'table' and v.Done and not v.Local then
                    if v.State.State == "Downed" and v.PrimaryPart then
                        if dist(v.PrimaryPart.Position) < 30 then
                            RE.Interact:FireServer("Revive", v.Tag, true);
                            twait(v.DataRegistry:Get("ReviveLength") or 1.5);
                            if v.State.State == "Downed" and v.PrimaryPart then
                                return dist(v.PrimaryPart.Position) < 30 and RE.Interact:FireServer("Revive", v.Tag);
                            end;
                        end;
                    end;
                end;
            end;
        end;
        Functions.ESPChars = function(Chars)
            for i=1, #Chars do
                local v=Chars[i]; if v.Done and not v.Local then
                    local Model = v.Model; if Model then
                        local ESPObject = ESPF.ESP(if v.AI then "Bots" else "Players", Model, {
                            Color = if v.AI then RED else WHITE;
                            Size = VEC252;
                            Text = v.Name;
                        }); if ESPObject and not v.AI then
                            local Label = ESPObject.Label;
                            if Label then
                                if v.State.State == "Downed" then
                                    Label.TextColor3 = YELLOW;
                                else
                                    Label.TextColor3 = WHITE;
                                end; if not v.PrimaryPart then continue; end;
                                Label.Text = v.Name .. "\n(" .. tostring(mfloor(dist(v.PrimaryPart.Position))) .. " studs)";
                            end;
                        end;
                    end;
                end;
            end; if GameCon.ESPPlayers then
                ESPF.Visible("Players", true, GameCon.PlayerShowText);
            end; if GameCon.ESPBots then
                ESPF.Visible("Bots", true, GameCon.BotShowText);
            end;
        end;

        ScriptData.AutoData = {
            ClientTab = {
                {type="Group", dats={
                    {dat={
                        {type="Toggle", EN="Self Revive", EN2="Auto revive yourself when downed", TH1="ชุบตัวเอง", TH2="ชุบตัวเองเมื่อโดนทำให้ล้ม", Bindable="+", Path="Client/SelfRevive"},
                        {type="Toggle", EN="Allow Holding", EN2="Allow you to hold spacbar/jump button.", TH1="อนุญาติการกดกระโดดค้าง", TH2="กดกระโดดค้างได้", Path="Client/AllowHolding"},
                        {type="Toggle", EN="No Render", EN2="Change camera subject & disable 3D rendering", TH1="ปิดการ Render", TH2="เปลี่ยนกล้องและปิดการ render 3D", Bindable="+", Path="Client/No Render", Callback=function(state)
                            ClientCon["No Render"] = state;
                            H:Set3dRenderingEnabled(not state);
                            Cam.CameraSubject = if state then VOIDPART else HumSelf;
                        end},
                        {type="Toggle", EN="Full Bright", EN2="Make the game brighter, easier to see or look around.", TH1="แมพสว่าง", TH2="มองเห็นง่ายขึ้น", Bindable="+", Path="Client/Full Bright"},
                        {type="Toggle", EN="Float", EN2="Make your character float in the air.", TH1="ลอย", TH2="ทำให้ตัวละครเดินบนอากาศได้", Bindable="+", Path="Client/Float"},
                        {type="Toggle", EN="Noclip", EN2="Allow you to walk through walls.", TH1="เดินทะลุกำแพง", TH2="ต้องอธิบายด้วยหรอ", Bindable="+", Path="Client/Noclip"},
                        {type="Slider", EN="Speed Multiplier", EN2="Change the speed of your character.", TH1="ความเร็วในการเดิน", TH2="ปรับความเร็วในการเดิน", Value={Min=1, Max=5}, Step=0.1, Path="Client/SpeedMultiplier"},
                        {type="Toggle", EN="Enable Speed Multiplier", EN2="Enable speed multiplier modification.", TH1="เปิดใช้งานความเร็วในการเดิน", TH2="ปรับความเร็วในการเดิน", Bindable="+", Path="Client/Enable SpeedMultiplier"},
                        {type="Slider", EN="Teleport Walk Speed", EN2="Change the speed of teleport walk.", TH1="ความเร็วในการเดินแบบวาร์ป", TH2="ปรับความเร็วในการเดินแบบวาร์ป", Value={Min=1, Max=10}, Path="Client/TeleportWalk Speed"},
                        {type="Toggle", EN="Enable Teleport Walk", EN2="Enable teleport walk.", TH1="เปิดใช้งานเดินแบบวาร์ป", TH2="เปิดใช้งานเดินโดยการวาร์ปไปเรื่อยๆ", Bindable="+", Path="Client/Enable TeleportWalk"},
                        {type="Slider", EN="Jump Power", EN2="Change the power of your jump.", TH1="ความแรงในการกระโดด", TH2="ปรับความแรงในการกระโดด", Value={Min=1, Max=300}, Path="Client/JumpPower"},
                        {type="Toggle", EN="Enable Jump Power", EN2="Enable jump power modification.", TH1="เปิดใช้งานความแรงในการกระโดด", TH2="ปรับความแรงในการกระโดด", Bindable="+", Path="Client/Enable JumpPower"},
                    }, Title="Client", Open=true};
                }};
            };
            TicketTab = {
                {type="Toggle", EN="Auto Collect", EN2="Teleport & collect tickets.", TH1="ออโต้เก็บ", TH2="วาปเก็บตั๋ว", Bindable="+", Path="AutoCollect"}, {type="Space"},
                {type="Toggle", EN="ESP", EN2="Show ticket boxes", TH1="ESP ตั๋ว", TH2="มองเห็นตั๋ว", Bindable="+", Path="ESP"},
                {type="Toggle", EN="Show Text", EN2="Show text on ticket boxes", TH1="แสดงข้อความ", TH2="เห็นข้อความบนตั๋ว", Bindable="+", Path="ShowText"},
            };
            GameTab = {
                {type="Toggle", EN="Show Round Time", EN2="Show timer for how long you have to survive on top of the screen.", TH1="แสดงเวลารอบ", TH2="แสดงเวลาว่าต้องอยู่รอดอีกนานแค่ไหน", Bindable="+", Path="ShowRoundTimer"},
                {type="Toggle", EN="Switch To Survive Time", EN2="Change the timer from countdown to countup.", TH1="เปลี่ยนเป็นเวลาที่เรารอดชีวิต", TH2="เปลี่ยนจากการนับถอยหลัง เป็นนับไปข้างหน้า", Bindable="+", Path="CountUpTimer"}, {type="Space"},
                {type="Toggle", EN="Teleport To Safe Spot", EN2="Teleport out of the map.", TH1="วาปไปจุดปลอดภัย", TH2="วาปออกนอกแมพ", Bindable="+", Path="TeleportToSafeSpot"},
                {type="Toggle", EN="Teleport To Downed Player", EN2="Teleport to a downed player.", TH1="วาปไปผู้เล่นที่ล้ม", TH2="วาปไปหาผู้เล่นที่ล้ม", Bindable="+", Path="TeleportToDownedPlayer"}, {type="Space"},
                {type="Slider", EN="Revive Time", EN2="Set the time to revive.", TH1="ระยะเวลาในการชุบ", TH2="ตั้งระยะเวลาในการชุบ", Value={Min=1.2, Max=1.5}, Step=0.01, Path="ReviveTime"},
                {type="Toggle", EN="Revive Aura", EN2="Revive downed players around you", TH1="ชุบออโต้", TH2="ชุบผู้เล่นที่ล้มรอบๆตัว", Bindable="+", Path="ReviveAura"}, {type="Space"},
                {type="Toggle", EN="ESP Players", EN2="Show player boxes", TH1="ESP ผู้เล่น", TH2="มองเห็นผู้เล่น", Bindable="+", Path="ESPPlayers"},
                {type="Toggle", EN="Show Text", EN2="Show text on player boxes", TH1="แสดงข้อความ", TH2="เห็นข้อความบนผู้เล่น", Bindable="+", Path="PlayerShowText"}, {type="Space"},
                {type="Toggle", EN="ESP Bots", EN2="Show bot boxes", TH1="ESP บอท", TH2="มองเห็นบอท", Bindable="+", Path="ESPBots"},
                {type="Toggle", EN="Show Text", EN2="Show text on bot boxes", TH1="แสดงข้อความ", TH2="เห็นข้อความบนบอท", Bindable="+", Path="BotShowText"}, {type="Space"},
            };
        };

        CoruTask.New("Timer-Manipulation", function()
            warn(pcall(function()
                while true do
                    if not GameCon.ShowRoundTimer or CoreDestroyed then
                        if GameTimeUI and GameTimeUI.Parent then
                            GameTimeUI.Visible = false;
                        end; CoruTask.Close("Timer-Manipulation");
                    end; if GameTimeUI then
                        Functions:SetTimer(GameCon.CountUpTimer);
                    end; twait(0.1);
                end;
            end));
        end);
        CoruTask.New("Revive Aura", function()
            warn(pcall(function()
                while true do
                    if not GameCon.ReviveAura or CoreDestroyed then
                        CoruTask.Close("Revive Aura");
                    end; if REQ.CharService then
                        Functions.ReviveAura(REQ.CharService:GetCharacters());
                    end; twait(0.1);
                end;
            end));
        end);
        CoruTask.New("Shared-Automation", function()
            warn(pcall(function() while true do
                if not (TicketCon.AutoCollect or GameCon.TeleportToDownedPlayer) or CoreDestroyed then
                    CoruTask.Close("Shared-Automation");
                end;

                if GameCon.TeleportToDownedPlayer and REQ.CharService then
                    Functions.TpDowned(REQ.CharService:GetCharacters());
                end;
                if GameCon.TeleportToSafeSpot then
                    Functions.TpSafeSpot();
                end;
                if TicketCon.AutoCollect and REQ.Contexts then 
                    Functions.AutoTicket(REQ.Contexts); 
                end;
                twait(0.1);
            end; end));
        end);
        CoruTask.New("Shared-ESP", function()
            warn(pcall(function() while true do
                if not (TicketCon.ESP or ClientCon.SelfRevive) or CoreDestroyed then
                    if not TicketCon.ESP then ESPF.Visible("Tickets", false); end;
                    CoruTask.Close("Shared-ESP");
                end;

                local Chars = REQ.CharService and REQ.CharService:GetCharacters();
                if ClientCon.SelfRevive and RE.SetPlayerMode and Chars then
                    Functions.SelfRevive(RE.SetPlayerMode, Chars);
                end;
                if TicketCon.ESP and REQ.Contexts then 
                    Functions.ESPTicket(REQ.Contexts); 
                end;
                if (GameCon.ESPPlayers or GameCon.ESPBots) and Chars then
                    Functions.ESPChars(Chars);
                end;
                twait(0.1);
            end; end));
        end);

        local LSecureUI = function()
            local WindUI = WindLib();
            local Window = WindUI:CreateWindow({
                Title = "Evade",
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
                Ticket = Window:Tab({ Title = "Ticket", Icon = "ticket" }),
                Game = Window:Tab({ Title = "Game", Icon = "gamepad-2" }),

                ExtraDiv = Window:Divider(),
                AddOn = LoaderSettings.AllowAddOn and Window:Tab({ Title = "AddOn", Icon = "box" }),
                Themes = LoaderSettings.AllowThemesTab and Window:Tab({ Title = "Themes", Icon = "palette" }),
                Core = Window:Tab({ Title = "Core Settings", Icon = "settings" }),
            }; IntroLib.Init(WindUI, Tabs.Welcome); IntroLib:Tutorial(WindUI);
            
            Windy:CreateComponent(Tabs.Client, ScriptData.AutoData.ClientTab, "Client");
            Windy:CreateComponent(Tabs.Ticket, ScriptData.AutoData.TicketTab, "Ticket");
            Windy:CreateComponent(Tabs.Game, ScriptData.AutoData.GameTab, "Game");
            
            Windy:CreateComponent(Tabs.Core, CorePackage());

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
                        if TicketCon.AutoCollect or GameCon.TeleportToDownedPlayer or GameCon.TeleportToSafeSpot then
                            CoruTask.Handle("Shared-Automation");
                        end;
                        if GameCon.ShowRoundTimer then
                            CoruTask.Handle("Timer-Manipulation");
                        end;
                        if GameCon.ReviveAura then
                            CoruTask.Handle("Revive Aura");
                        end;
                        if TicketCon.ESP or ClientCon.SelfRevive or GameCon.ESPPlayers or GameCon.ESPBots then
                            CoruTask.Handle("Shared-ESP");
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
                    selc = char;
                    HumSelf = WaitForChild(char, "Humanoid", 9e9);
                    HumRSelf = WaitForChild(char, "HumanoidRootPart", 9e9);
                    GameTimeUI = WaitForChild(PSG, "Game", 9e9);
                    GameTimeUI = WaitForChild(GameTimeUI, "HUD", 9e9);
                    GameTimeUI = WaitForChild(GameTimeUI, "Overlay", 9e9);
                    GameTimeUI = WaitForChild(GameTimeUI, "RoundOverlay", 9e9);
                    GameTimeUI = WaitForChild(GameTimeUI, "RoundTimer", 9e9);
                    GameTimeUI = WaitForChild(GameTimeUI, "IngameRoundTimer", 9e9);
                    Functions:GameDataInit();
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
                    GameTimeUI = WaitForChild(PSG, "Game", 9e9);
                    GameTimeUI = WaitForChild(GameTimeUI, "HUD", 9e9);
                    GameTimeUI = WaitForChild(GameTimeUI, "Overlay", 9e9);
                    GameTimeUI = WaitForChild(GameTimeUI, "RoundOverlay", 9e9);
                    GameTimeUI = WaitForChild(GameTimeUI, "RoundTimer", 9e9);
                    GameTimeUI = WaitForChild(GameTimeUI, "IngameRoundTimer", 9e9);
                    Functions:GameDataInit();
                end;

                if not CoruTask.Intialized then
                    CoruTask.Init(WindUI);
                    CoruTask.Intialized = true;
                end;
            end); if OneRunCallMain then
                return true, GG.LoadingSignal:Fire(100);
            end; return false, warn(OneRunErrorMain);
        end; GG.LSecureLoad = LSecureLoad; return LSecureLoad;
    end;
};