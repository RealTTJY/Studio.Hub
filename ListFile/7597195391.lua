local GG=GG; if not GG then return game:GetService("Players").LocalPlayer:Kick("[TTJY Studio] : Really? Your account is now at risk for the next ban wave."); end;

local ScriptCache = GG.ScriptCache;
local LoaderSettings = GG.LoaderSettings;
local userIdentify = ScriptCache.userIdentify;
local GetService = game.GetService;
local Instancen = Instance.new;
local Vec3 = Vector3.new;
local Col3 = Color3;
local tk = task;

local H = GetService(game, "RunService");
local W = GetService(game, "Workspace");
local P = GetService(game, "Players");

local twait = tk.wait;
local CFr = CFrame.new;
local WaitForChild = game.WaitForChild;
local GetDescendants = game.GetDescendants;
local FindFirstChildOfClass = game.FindFirstChildOfClass;

local VEC0 = Vector3.zero;

local ScriptData = {};
local Config = GG.Configs or {};

Config.Client = Config.Client or {};
Config.Client.Client = Config.Client.Client or {};

return {
    Version = "RealUNISnapshot5";
    Function = function(CorePackage, WindLib, IntroLib, Windy, ClientPackage, PromptPackage, CoruTask)
        local CoreConnection    = {};
        local CoreDestroyed     = false;
        local ForceFloat        = "None";

        local Cam               = W.CurrentCamera;
        local selff             = P.LocalPlayer;
        local selc              = selff.Character;
        local HumSelf           = selc and FindFirstChildOfClass(selc, "Humanoid");
        local HumRSelf          = HumSelf and HumSelf.RootPart;
        local PSS               = WaitForChild(selff, "PlayerScripts", 9e9);
        local ControlModule     = require(WaitForChild(WaitForChild(PSS, "PlayerModule", 9e9), "ControlModule", 9e9));

        local cmdm              = selff:GetMouse();
        local ClientCon         = Config.Client.Client;
        local Control           = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0};

        ClientCon.FlySpeed = ClientCon.FlySpeed or 1;
        ClientCon.WalkSpeed = ClientCon.WalkSpeed or 16;
        ClientCon.JumpPower = ClientCon.JumpPower or 50;
        ClientCon["TeleportWalk Speed"] = ClientCon["TeleportWalk Speed"] or 1;

        local Functions = {};

        ScriptData.AutoData = {
            ClientTab = {
                {type="Group", dats={
                    {dat={
                        {type="Toggle", EN="Full Bright", EN2="Make the game brighter, easier to see or look around.", TH1="แมพสว่าง", TH2="มองเห็นง่ายขึ้น", Bindable="+", Path="Client/Full Bright"},
                        {type="Toggle", EN="Instant Prompt", EN2="On some prompt/maps, this can flag anti cheat so remember to turn it off when you have to.", TH1="กด Prompt เร็วขึ้น", TH2="กดพวกปุ่มที่มันขึ้นมาให้กดเร็วขึ้น (Class:Prompt)", Bindable="+", Path="Client/Instant Prompt"},
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

                ExtraDiv = Window:Divider(),
                AddOn = LoaderSettings.AllowAddOn and Window:Tab({ Title = "AddOn", Icon = "box" }),
                Themes = LoaderSettings.AllowThemesTab and Window:Tab({ Title = "Themes", Icon = "palette" }),
                Core = Window:Tab({ Title = "Core Settings", Icon = "settings" }),
            }; IntroLib.Init(WindUI, Tabs.Welcome); IntroLib:Tutorial(WindUI);
            Windy:CreateComponent(Tabs.Client, ScriptData.AutoData.ClientTab, "Client");
            Windy:CreateComponent(Tabs.Core, CorePackage());

            Window:SelectTab(1); Window:OnDestroy(function()
                CoreDestroyed = true;
                PromptPackage.UpdateState(true);
            end);

            Window:SetToggleKey((LoaderSettings.UIKeybind and Enum.KeyCode[LoaderSettings.UIKeybind]) or Enum.KeyCode["RightShift"]);
            ScriptCache.WindUI = WindUI; ScriptCache.Window = Window;
        end; local LSecureLoad = function(AUTH_KEY)
            local OneRunCallMain, OneRunErrorMain = pcall(function()
                CoreDestroyed = false; PromptPackage.UpdateState(false);
                ClientCon.WalkSpeed = HumSelf and HumSelf.WalkSpeed or 16;
                ClientCon.JumpPower = HumSelf and HumSelf.JumpPower or 50;

                GG.Configs = Config;
                LSecureUI();

                tk.spawn(function()
                    while not CoreDestroyed do
                        if ClientCon["Enable Fly"] then
                            CoruTask.Handle("Fly");
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
                
                if selff.Character then
                    selc = selff.Character;
                    HumSelf = WaitForChild(selc, "Humanoid", 9e9);
                    HumRSelf = WaitForChild(selc, "HumanoidRootPart", 9e9);
                    ClientPackage:WalkSpeedC(HumSelf);
                end;

                if not CoruTask.Intialized then
                    CoruTask.Init(ScriptCache.WindUI);
                    CoruTask.Intialized = true;
                end;
            end); if OneRunCallMain then
                return true, GG.LoadingSignal:Fire(100);
            end; return false, warn(OneRunErrorMain);
        end; GG.LSecureLoad = LSecureLoad; return LSecureLoad;
    end;
};
