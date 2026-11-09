local function TTJYMenu()
    local GetService = game.GetService
    local Instancen = Instance.new
    local UDimn = UDim.new
    local UDim2n = UDim2.new
    local UDim2s = UDim2.fromScale
    local UDim2o = UDim2.fromOffset
    local Vec2 = Vector2.new
    local Col3 = Color3.fromRGB
    local setmt = setmetatable
    local tble = table
    local tk = task

    local CoreGui = GetService(game, "CoreGui")

    local SortLayout = Enum.SortOrder.LayoutOrder
    local DirHorizontal = Enum.FillDirection.Horizontal
    local VAlignMiddle = Enum.VerticalAlignment.Center
    local SizeXY = Enum.AutomaticSize.XY
    local SizeY = Enum.AutomaticSize.Y
    local AlignLeft = Enum.TextXAlignment.Left
    local AlignTop = Enum.TextYAlignment.Top
    local AlignMiddle = Enum.TextYAlignment.Center
    local StrokeBorder = Enum.ApplyStrokeMode.Border
    local ScaleCrop = Enum.ScaleType.Crop

    local ColButton = Col3(32, 33, 36)
    local ColButtonHover = Col3(46, 47, 52)
    local ColPrimary = Col3(25, 40, 110)
    local ColPrimaryHover = Col3(34, 54, 140)
    local ColText = Col3(255, 255, 255)
    local ColSub = Col3(190, 190, 195)
    local ColLine = Col3(58, 59, 64)
    local FontMain = Enum.Font.GothamMedium
    local FontBold = Enum.Font.GothamBold
    local Gap = 8
    local Height = 52

    local function New(class, props, kids)
        local inst = Instancen(class)
        local parent
        for k, v in pairs(props or {}) do
            if k == "Parent" then parent = v else inst[k] = v end
        end
        for _, c in ipairs(kids or {}) do c.Parent = inst end
        inst.Parent = parent
        return inst
    end

    local function Merge(base, props)
        for k, v in pairs(props) do base[k] = v end
        return base
    end

    local function Wait(inst, ...)
        for _, name in ipairs({ ... }) do inst = inst:WaitForChild(name, 9e9) end
        return inst
    end

    local function Kill(parent, name)
        local old = parent:FindFirstChild(name)
        if old then old:Destroy() end
    end

    local function Fetch(url, file)
        url = url:gsub("^https://github%.com/(.-)/blob/(.+)$", "https://raw.githubusercontent.com/%1/%2")
        local res = request({ Url = url, Method = "GET" })
        if not res.Success then error("image request failed: " .. tostring(res.StatusCode)) end
        writefile(file, res.Body)
        return getcustomasset(file)
    end

    local function Hover(inst, fn)
        inst.MouseEnter:Connect(function() fn(true) end)
        inst.MouseLeave:Connect(function() fn(false) end)
    end

    local function Corner(px)
        return New("UICorner", { CornerRadius = UDimn(0, px) })
    end

    local function Stroke(thickness, enabled)
        return New("UIStroke", {
            Thickness = thickness,
            Color = ColText,
            Enabled = enabled,
            ApplyStrokeMode = StrokeBorder,
        })
    end

    local function List(props)
        return New("UIListLayout", Merge({ SortOrder = SortLayout }, props or {}))
    end

    local function Label(props)
        return New("TextLabel", Merge({
            BackgroundTransparency = 1,
            Font = FontMain,
            TextColor3 = ColText,
            TextSize = 16,
        }, props))
    end

    local function MakeButton(o)
        local primary = o.Primary == true
        local base = primary and ColPrimary or ColButton
        local over = primary and ColPrimaryHover or ColButtonHover
        local stroke = Stroke(2, primary)
        local parts = {
            List({ FillDirection = DirHorizontal, VerticalAlignment = VAlignMiddle, Padding = UDimn(0, 12) }),
            Label({ Text = o.Text, Font = FontBold, AutomaticSize = SizeXY, LayoutOrder = 2 }),
        }
        if o.Key then
            local long = #o.Key > 1
            tble.insert(parts, New("Frame", {
                Size = UDim2o(long and 34 or 24, 24),
                BackgroundTransparency = 1,
                LayoutOrder = 1,
            }, {
                Corner(4),
                Stroke(1.5, true),
                Label({ Text = o.Key, Font = FontBold, TextSize = long and 11 or 14, Size = UDim2s(1, 1) }),
            }))
        end
        local btn = New("TextButton", {
            Text = "",
            AutoButtonColor = false,
            BorderSizePixel = 0,
            BackgroundColor3 = base,
            Size = o.Size or UDim2n(1, 0, 0, Height),
        }, {
            Corner(8),
            stroke,
            New("Frame", {
                AnchorPoint = Vec2(0.5, 0.5),
                Position = UDim2s(0.5, 0.5),
                AutomaticSize = SizeXY,
                BackgroundTransparency = 1,
            }, parts),
        })
        Hover(btn, function(on)
            btn.BackgroundColor3 = on and over or base
            stroke.Enabled = on or primary
        end)
        if o.Callback then btn.Activated:Connect(o.Callback) end
        return btn
    end

    local Page = {}
    Page.__index = Page

    local function Add(self, inst)
        self.Order += 1
        inst.LayoutOrder = self.Order
        inst.Parent = self.Root
        return inst
    end

    local function Wire(self, o)
        local go, cb = o.Goto, o.Callback
        if go or o.Back then
            o.Callback = function()
                if cb then cb() end
                if go then self.Router:Go(go) else self.Router:Back() end
            end
        end
        return o
    end

    function Page.new(parent)
        local root = New("ScrollingFrame", {
            Size = UDim2s(1, 1),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ScrollBarThickness = 4,
            CanvasSize = UDim2n(),
            AutomaticCanvasSize = SizeY,
            Parent = parent,
        }, {
            List({ Padding = UDimn(0, Gap) }),
            New("UIPadding", { PaddingTop = UDimn(0, 5), PaddingLeft = UDimn(0, 4), PaddingRight = UDimn(0, 10) }),
        })
        return setmt({ Root = root, Order = 0 }, Page)
    end

    function Page:Text(o)
        local size = o.Size or 22
        return Add(self, Label({
            Text = o.Text,
            Font = FontBold,
            TextSize = size,
            TextXAlignment = AlignLeft,
            Size = UDim2n(1, 0, 0, size + 10),
        }))
    end

    function Page:Paragraph(o)
        return Add(self, Label({
            Text = o.Text,
            TextSize = o.Size or 14,
            TextColor3 = o.Color or ColSub,
            TextWrapped = true,
            RichText = o.Rich == true,
            TextXAlignment = AlignLeft,
            TextYAlignment = AlignTop,
            AutomaticSize = SizeY,
            Size = UDim2n(1, 0, 0, 0),
        }))
    end

    function Page:Divider(o)
        o = o or {}
        return Add(self, New("Frame", {
            BackgroundColor3 = o.Color or ColLine,
            BorderSizePixel = 0,
            Size = UDim2n(1, 0, 0, o.Thickness or 1),
        }))
    end

    function Page:Image(o)
        local img = o.Image
        if type(img) == "number" then img = "rbxassetid://" .. img end
        local label = Add(self, New("ImageLabel", {
            Image = img,
            ScaleType = o.Scale or ScaleCrop,
            BackgroundColor3 = ColButton,
            BorderSizePixel = 0,
            ImageTransparency = o.Transparency or 0,
            Size = UDim2n(1, 0, 0, o.Height or 120),
        }, { Corner(o.Radius or 8) }))
        if o.Url then
            tk.spawn(function()
                local ok, asset = pcall(Fetch, o.Url, o.File or "jy.png")
                if ok then label.Image = asset else warn(asset) end
            end)
        end
        return label
    end

    function Page:Spacer(px)
        return Add(self, New("Frame", { BackgroundTransparency = 1, Size = UDim2n(1, 0, 0, px or 8) }))
    end

    function Page:Button(o)
        return Add(self, MakeButton(Wire(self, o)))
    end

    function Page:ButtonGroup(list)
        local n = #list
        local holder = New("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2n(1, 0, 0, Height),
        }, { List({ FillDirection = DirHorizontal, Padding = UDimn(0, Gap) }) })
        local buttons = {}
        for i, o in ipairs(list) do
            o.Size = UDim2n(1 / n, -Gap * (n - 1) / n, 1, 0)
            buttons[i] = MakeButton(Wire(self, o))
            buttons[i].LayoutOrder = i
            buttons[i].Parent = holder
        end
        Add(self, holder)
        return { Frame = holder, Buttons = buttons }
    end

    function Page:Selector(o)
        local options, index = o.Options, o.Default or 1
        local left = { Size = UDim2s(0.4, o.Desc and 0.45 or 1), TextXAlignment = AlignLeft }
        local row = New("Frame", { BackgroundTransparency = 1, Size = UDim2n(1, 0, 0, o.Desc and 64 or 48) }, {
            Label(Merge({ Text = o.Text, Font = FontBold, TextSize = 17, TextYAlignment = o.Desc and AlignTop or AlignMiddle }, left)),
        })
        if o.Desc then
            Label({
                Text = o.Desc,
                TextSize = 12,
                TextColor3 = ColSub,
                TextWrapped = true,
                TextXAlignment = AlignLeft,
                TextYAlignment = AlignTop,
                Position = UDim2s(0, 0.45),
                Size = UDim2s(0.4, 0.55),
                Parent = row,
            })
        end
        local control = New("Frame", {
            AnchorPoint = Vec2(1, 0.5),
            Position = UDim2s(1, 0.5),
            Size = UDim2s(0.58, 1),
            BackgroundTransparency = 1,
            Parent = row,
        })
        local value = Label({
            Text = tostring(options[index]),
            AnchorPoint = Vec2(0.5, 0.5),
            Position = UDim2s(0.5, 0.5),
            Size = UDim2n(1, -90, 1, 0),
            Parent = control,
        })
        local function set(i)
            index = (i - 1) % #options + 1
            value.Text = tostring(options[index])
            if o.Callback then tk.spawn(o.Callback, options[index], index) end
        end
        for _, a in ipairs({ { "‹", 0, -1 }, { "›", 1, 1 } }) do
            local arrow = Label({
                Text = a[1],
                Font = FontBold,
                TextSize = 34,
                AnchorPoint = Vec2(a[2], 0.5),
                Position = UDim2s(a[2], 0.5),
                Size = UDim2o(40, 40),
                Parent = control,
            })
            local hit = New("TextButton", { Text = "", BackgroundTransparency = 1, Size = UDim2s(1, 1), Parent = arrow })
            Hover(hit, function(on) arrow.TextColor3 = on and ColSub or ColText end)
            hit.Activated:Connect(function() set(index + a[3]) end)
        end
        Add(self, row)
        return {
            Frame = row,
            Set = function(_, i) set(i) end,
            Get = function() return options[index], index end,
        }
    end

    local Router = {}
    Router.__index = Router

    function Router.new(parent)
        return setmt({ Parent = parent, Pages = {}, History = {} }, Router)
    end

    function Router:Page(name)
        local page = Page.new(self.Parent)
        page.Root.Visible = false
        page.Router = self
        self.Pages[name] = page
        return page
    end

    function Router:Go(name, back)
        local current = self.Current
        if current then
            self.Pages[current].Root.Visible = false
            if not back then tble.insert(self.History, current) end
        end
        self.Current = name
        self.Pages[name].Root.Visible = true
    end

    function Router:Back()
        local previous = tble.remove(self.History)
        if previous then self:Go(previous, true) end
    end

    local menu = Wait(CoreGui, "RobloxGui", "SettingsClippingShield", "SettingsShield", "MenuContainer", "Page")
    local tabs = Wait(menu, "HubBar", "TabHeaderContainer", "HubBarContainer")
    local clipper = Wait(menu, "PageViewClipper")
    local peopleTab = Wait(tabs, "PeopleTab")

    Kill(tabs, "TTJYTab")
    Kill(menu, "TTJYClipper")
    clipper.Visible = true

    local function fit(t)
        local function apply()
            local size = t.Size
            if math.abs(size.X.Scale - 0.174) > 0.001 or size.X.Offset ~= 0 then
                t.Size = UDim2n(0.174, 0, size.Y.Scale, size.Y.Offset)
            end
        end
        apply()
        t:GetPropertyChangedSignal("Size"):Connect(apply)
    end

    local tab = peopleTab:Clone()
    tab.Name = "TTJYTab"
    tab.LayoutOrder = -1
    tab.TabLabel.Icon.Text = "x"
    tab.TabLabel.Title.Text = "TJYS"
    tab.TabSelection.Visible = false
    fit(tab)
    tab.Parent = tabs

    local mine = clipper:Clone()
    mine:ClearAllChildren()
    mine.Name = "TTJYClipper"
    New("UISizeConstraint", { MaxSize = Vec2(800, 600), Parent = mine })
    mine.Visible = false
    mine.Parent = menu

    local function show(on)
        mine.Visible = on
        clipper.Visible = not on
        if on then warn("TTJY", mine.AbsoluteSize, mine.AbsolutePosition, mine.ZIndex, #mine:GetDescendants()) end
        for _, t in ipairs(tabs:GetChildren()) do
            local mark = t:FindFirstChild("TabSelection")
            if mark and (on or t == tab) then mark.Visible = on and t == tab end
        end
    end

    local function hook(t)
        if t ~= tab and t:IsA("GuiButton") then
            fit(t)
            t.Activated:Connect(function() show(false) end)
        end
    end

    tab.Activated:Connect(function() show(true) end)
    for _, t in ipairs(tabs:GetChildren()) do hook(t) end
    tabs.ChildAdded:Connect(hook)

    local Nav = Router.new(mine)
    local Home = Nav:Page("home")
    local Settings = Nav:Page("settings")

    Home:Image({ Url = "https://github.com/RealTTJY/Studio.Hub/blob/main/TJYS.png", File = "jy.png", Height = 160 })
    Home:Text({ Text = "Script not working?" })
    Home:Paragraph({ Text = "Try Status first. If the game still feels stuck, use Rejoin." })
    Home:Divider()
    Home:ButtonGroup({
        { Text = "Status", Key = "S", Callback = function() print("status") end },
        { Text = "Rejoin", Key = "J", Callback = function() print("rejoin") end },
        { Text = "Settings", Key = "E", Primary = true, Goto = "settings" },
    })

    Settings:Text({ Text = "Settings" })
    Settings:Selector({ Text = "Auto Execute", Options = { "On", "Off" }, Callback = function(v) print(v) end })
    Settings:Selector({
        Text = "Notifications",
        Desc = "Show a popup when something happens.",
        Options = { "All", "Errors only", "Off" },
        Callback = function(v) print(v) end,
    })
    Settings:Button({ Text = "Back", Key = "ESC", Back = true })

    Nav:Go("home")

    local shield = menu.Parent.Parent
    show(true)
    if shield.Visible then return end
    local opened
    opened = shield:GetPropertyChangedSignal("Visible"):Connect(function()
        if not shield.Visible then return end
        opened:Disconnect()
        tk.defer(show, true)
    end)
end

xpcall(TTJYMenu, function(e) warn(debug.traceback(e)) end)
