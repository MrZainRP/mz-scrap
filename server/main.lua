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

QBCore.Functions.CreateCallback('mz-scrap:server:ScrapReward', function(source, cb)
	local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    local luck2 = math.random(1, 20)
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
end)


--------------------
-- TIER 2 EXTRACT --
--------------------

QBCore.Functions.CreateCallback('mz-scrap:server:ScrapReward2', function(source, cb)
	local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    local luck2 = math.random(1, 20)
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
end)

--------------------
-- TIER 3 EXTRACT --
--------------------

QBCore.Functions.CreateCallback('mz-scrap:server:ScrapReward3', function(source, cb)
	local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    local luck2 = math.random(1, 20)
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
end)

RegisterServerEvent('mz-scrap:server:ScrapReward')
AddEventHandler('mz-scrap:server:ScrapReward', function()
    QBCore.Functions.BanInjection(source, 'mz-scrap:server:ScrapReward')
end)

-----------------------
--BREAK DOWN ELEMENTS--
-----------------------

---------
--TIRES--
---------

RegisterServerEvent('mz-scrap:server:BreakdownTires')
AddEventHandler('mz-scrap:server:BreakdownTires', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local oldtire = Player.Functions.GetItemByName('oldtire')
    if Player.PlayerData.items ~= nil then 
        if oldtire ~= nil then 
            if oldtire.amount >= 5 then 
                Player.Functions.RemoveItem("oldtire", 5)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['oldtire'], "remove", 5)
                TriggerClientEvent("mz-scrap:client:BreakdownTiresMinigame", src)
            else
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, "You do not have enough worn tires to process", 'error')
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', source, "NO TIRES?", "You do not have enough worn tires to process", 3500, 'error')
                end
            end
        end
    end
end)

RegisterServerEvent('mz-scrap:server:GetRubber')
AddEventHandler('mz-scrap:server:GetRubber', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local amount = math.random(18, 22)
    Player.Functions.AddItem("rubber", amount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['rubber'], "add", amount)
end)

---------
--NAILS--
---------

RegisterServerEvent('mz-scrap:server:CleanNails')
AddEventHandler('mz-scrap:server:CleanNails', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rustynails = Player.Functions.GetItemByName('rustynails')
    if Player.PlayerData.items ~= nil then 
        if rustynails ~= nil then 
            if rustynails.amount >= 5 then 
                Player.Functions.RemoveItem("rustynails", 5)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['rustynails'], "remove", 5)
                TriggerClientEvent("mz-scrap:client:CleanNailsMinigame", src)
            else
            if Config.NotifyType == 'qb' then
                TriggerClientEvent('QBCore:Notify', src, "You need 5x Rusty Nails and 1x WD-40.", 'error')
            elseif Config.NotifyType == "okok" then
                TriggerClientEvent('okokNotify:Alert', source, "NEED MATERIALS", "You need 5x Rusty Nails and 1x WD-40.", 3500, 'error')
            end
            end
        end
    end
end)

RegisterServerEvent('mz-scrap:server:GetMetalscrap')
AddEventHandler('mz-scrap:server:GetMetalscrap', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local amount = math.random(18, 22)
    local chance = math.random(1, 100)
    Player.Functions.AddItem("metalscrap", amount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['metalscrap'], "add", amount)
    Wait(3000)
    if chance < 20 then
        Player.Functions.RemoveItem("wd40", 1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['wd40'], "remove", 1)
    end
end)

---------
--RADIO--
---------

RegisterServerEvent('mz-scrap:server:ExtractRadio')
AddEventHandler('mz-scrap:server:ExtractRadio', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local carradio = Player.Functions.GetItemByName('carradio')
    if Player.PlayerData.items ~= nil then 
        if carradio ~= nil then 
            if carradio.amount >= 3 then 
                Player.Functions.RemoveItem("carradio", 3)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['carradio'], "remove", 3)
                TriggerClientEvent("mz-scrap:client:BreakRadioMinigame", src)
            else
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, "You need 3x car radios to start work", 'error')
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', source, "NEED RADIOS", "You need 3x car radios to start work.", 3500, 'error')
                end
            end
        end
    end
end)

RegisterServerEvent('mz-scrap:server:GetElectricscrap')
AddEventHandler('mz-scrap:server:GetElectricscrap', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local amount = math.random(7, 11)
    Player.Functions.AddItem("electronicscrap", amount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['electronicscrap'], "add", amount)
end)

------------
--CAR JACK--
------------

RegisterServerEvent('mz-scrap:server:BreakdownCarjack')
AddEventHandler('mz-scrap:server:BreakdownCarjack', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local carjack = Player.Functions.GetItemByName('carjack')
    if Player.PlayerData.items ~= nil then 
        if carjack ~= nil then 
            if carjack.amount >= 3 then 
                Player.Functions.RemoveItem("carjack", 3)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['carjack'], "remove", 3)
                TriggerClientEvent("mz-scrap:client:BreakCarjackMinigame", src)
            else
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, "You need 3x car jacks to start work", 'error')
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', source, "NEED JACKS", "You need 3x car jacks to start work.", 3500, 'error')
                end
            end
        end
    end
end)

RegisterServerEvent('mz-scrap:server:GetMetals')
AddEventHandler('mz-scrap:server:GetMetals', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local amount = math.random(6, 9)
    Player.Functions.AddItem("metalscrap", amount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['metalscrap'], "add", amount)
end)

RegisterServerEvent('mz-scrap:server:GetMetals2')
AddEventHandler('mz-scrap:server:GetMetals2', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local amount = math.random(3, 6)
    Player.Functions.AddItem("steel", amount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['steel'], "add", amount)
end)

------------
--CAR DOOR--
------------

RegisterServerEvent('mz-scrap:server:BreakdownCardoor')
AddEventHandler('mz-scrap:server:BreakdownCardoor', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cardoor = Player.Functions.GetItemByName('cardoor')
    if Player.PlayerData.items ~= nil then 
        if cardoor ~= nil then 
            if cardoor.amount >= 3 then 
                Player.Functions.RemoveItem("cardoor", 3)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cardoor'], "remove", 3)
                TriggerClientEvent("mz-scrap:client:BreakCardoorMinigame", src)
            else
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, "You need 3x car doors to start work.", 'error')
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', source, "NEED DOORS", "You need 3x car doors to start work.", 3500, 'error')
                end    
            end
        end
    end
end)

RegisterServerEvent('mz-scrap:server:GetCardoormats')
AddEventHandler('mz-scrap:server:GetCardoormats', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local amount = math.random(5, 15)
    Player.Functions.AddItem("glass", amount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['glass'], "add", amount)
end)

RegisterServerEvent('mz-scrap:server:GetCardoormats2')
AddEventHandler('mz-scrap:server:GetCardoormats2', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local amount = math.random(3, 6)
    Player.Functions.AddItem("iron", amount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['iron'], "add", amount)
end)

------------
--CAR HOOD--
------------

RegisterServerEvent('mz-scrap:server:BreakdownCarhood')
AddEventHandler('mz-scrap:server:BreakdownCarhood', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local carhood = Player.Functions.GetItemByName('carhood')
    if Player.PlayerData.items ~= nil then 
        if carhood ~= nil then 
            if carhood.amount >= 3 then 
                Player.Functions.RemoveItem("carhood", 3)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['carhood'], "remove", 3)
                TriggerClientEvent("mz-scrap:client:BreakCarhoodMinigame", src)
            else
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, "You need 3x car hoods to start work.", 'error')
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', source, "NEED HOODS", "You need 3x car hoods to start work.", 3500, 'error')
                end   
            end
        end
    end
end)

RegisterServerEvent('mz-scrap:server:GetCarhoodmats')
AddEventHandler('mz-scrap:server:GetCarhoodmats', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local amount = math.random(5, 15)
    Player.Functions.AddItem("metalscrap", amount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['metalscrap'], "add", amount)
end)

RegisterServerEvent('mz-scrap:server:GetCarhoodmats2')
AddEventHandler('mz-scrap:server:GetCarhoodmats2', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local amount2 = math.random(3, 6)
    Player.Functions.AddItem("copper", amount2)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['copper'], "add", amount2)
end)

--------------
--CAR ENGINE--
--------------

RegisterServerEvent('mz-scrap:server:BreakdownCarengine')
AddEventHandler('mz-scrap:server:BreakdownCarengine', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local carengine = Player.Functions.GetItemByName('carengine')
    if Player.PlayerData.items ~= nil then 
        if carengine ~= nil then 
            if carengine.amount >= 3 then 
                Player.Functions.RemoveItem("carengine", 1)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['carengine'], "remove", 1)
                TriggerClientEvent("mz-scrap:client:BreakCarengineMinigame", src)
            else
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, "You need an engine block to start work.", 'error')
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', source, "NEED ENGINE", "You need an engine block to start work.", 3500, 'error')
                end 
            end
        end
    end
end)

RegisterServerEvent('mz-scrap:server:GetCarenginemats')
AddEventHandler('mz-scrap:server:GetCarenginemats', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local amount = math.random(3, 6)
    Player.Functions.AddItem("iron", amount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['iron'], "add", amount)
end)

RegisterServerEvent('mz-scrap:server:GetCarenginemats2')
AddEventHandler('mz-scrap:server:GetCarenginemats2', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local amount2 = math.random(4, 8)
    Player.Functions.AddItem("copper", amount2)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['copper'], "add", amount2)
end)

RegisterServerEvent('mz-scrap:server:GetCarenginemats3')
AddEventHandler('mz-scrap:server:GetCarenginemats3', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local amount3 = math.random(5, 10)
    Player.Functions.AddItem("steel", amount3)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['steel'], "add", amount3)
end)

RegisterServerEvent('mz-scrap:server:GetCarenginemats4')
AddEventHandler('mz-scrap:server:GetCarenginemats4', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local amount4 = math.random(7, 12)
    Player.Functions.AddItem("metalscrap", amount4)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['metalscrap'], "add", amount4)
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