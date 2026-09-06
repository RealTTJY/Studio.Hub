local GG=GG; if not GG then return game:GetService("Players").LocalPlayer:Kick("[TTJY Studio] : Really? Your account is now at risk for the next ban wave."); end;

local QUEUE_INFO = GG.QUEUE_INFO or {};
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

local IsA = game.IsA;
local twait = tk.wait;
local strfind = str.find;
local CFr = CFrame.new;
local Vec3 = Vector3.new;
local GetChildren = game.GetChildren;
local WaitForChild = game.WaitForChild;
local GetDescendants = game.GetDescendants;
local FindFirstChild = game.FindFirstChild;
local FindFirstChildOfClass = game.FindFirstChildOfClass;

local RED = Col3.new(1, 0, 0);
local EMPTY_OBJECT = {Parent=nil, SeatPart=nil};

local PlaceId = game.PlaceId;

local ScriptData = {};
local Config = GG.Configs or {};

Config.Client = Config.Client or {};
Config.Client.Client = Config.Client.Client or {};

return {
    Version = "TheMimicClassicV3.00";
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

        local Chapter           = if PlaceId == 15996404472 or PlaceId == 15996407335 then "B1C1"
                                  elseif PlaceId == 15996410294 or PlaceId == 15996411979 or PlaceId == 15996413469 then "B1C2"
                                  elseif PlaceId == 15996414738 or PlaceId == 15996416081 or PlaceId == 15996417416 then "B1C3"
                                  elseif PlaceId == 15989427413 then "Lobby"
                                  else nil;

        local GameAI, GameAI2   = nil, nil;

        local Tp                = CommonF.Tp;

        local RE                = {};
        local REQ               = {};
        local Functions         = {};

        ClientCon.JumpPower = ClientCon.JumpPower or 50;
        ClientCon.SpeedMultiplier = ClientCon.SpeedMultiplier or 1;
        ClientCon["TeleportWalk Speed"] = ClientCon["TeleportWalk Speed"] or 1;

        Functions.GameValidate = function(self)
            if PlaceId == 15989427413 then
                WaitForChild(selc, "AntiFly", 9e9).Enabled = false;
            end;
        end;
        Functions.AutoCompleteBook1 = function()
            if PlaceId == 15996404472 then
                return Tp(HumRSelf, CFr(3507, 37.65, -1539.45));
            elseif PlaceId == 15996407335 then
                return Tp(HumRSelf, CFr(1274.95, 199.54, -2537.93));
            end;
            if PlaceId == 15996410294 then
                return Tp(HumRSelf, CFr(79, 58, -1629));
            elseif PlaceId == 15996411979 then
                return Tp(HumRSelf, CFr(235.17, 101.94, -590));
            elseif PlaceId == 15996413469 then
                return Tp(HumRSelf, CFr(829.97, 72.49, -353.46));
            end;
            if PlaceId == 15996414738 then
                return Tp(HumRSelf, CFr(2411.93, -23.03, 2300));
            elseif  PlaceId == 15996416081 then
                return Tp(HumRSelf, CFr(-300, 93, -540));
            elseif  PlaceId == 15996417416 then
                return Tp(HumRSelf, CFr(255, 17, -315), 5), Tp(HumRSelf, CFr(430, 17, -844));
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
                end; if not GameAI and not GameAI2 then
                    local CHs = GetChildren(W); for i=1, #CHs do
                        local v=CHs[i]; if v.Parent and v.ClassName == "Model" and strfind(v.Name, "AI") then
                            local AI = FindFirstChild(v, "AI");
                            if not AI then continue; end;
                            ESPF.ESP("Monster", v, {
                                Color = RED;
                                Size = VEC10;
                                Text = v.Name;
                            });
                        end;
                    end;
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

        ScriptData.AutoData = {
            ClientTab = {
                {type="Group", dats={
                    {dat={
                        {type="Toggle", EN="Instant Prompt", EN2="Instantly activate prompts.", TH1="กดปุ่มทันที", TH2="กดปุ่มได้แบบทันที", Bindable="+", Path="Client/InstantPrompt"},
                        {type="Toggle", EN="No Render", EN2="Change camera subject & disable 3D rendering", TH1="ปิดการ Render", TH2="เปลี่ยนกล้องและปิดการ render 3D", Bindable="+", Path="Client/No Render", Callback=function(state)
                            ClientCon["No Render"] = state;
                            H:Set3dRenderingEnabled(not state);
                            Cam.CameraSubject = if state then VOIDPART else HumSelf;
                        end},
                        {type="Toggle", EN="Full Bright", EN2="Make the game brighter, easier to see or look around.", TH1="แมพสว่าง", TH2="มองเห็นง่ายขึ้น", Bindable="+", Path="Client/Full Bright"},
                        {type="Toggle", EN="Float", EN2="Make your character float in the air.", TH1="ลอย", TH2="ทำให้ตัวละครเดินบนอากาศได้", Bindable="+", Path="Client/Float"},
                        {type="Toggle", EN="Noclip", EN2="Allow you to walk through walls.", TH1="เดินทะลุกำแพง", TH2="ต้องอธิบายด้วยหรอ", Bindable="+", Path="Client/Noclip"},
                        {type="Slider", EN="Walk Speed", EN2="Change the speed of your walk.", TH1="ความเร็วในการเดิน", TH2="ปรับความเร็วการเดิน", Value={Min=1, Max=100}, Path="Client/WalkSpeed", Callback=function(value)
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
            PackB1C1 = (Chapter == "B1C1" and {
                Tabs={
                    {Tab={at="B1C1", Title="Main", Icon="book-open", Path="B1C1"}, Data={
                        {type="Button", EN="Auto Complete Game", EN2="Teleport to the end of the game.", TH1="ออโต้จบเกม", TH2="วาปไปที่ด่านสุดท้ายของเกม", Callback=Functions.AutoCompleteBook1}; {type="Space"},
                        {type="Toggle", EN="ESP Items", EN2="Show item's box & name", Path="ESP/Items", TH1="ESP ไอเทม", TH2="มองเห็นไอเทม", Callback=Functions.ESPItemsBook1};
                        {type="Toggle", EN="ESP Monsters", EN2="Show monster's hitbox & name", Path="ESP/Monsters", TH1="ESP ผี", TH2="มองเห็นผี", Callback=Functions.ESPMonsterBook1};
                    }};
                };
            });
            PackB1C2 = (Chapter == "B1C2" and {
                Tabs={
                    {Tab={at="B1C2", Title="Main", Icon="book-open", Path="B1C2"}, Data={
                        {type="Button", EN="Auto Complete Game", EN2="Teleport to the end of the game.", TH1="ออโต้จบเกม", TH2="วาปไปที่ด่านสุดท้ายของเกม", Callback=Functions.AutoCompleteBook1}; {type="Space"},
                        {type="Toggle", EN="ESP Items", EN2="Show item's box & name", Path="ESP/Items", TH1="ESP ไอเทม", TH2="มองเห็นไอเทม", Callback=Functions.ESPItemsBook1};
                        {type="Toggle", EN="ESP Monsters", EN2="Show monster's hitbox & name", Path="ESP/Monsters", TH1="ESP ผี", TH2="มองเห็นผี", Callback=Functions.ESPMonsterBook1};
                    }};
                };
            });
            PackB1C3 = (Chapter == "B1C3" and {
                Tabs={
                    {Tab={at="B1C3", Title="Main", Icon="book-open", Path="B1C3"}, Data={
                        {type="Button", EN="Auto Complete Game", EN2="Teleport to the end of the game.", TH1="ออโต้จบเกม", TH2="วาปไปที่ด่านสุดท้ายของเกม", Callback=Functions.AutoCompleteBook1}; {type="Space"},
                        {type="Toggle", EN="ESP Items", EN2="Show item's box & name", Path="ESP/Items", TH1="ESP ไอเทม", TH2="มองเห็นไอเทม", Callback=Functions.ESPItemsBook1};
                        {type="Toggle", EN="ESP Monsters", EN2="Show monster's hitbox & name", Path="ESP/Monsters", TH1="ESP ผี", TH2="มองเห็นผี", Callback=Functions.ESPMonsterBook1};
                    }};
                };
            });
        };

        

        local LSecureUI = function()
            local WindUI = WindLib();
            local Window = WindUI:CreateWindow({
                Title = "The Mimic Classic",
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
                Placeholder = if ScriptData.AutoData.PlaceholderTab then Window:Tab({ Title = "Information", Icon = "star" }) else false,
                B1C1 = Windy:CreateDynamic(Window, Tabs, ScriptData.AutoData.PackB1C1),
                B1C2 = Windy:CreateDynamic(Window, Tabs, ScriptData.AutoData.PackB1C2),
                B1C3 = Windy:CreateDynamic(Window, Tabs, ScriptData.AutoData.PackB1C3),

                ExtraDiv = Window:Divider(),
                AddOn = LoaderSettings.AllowAddOn and Window:Tab({ Title = "AddOn", Icon = "box" }),
                Themes = LoaderSettings.AllowThemesTab and Window:Tab({ Title = "Themes", Icon = "palette" }),
                Core = Window:Tab({ Title = "Core Settings", Icon = "settings" }),
            }; IntroLib.Init(WindUI, Tabs.Welcome); IntroLib:Tutorial(WindUI);
            Windy:CreateComponent(Tabs.Client, ScriptData.AutoData.ClientTab, "Client");

            Windy:CreateComponent(Tabs.Placeholder, ScriptData.AutoData.PlaceholderTab, "IGNORE");

            Windy:CreateComponent(Tabs.Core, CorePackage());

            Window:SelectTab(1); Window:OnDestroy(function()
                CoreDestroyed = true;
                PromptPackage.UpdateState(true);
            end);

            Window:SetToggleKey((LoaderSettings.UIKeybind and Enum.KeyCode[LoaderSettings.UIKeybind]) or Enum.KeyCode["RightShift"]);
            ScriptCache.WindUI = WindUI; ScriptCache.Window = Window;
        end; local LSecureLoad = function(AUTH_KEY)
            local OneRunCallMain, OneRunErrorMain = pcall(function()
                CoreDestroyed = false;
                PromptPackage.UpdateState(false);
                GG.ESPF_ChangeMode = ESPF.Method;
                ClientCon.WalkSpeed = HumSelf and HumSelf.WalkSpeed or 16;
                ClientCon.JumpPower = HumSelf and HumSelf.JumpPower or 50;

                GG.Configs = Config;
                LSecureUI();

                tk.spawn(function()
                    while not CoreDestroyed do
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
                    Functions:GameValidate();
                    ClientPackage:WalkSpeedC(HumSelf);
                end);
                
                if selff.Character then
                    selc = selff.Character; BP = selff.Backpack;
                    HumSelf = WaitForChild(selc, "Humanoid", 9e9);
                    HumRSelf = WaitForChild(selc, "HumanoidRootPart", 9e9);
                    Functions:GameValidate();
                    ClientPackage:WalkSpeedC(HumSelf);
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
