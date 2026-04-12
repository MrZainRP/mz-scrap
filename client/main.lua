QBCore = exports['qb-core']:GetCoreObject()
local bl_ui = exports.bl_ui

local PlayerData = {}
local isLoggedIn = false
local percent = false
local searching = false
local salvaging = false 

local craftcheck = false
local craftprocesscheck = false
local craftparse = true 
local antiEx = true 
local skillAmt = 0

cachedWreck = {}

closestScrap = {
    "prop_rub_buswreck_0",
    "prop_rub_carwreck_1",
    "prop_rub_carwreck_2",
    "prop_rub_carwreck_3",
    "prop_rub_carwreck_4",
    "prop_rub_carwreck_5",
    "prop_rub_carwreck_6",
    "prop_rub_carwreck_7",
    "prop_rub_carwreck_8",
    "prop_rub_carwreck_9",
    "prop_rub_carwreck_10",
    "prop_rub_carwreck_11",
    "prop_rub_carwreck_12",
    "prop_rub_carwreck_13",
    "prop_rub_carwreck_14",
    "prop_rub_carwreck_15",
    "prop_rub_carwreck_16",
}

RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
    isLoggedIn = true
end)

QBCore.Functions.TriggerCallback('mz-scrap:GetKey', function(result)
    Key = result
end)

function RandomKey()
    return Key
end

DrawText3Ds = function(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end


-------------
--SCRAPPING--
-------------

local tier2Check = false
local tier3Check = false 

CreateThread(function()
    if Config.TargetType == "qb" then 
        exports['qb-target']:AddTargetModel(Config.Objects, {
            options = {
                {
                    num = 1, 
                    type = "client",
                    event = "mz-scrap:client:salvage",
                    icon = "fas fa-search",
                    label = "Use Hands",
                    tool = "hands",
                },
                {
                    num = 2, 
                    type = "client",
                    event = "mz-scrap:client:salvage",
                    icon = "fas fa-screwdriver",
                    label = "Use "..Config.ScrewdriverRequiredItemLabel,
                    tool = "screw",
                },
                {
                    num = 3, 
                    type = "client",
                    event = "mz-scrap:client:salvage",
                    icon = "fas fa-fire-extinguisher", 
                    label = "Use "..Config.BlowtorchRequiredItemLabel,
                    tool = "torch",
                },
            },
        distance = 1.1
        })  
    elseif Config.TargetType == "ox" then 
        exports.ox_target:addModel(Config.Objects, {
            {
                event = "mz-scrap:client:salvage",
                icon = "fas fa-search",
                label = "Use Hands",
                num = 1,
                type = "client",
                tool = "hands",
                distance = 1.1, 
            },
            {
                event = "mz-scrap:client:salvage",
                icon = "fas fa-screwdriver",
                label = "Use "..Config.ScrewdriverRequiredItemLabel,
                num = 2,
                type = "client",
                tool = "screw",
                distance = 1.1, 
            },
            {
                event = "mz-scrap:client:salvage",
                icon = "fas fa-fire-extinguisher",
                label = "Use "..Config.BlowtorchRequiredItemLabel,
                num = 3,
                type = "client",
                tool = "torch",
                distance = 1.1, 
            },
        })
    else 
        print("your Config.TargetType has been set incorrect in config.lua. Pick between 'qb' or 'ox'.")
    end 
end)

--------------
--HAND SCRAP--
--------------

RegisterNetEvent("mz-scrap:client:salvage", function(data)
    checkXP()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    for i = 1, #closestScrap do
        local x = GetClosestObjectOfType(playerCoords, 0.9, GetHashKey(closestScrap[i]), false, false, false)
        local entity = nil
        if DoesEntityExist(x) and not IsPedSittingInAnyVehicle(PlayerPedId()) then
            entity = x
            if not cachedWreck[entity] then
                if not salvaging then
                    if data.tool == "hands" then  
                        if Config.Handskillcheck then
                            TriggerEvent('animations:client:EmoteCommandStart', {"kneel"}) 
                            if Config.skillType == "ps" then 
                                exports['ps-ui']:Circle(function(success)
                                    if success then
                                        salvaging = true 
                                        ExtractScrap(entity)
                                    else
                                        scrapLevel = 1
                                        ScrapFail(scrapLevel)
                                    end
                                end, Config.handscrapparses, Config.handsearchtime)
                            elseif Config.skillType == "bl" then 
                                local iterations = Config.handParses
                                local diffculty = Config.handDifficulty
                                local numberOfLines = Config.handLines
                                local success = bl_ui:RapidLines(iterations, difficulty, numberOfLines)
                                if success then
                                    salvaging = true 
                                    ExtractScrap(entity)
                                else
                                    scrapLevel = 1
                                    ScrapFail(scrapLevel)
                                end
                            else 
                                if Config.debug then 
                                    print("You have not set 'Config.skillType to a valid variable - use 'ps' or 'bl' to change skill check game")
                                end
                            end
                        elseif not Config.Handskillcheck then 
                            ExtractScrap(entity)
                        end
                    elseif data.tool == "screw" then
                        if tier2Check then 
                            if Config.Screwdriverskillcheck then 
                                if QBCore.Functions.HasItem(Config.ScrewdriverRequiredItem) then
                                    TriggerEvent('animations:client:EmoteCommandStart', {"kneel"}) 
                                    if Config.skillType == "ps" then
                                        exports['ps-ui']:Circle(function(success)
                                            if success then
                                                salvaging = true 
                                                ExtractScrap2(entity)
                                            else
                                                scrapLevel = 2
                                                ScrapFail(scrapLevel)
                                            end
                                        end, Config.screwscrapparses, Config.screwsearchtime)
                                    elseif Config.skillType == "bl" then 
                                        local iterations = Config.screwParses
                                        local diffculty = Config.screwDifficulty
                                        local numberOfLines = Config.screwLines
                                        local success = bl_ui:RapidLines(iterations, difficulty, numberOfLines)
                                        if success then
                                            salvaging = true 
                                            ExtractScrap(entity)
                                        else
                                            scrapLevel = 2
                                            ScrapFail(scrapLevel)
                                        end
                                    else 
                                        if Config.debug then 
                                            print("You have not set 'Config.skillType to a valid variable - use 'ps' or 'bl' to change skill check game")
                                        end
                                    end
                                else 
                                    if Config.inventoryType == "qb" then 
                                        local requiredItems = {
                                            [1] = {name = QBCore.Shared.Items[Config.ScrewdriverRequiredItem]["name"], image = QBCore.Shared.Items[Config.ScrewdriverRequiredItem]["image"]},
                                        }
                                        TriggerEvent('inventory:client:requiredItems', requiredItems, true)
                                        Wait(3000)
                                        TriggerEvent('inventory:client:requiredItems', requiredItems, false)
                                    end 
                                    if Config.NotifyType == 'qb' then
                                        QBCore.Functions.Notify('You need a '..Config.ScrewdriverRequiredItemLabel..' to access these parts.', "error", 3500)
                                    elseif Config.NotifyType == "okok" then
                                        exports['okokNotify']:Alert("WRONG TOOL", 'You need a '..Config.ScrewdriverRequiredItemLabel..' to access these parts.', 3500, "error")
                                    end
                                end 
                            elseif not Config.Screwdriverskillcheck then 
                                ExtractScrap2(entity)
                            end
                        else 
                            if Config.NotifyType == 'qb' then
                                QBCore.Functions.Notify('You need at least '..Config.screwdriverXP..'XP to use a '..Config.ScrewdriverRequiredItemLabel..".", "error", 3500)
                            elseif Config.NotifyType == "okok" then
                                exports['okokNotify']:Alert("XP NEEDED", 'You need at least '..Config.screwdriverXP..'XP to use a '..Config.ScrewdriverRequiredItemLabel..".", 3500, "error")
                            end
                        end
                    elseif data.tool == "torch" then 
                        if tier3Check then
                            if QBCore.Functions.HasItem(Config.BlowtorchRequiredItem) then
                                if Config.Blowtorchskillcheck then 
                                    TriggerEvent('animations:client:EmoteCommandStart', {"kneel"}) 
                                    if Config.skillType == "ps" then
                                        exports['ps-ui']:Circle(function(success)
                                            if success then
                                                salvaging = true 
                                                ExtractScrap3(entity)
                                            else
                                                scrapLevel = 3
                                                ScrapFail(scrapLevel)
                                            end
                                        end, Config.blowscrapparses, Config.blowsearchtime)
                                    elseif Config.skillType == "bl" then
                                        local iterations = Config.blowParses
                                        local diffculty = Config.blowDifficulty
                                        local numberOfLines = Config.blowLines
                                        local success = bl_ui:RapidLines(iterations, difficulty, numberOfLines)
                                        if success then
                                            salvaging = true 
                                            ExtractScrap(entity)
                                        else
                                            scrapLevel = 3
                                            ScrapFail(scrapLevel)
                                        end
                                    else 
                                        if Config.debug then 
                                            print("You have not set 'Config.skillType to a valid variable - use 'ps' or 'bl' to change skill check game")
                                        end
                                    end
                                elseif not Config.Blowtorchskillcheck then 
                                    ExtractScrap3(entity)
                                end
                            else
                                if Config.inventoryType == "qb" then 
                                    local requiredItems = {
                                        [1] = {name = QBCore.Shared.Items[Config.BlowtorchRequiredItem]["name"], image = QBCore.Shared.Items[Config.BlowtorchRequiredItem]["image"]},
                                    }
                                    TriggerEvent('inventory:client:requiredItems', requiredItems, true)
                                    Wait(3000)
                                    TriggerEvent('inventory:client:requiredItems', requiredItems, false)
                                end 
                                if Config.NotifyType == 'qb' then
                                    QBCore.Functions.Notify('You need a '..Config.BlowtorchRequiredItemLabel..' to unweld these parts.', "error", 3500)
                                elseif Config.NotifyType == "okok" then
                                    exports['okokNotify']:Alert("WRONG TOOL", "You need a "..Config.BlowtorchRequiredItemLabel.." to unweld these parts.", 3500, "error")
                                end
                            end 
                        else 
                            if Config.NotifyType == 'qb' then
                                QBCore.Functions.Notify('You need at least '..Config.blowtorchXP..'XP to use a '..Config.BlowtorchRequiredItemLabel..".", "error", 3500)
                            elseif Config.NotifyType == "okok" then
                                exports['okokNotify']:Alert("XP NEEDED", 'You need at least '..Config.blowtorchXP..'XP to use a '..Config.BlowtorchRequiredItemLabel..".", 3500, "error")
                            end
                        end   
                    else 
                        if Config.debug then 
                            print("You have tried to trigger the scraping function without targeting an appropriate prop.")
                        end                        
                        end 
                else 
                    if Config.NotifyType == 'qb' then
                        QBCore.Functions.Notify('You are doing something... slow down...', "error", 3500)
                    elseif Config.NotifyType == "okok" then
                        exports['okokNotify']:Alert("SLOW DOWN", "You are doing something... slow down...", 3500, "error")
                    end
                end 
            else
                if Config.NotifyType == 'qb' then
                    QBCore.Functions.Notify('You already stripped this wreck!', "error", 3500)
                elseif Config.NotifyType == "okok" then
                    exports['okokNotify']:Alert("NO MORE SCRAP", "You already stripped this wreck.", 3500, "error")
                end
            end
        end    
    end
end)

checkXP = function()
    if Config.mzskills then 
        exports["mz-skills"]:CheckSkill(Config.ScrapXPSkill, Config.scraplvl10, function(hasskill)
            if hasskill then scraplvl10 = true end
        end) 
        exports["mz-skills"]:CheckSkill(Config.ScrapXPSkill, Config.scraplvl9, function(hasskill)
            if hasskill then scraplvl9 = true end
        end) 
        exports["mz-skills"]:CheckSkill(Config.ScrapXPSkill, Config.scraplvl8, function(hasskill)
            if hasskill then scraplvl8 = true end
        end)
        exports["mz-skills"]:CheckSkill(Config.ScrapXPSkill, Config.scraplvl7, function(hasskill)
            if hasskill then scraplvl7 = true end
        end)
        exports["mz-skills"]:CheckSkill(Config.ScrapXPSkill, Config.scraplvl6, function(hasskill)
            if hasskill then scraplvl6 = true end
        end)
        exports["mz-skills"]:CheckSkill(Config.ScrapXPSkill, Config.scraplvl5, function(hasskill)
            if hasskill then scraplvl5 = true end
        end)
        exports["mz-skills"]:CheckSkill(Config.ScrapXPSkill, Config.scraplvl4, function(hasskill)
            if hasskill then scraplvl4 = true end
        end)
        exports["mz-skills"]:CheckSkill(Config.ScrapXPSkill, Config.scraplvl3, function(hasskill)
            if hasskill then scraplvl3 = true end
        end)
        exports["mz-skills"]:CheckSkill(Config.ScrapXPSkill, Config.scraplvl2, function(hasskill)
            if hasskill then scraplvl2 = true end
        end)
        exports["mz-skills"]:CheckSkill(Config.ScrapXPSkill, Config.scraplvl1, function(hasskill)
            if hasskill then scraplvl1 = true end
        end)
        exports["mz-skills"]:CheckSkill(Config.ScrapXPSkill, Config.scraplvl0, function(hasskill)
            if hasskill then scraplvl0 = true end
        end)
        exports["mz-skills"]:CheckSkill(Config.ScrapXPSkill, Config.screwdriverXP, function(hasskill)
            if hasskill then tier2Check = true end 
        end) 
        exports["mz-skills"]:CheckSkill(Config.ScrapXPSkill, Config.blowtorchXP, function(hasskill)
            if hasskill then tier3Check = true end 
        end)
    else
        scrapNOXP = true 
    end 
end 

ScrapFail = function(scrapLevel) 
    if Config.debug then 
        print("Player failed skillcheck and is losing XP")
    end
    Wait(500)
    ClearPedTasks(PlayerPedId())  
    Wait(500)
    if Config.mzskills then
        local deteriorate = 1
        if scrapLevel == 1 then 
            deteriorate = -Config.handXPloss
        elseif scrapLevel == 2 then 
            deteriorate = -Config.screwdriverXPloss
        elseif scrapLevel == 2 then 
            deteriorate = -Config.blowtorchXPloss
        end 
        exports["mz-skills"]:UpdateSkill(Config.ScrapXPSkill, deteriorate)
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('Your hand slipped!', "error", 3500)
            Wait(1000)
            QBCore.Functions.Notify('-'..Config.handXPloss.. 'XP to '..Config.ScrapXPSkill..'.', "error", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("HAND SLIPPED!", "Don't hurt yourself!", 3500, "error")
            Wait(1000)
            exports['okokNotify']:Alert("SKILLS", '-'..Config.handXPloss.. 'XP to '..Config.ScrapXPSkill..'.', 3500, "error")
        end
        scrapLevel = 0
    end
end

ExtractScrap = function(entity)
    searching = true
    TriggerEvent('animations:client:EmoteCommandStart', {"kneel"})
    local handsearch = math.random(Config.handsearchlow * 1000, Config.handsearchhigh * 1000)
    QBCore.Functions.Progressbar("search_register", "Attempting to salvage scrap...", handsearch, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        DisableControlAction(0, 170, true),
    }, {
    }, {}, {}, function() -- Done
        Wait(500)
        if Config.mzskills then 
            local BetterXP = math.random(Config.handXPlow, Config.handXPhigh)
            local chance2 = math.random(1, 4)
            if chance2 >= 3 then
                skillup = BetterXP
            else
                skillup = Config.handXPlow
            end
            exports["mz-skills"]:UpdateSkill(Config.ScrapXPSkill, skillup)
        end
        Wait(500)
        cachedWreck[entity] = true 
        if scraplvl10 then scrapAmt = 10  
        elseif scraplvl9 then scrapAmt = 9 
        elseif scraplvl8 then scrapAmt = 8 
        elseif scraplvl7 then scrapAmt = 7 
        elseif scraplvl6 then scrapAmt = 6 
        elseif scraplvl5 then scrapAmt = 5 
        elseif scraplvl4 then scrapAmt = 4 
        elseif scraplvl3 then scrapAmt = 3 
        elseif scraplvl2 then scrapAmt = 2 
        elseif scraplvl1 then scrapAmt = 1 
        elseif scraplvl0 then scrapAmt = 0 
        elseif scrapNOXP then scrapAmt = 000 end
        Wait(100)
        TriggerServerEvent('mz-scrap:server:ScrapReward', RandomKey(), scrapAmt) 
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        ClearPedTasks(PlayerPedId())
        StopAnimTask(PlayerPedId(), "amb@world_human_welding@male@base", "base", 1.0)
        searching = false
        salvaging = false 
    end, function() -- Cancel
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        StopAnimTask(PlayerPedId(), "amb@world_human_welding@male@base", "base", 1.0)
        ClearPedTasks(PlayerPedId())
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('You stopped '..Config.ScrapXPSkill..'.', "error", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("INTERRUPTED", 'You stopped '..Config.ScrapXPSkill..'.', 3500, "error")
        end
        searching = false  
        salvaging = false    
    end)
end

ExtractScrap2 = function(entity)
    searching = true
    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
    local screwsearchtime = math.random(Config.screwsearchlow * 1000, Config.screwsearchhigh * 1000)
    QBCore.Functions.Progressbar("search_register", "Attempting to salvage scrap...", screwsearchtime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        DisableControlAction(0, 170, true),
    }, {
    }, {}, {}, function() -- Done
        ClearPedTasks(PlayerPedId())
        cachedWreck[entity] = true
        antiEx = false 
        if scraplvl10 then scrapAmt = 10  
        elseif scraplvl9 then scrapAmt = 9 
        elseif scraplvl8 then scrapAmt = 8 
        elseif scraplvl7 then scrapAmt = 7 
        elseif scraplvl6 then scrapAmt = 6 
        elseif scraplvl5 then scrapAmt = 5 
        elseif scraplvl4 then scrapAmt = 4 
        elseif scraplvl3 then scrapAmt = 3 
        elseif scraplvl2 then scrapAmt = 2 
        elseif scraplvl1 then scrapAmt = 1 
        elseif scraplvl0 then scrapAmt = 0 
        elseif scrapNOXP then scrapAmt = 000 end
        Wait(100)
        TriggerServerEvent('mz-scrap:server:ScrapReward2', RandomKey(), scrapAmt)
        antiEx = true 
        Wait(1000)
        local successchance = math.random(1, 100)
        if successchance <= Config.screwdriversuccess then 
            TriggerServerEvent('mz-scrap:server:screwdriverbreak')
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('Damn! Your '..Config.ScrewdriverRequiredItemLabel..' breaks!', "error", 3500)
            elseif Config.NotifyType == "okok" then
                exports['okokNotify']:Alert(Config.ScrewdriverRequiredItemLabel.." SNAPS", "Damn! Your "..Config.ScrewdriverRequiredItemLabel.." breaks!", 3500, "error")
            end
        end
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        ClearPedTasks(PlayerPedId())
        StopAnimTask(PlayerPedId(), "amb@world_human_welding@male@base", "base", 1.0)
        Wait(500)
        if Config.mzskills then 
            local BetterXP2 = math.random(Config.screwdriverXPlow, Config.screwdriverXPhigh)
            local chance2 = math.random(1, 10)
            if chance2 >= 8 then
                skillup2 = BetterXP2
            elseif chance2 > 5 and chance2 < 8 then
                skillup2 = Config.screwdriverXPmid
            elseif chance2 < 6 then
                skillup2 = Config.screwdriverXPlow
            end
            exports["mz-skills"]:UpdateSkill(Config.ScrapXPSkill, skillup2)
        end
        searching = false
        salvaging = false 
    end, function() -- Cancel
        searching = false
        salvaging = false 
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        StopAnimTask(PlayerPedId(), "amb@world_human_welding@male@base", "base", 1.0)
        ClearPedTasks(PlayerPedId())
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('You stopped '..Config.ScrapXPSkill..'.', "error", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("INTERRUPTED", 'You stopped '..Config.ScrapXPSkill..'.', 3500, "error")
        end   
    end)
end

ExtractScrap3 = function(entity)
    ClearPedTasks(PlayerPedId()) 
    Wait(250)
    searching = true
    TriggerEvent('animations:client:EmoteCommandStart', {"weld"})
    local blowtime = math.random(Config.blowsearchlow * 1000, Config.blowsearchhigh * 1000)
    QBCore.Functions.Progressbar("search_register", "Attempting to salvage scrap...", blowtime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
        DisableControlAction(0, 170, true),
    }, {
    }, {}, {}, function() -- Done
        ClearPedTasks(PlayerPedId())
        searching = false
        salvaging = false 
        cachedWreck[entity] = true
        antiEx = false
        if scraplvl10 then scrapAmt = 10  
        elseif scraplvl9 then scrapAmt = 9 
        elseif scraplvl8 then scrapAmt = 8 
        elseif scraplvl7 then scrapAmt = 7 
        elseif scraplvl6 then scrapAmt = 6 
        elseif scraplvl5 then scrapAmt = 5 
        elseif scraplvl4 then scrapAmt = 4 
        elseif scraplvl3 then scrapAmt = 3 
        elseif scraplvl2 then scrapAmt = 2 
        elseif scraplvl1 then scrapAmt = 1 
        elseif scraplvl0 then scrapAmt = 0 
        elseif scrapNOXP then scrapAmt = 000 end
        Wait(100)
        TriggerServerEvent('mz-scrap:server:ScrapReward3', RandomKey(), scrapAmt)
        antiEx = true 
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        ClearPedTasks(PlayerPedId())
        StopAnimTask(PlayerPedId(), "amb@world_human_welding@male@base", "base", 1.0)
        Wait(500)
        if Config.mzskills then 
            local BetterXP2 = math.random(Config.blowtorchXPlow, Config.blowtorchXPhigh)
            local chance2 = math.random(1, 10)
            if chance2 >= 8 then
                skillup2 = BetterXP2
            elseif chance2 > 5 and chance2 < 8 then
                skillup2 = Config.blowtorchXPmid
            elseif chance2 < 6 then
                skillup2 = Config.blowtorchXPlow
            end
            exports["mz-skills"]:UpdateSkill(Config.ScrapXPSkill, skillup2)
        end
        Wait(500)
        local successchance2 = math.random(1, 100)
        if successchance2 <= Config.blowtorchsuccess then 
            TriggerServerEvent('mz-scrap:server:blowtorchbreak')
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('Damn! Your blowtorch burns out!', "error", 3500)
            elseif Config.NotifyType == "okok" then
                exports['okokNotify']:Alert("BLOWTORCH FRIED", "Damn! Your blowtorch burns out!", 3500, "error")
            end
        end
    end, function() -- Cancel
        searching = false
        salvaging = false 
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        StopAnimTask(PlayerPedId(), "amb@world_human_welding@male@base", "base", 1.0)
        ClearPedTasks(PlayerPedId())
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('You stopped '..Config.ScrapXPSkill..'.', "error", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("INTERRUPTED", 'You stopped '..Config.ScrapXPSkill..'.', 3500, "error")
        end   
    end)
end

--------------------
--BREAK DOWN PARTS--
--------------------

CreateThread(function()
    if Config.TargetType == "qb" then
        exports['qb-target']:AddBoxZone("mzscrapcrafting", Config.craftingLocation, 3.6, 1, {
            name = "mzscrapcrafting",
            heading = 90,
            debugPoly = false,
            minZ = 34.35,
            maxZ = 38.35,
            drawDistance = 10.0
            }, {
                options = { 
                {
                    num = 1, 
                    type = "client",
                    event = "mz-scrap:client:Breakdown",
                    icon = 'fas fa-cog',
                    label = 'Process Car Doors',
                    rawMat = "door", 
                },
                {
                    num = 2,
                    type = "client",
                    event = "mz-scrap:client:Breakdown",
                    icon = 'fas fa-screwdriver',
                    label = 'Process Old Tyres',
                    rawMat = "tyre", 
                },
                {
                    num = 3,
                    type = "client",
                    event = "mz-scrap:client:Breakdown",
                    icon = 'fas fa-radio',
                    label = 'Disassemble Car Hood', 
                    rawMat = "hood", 
                },
                {
                    num = 4,
                    type = "client",
                    event = "mz-scrap:client:Breakdown",
                    icon = 'fas fa-times',
                    label = 'Breakdown Air Filter', 
                    rawMat = "filter", 
                },
                {
                    num = 5,
                    type = "client",
                    event = "mz-scrap:client:Breakdown",
                    icon = 'fas fa-door-closed',
                    label = 'Recycle Spark Plugs', 
                    rawMat = "spark", 
                },
                {
                    num = 6,
                    type = "client",
                    event = "mz-scrap:client:Breakdown",
                    icon = 'fas fa-car',
                    label = 'Strip car hood', 
                    rawMat = "spoiler", 
                },
                {
                    num = 7,
                    type = "client",
                    event = "mz-scrap:client:Breakdown",
                    icon = 'fas fa-people-carry',
                    label = 'Strip engine block', 
                    rawMat = "engine", 
                },
            },
            distance = 1.5,
        })
    elseif Config.TargetType == "ox" then 
        exports.ox_target:addBoxZone({
            name = "mzscrapcrafting",
            coords = Config.craftingLocation,
            size = vec3(3.6, 1, 4.0),
            rotation = 90,
            debug = false,
            options = {
                {
                    event = "mz-scrap:client:Breakdown",
                    icon = 'fas fa-cog',
                    label = 'Strip Car Door',
                    type = "client",
                    num = 1,
                    rawMat = "door", 
                },
                {
                    event = "mz-scrap:client:Breakdown",
                    icon = 'fas fa-screwdriver',
                    label = 'Process Old Tyres',
                    type = "client",
                    num = 2,
                    rawMat = "tyre", 
                },
                {
                    event = "mz-scrap:client:Breakdown",
                    icon = 'fas fa-radio',
                    label = 'Disassemble Car Hood', 
                    rawMat = "hood", 
                    type = "client",
                    num = 3,
                },
                {
                    event = "mz-scrap:client:Breakdown",
                    icon = 'fas fa-times',
                    label = 'Breakdown Air Filter', 
                    rawMat = "filter", 
                    type = "client",
                    num = 4,
                },
                {
                    event = "mz-scrap:client:Breakdown",
                    icon = 'fas fa-door-closed',
                    label = 'Recycle Spark Plugs', 
                    rawMat = "spark", 
                    type = "client",
                    num = 5,
                },
                {
                    event = "mz-scrap:client:Breakdown",
                    icon = 'fas fa-car',
                    label = 'Strip car hood', 
                    rawMat = "spoiler", 
                    type = "client",
                    num = 6,
                },
                {
                    event = "mz-scrap:client:Breakdown",
                    icon = 'fas fa-people-carry',
                    label = 'Strip engine block', 
                    rawMat = "engine", 
                    type = "client",
                    num = 7,
                },
            },
            distance = 1.5,
        })
    else 
        print("your Config.TargetType has been set incorrect in config.lua. Pick between 'qb' or 'ox'.")
    end     
end)


---------
--TIRES--
---------

RegisterNetEvent('mz-scrap:client:Breakdown', function(data)
    local success = nil 
    if not craftcheck then 
        if Config.craftskillType == "pathfind" then 
            success = exports.bl_ui:PathFind(Config.craftingParses, {
                numberOfNodes = Config.craftingNodes,
                duration = Config.craftingDuration,
            })
        elseif Config.craftskillType == "untangle" then 
            success = exports.bl_ui:Untangle(Config.craftingParses, {
                numberOfNodes = Config.craftingNodes,
                duration = Config.craftingDuration,
            })
        elseif Config.craftskillType == "numslide" then 
            local iterations = Config.craftingParses
            local difficulty = Config.craftingDifficulty
            local numberOfKeys = Config.craftingKeys
            success = bl_ui:NumberSlide(iterations, difficulty, numberOfKeys)
        else 
            if Config.debug then 
                print("You have not set 'Config.skillType to a valid variable - use 'ps' or 'bl' to change skill check game")
            end
        end 
        if Config.debug then 
            print("Did player pass the skill-check? ", success)
        end
        if success then 
            if data.rawMat == "door" then 
                if QBCore.Functions.HasItem(Config.scrapitem1) then
                    rawMatType = "door" 
                    TriggerServerEvent("mz-scrap:server:Breakdown", RandomKey(),rawMatType)
                else
                    if Config.inventoryType == "qb" then 
                        local requiredItems = {
                            [1] = {name = QBCore.Shared.Items[Config.scrapitem1]["name"], image = QBCore.Shared.Items[Config.scrapitem1]["image"]}, 
                        }  
                        TriggerEvent('inventory:client:requiredItems', requiredItems, true)
                        Wait(3000)
                        TriggerEvent('inventory:client:requiredItems', requiredItems, false)
                    end 
                    if Config.NotifyType == 'qb' then
                        QBCore.Functions.Notify('You need '..Config.scrapitem1Label..".", "error", 3500)
                    elseif Config.NotifyType == "okok" then
                        exports['okokNotify']:Alert("NEED ITEM", 'You need '..Config.scrapitem1Label..".", 3500, "error")
                    end
                end 
            elseif data.rawMat == "tyre" then
                if QBCore.Functions.HasItem(Config.scrapitem2) then
                    rawMatType = "tyre"
                    TriggerServerEvent("mz-scrap:server:Breakdown", RandomKey(),rawMatType)
                else
                    if Config.inventoryType == "qb" then 
                        local requiredItems = {
                            [1] = {name = QBCore.Shared.Items[Config.scrapitem2]["name"], image = QBCore.Shared.Items[Config.scrapitem2]["image"]}, 
                        }  
                        TriggerEvent('inventory:client:requiredItems', requiredItems, true)
                        Wait(3000)
                        TriggerEvent('inventory:client:requiredItems', requiredItems, false)
                    end 
                    if Config.NotifyType == 'qb' then
                        QBCore.Functions.Notify('You need '..Config.scrapitem2Label..".", "error", 3500)
                    elseif Config.NotifyType == "okok" then
                        exports['okokNotify']:Alert("NEED ITEM", 'You need '..Config.scrapitem2Label..".", 3500, "error")
                    end  
                end  
            elseif data.rawMat == "hood" then
                if QBCore.Functions.HasItem(Config.scrapitem3) then
                    rawMatType = "hood"
                    TriggerServerEvent("mz-scrap:server:Breakdown", RandomKey(),rawMatType)
                else
                    if Config.inventoryType == "qb" then 
                        local requiredItems = {
                            [1] = {name = QBCore.Shared.Items[Config.scrapitem3]["name"], image = QBCore.Shared.Items[Config.scrapitem3]["image"]}, 
                        }  
                        TriggerEvent('inventory:client:requiredItems', requiredItems, true)
                        Wait(3000)
                        TriggerEvent('inventory:client:requiredItems', requiredItems, false)
                    end 
                    if Config.NotifyType == 'qb' then
                        QBCore.Functions.Notify('You need '..Config.scrapitem3Label..".", "error", 3500)
                    elseif Config.NotifyType == "okok" then
                        exports['okokNotify']:Alert("NEED ITEM", 'You need '..Config.scrapitem3Label..".", 3500, "error")
                    end  
                end  
            elseif data.rawMat == "filter" then
                if QBCore.Functions.HasItem(Config.scrapitem6) then
                    rawMatType = "filter"
                    TriggerServerEvent("mz-scrap:server:Breakdown", RandomKey(),rawMatType)
                else
                    if Config.inventoryType == "qb" then 
                        local requiredItems = {
                            [1] = {name = QBCore.Shared.Items[Config.scrapitem6]["name"], image = QBCore.Shared.Items[Config.scrapitem6]["image"]}, 
                        }  
                        TriggerEvent('inventory:client:requiredItems', requiredItems, true)
                        Wait(3000)
                        TriggerEvent('inventory:client:requiredItems', requiredItems, false)
                    end 
                    if Config.NotifyType == 'qb' then
                        QBCore.Functions.Notify('You need '..Config.scrapitem6Label..".", "error", 3500)
                    elseif Config.NotifyType == "okok" then
                        exports['okokNotify']:Alert("NEED ITEM", 'You need '..Config.scrapitem6Label..".", 3500, "error")
                    end  
                end  
            elseif data.rawMat == "spark" then
                if QBCore.Functions.HasItem(Config.scrapitem8) then
                    rawMatType = "spark"
                    TriggerServerEvent("mz-scrap:server:Breakdown", RandomKey(),rawMatType)
                else
                    if Config.inventoryType == "qb" then 
                        local requiredItems = {
                            [1] = {name = QBCore.Shared.Items[Config.scrapitem8]["name"], image = QBCore.Shared.Items[Config.scrapitem8]["image"]}, 
                        }  
                        TriggerEvent('inventory:client:requiredItems', requiredItems, true)
                        Wait(3000)
                        TriggerEvent('inventory:client:requiredItems', requiredItems, false)
                    end 
                    if Config.NotifyType == 'qb' then
                        QBCore.Functions.Notify('You need '..Config.scrapitem8Label..".", "error", 3500)
                    elseif Config.NotifyType == "okok" then
                        exports['okokNotify']:Alert("NEED ITEM", 'You need '..Config.scrapitem8Label..".", 3500, "error")
                    end  
                end  
            elseif data.rawMat == "spoiler" then
                if QBCore.Functions.HasItem(Config.scrapitem9) then
                    rawMatType = "spoiler"
                    TriggerServerEvent("mz-scrap:server:Breakdown", RandomKey(),rawMatType)
                else
                    if Config.inventoryType == "qb" then 
                        local requiredItems = {
                            [1] = {name = QBCore.Shared.Items[Config.scrapitem9]["name"], image = QBCore.Shared.Items[Config.scrapitem9]["image"]}, 
                        }  
                        TriggerEvent('inventory:client:requiredItems', requiredItems, true)
                        Wait(3000)
                        TriggerEvent('inventory:client:requiredItems', requiredItems, false)
                    end 
                    if Config.NotifyType == 'qb' then
                        QBCore.Functions.Notify('You need '..Config.scrapitem9Label..".", "error", 3500)
                    elseif Config.NotifyType == "okok" then
                        exports['okokNotify']:Alert("NEED ITEM", 'You need '..Config.scrapitem9Label..".", 3500, "error")
                    end  
                end  
            elseif data.rawMat == "engine" then
                if QBCore.Functions.HasItem(Config.scrapitem10) then
                    rawMatType = "engine"
                    TriggerServerEvent("mz-scrap:server:Breakdown", RandomKey(),rawMatType)
                else
                    if Config.inventoryType == "qb" then 
                        local requiredItems = {
                            [1] = {name = QBCore.Shared.Items[Config.scrapitem10]["name"], image = QBCore.Shared.Items[Config.scrapitem10]["image"]}, 
                        }  
                        TriggerEvent('inventory:client:requiredItems', requiredItems, true)
                        Wait(3000)
                        TriggerEvent('inventory:client:requiredItems', requiredItems, false)
                    end 
                    if Config.NotifyType == 'qb' then
                        QBCore.Functions.Notify('You need '..Config.scrapitem10Label..".", "error", 3500)
                    elseif Config.NotifyType == "okok" then
                        exports['okokNotify']:Alert("NEED ITEM", 'You need '..Config.scrapitem10Label..".", 3500, "error")
                    end  
                end  
            end
        else 
            if Config.NotifyType == 'qb' then
                QBCore.Functions.Notify('Your hand slipped... Whoops...', "error", 3500)
            elseif Config.NotifyType == "okok" then
                exports['okokNotify']:Alert("SLOW DOWN", 'Your hand slipped... Whoops...', 3500, "error")
            end 
            if data.rawMat == "door" then
                breakType = "door"
                TriggerServerEvent('mz-scrap:server:removeBreakdown', breakType)
            elseif data.rawMat == "tyre" then  
                breakType = "tyre"
                TriggerServerEvent('mz-scrap:server:removeBreakdown', breakType)
            elseif data.rawMat == "hood" then
                breakType = "hood"
                TriggerServerEvent('mz-scrap:server:removeBreakdown', breakType)
            elseif data.rawMat == "filter" then
                breakType = "filter"
                TriggerServerEvent('mz-scrap:server:removeBreakdown', breakType)
            elseif data.rawMat == "spoiler" then
                breakType = "spoiler"
                TriggerServerEvent('mz-scrap:server:removeBreakdown', breakType)
            elseif data.rawMat == "engine" then
                breakType = "engine"
                TriggerServerEvent('mz-scrap:server:removeBreakdown', breakType)
            end 
        end 
        success = nil 
        if Config.debug then 
            print("Did player pass the skill-check? ", success)
        end
    else 
        if Config.NotifyType == 'qb' then
            QBCore.Functions.Notify('You are already doing something...', "error", 3500)
        elseif Config.NotifyType == "okok" then
            exports['okokNotify']:Alert("SLOW DOWN", 'You are already doing something...', 3500, "error")
        end 
    end 
end)

-------------
--FUNCTIONS--
-------------


local loadcraft = true

CreateThread(function()
    Wait(100)
    while true do
        local sleep = 1000
        if percent then
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            for i = 1, #closestScrap do
                local x = GetClosestObjectOfType(playerCoords, 1.0, GetHashKey(closestScrap[i]), false, false, false)
                local entity = nil
                if DoesEntityExist(x) then
                    sleep = 5
                    entity = x
                    scrap = GetEntityCoords(entity)
                    DrawText3Ds(scrap.x, scrap.y, scrap.z + 1.5, TimeLeft .. '~g~%~s~')
                    break
                end
            end
        end
        Wait(sleep)
	end
end)

CreateThread(function()
    while true do
        Citizen.Wait(0)
        if searching then
            DisableControlAction(0, 73)
        end
    end
end)