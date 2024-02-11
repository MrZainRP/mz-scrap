QBCore = exports['qb-core']:GetCoreObject()

local ItemList = {
    ["oldtire"] = "oldtire",
    ["rustynails"] = "rustynails",
    ["wd40"] = "wd40",
    ["carradio"] = "carradio",
    ["carjack"] = "carjack",
    ["cardoor"] = "cardoor",
    ["carhood"] = "carhood",
    ["carengine"] = "carengine",
}

--------------------
-- TIER 1 EXTRACT --
--------------------

RegisterNetEvent('mz-scrap:server:ScrapReward', function(antiEx)
	local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    local luck2 = math.random(1, 20)
    if not antiEx then 
        if luck2 > 2 and luck2 < 21 then
            local luck = math.random(1, 100)
            local amount = math.random(1, 1)
            local src = source
            local Player = QBCore.Functions.GetPlayer(src)
            if luck > 0 and luck < 26 then
                Player.Functions.AddItem(QBCore.Shared.Items["rustynails"].name, amount)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["rustynails"], 'add', amount)   
            elseif luck > 25 and luck < 46 then
                Player.Functions.AddItem(QBCore.Shared.Items["oldtire"].name, amount)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["oldtire"], 'add', amount)
            elseif luck > 45 and luck < 66 then
                Player.Functions.AddItem(QBCore.Shared.Items["chewinggum"].name, amount)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["chewinggum"], 'add', amount)
            elseif luck > 65 and luck < 76 then
                Player.Functions.AddItem(QBCore.Shared.Items["carwipers"].name, amount)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["carwipers"], 'add', amount)
            elseif luck > 75 and luck < 86 then
                Player.Functions.AddItem(QBCore.Shared.Items["tissuebox"].name, amount)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["tissuebox"], 'add', amount)
            elseif luck > 85 and luck < 96 then
                Player.Functions.AddItem(QBCore.Shared.Items["fuelcap"].name, amount)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["fuelcap"], 'add', amount)
            elseif luck > 95 and luck < 100 then
                Player.Functions.AddItem(QBCore.Shared.Items["carjack"].name, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["carjack"], 'add')    
            elseif luck == 100 then
                Player.Functions.AddItem(QBCore.Shared.Items["pistol1"].name, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["pistol1"], 'add')      
            end
            Wait(100)
            if Config.NotifyType == 'qb' then
                TriggerClientEvent('QBCore:Notify', src, "You extracted some salvaged scrap!", 'success')
            elseif Config.NotifyType == "okok" then
                TriggerClientEvent('okokNotify:Alert', source, "ITEM FOUND!", "You extracted some salvaged scrap!", 3500, 'success')
            end
        else
            Wait(100)
            if Config.NotifyType == 'qb' then
                TriggerClientEvent('QBCore:Notify', src, "You did not manage to find anything useful.", 'success')
            elseif Config.NotifyType == "okok" then
                TriggerClientEvent('okokNotify:Alert', source, "NOTHING HERE...", "You did not manage to find anything useful.", 3500, 'error')
            end
        end
    else 
        cheaterDeal()
    end
end)


--------------------
-- TIER 2 EXTRACT --
--------------------

RegisterNetEvent('mz-scrap:server:ScrapReward2', function(antiEx)
	local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    local luck2 = math.random(1, 20)
    if not antiEx then 
        if luck2 > 2 and luck2 < 21 then
            local luck = math.random(1, 100)
            local amount = math.random(1, 1)
            local src = source
            local Player = QBCore.Functions.GetPlayer(src)
            if luck > 0 and luck < 26 then
                Player.Functions.AddItem(QBCore.Shared.Items["rustynails"].name, 2)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["rustynails"], 'add', 2)   
            elseif luck > 25 and luck < 51 then
                Player.Functions.AddItem(QBCore.Shared.Items["oldtire"].name, 2)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["oldtire"], 'add', 2)
            elseif luck > 50 and luck < 61 then
                Player.Functions.AddItem(QBCore.Shared.Items["carjack"].name, amount)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["carjack"], 'add', amount)
            elseif luck > 60 and luck < 71 then
                Player.Functions.AddItem(QBCore.Shared.Items["carbattery"].name, amount)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["carbattery"], 'add', amount)
            elseif luck > 70 and luck < 81 then
                Player.Functions.AddItem(QBCore.Shared.Items["gearshift"].name, amount)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["gearshift"], 'add', amount)
            elseif luck > 80 and luck < 91 then
                Player.Functions.AddItem(QBCore.Shared.Items["airfilter"].name, amount)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["airfilter"], 'add', amount)
            elseif luck > 90 and luck < 96 then
                Player.Functions.AddItem(QBCore.Shared.Items["carradio"].name, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["carradio"], 'add')
            elseif luck > 90 and luck < 96 then
                Player.Functions.AddItem(QBCore.Shared.Items["sparkplugs"].name, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["sparkplugs"], 'add')       
            elseif luck == 100 then
                Player.Functions.AddItem(QBCore.Shared.Items["pistol2"].name, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["pistol2"], 'add')      
            end
            if Config.NotifyType == 'qb' then
                TriggerClientEvent('QBCore:Notify', src, "You extracted some salvaged scrap!", 'success')
            elseif Config.NotifyType == "okok" then
                TriggerClientEvent('okokNotify:Alert', source, "ITEM FOUND!", "You extracted some salvaged scrap!", 3500, 'success')
            end
        else
            if Config.NotifyType == 'qb' then
                TriggerClientEvent('QBCore:Notify', src, "You did not manage to find anything useful.", 'success')
            elseif Config.NotifyType == "okok" then
                TriggerClientEvent('okokNotify:Alert', source, "NOTHING HERE...", "You did not manage to find anything useful.", 3500, 'error')
            end
        end
    else 
        cheaterDeal()
    end
end)

--------------------
-- TIER 3 EXTRACT --
--------------------

RegisterNetEvent('mz-scrap:server:ScrapReward3', function(antiEx)
	local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    local luck2 = math.random(1, 20)
    if not antiEx then 
        if luck2 > 2 and luck2 < 21 then
            local luck = math.random(1, 100)
            local amount = math.random(1, 1)
            local src = source
            local Player = QBCore.Functions.GetPlayer(src)
            if luck > 0 and luck <= 20 then
                Player.Functions.AddItem(QBCore.Shared.Items["carradio"].name, amount)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["carradio"], 'add', amount)   
            elseif luck > 21 and luck < 41 then
                Player.Functions.AddItem(QBCore.Shared.Items["sparkplugs"].name, amount)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["sparkplugs"], 'add', amount)
            elseif luck > 40 and luck < 56 then
                Player.Functions.AddItem(QBCore.Shared.Items["spoiler"].name, amount)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["spoiler"], 'add', amount)
            elseif luck > 55 and luck < 71 then
                Player.Functions.AddItem(QBCore.Shared.Items["cardoor"].name, amount)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["cardoor"], 'add', amount)
            elseif luck > 70 and luck < 81 then
                Player.Functions.AddItem(QBCore.Shared.Items["carhood"].name, amount)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["carhood"], 'add', amount)
            elseif luck > 80 and luck < 91 then
                Player.Functions.AddItem(QBCore.Shared.Items["cargrill"].name, amount)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["cargrill"], 'add', amount)
            elseif luck > 90 and luck < 95 then
                Player.Functions.AddItem(QBCore.Shared.Items["carrim"].name, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["carrim"], 'add')
            elseif luck > 94 and luck < 99 then
                Player.Functions.AddItem(QBCore.Shared.Items["carengine"].name, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["carengine"], 'add')
            elseif luck == 99 then
                Player.Functions.AddItem(QBCore.Shared.Items["pistol3"].name, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["pistol3"], 'add')           
            elseif luck == 100 then
                Player.Functions.AddItem(QBCore.Shared.Items["pistol4"].name, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["pistol4"], 'add')      
            end
            if Config.NotifyType == 'qb' then
                TriggerClientEvent('QBCore:Notify', src, "You extracted some salvaged scrap!", 'success')
            elseif Config.NotifyType == "okok" then
                TriggerClientEvent('okokNotify:Alert', source, "ITEM FOUND!", "You extracted some salvaged scrap!", 3500, 'success')
            end
        else
            if Config.NotifyType == 'qb' then
                TriggerClientEvent('QBCore:Notify', src, "You did not manage to find anything useful.", 'success')
            elseif Config.NotifyType == "okok" then
                TriggerClientEvent('okokNotify:Alert', source, "NOTHING HERE...", "You did not manage to find anything useful.", 3500, 'error')
            end
        end
    else 
        cheaterDeal()
    end
end)

-- RegisterServerEvent('mz-scrap:server:ScrapReward', function()
--     QBCore.Functions.BanInjection(source, 'mz-scrap:server:ScrapReward')
-- end)

------------------
--PARTS BREAKING--
------------------

RegisterServerEvent('mz-scrap:server:screwdriverbreak', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(Config.ScrewdriverRequiredItem, 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.ScrewdriverRequiredItem], "remove", 1)
end)
RegisterServerEvent('mz-scrap:server:blowtorchbreak', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(Config.BlowtorchRequiredItem, 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.BlowtorchRequiredItem], "remove", 1)
end)

-----------------------
--BREAK DOWN ELEMENTS--
-----------------------

---------
--TIRES--
---------

RegisterServerEvent('mz-scrap:server:BreakdownTires', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local oldtire = Player.Functions.GetItemByName('oldtire')
    if Player.PlayerData.items ~= nil then 
        if oldtire ~= nil then 
            if oldtire.amount >= Config.tiresneeded then 
                Player.Functions.RemoveItem("oldtire", Config.tiresneeded)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['oldtire'], "remove", Config.tiresneeded)
                TriggerClientEvent("mz-scrap:client:BreakdownTiresMinigame", src)
            else
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, "You do not have enough worn tires to process (Need "..Config.tiresneeded..")", 'error')
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', source, "NO TIRES?", "You do not have enough worn tires to process (Need "..Config.tiresneeded..")", 3500, 'error')
                end
            end
        end
    end
end)

RegisterServerEvent('mz-scrap:server:GetRubber', function(antiEx)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local amount = math.random(Config.Rubberoutputlow, Config.Rubberoutputhigh)
    if not antiEx then 
        Player.Functions.AddItem("rubber", amount)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['rubber'], "add", amount)
    else 
        cheaterDeal()
    end
end)

---------
--NAILS--
---------

RegisterServerEvent('mz-scrap:server:CleanNails', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rustynails = Player.Functions.GetItemByName('rustynails')
    if Player.PlayerData.items ~= nil then 
        if rustynails ~= nil then 
            if rustynails.amount >= Config.nailsneeded then 
                Player.Functions.RemoveItem("rustynails", Config.nailsneeded)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['rustynails'], "remove", Config.nailsneeded)
                TriggerClientEvent("mz-scrap:client:CleanNailsMinigame", src)
            else
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, "You need "..Config.nailsneeded.." Rusty Nails and 1x WD-40.", 'error')
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', source, "NEED MATERIALS", "You need "..Config.nailsneeded.." Rusty Nails and 1x WD-40.", 3500, 'error')
                end
            end
        end
    end
end)

RegisterServerEvent('mz-scrap:server:GetMetalscrap', function(antiEx)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local amount = math.random(Config.metaloutputlow, Config.metaloutputhigh)
    local chance = math.random(1, 100)
    if not antiEx then 
        Player.Functions.AddItem("metalscrap", amount)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['metalscrap'], "add", amount)
        Wait(3000)
        if chance < 20 then
            Player.Functions.RemoveItem("wd40", 1)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['wd40'], "remove", 1)
        end
    else 
        cheaterDeal()
    end
end)

---------
--RADIO--
---------

RegisterServerEvent('mz-scrap:server:ExtractRadio', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local carradio = Player.Functions.GetItemByName('carradio')
    if Player.PlayerData.items ~= nil then 
        if carradio ~= nil then 
            if carradio.amount >= Config.radiosneeded then 
                Player.Functions.RemoveItem("carradio", Config.radiosneeded)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['carradio'], "remove", Config.radiosneeded)
                TriggerClientEvent("mz-scrap:client:BreakRadioMinigame", src)
            else
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, "You need "..Config.radiosneeded.." car radios to start work", 'error')
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', source, "NEED RADIOS", "You need "..Config.radiosneeded.." car radios to start work", 3500, 'error')
                end
            end
        end
    end
end)

RegisterServerEvent('mz-scrap:server:GetElectricscrap', function(antiEx)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local amount = math.random(Config.elecoutputlow, Config.elecoutputhigh)
    if not antiEx then 
        Player.Functions.AddItem("electronicscrap", amount)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['electronicscrap'], "add", amount)
    else 
        cheaterDeal()
    end
end)

------------
--CAR JACK--
------------

RegisterServerEvent('mz-scrap:server:BreakdownCarjack', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local carjack = Player.Functions.GetItemByName('carjack')
    if Player.PlayerData.items ~= nil then 
        if carjack ~= nil then 
            if carjack.amount >= Config.jacksneeded then 
                Player.Functions.RemoveItem("carjack", Config.jacksneeded)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['carjack'], "remove", Config.jacksneeded)
                TriggerClientEvent("mz-scrap:client:BreakCarjackMinigame", src)
            else
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, "You need "..Config.jacksneeded.." car jacks to start work", 'error')
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', source, "NEED JACKS", "You need "..Config.jacksneeded.." car jacks to start work", 3500, 'error')
                end
            end
        end
    end
end)

RegisterServerEvent('mz-scrap:server:GetMetals', function(antiEx)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local amount = math.random(Config.jacksmetaloutputlow, Config.jacksmetaloutputhigh)
    if not antiEx then 
        Player.Functions.AddItem("metalscrap", amount)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['metalscrap'], "add", amount)
    else 
        cheaterDeal()
    end
end)

RegisterServerEvent('mz-scrap:server:GetMetals2', function(antiEx)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local amount = math.random(Config.jackssteeloutputlow, Config.jackssteeloutputlow)
    if not antiEx then 
        Player.Functions.AddItem("steel", amount)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['steel'], "add", amount)
    else 
        cheaterDeal()
    end
end)

------------
--CAR DOOR--
------------

RegisterServerEvent('mz-scrap:server:BreakdownCardoor', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cardoor = Player.Functions.GetItemByName('cardoor')
    if Player.PlayerData.items ~= nil then 
        if cardoor ~= nil then 
            if cardoor.amount >= Config.doorsneeded then 
                Player.Functions.RemoveItem("cardoor", Config.doorsneeded)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cardoor'], "remove", Config.doorsneeded)
                TriggerClientEvent("mz-scrap:client:BreakCardoorMinigame", src)
            else
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, "You need "..Config.doorsneeded.." car doors to start work.", 'error')
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', source, "NEED DOORS", "You need "..Config.doorsneeded.." car doors to start work.", 3500, 'error')
                end    
            end
        end
    end
end)

RegisterServerEvent('mz-scrap:server:GetCardoormats', function(antiEx)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local amount = math.random(Config.doorglasslow , Config.doorglasshigh)
    if not antiEx then 
        Player.Functions.AddItem("glass", amount)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['glass'], "add", amount)
    else 
        cheaterDeal()
    end
end)

RegisterServerEvent('mz-scrap:server:GetCardoormats2', function(antiEx)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local amount = math.random(Config.doorironlow, Config.doorironhigh)
    if not antiEx then 
        Player.Functions.AddItem("iron", amount)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['iron'], "add", amount)
    else 
        cheaterDeal()
    end
end)

------------
--CAR HOOD--
------------

RegisterServerEvent('mz-scrap:server:BreakdownCarhood', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local carhood = Player.Functions.GetItemByName('carhood')
    if Player.PlayerData.items ~= nil then 
        if carhood ~= nil then 
            if carhood.amount >= Config.hoodneeded then 
                Player.Functions.RemoveItem("carhood", Config.hoodneeded)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['carhood'], "remove", Config.hoodneeded)
                TriggerClientEvent("mz-scrap:client:BreakCarhoodMinigame", src)
            else
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, "You need "..Config.hoodneeded.." car hoods to start work.", 'error')
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', source, "NEED HOODS", "You need "..Config.hoodneeded.." car hoods to start work.", 3500, 'error')
                end   
            end
        end
    end
end)

RegisterServerEvent('mz-scrap:server:GetCarhoodmats', function(antiEx)
    local Player = QBCore.Functions.GetPlayer(source)
    local amount = math.random(Config.hoodscraplow, Config.hoodscraphigh)
    if not antiEx then 
        Player.Functions.AddItem("metalscrap", amount)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['metalscrap'], "add", amount)
    else 
        cheaterDeal()
    end
end)

RegisterServerEvent('mz-scrap:server:GetCarhoodmats2', function(antiEx)
    local Player = QBCore.Functions.GetPlayer(source)
    local amount2 = math.random(Config.hoodcopperlow, Config.hoodcopperhigh)
    if not antiEx then 
        Player.Functions.AddItem("copper", amount2)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['copper'], "add", amount2)
    else 
        cheaterDeal()
    end
end)

--------------
--CAR ENGINE--
--------------

RegisterServerEvent('mz-scrap:server:BreakdownCarengine', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local carengine = Player.Functions.GetItemByName('carengine')
    if Player.PlayerData.items ~= nil then 
        if carengine ~= nil then 
            if carengine.amount >= Config.engineneeded then 
                Player.Functions.RemoveItem("carengine", Config.engineneeded)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['carengine'], "remove", Config.engineneeded)
                TriggerClientEvent("mz-scrap:client:BreakCarengineMinigame", src)
            else
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, "You need an engine bloc to start work.", 'error')
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', source, "NEED ENGINE", "You need an engine bloc to start work.", 3500, 'error')
                end 
            end
        end
    end
end)

RegisterServerEvent('mz-scrap:server:GetCarenginemats', function(antiEx)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local amount = math.random(Config.engineironlow, Config.engineironhigh)
    if not antiEx then 
        Player.Functions.AddItem("iron", amount)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['iron'], "add", amount)
    else 
        cheaterDeal()
    end
end)

RegisterServerEvent('mz-scrap:server:GetCarenginemats2', function(antiEx)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local amount2 = math.random(Config.enginecopperlow, Config.enginecopperhigh)
    if not antiEx then 
        Player.Functions.AddItem("copper", amount2)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['copper'], "add", amount2)
    else 
        cheaterDeal()
    end
end)

RegisterServerEvent('mz-scrap:server:GetCarenginemats3', function(antiEx)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local amount3 = math.random(Config.enginesteellow, Config.enginesteelhigh)
    if not antiEx then 
        Player.Functions.AddItem("steel", amount3)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['steel'], "add", amount3)
    else 
        cheaterDeal()
    end
end)

RegisterServerEvent('mz-scrap:server:GetCarenginemats4', function(antiEx)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local amount4 = math.random(Config.enginescraplow, Config.enginescraphigh)
    if not antiEx then 
        Player.Functions.AddItem("metalscrap", amount4)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['metalscrap'], "add", amount4)
    else 
        cheaterDeal()
    end
end)

----------
--TRADER--
----------

RegisterNetEvent("mz-scrap:server:sellPawnItems", function(itemName, itemAmount, itemPrice)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local totalPrice = (tonumber(itemAmount) * itemPrice)
    if Player.Functions.RemoveItem(itemName, tonumber(itemAmount)) then
        Player.Functions.AddMoney("cash", totalPrice)
        TriggerClientEvent("QBCore:Notify", src, Lang:t('success.sold', {value = tonumber(itemAmount), value2 = QBCore.Shared.Items[itemName].label, value3 = totalPrice}), 'success')
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[itemName], 'remove')
    else
        TriggerClientEvent("QBCore:Notify", src, Lang:t('error.no_items'), "error")
    end
end)

QBCore.Functions.CreateCallback('mz-scrap:server:getInv', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local inventory = Player.PlayerData.items
    return cb(inventory)
end)

function cheaterDeal()
    local user = GetPlayerName(source)
    DropPlayer(source,'Nice try cheater.')
end
