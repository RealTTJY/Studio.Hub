local Start = function(Out_M)
    local Out_M = "[JYRS@COMPAT]: ";
    local Erros = {
        MissingFunc = {};
        MissingC = {};
        Called = {};
    };

    local SimpleHttp = function()
        warn(Out_M.."@Httpget: ");

        local Success, HttpGet = pcall(function()
            return game.HttpGet;
        end); if Success and HttpGet then
            print("\t\tYour executor can index game.HttpGet");
            return true;
        else
            print("\t\tYour executor can NOT index game.HttpGet");
            warn("\t\tJust quit exploit at this point");
            return false;
        end;
    end;
    local FuncCheck = function()
        warn(Out_M.."@ENV: ");

        local TBL, Suc = {
            ["setthreadcontext"] = setthreadcaps or setthreadcontext or setthreadidentity or set_thread_context or set_thread_identity or 0;
            ["hookfunction"] = hookfunc or hookfunction or 0,
            ["hookmetamethod"] = hookmetamethod or 0,
            ["newcclosure"] = newcclosure or 0,
            ["checkcaller"] = checkcaller or 0,
            ["getnamecallmethod"] = getnamecallmethod or 0,
            ["getrawmetatable"] = getrawmetatable or 0,
            ["setreadonly"] = setreadonly or make_writeable or 0,
            ["isreadonly"] = isreadonly or 0,
            ["getgc"] = getgc or 0,
            ["getgenv"] = getgenv or 0,
            ["getrenv"] = getrenv or 0,
            ["getreg"] = getreg or 0,
            ["getinfo"] = debug.getinfo or getinfo or 0;
            ["getupvalue"] = getupvalue or 0,
            ["getupvalues"] = getupvalues or 0,
            ["setupvalue"] = setupvalue or 0,
            ["getconstants"] = getconstants or 0,
            ["setconstant"] = setconstant or 0,
            ["getprotos"] = getprotos or 0,
            ["getproto"] = getproto or 0,
            ["cloneref"] = cloneref or 0,
            ["isfunctionhooked"] = isfunctionhooked or 0;
            ["identifyexecutor"] = identifyexecutor or 0,
            ["isexecutorclosure"] = isexecutorclosure or 0,
            ["gethui"] = gethui or 0,
            ["request"] = http_request or request or 0;
            ["firetouchinterest"] = firetouchinterest or 0,
            ["fireproximityprompt"] = fireproximityprompt or 0,
            ["firesignal"] = firesignal or 0,
            ["getconnections"] = getconnections or 0,
            ["restorefunction"] = restorefunction or restorefunc or restoreclosure or 0;
        }, {};

        for Name, Func in pairs(TBL) do
            if type(Func) == "function" then
                Suc[Name] = {
                    Txt = "\t✅ "..Name;
                    func = Func;
                };
            else
                Suc[Name] = {
                    Txt = "\t❌ "..Name;
                }; table.insert(Erros.MissingFunc, Name);
            end;
        end;

        if debug.info then
            for Name, v in pairs(Suc) do
                local Written,RName = nil; if v.func then
                    pcall(function()
                        Written,RName = debug.info(v.func, "sn");
                    end);
                end; if type(Written) == 'string' then
                    if Written ~= "[C]" and Written ~= "C" then
                        table.insert(Erros.MissingC, Name);
                    end;
                end; print(v.Txt.." ".. (Written or "") .. " (" .. (RName or "") .. ")");
            end;
        else
            for Name, v in pairs(Suc) do
                print(v.Txt);
            end; warn("[WARNING]: debug.info NOT found");
        end; return true;
    end;
    local RequestCheck = function()
        warn(Out_M.."@RQ: ");

        local Request = http_request or request;
        if not Request then return false; end;

        local Success, Response = pcall(function()
            return request({
                Url = "https://httpbin.org/get",
                Method = "GET"
            });
        end);

        warn("\tOriginal RQ:"); if Success and Response then
            if Response.StatusCode and Response.Success then
                print("\t\tSuccess");
            else
                print("\t\tStatusCode: " .. tostring(Response.StatusCode));
                print("\t\tSuccess: " .. tostring(Response.Success));
                return false;
            end;
        else
            print("\t\tFailed: " .. tostring(Response));
            return false;
        end;

        local LowerC = hookfunc or hookfunction;
        local ResetC = restorefunction or restorefunc or restoreclosure;
        if not LowerC then return false; end;

        local Success, Response = pcall(function()
            LowerC(Request, function(...)
                return "Hello World";
            end); return request({
                Url = "https://httpbin.org/get",
                Method = "GET"
            });
        end);

        warn("\tHooked RQ:"); if Success then
            if Response == "Hello World" then
                print("\t\tSuccess: " .. tostring(Response));
            else
                print("\t\tUnhookable: " .. tostring(Response));
            end;
        else
            print("\t\tFailed: " .. tostring(Response));
            return false;
        end; if not ResetC then return false; end;

        warn("\tRestored RQ:")
        local Success, Response = pcall(function()
            ResetC(Request);
        end); if not Success then
            print("\t\tFailed: " .. tostring(Response));
        else
            print("\t\tSuccess");
        end;

        local Success, Response = pcall(function()
            return request({
                Url = "https://httpbin.org/get",
                Method = "GET"
            });
        end);

        warn("\tNext RQ:"); if Success and Response then
            if Response.StatusCode and Response.Success then
                print("\t\tSuccess");
            else
                warn("\t\tSecurityVoltSharp");
                return false;
            end;
        else
            print("\t\tFailed: " .. tostring(Response));
            return false;
        end; return true;
    end;
    local LuaTimeCheck = function()
        warn(Out_M.."@LT:");
        if not isfunctionhooked then return false; end;
        local serve1=tick(); isfunctionhooked(print); local serve2=tick();
        local serve3 = serve2 - serve1; if serve3 > 0.00000250928955078125 then
            print("\t\tFailed: " .. tostring(serve3));
        else
            print("\t\tSuccess: " .. tostring(serve3));
        end; return true;
    end;
    local RequireCheck = function()
        warn(Out_M.."@REQ:")
        if not require then return false; end;
        if not debug.info then return false; end;
        local Success, Written = pcall(function()
            return debug.info(require, "s");
        end); if Written ~= "C" and Written ~= "[C]" then
            print("\tFailed 2C");
            return false;
        else
            print("\tSuccess 2C");
        end;

        warn("\tREQ:")
        local Success, Response = pcall(function()
            return require(game:GetService("Players").LocalPlayer.PlayerScripts.PlayerModule);
        end); if Success and Response then
            print("\t\tSuccess: " .. tostring(Response));
        else
            print("\t\tFailed: " .. tostring(Response));
        end; return true;
    end;
    local GCCheck = function()
        warn(Out_M.."@GC:");
        if not getgc then return; end;
        local Success, Response = pcall(function()
            return getgc(true);
        end); task.wait(3); if not Success then
            print("\tGC Failed: " .. tostring(Response));
            return false;
        else
            local atleast1 = nil; for i,v in pairs(Response) do
                if type(v) == 'table' then
                    if rawget(v, "cameras") and rawget(v, "controls") then
                        atleast1 = v;
                    end;
                end;
            end; if atleast1 then
                print("\tGC Success: " .. tostring(atleast1));
            else
                print("\tFake GC: " .. tostring(atleast1));
            end;
        end; return true;
    end;
    local UPSCheck = function()
        warn(Out_M.."@UPS:");

        local getup = getupvalue or debug.getupvalue;
        local getcon = getconstants or debug.getconstants;

        if not getup then return false; end;
        if not getcon then return false; end;

        local Success, Response = pcall(function()
            return require(game:GetService("Players").LocalPlayer.PlayerScripts.PlayerModule);
        end); if not Success then
            warn("\tProbably failed to double required");
            return false;
        end;

        local new = Response.controls;
        new = new and new.activeControlModule;
        new = new and new.new;

        if not new then return false; end;

        local Success, Up = pcall(function()
            return getupvalue(new, 1);
        end); if not Success then
            print("\tFailed: " .. tostring(Up));
        else
            print("\tSuccess: " .. tostring(Up));
        end; return true;
    end;

    for i,v in pairs({
        ["HttpGet"] = SimpleHttp();
        ["Func"] = FuncCheck();
        ["RQ"] = RequestCheck();
        ["LT"] = LuaTimeCheck();
        ["REQ"] = RequireCheck();
        ["GC"] = GCCheck();
        ["UPS"] = UPSCheck();
    }) do
        if not v then table.insert(Erros.Called, i); end;
        if i == "HttpGet" and not v then
            return;
        end; if not v then
            warn(Out_M..i.." did NOT complete succesfully");
        end;
    end;

    local execname = getexecutorname or function()
        return "Does not have a name??";
    end;
    local getthread = getthreadcontext or getthreadidentity or getthreadcaps or get_thread_context or get_thread_identity or function()
        return "Unknown";
    end;

    warn(Out_M.."Executor: " .. tostring(execname()));
    warn(Out_M.."Thread: " .. tostring(getthread()));
    warn(Out_M.."MissingFunc: "..tostring(#Erros.MissingFunc));
    warn(Out_M.."MissingC: "..tostring(#Erros.MissingC));
    warn(Out_M.."FailedCall: "..tostring(#Erros.Called));

    for i,v in pairs(Erros.Called) do
        print("\t"..v);
    end;

    pcall(function()
        local setc = setclipboard or toclipboard;
        if not setc then
            warn(Out_M.."Clipboard function unavailable");
            return;
        end;

        local Report = {
            "========================================",
            "       JYRS COMPATIBILITY REPORT",
            "========================================",
            "",
            "Executor: " .. tostring(execname()),
            "Thread: " .. tostring(getthread()),
            "",
            "--------------- SUMMARY ----------------",
            "Missing Functions: " .. tostring(#Erros.MissingFunc),
            "Non-C Functions: " .. tostring(#Erros.MissingC),
            "Failed Checks: " .. tostring(#Erros.Called),
            "",
            "----------- MISSING FUNCTIONS ----------"
        };

        for _, v in ipairs(Erros.MissingFunc) do
            table.insert(Report, "[-] " .. tostring(v));
        end;

        if #Erros.MissingFunc == 0 then
            table.insert(Report, "[+] None");
        end;

        table.insert(Report, "");
        table.insert(Report, "------------- NON-C FUNCTIONS -----------");

        for _, v in ipairs(Erros.MissingC) do
            table.insert(Report, "[!] " .. tostring(v));
        end;

        if #Erros.MissingC == 0 then
            table.insert(Report, "[+] None");
        end;

        table.insert(Report, "");
        table.insert(Report, "-------------- FAILED CHECKS ------------");

        for _, v in ipairs(Erros.Called) do
            table.insert(Report, "[-] " .. tostring(v));
        end;

        if #Erros.Called == 0 then
            table.insert(Report, "[+] None");
        end;

        table.insert(Report, "");
        table.insert(Report, "========================================");
        table.insert(Report, "Generated by JYRS@COMPAT");
        table.insert(Report, "========================================");

        local FinalReport = table.concat(Report, "\n");

        setc(FinalReport);
    end);
end;

local Success, Error = pcall(function()
    local Compatibility = Start("[JYRS@COMPAT]: ");
end); warn("[JYRS@ERROR]: " .. tostring(Success) .. " " .. tostring(Error));
