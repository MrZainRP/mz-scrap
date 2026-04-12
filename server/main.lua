QBCore = exports['qb-core']:GetCoreObject()

--------------------
-- TIER 1 EXTRACT --
--------------------

RegisterNetEvent('mz-scrap:server:ScrapReward', function(ClientKey, scrapAmt)
    local StoredKey = 0
    StoredKey = ClientKey 
    if Config.debug then 
        print("Player triggered ScrapReward - Hands reward event")
        print("Player level = ", scrapAmt)
    end
    if ClientKey == StoredKey then
        local itemAmt = 1
            local amtMulti = math.random(1, 100)
            if scrapAmt == 10 then 
                if amtMulti < 90 then 
                    itemAmt = math.random(2, 3)
                end 
            elseif scrapAmt == 9 then 
                if amtMulti < 80 then 
                    itemAmt = math.random(2, 3)
                end 
            elseif scrapAmt == 8 then
                if amtMulti < 70 then 
                    itemAmt = math.random(2, 3)
                end 
            elseif scrapAmt == 7 then
                if amtMulti < 60 then 
                    itemAmt = math.random(2, 3)
                end 
            elseif scrapAmt == 6 then
                if amtMulti < 50 then 
                    itemAmt = 2
                end 
            elseif scrapAmt == 5 then
                if amtMulti < 40 then 
                    itemAmt = 2
                end 
            elseif scrapAmt == 4 then
                if amtMulti < 30 then 
                    itemAmt = 2
                end 
            elseif scrapAmt == 3 then
                if amtMulti < 25 then 
                    itemAmt = 2
                end 
            elseif scrapAmt == 2 then
                if amtMulti < 20 then 
                    itemAmt = 2
                end 
            elseif scrapAmt == 1 then
                if amtMulti < 15 then 
                    itemAmt = 2
                end 
            elseif scrapAmt == 0 then
                if amtMulti < 10 then 
                    itemAmt = 2
                end 
            elseif scrapAmt == 000 then
                if amtMulti < Config.chanceforMultiNOXP then 
                    itemAmt = 2
                end 
            end 
            local luck2 = Config.nofindChance
            if math.random(1,100) > Config.nofindChance then
                local itemName = "plastic"
                local itemLabel = "Plastic"
                local luck = math.random(1, 100)
                local item1 = Config.hands1prob
                local item2 = item1 + Config.hands2prob
                local item3 = item2 + Config.hands3prob
                local item4 = item3 + Config.hands4prob
                local item5 = item4 + Config.hands5prob
                local item6 = item5 + Config.hands6prob
                local item7 = item6 + Config.hands7prob
                local item8 = item7 + Config.hands8prob
                local item9 = item8 + Config.hands9prob
                local item10 = item9 + Config.hands10prob
                if luck <= item1 then
                    itemName = Config.scrapitem1
                    itemLabel = Config.scrapitem1Label 
                elseif luck <= item2 then
                    itemName = Config.scrapitem2
                    itemLabel = Config.scrapitem2Label 
                elseif luck <= item3 then
                    itemName = Config.scrapitem3
                    itemLabel = Config.scrapitem3Label 
                elseif luck <= item4 then
                    itemName = Config.scrapitem4 
                    itemLabel = Config.scrapitem4Label 
                elseif luck <= item5 then
                    itemName = Config.scrapitem5
                    itemLabel = Config.scrapitem5Label 
                elseif luck <= item6 then
                    itemName = Config.scrapitem6
                    itemLabel = Config.scrapitem6Label 
                elseif luck <= item7 then
                    itemName = Config.scrapitem7
                    itemLabel = Config.scrapitem7Label 
                elseif luck <= item8 then
                    itemName = Config.scrapitem8
                    itemLabel = Config.scrapitem8Label 
                elseif luck <= item9 then
                    itemName = Config.scrapitem9
                    itemLabel = Config.scrapitem9Label 
                elseif luck <= item10 then
                    itemName = Config.scrapitem10
                    itemLabel = Config.scrapitem10Label 
                end            
                local src = source
                local Player = QBCore.Functions.GetPlayer(src)
                if Config.inventoryType == "qb" then 
                    Player.Functions.AddItem(itemName, itemAmt)
                    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[itemName], "add", itemAmt)
                elseif Config.inventoryType == "ox" then 
                    exports.ox_inventory:AddItem(src, itemName, itemAmt)
                else 
                    print("Your Config.inventoryType needs to be set to 'qb' or 'ox' in order to function. If you use a custom inventory, try both of these options to see if either are compatible.")
                end
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, "You extracted "..itemAmt.."x "..itemLabel.."!", 'success')
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', src, "ITEM FOUND", "You extracted "..itemAmt.."x "..itemLabel.."!", 3500, 'success')
                end
            else
                if Config.NotifyType == 'qb' then
                    TriggerClientEvent('QBCore:Notify', src, "You did not manage to find anything useful.", 'success')
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', src, "NOTHING HERE", "You did not manage to find anything useful.", 3500, 'error')
                end
            end
    else 
        print("Cheater tried to trigger output externally - and failed.")
    end 
end)

--------------------
-- TIER 2 EXTRACT --
--------------------

RegisterNetEvent('mz-scrap:server:ScrapReward2', function(ClientKey, scrapAmt)
    if Config.debug then 
        print("Player triggered ScrapReward2 - Screwdriver rewards event")
        print("Player level = ", scrapAmt)
    end
    local StoredKey = 0
    StoredKey = ClientKey 
    if ClientKey == StoredKey then
        local amtMulti = math.random(1, 100)
        if scrapAmt == 10 then 
            if amtMulti < 90 then 
                itemAmt = math.random(2, 3)
            end 
        elseif scrapAmt == 9 then 
            if amtMulti < 80 then 
                itemAmt = math.random(2, 3)
            end 
        elseif scrapAmt == 8 then
            if amtMulti < 70 then 
                itemAmt = math.random(2, 3)
            end 
        elseif scrapAmt == 7 then
            if amtMulti < 60 then 
                itemAmt = math.random(2, 3)
            end 
        elseif scrapAmt == 6 then
            if amtMulti < 50 then 
                itemAmt = 2
            end 
        elseif scrapAmt == 5 then
            if amtMulti < 40 then 
                itemAmt = 2
            end 
        elseif scrapAmt == 4 then
            if amtMulti < 30 then 
                itemAmt = 2
            end 
        elseif scrapAmt == 3 then
            if amtMulti < 25 then 
                itemAmt = 2
            end 
        elseif scrapAmt == 2 then
            if amtMulti < 20 then 
                itemAmt = 2
            end 
        elseif scrapAmt == 1 then
            if amtMulti < 15 then 
                itemAmt = 2
            end 
        elseif scrapAmt == 0 then
            if amtMulti < 10 then 
                itemAmt = 2
            end 
        elseif scrapAmt == 000 then
            if amtMulti < Config.chanceforMultiNOXP then 
                itemAmt = 2
            end 
        end 
        local luck2 = Config.nofindChance
        if math.random(1,100) > Config.nofindChance then
            local itemName = "plastic"
            local itemLabel = "Plastic"
            local luck = math.random(1, 100)
            local item1 = Config.screw1prob
            local item2 = item1 + Config.screw2prob
            local item3 = item2 + Config.screw3prob
            local item4 = item3 + Config.screw4prob
            local item5 = item4 + Config.screw5prob
            local item6 = item5 + Config.screw6prob
            local item7 = item6 + Config.screw7prob
            local item8 = item7 + Config.screw8prob
            local item9 = item8 + Config.screw9prob
            local item10 = item9 + Config.screw10prob
            if luck <= item1 then
                itemName = Config.scrapitem1
                itemLabel = Config.scrapitem1Label 
            elseif luck <= item2 then
                itemName = Config.scrapitem2
                itemLabel = Config.scrapitem2Label 
            elseif luck <= item3 then
                itemName = Config.scrapitem3
                itemLabel = Config.scrapitem3Label 
            elseif luck <= item4 then
                itemName = Config.scrapitem4 
                itemLabel = Config.scrapitem4Label 
            elseif luck <= item5 then
                itemName = Config.scrapitem5
                itemLabel = Config.scrapitem5Label 
            elseif luck <= item6 then
                itemName = Config.scrapitem6
                itemLabel = Config.scrapitem6Label 
            elseif luck <= item7 then
                itemName = Config.scrapitem7
                itemLabel = Config.scrapitem7Label 
            elseif luck <= item8 then
                itemName = Config.scrapitem8
                itemLabel = Config.scrapitem8Label 
            elseif luck <= item9 then
                itemName = Config.scrapitem9
                itemLabel = Config.scrapitem9Label 
            elseif luck <= item10 then
                itemName = Config.scrapitem10
                itemLabel = Config.scrapitem10Label 
            end            
            local src = source
            local Player = QBCore.Functions.GetPlayer(src)
            if Config.inventoryType == "qb" then 
                Player.Functions.AddItem(itemName, itemAmt)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[itemName], "add", itemAmt)
            elseif Config.inventoryType == "ox" then 
                exports.ox_inventory:AddItem(src, itemName, itemAmt)
            else 
                print("Your Config.inventoryType needs to be set to 'qb' or 'ox' in order to function. If you use a custom inventory, try both of these options to see if either are compatible.")
            end
            if Config.NotifyType == 'qb' then
                TriggerClientEvent('QBCore:Notify', src, "You extracted "..itemAmt.."x "..itemLabel.."!", 'success')
            elseif Config.NotifyType == "okok" then
                TriggerClientEvent('okokNotify:Alert', src, "ITEM FOUND", "You extracted "..itemAmt.."x "..itemLabel.."!", 3500, 'success')
            end
        else
            if Config.NotifyType == 'qb' then
                TriggerClientEvent('QBCore:Notify', src, "You did not manage to find anything useful.", 'success')
            elseif Config.NotifyType == "okok" then
                TriggerClientEvent('okokNotify:Alert', src, "NOTHING HERE", "You did not manage to find anything useful.", 3500, 'error')
            end
        end
    else 
        print("Player is cheating - set up log and ban event here")
    end 
end)

--------------------
-- TIER 3 EXTRACT --
--------------------

RegisterNetEvent('mz-scrap:server:ScrapReward3', function(ClientKey, scrapAmt)
    if Config.debug then 
        print("Player triggered ScrapReward3 - Blowtorch rewards event")
        print("Player level = ", scrapAmt)
    end
    local StoredKey = 0
    StoredKey = ClientKey 
    if ClientKey == StoredKey then
        local amtMulti = math.random(1, 100)
        if scrapAmt == 10 then 
            if amtMulti < 90 then 
                itemAmt = math.random(2, 3)
            end 
        elseif scrapAmt == 9 then 
            if amtMulti < 80 then 
                itemAmt = math.random(2, 3)
            end 
        elseif scrapAmt == 8 then
            if amtMulti < 70 then 
                itemAmt = math.random(2, 3)
            end 
        elseif scrapAmt == 7 then
            if amtMulti < 60 then 
                itemAmt = math.random(2, 3)
            end 
        elseif scrapAmt == 6 then
            if amtMulti < 50 then 
                itemAmt = 2
            end 
        elseif scrapAmt == 5 then
            if amtMulti < 40 then 
                itemAmt = 2
            end 
        elseif scrapAmt == 4 then
            if amtMulti < 30 then 
                itemAmt = 2
            end 
        elseif scrapAmt == 3 then
            if amtMulti < 25 then 
                itemAmt = 2
            end 
        elseif scrapAmt == 2 then
            if amtMulti < 20 then 
                itemAmt = 2
            end 
        elseif scrapAmt == 1 then
            if amtMulti < 15 then 
                itemAmt = 2
            end 
        elseif scrapAmt == 0 then
            if amtMulti < 10 then 
                itemAmt = 2
            end 
        elseif scrapAmt == 000 then
            if amtMulti < Config.chanceforMultiNOXP then 
                itemAmt = 2
            end 
        end 
        if Config.debug then 
            print("Item Amount player will receive based on mz-skill level (if enabled): ", itemAmt)
        end
        local luck2 = Config.nofindChance
        if math.random(1,100) > Config.nofindChance then
            local itemName = "plastic"
            local itemLabel = "Plastic"
            local luck = math.random(1, 100)
            local item1 = Config.torch1prob
            local item2 = item1 + Config.torch2prob
            local item3 = item2 + Config.torch3prob
            local item4 = item3 + Config.torch4prob
            local item5 = item4 + Config.torch5prob
            local item6 = item5 + Config.torch6prob
            local item7 = item6 + Config.torch7prob
            local item8 = item7 + Config.torch8prob
            local item9 = item8 + Config.torch9prob
            local item10 = item9 + Config.torch10prob
            if luck <= item1 then
                itemName = Config.scrapitem1
                itemLabel = Config.scrapitem1Label 
            elseif luck <= item2 then
                itemName = Config.scrapitem2
                itemLabel = Config.scrapitem2Label 
            elseif luck <= item3 then
                itemName = Config.scrapitem3
                itemLabel = Config.scrapitem3Label 
            elseif luck <= item4 then
                itemName = Config.scrapitem4 
                itemLabel = Config.scrapitem4Label 
            elseif luck <= item5 then
                itemName = Config.scrapitem5
                itemLabel = Config.scrapitem5Label 
            elseif luck <= item6 then
                itemName = Config.scrapitem6
                itemLabel = Config.scrapitem6Label 
            elseif luck <= item7 then
                itemName = Config.scrapitem7
                itemLabel = Config.scrapitem7Label 
            elseif luck <= item8 then
                itemName = Config.scrapitem8
                itemLabel = Config.scrapitem8Label 
            elseif luck <= item9 then
                itemName = Config.scrapitem9
                itemLabel = Config.scrapitem9Label 
            elseif luck <= item10 then
                itemName = Config.scrapitem10
                itemLabel = Config.scrapitem10Label 
            end            
            local src = source
            local Player = QBCore.Functions.GetPlayer(src)
            if Config.debug then 
                print("Item that the player will receive ", itemName)
                print("Item label of the relevant item (for use with notifications and logs): ", itemLabel)
            end
            if Config.inventoryType == "qb" then 
                Player.Functions.AddItem(itemName, itemAmt)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[itemName], "add", itemAmt)
            elseif Config.inventoryType == "ox" then 
                exports.ox_inventory:AddItem(src, itemName, itemAmt)
            else 
                print("Your Config.inventoryType needs to be set to 'qb' or 'ox' in order to function. If you use a custom inventory, try both of these options to see if either are compatible.")
            end
            if Config.NotifyType == 'qb' then
                TriggerClientEvent('QBCore:Notify', src, "You extracted "..itemAmt.."x "..itemLabel.."!", 'success')
            elseif Config.NotifyType == "okok" then
                TriggerClientEvent('okokNotify:Alert', src, "ITEM FOUND", "You extracted "..itemAmt.."x "..itemLabel.."!", 3500, 'success')
            end
        else
            if Config.NotifyType == 'qb' then
                TriggerClientEvent('QBCore:Notify', src, "You did not manage to find anything useful.", 'success')
            elseif Config.NotifyType == "okok" then
                TriggerClientEvent('okokNotify:Alert', src, "NOTHING HERE", "You did not manage to find anything useful.", 3500, 'error')
            end
        end
    else 
        cheaterDeal()
    end
end)

-- RegisterServerEvent('mz-scrap:server:ScrapReward', function()
--     QBCore.Functions.BanInjection(source, 'mz-scrap:server:ScrapReward')
-- end)

-------------------
--CRAFTING EVENTS--
-------------------

RegisterServerEvent('mz-scrap:server:Breakdown', function(ClientKey, rawMatType)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local StoredKey = 0
    StoredKey = ClientKey 
    if ClientKey == StoredKey then
        if rawMatType == "door" then 
            local itemReq = exports.ox_inventory:GetItemCount(src, Config.scrapitem1)
            if itemReq >= Config.scrapitem1req then 
                local outputAmt = math.random(Config.ScrapCraft1Low, Config.ScrapCraft1High)
                exports.ox_inventory:AddItem(src, Config.ScrapCraft1Item, outputAmt)
                exports.ox_inventory:RemoveItem(src, Config.scrapitem1, Config.scrapitem1req)
                if Config.NotifyType == "qb" then 
                    TriggerClientEvent('QBCore:Notify', src, "You received "..outputAmt.."x "..Config.ScrapCraft1Item.."!", "success", 3500)
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', src, "ITEM RECEIVED", "You received "..outputAmt.."x "..Config.ScrapCraft1Item.."!", 3500, 'success')
                end
            else 
                if Config.NotifyType == "qb" then 
                    TriggerClientEvent('QBCore:Notify', src, "You need at least "..Config.scrapitem1req.." "..Config.scrapitem1Label..".", "error", 3500)
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', src, "ITEM REQUIRED", "You need at least "..Config.scrapitem1req.." "..Config.scrapitem1Label..".", 3500, 'error')
                end
            end
        elseif rawMatType == "tyre" then 
            local itemReq = exports.ox_inventory:GetItemCount(src, Config.scrapitem2)
            if itemReq >= Config.scrapitem2req then 
                local outputAmt = math.random(Config.ScrapCraft2Low, Config.ScrapCraft2High)
                exports.ox_inventory:AddItem(src, Config.ScrapCraft2Item, outputAmt)
                exports.ox_inventory:RemoveItem(src, Config.scrapitem2, Config.scrapitem2req)
                if Config.NotifyType == "qb" then 
                    TriggerClientEvent('QBCore:Notify', src, "You received "..outputAmt.."x "..Config.ScrapCraft2Item.."!", "success", 3500)
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', src, "ITEM RECEIVED", "You received "..outputAmt.."x "..Config.ScrapCraft2Item.."!", 3500, 'success')
                end
            else 
                if Config.NotifyType == "qb" then 
                    TriggerClientEvent('QBCore:Notify', src, "You need at least "..Config.scrapitem2req.." "..Config.scrapitem2Label..".", "error", 3500)
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', src, "ITEM REQUIRED", "You need at least "..Config.scrapitem2req.." "..Config.scrapitem2Label..".", 3500, 'error')
                end
            end
        elseif rawMatType == "hood" then 
            local itemReq = exports.ox_inventory:GetItemCount(src, Config.scrapitem3)
            if itemReq >= Config.scrapitem3req then 
                local outputAmt = math.random(Config.ScrapCraft3Low, Config.ScrapCraft3High)
                exports.ox_inventory:AddItem(src, Config.ScrapCraft3Item, outputAmt)
                exports.ox_inventory:RemoveItem(src, Config.scrapitem3, Config.scrapitem3req)
                if Config.NotifyType == "qb" then 
                    TriggerClientEvent('QBCore:Notify', src, "You received "..outputAmt.."x "..Config.ScrapCraft3Item.."!", "success", 3500)
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', src, "ITEM RECEIVED", "You received "..outputAmt.."x "..Config.ScrapCraft3Item.."!", 3500, 'success')
                end
            else 
                if Config.NotifyType == "qb" then 
                    TriggerClientEvent('QBCore:Notify', src, "You need at least "..Config.scrapitem3req.." "..Config.scrapitem3Label..".", "error", 3500)
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', src, "ITEM REQUIRED", "You need at least "..Config.scrapitem3req.." "..Config.scrapitem3Label..".", 3500, 'error')
                end
            end
        elseif rawMatType == "filter" then 
            local itemReq = exports.ox_inventory:GetItemCount(src, Config.scrapitem6)
            if itemReq >= Config.scrapitem6req then 
                local outputAmt = math.random(Config.ScrapCraft6Low, Config.ScrapCraft6High)
                exports.ox_inventory:AddItem(src, Config.ScrapCraft6Item, outputAmt)
                exports.ox_inventory:RemoveItem(src, Config.scrapitem6, Config.scrapitem6req)
                if Config.NotifyType == "qb" then 
                    TriggerClientEvent('QBCore:Notify', src, "You received "..outputAmt.."x "..Config.ScrapCraft6Item.."!", "success", 3500)
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', src, "ITEM RECEIVED", "You received "..outputAmt.."x "..Config.ScrapCraft6Item.."!", 3500, 'success')
                end
            else 
                if Config.NotifyType == "qb" then 
                    TriggerClientEvent('QBCore:Notify', src, "You need at least "..Config.scrapitem6req.." "..Config.scrapitem6Label..".", "error", 3500)
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', src, "ITEM REQUIRED", "You need at least "..Config.scrapitem6req.." "..Config.scrapitem6Label..".", 3500, 'error')
                end
            end
        elseif rawMatType == "spark" then 
            local itemReq = exports.ox_inventory:GetItemCount(src, Config.scrapitem8)
            if itemReq >= Config.scrapitem8req then 
                local outputAmt = math.random(Config.ScrapCraft8Low, Config.ScrapCraft8High)
                exports.ox_inventory:AddItem(src, Config.ScrapCraft8Item, outputAmt)
                exports.ox_inventory:RemoveItem(src, Config.scrapitem8, Config.scrapitem8req)
                if Config.NotifyType == "qb" then 
                    TriggerClientEvent('QBCore:Notify', src, "You received "..outputAmt.."x "..Config.ScrapCraft8Item.."!", "success", 3500)
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', src, "ITEM RECEIVED", "You received "..outputAmt.."x "..Config.ScrapCraft8Item.."!", 3500, 'success')
                end
            else 
                if Config.NotifyType == "qb" then 
                    TriggerClientEvent('QBCore:Notify', src, "You need at least "..Config.scrapitem8req.." "..Config.scrapitem8Label..".", "error", 3500)
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', src, "ITEM REQUIRED", "You need at least "..Config.scrapitem8req.." "..Config.scrapitem8Label..".", 3500, 'error')
                end
            end
        elseif rawMatType == "spoiler" then 
            local itemReq = exports.ox_inventory:GetItemCount(src, Config.scrapitem9)
            if itemReq >= Config.scrapitem9req then 
                local outputAmt = math.random(Config.ScrapCraft9Low, Config.ScrapCraft9High)
                exports.ox_inventory:AddItem(src, Config.ScrapCraft9Item, outputAmt)
                exports.ox_inventory:RemoveItem(src, Config.scrapitem9, Config.scrapitem9req)
                if Config.NotifyType == "qb" then 
                    TriggerClientEvent('QBCore:Notify', src, "You received "..outputAmt.."x "..Config.ScrapCraft9Item.."!", "success", 3500)
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', src, "ITEM RECEIVED", "You received "..outputAmt.."x "..Config.ScrapCraft9Item.."!", 3500, 'success')
                end
            else            
                if Config.NotifyType == "qb" then 
                    TriggerClientEvent('QBCore:Notify', src, "You need at least "..Config.scrapitem9req.." "..Config.scrapitem9Label..".", "error", 3500)
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', src, "ITEM REQUIRED", "You need at least "..Config.scrapitem9req.." "..Config.scrapitem9Label..".", 3500, 'error')
                end
            end
        elseif rawMatType == "engine" then 
            local itemReq = exports.ox_inventory:GetItemCount(src, Config.scrapitem10)
            if itemReq >= Config.scrapitem10req then 
                local outputAmt = math.random(Config.ScrapCraft10Low, Config.ScrapCraft10High)
                exports.ox_inventory:AddItem(src, Config.ScrapCraft10Item, outputAmt)
                exports.ox_inventory:RemoveItem(src, Config.scrapitem10, Config.scrapitem10req)
                if Config.NotifyType == "qb" then 
                    TriggerClientEvent('QBCore:Notify', src, "You received "..outputAmt.."x "..Config.ScrapCraft10Item.."!", "success", 3500)
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', src, "ITEM RECEIVED", "You received "..outputAmt.."x "..Config.ScrapCraft10Item.."!", 3500, 'success')
                end
            else 
                if Config.NotifyType == "qb" then 
                    TriggerClientEvent('QBCore:Notify', src, "You need at least "..Config.scrapitem10req.." "..Config.scrapitem10Label..".", "error", 3500)
                elseif Config.NotifyType == "okok" then
                    TriggerClientEvent('okokNotify:Alert', src, "ITEM REQUIRED", "You need at least "..Config.scrapitem10req.." "..Config.scrapitem10Label..".", 3500, 'error')
                end
            end
        end
    else 
        print("Cheater tried to trigger mz-scrap crafting breakdown - include ban event here")
    end 
end)

RegisterServerEvent('mz-scrap:server:removeBreakdown', function(breakType)
    if Config.debug then 
        print("Skill Check fail triggered.")
        print("Item to be removed = ", breakType)
    end
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if breakType == "door" then 
        lossAmt = math.random(Config.ScrapCraft1LossLow, Config.ScrapCraft1LossHigh)
        itemName = Config.scrapitem1
    elseif breakType == "tyre" then 
        lossAmt = math.random(Config.ScrapCraft2LossLow, Config.ScrapCraft2LossHigh)
        itemName = Config.scrapitem2
    elseif breakType == "hood" then 
        lossAmt = math.random(Config.ScrapCraft3LossLow, Config.ScrapCraft3LossHigh)
        itemName = Config.scrapitem3
    elseif breakType == "filter" then 
        lossAmt = math.random(Config.ScrapCraft6LossLow, Config.ScrapCraft6LossHigh)
        itemName = Config.scrapitem6
    elseif breakType == "spark" then 
        lossAmt = math.random(Config.ScrapCraft8LossLow, Config.ScrapCraft8LossHigh)
        itemName = Config.scrapitem8
    elseif breakType == "spoiler" then 
        lossAmt = math.random(Config.ScrapCraft9LossLow, Config.ScrapCraft9LossHigh)
        itemName = Config.scrapitem9
    elseif breakType == "engine" then 
        lossAmt = math.random(Config.ScrapCraft10LossLow, Config.ScrapCraft10LossHigh)
        itemName = Config.scrapitem10
    end 
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Config.inventoryType == "qb" then 
        Player.Functions.RemoveItem(itemName, lossAmt)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[itemName], "remove", lossAmt)
    elseif Config.inventoryType == "ox" then 
        exports.ox_inventory:RemoveItem(src, itemName, lossAmt)
    else 
        print("Your Config.inventoryType needs to be set to 'qb' or 'ox' in order to function. If you use a custom inventory, try both of these options to see if either are compatible.")
    end
    if Config.NotifyType == "qb" then 
        TriggerClientEvent('QBCore:Notify', src, "You lost "..lossAmt.."x "..itemName..".", "error", 3500)
    elseif Config.NotifyType == "okok" then
        TriggerClientEvent('okokNotify:Alert', src, "ITEM LOST", "You lost "..lossAmt.."x "..itemName..".", 3500, 'error')
    end
end) 

---------------------
--ITEM BREAK EVENTS--
---------------------

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

---------------
--ANTIEXPLOIT--
---------------

local function generateRandomKey()
    local keyLength = math.random(10, 20)
    local key = ""
    local charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+-=[]{}|;':,.<>/?`~"
    local charsetLength = string.len(charset)
    for i = 1, keyLength do
        local randomIndex = math.random(1, charsetLength)
        local randomChar = string.sub(charset, randomIndex, randomIndex)
        key = key .. randomChar
    end
    return key
end
  
  local randomKey = generateRandomKey()
    
function RandomKey()
    return randomKey
end
  
QBCore.Functions.CreateCallback('mz-scrap:GetKey', function(source, cb)
    local result = RandomKey()
    cb(result)
end)