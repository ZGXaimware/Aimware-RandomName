local ref = gui.Tab(gui.Reference("Misc"), "RandomName", "RandomName")

local String = gui.Groupbox(ref, "String Set", 15, 15, 294);

local MsSwitch = gui.Groupbox(ref, "Switch", 327, 15, 294);


local randommaster = gui.Checkbox(MsSwitch, "rnmaster", "RandomMasterSwitch", 0)
local manualstart = gui.Keybox(MsSwitch, "ManualChangeName", "ManualChangeNameKey", 119)
local staticname = gui.Editbox(String, "staticName", "staticName")
local ontimechange = gui.Checkbox(MsSwitch, "ontimechange", "OnTimeChange", 0);
local ontimetick =  gui.Slider(MsSwitch, "ontimetick", "OnTimeTick", 256, 64, 1000, 1)
local usepy = gui.Checkbox(MsSwitch, "usepy", "UsePyScript", 0);
local ondeathchange = gui.Checkbox(MsSwitch, "deathchange", "OnDeathChange", 0);
local thisname = gui.Editbox(String, "plocalname", "plocalName");



local namelist = { "James", "翻斗花园第一突破手", "Kamisama", "我永远喜欢樱岛麻衣", "CSGO大茄子",
    "WDNMD", "Selector", "-=Smart=-", "理塘最強伝説!純真丁一郎", "当爱已成往事", "Astender", "Bubbpy",
    ":D flash", "Revenger", "蜜雪冰城甜蜜蜜", "百香果果汁", "Slayer", "YaYa大D", "Cz7Teacher", "可惜悦刻没有电",
    "Aqua Minato", "和泉紗霧", "Apex顶猎", "DeagleKing", "Lê Minh", "龍が如く", "初音未来", "Rolicon",
    "对镜子倾诉心事", "Miku", "Sksleetion", "QZSekec", "雷军!金凡!", "小爱同学", "Rosetta", "樱岛麻衣", "百事可乐", "可口可乐", "Kawaii", "StormGamer",
    "FireDragon",
    "IceQueen",
    "ShadowHunter",
    "NightmareSlayer",
    "BlazingPhoenix",
    "MysticWizard",
    "EternalGamer",
    "SteelAssassin",
    "SavageSamurai",
    "SilentNinja",
    "CrimsonReaper",
    "LuckyCharm",
    "RapidFire",
    "FearlessWarrior",
    "GhostRider",
    "PhantomSniper",
    "RadiantStar",
    "EnigmaMaster",
    "Dragonborn",
    "Frostbite",
    "CyberPunk",
    "ThunderStorm",
    "DoomBringer",
    "SkyWalker",
    "EagleEye",
    "MoonlightShadow",
    "CrazyGamer",
    "SilverBullet",
    "CaffeineAddict",
    "SpartanWarrior",
    "GamingLegend",
    "Mastermind",
    "DigitalMage",
    "CaptainAwesome",
    "StealthyViper",
    "FrozenFury",
    "PhoenixRising",
    "SupremeCommander",
    "UltimateGamer",
    "DragonSlayer",
    "NinjaAssassin",
    "ShadowBlade",
    "StormBreaker",
    "Firestorm",
    "IceWizard",
    "LunarEclipse",
    "SpectralKnight",
    "Nightfall",
    "BladeRunner",
    "MysticDreamer",
    "EternalChampion",
    "StealthSniper",
    "SamuraiWarrior",
    "CrimsonTide",
    "LuckyStar",
    "RapidStrike",
    "FearlessHero",
    "GhostlyPresence",
    "PhantomStriker",
    "RadiantGlow",
    "EnigmaHunter",
    "DragonHeart",
    "FrostGuardian",
    "CyberHero",
    "ThunderBolt",
    "DoomDestroyer",
    "SkyHigh",
    "EagleGaze",
    "Moonshadow",
    "CrazySpartan",
    "SilverStreak",
    "CaffeineJunkie",
    "GamingPro",
    "MasterOfPuzzles",
    "DigitalNinja",
    "CaptainMarvel",
    "StealthWizard",
    "FrozenFury",
    "PhoenixFire",
    "SupremeLeader",
    "UltimateWarrior",
    "DragonFury",
    "NinjaMaster",
    "ShadowWalker",
    "StormSeeker",
    "FireBlaze",
    "IcePrince",
    "LunarGuardian",
    "SpectralReaper",
    "Nightshade",
    "BladeMaster",
    "宇智波", "四代", "柯南", "赤瞳", "幻影", "奥特曼", "维特", "白色恶魔", "诺基亚", "海绵宝宝",
    "巴斯光年", "蓝精灵", "大力水手", "史瑞克", "麦兜",
    "皮卡丘", "小樱", "路飞", "猪猪侠", "史努比", "米老鼠", "小飞象", "小猪佩奇", "哆啦A梦",
    "蜡笔小新", "睡美人", "仙履奇缘", "铁臂阿童木", "风骚侧脸", "蛇精病",
    "财神爷", "奶茶妹妹", "糖糖", "宝藏男孩", "王子殿下", "高冷女王", "唯美小公主", "帅气大叔",
    "甜蜜情人", "摩登时尚", "热血战士", "潮人一族", "宅男女神", "乐活小鲜肉",
    "超级粉丝", "小可爱", "迷人小猫咪", "游戏高手", "逗比小萌物", "学霸天团", "小资情调",
    "悍匪", "灰姑娘", "宅女大佬", "黑妞", "憨豆先生", "倔强的小牛",
    "仗剑走天涯", "绝世小妖精", "流氓兔", "二哈", "寻找幸福", "霸气总裁", "痞子", "绝命毒师",
    "草帽海贼团", "美眉杀手", "忍者神龟", "金牌咖啡师", "脑洞大开", "魔法少女",
    "战神阿瑞斯", "拼命三郎", "爱哭鬼", "熊孩子", "淘气包", "刺客信条", "神秘人", "猛男",
    "火箭少女", "气质小公举", "电竞小公主", "运动健将", "懒癌晚期", "全能剪辑师",
    "星际穿越", "超能力者", "时尚达人", "天使爱美丽", "蝙蝠侠", "绿巨人", "美猴王", "女王大人",
    "恶魔猎手", "海盗王", "双面人", "魔术师", "大力士", "黑暗骑士",
    "狙击手", "拳击手", "斗牛士", "神偷", "无敌战神", "机器人", "街头霸王", "狂野女郎", "女武神",
    "舞者", "天使之翼", "霸道总裁", "女帝", "超级英雄", "未来战士"
}

local font = draw.CreateFont("Microsoft Tai Le", 30, 1000);
local needchangename = false
local localplayername = nil

local function randomchangename(pLocal)
    if staticname:GetValue() ~= nil and staticname:GetValue() ~= "" then
        client.SetConVar("name", staticname:GetValue() .. "­­")
        print("Name Changed to " .. staticname:GetValue())
    else
        local randomname = namelist[math.random(0, #namelist)]
        if randomname ~= nil then
            client.SetConVar("name", randomname .. "­­")
            if not ontimechange:GetValue() then
                print("Name Changed to " .. randomname)
                localplayername = pLocal:GetName()
            end
        end
    end
end

callbacks.Register("CreateMove", function()
    local pLocal = entities.GetLocalPlayer()
    if pLocal ~= nil then
        localplayername = pLocal:GetName()

        if randommaster:GetValue() then
            if needchangename and globals.TickCount() % 30 == 0 then
                randomchangename(pLocal)
                needchangename = false
            end

            if localplayername == "󠀡󠀡" or localplayername == thisname:GetValue() then
                gui.SetValue("misc.stealname", 34)
                if usepy:GetValue() then
                    if globals.TickCount() % 64 == 0 then
                        http.Get("http://127.0.0.69:5000/")
                    end
                end
            end

            if manualstart:GetValue() ~= nil or manualstart:GetValue() ~= 0 then
                if input.IsButtonPressed(manualstart:GetValue()) then
                    needchangename = true
                end
            end

            if localplayername == "?empty" then
                randomchangename(pLocal)
                gui.SetValue("misc.stealname", 0)
            end
            if ontimechange:GetValue() then
                if localplayername ~= "?empty" and localplayername ~= "󠀡󠀡" and globals.TickCount() % ontimetick:GetValue() == 0 then
                    randomchangename(pLocal)
                    needchangename = false
                end
            end
        end
    end
end)

callbacks.Register("Draw", function()
    if gui.GetValue("esp.master") and randommaster:GetValue() then
        draw.SetFont(font);
        draw.Color(255, 255, 255, 255);
        if not (localplayername == nil) then
            draw.Text(100, 100, localplayername)
        end
    end
end)

local SetThisName = gui.Button(MsSwitch, "setpLocalName", function()
    if (localplayername == "󠀡󠀡" or localplayername == "?empty" or localplayername == nil) then
        return
    end
    thisname:SetValue(localplayername)
end);
SetThisName:SetWidth(268)

client.AllowListener("client_disconnect");
client.AllowListener("begin_new_match");
client.AllowListener('player_death');
callbacks.Register("FireGameEvent", function(e)
    local eventName = e:GetName()
    if (eventName == "client_disconnect") or (eventName == "begin_new_match") then
        localplayername = ""
    elseif (eventName == 'player_death') and ondeathchange:GetValue() then
        local lp = client.GetLocalPlayerIndex()
        local victim = client.GetPlayerIndexByUserID(e:GetInt('userid'))
        -- local attacker = client.GetPlayerIndexByUserID(Event:GetInt('attacker'))
        if lp == victim then
        -- and attacker ~= lp then
            needchangename = true
        end
    end
end)
