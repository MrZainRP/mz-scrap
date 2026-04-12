Config = Config or {}

    Config.debug = false                 -- Set to false to remove debugging prints from console (server sided)

------------
--MZ-SCRAP--
------------

--DEFAULT CRAFT LOCATION:                   1176.08, 2635.15, 37.75

    Config.NotifyType = 'qb'                    -- notification type: 'qb' for qb-core standard notifications, 'okok' for okokNotify notifications

    Config.inventoryType = "ox"                 -- Change to "qb" to use with qb-inventory

    Config.TargetType = "ox"                    -- Switch between "qb" and "ox" depending on what target dependency your server uses.

    Config.skillType = "bl"                     -- Change to "ps" to use with "ps-ui" or "bl" to use with "bl-ui"

    Config.nofindChance = 5                     -- Percentage chance that a successful search results in no output (but still gives XP).

-- MZ-SKILLS SETTINGS

    Config.mzskills = true                      -- change to "false" if you wish to use this resource without using mz-skills
    Config.ScrapXPSkill = "Scraping"            -- Take the name of your scrap skill from mz-skills (make sure they are exactly the same)

    Config.scraplvl0 = 0                        -- Level 0
    Config.scraplvl1 = 28500                    -- XP to Level 1
    Config.scraplvl2 = 92500                    -- XP to Level 2
    Config.scraplvl3 = 188000
    Config.scraplvl4 = 312700
    Config.scraplvl5 = 432600
    Config.scraplvl6 = 606500
    Config.scraplvl7 = 806500
    Config.scraplvl8 = 1079800
    Config.scraplvl9 = 1308100
    Config.scraplvl10 = 1584350

------------------
--HAND SCRAPPING--
------------------

    Config.handsearchlow = 2                    -- Lowest time (in seconds) to search a wreck by hand
    Config.handsearchhigh = 3                   -- Lowest time (in seconds) to search a wreck by hand

--if using mz-skills, the following will apply for hand scrapping:
    Config.handXPlow = 8                        -- Lowest possible amount of XP for hand scrapping.
    Config.handXPhigh = 18                       -- Highest possible amount of XP for hand scrapping.
    Config.handXPloss = 5                       -- Amount of XP lost if skill check failed
-----------------------------------------------------------------------------------
-- SKILL CHECKS
    Config.Handskillcheck = true                -- change to 'false' if you do not want to skill check when searching by hand
-- if the above is set to 'true' and you are using "ps" skill-check, then the following parameters apply:
    Config.handscrapparses = 1                  -- Number of parses to scrap a wreck by hand.
    Config.handsearchtime = 13                  -- time given to player regarding skill check

-- if the above is set to 'true' and you are using "bl" skill-check, then the following parameters apply:
    Config.handParses = 1
    Config.handDifficulty = 50
    Config.handLines = 2
-----------------------------------------------------------------------------------

-------------------------
--SCREWDRIVER SCRAPPING--
-------------------------

    Config.ScrewdriverRequiredItem = "screwdriver"          -- The qb-core/items.lua name or label of the required item.
    Config.ScrewdriverRequiredItemLabel = "Screwdriver"     -- The name of the above item which will appear in notifications.

--if using mz-skills, the following will apply for screwdriver scrapping:
    Config.screwdriverXP = 28500                -- Minimum amount of "Scraping" XP to access screwdriver salvaging
    Config.screwdriverXPlow = 12                -- Lowest possible amount of XP for screwdriver scrapping.
    Config.screwdriverXPmid = 20                -- Mid possible amount of XP for screwdriver scrapping.
    Config.screwdriverXPhigh = 25               -- Highest possible amount of XP for screwdriver scrapping.
    Config.screwdriverXPloss = 8                -- Amount of XP lost for failing skillcheck

-----------------------------------------------------------------------------------
    Config.screwdriversuccess = 2               -- Chance (in %) for the screwdriver to break from wear and tear (Set to 0 if you want to disable).

    Config.screwsearchlow = 1                   -- Lowest time (in seconds) to search a wreck with a screwdriver.
    Config.screwsearchhigh = 3                  -- Lowest time (in seconds) to search a wreck with a screwdriver.
-----------------------------------------------------------------------------------
-- SKILLCHECK 

    Config.Screwdriverskillcheck = true         -- change to 'false' if you do not want to skill check when searching by screwdriver.
-- if the above is set to 'true' and you are using "ps" skill-check, then the following parameters apply:
    Config.screwscrapparses = 2                 -- Number of parses to scrap a wreck with a screwdriver.
    Config.screwsearchtime = 12                 -- time given to player regarding skill check
    Config.screwdriverfail = 10                 -- Chance (in %) for the screwdriver to break if skillcheck fails (Set to 0 if you want to disable).
-- if the above is set to 'true' and you are using "bl" skill-check, then the following parameters apply:
    Config.screwParses = 1
    Config.screwDifficulty = 60
    Config.screwLines = 3
-----------------------------------------------------------------------------------

-----------------------
--BLOWTORCH SCRAPPING--
-----------------------

    Config.BlowtorchRequiredItem = "blowtorch"          -- The qb-core/items.lua name or label of the required item.
    Config.BlowtorchRequiredItemLabel = "Blowtorch"     -- The name of the above item which will appear in notifications.

--if using mz-skills, the following will apply for blowtorch scrapping:
    Config.blowtorchXP = 92500                   -- Minimum amount of "Scraping" XP to access blowtorch salvaging.
    Config.blowtorchXPlow = 17                   -- Lowest possible amount of XP for blowtorch scrapping.
    Config.blowtorchXPmid =  23                  -- Mid possible amount of XP for blowtorch scrapping.
    Config.blowtorchXPhigh = 30                  -- Highest possible amount of XP for blowtorch scrapping.
    Config.blowtorchXPloss = 10                  -- Amount of XP lost for failing skill check with blowtorch.
-----------------------------------------------------------------------------------
    Config.blowtorchsuccess = 2                 -- Chance (in %) for the blowtorch to burn out from wear and tear (Set to 0 if you want to disable).

    Config.blowsearchlow = 3                    -- Lowest time (in seconds) to search a wreck with a blowtorch.
    Config.blowsearchhigh = 8                   -- Lowest time (in seconds) to search a wreck with a blowtorch.

-----------------------------------------------------------------------------------
-- SKILLCHECK 
    Config.Blowtorchskillcheck = true           -- change to 'false' if you do not want to skill check when searching by blowtorch.
-- if the above is set to 'true' and the skillcheck is set to "ps", then the following parameters apply:
    Config.blowscrapparses = 3                  -- Number of parses to scrap a wreck with a blowtorch.
    Config.blowsearchtime = 10                  -- time given to player regarding skill check.
    Config.blowtorchfail = 15                   -- Chance (in %) for the blowtorch to break if skillcheck fails (Set to 0 if you want to disable).
-- if the above is set to 'true' and the skillcheck is set to "bl", then the following parameters apply:
    Config.blowParses = 1
    Config.blowDifficulty = 70
    Config.blowLines = 4 
-----------------------------------------------------------------------------------

--------------------
--SCRAPING OUTPUTS--
--------------------

-- HANDS Outputs 
-- NOTE: All outputs should add to 100 in order for all items to be obtainable. Lower probabilities should appear at the bottom for less valuable drops.
    Config.hands1prob = 20              -- = 20/100 = 20% chance to pull Config.scrapitem1
    Config.hands2prob = 22
    Config.hands3prob = 15
    Config.hands4prob = 12
    Config.hands5prob = 9
    Config.hands6prob = 7 
    Config.hands7prob = 4
    Config.hands8prob = 3
    Config.hands9prob = 2
    Config.hands10prob = 1

-- SCREWDRIVER Outputs
    Config.screw1prob = 10              -- = 10/100 = 10% chance to pull Config.scrapitem1
    Config.screw2prob = 15
    Config.screw3prob = 20
    Config.screw4prob = 15
    Config.screw5prob = 15
    Config.screw6prob = 9 
    Config.screw7prob = 7
    Config.screw8prob = 4
    Config.screw9prob = 3
    Config.screw10prob = 2

-- BLOWTORCH Outputs
    Config.torch1prob = 5              -- = 20/100 = 20% chance to pull item1.
    Config.torch2prob = 10
    Config.torch3prob = 18
    Config.torch4prob = 17
    Config.torch5prob = 17
    Config.torch6prob = 11
    Config.torch7prob = 9
    Config.torch8prob = 6
    Config.torch9prob = 4
    Config.torch10prob = 3

-- ITEMS
    Config.scrapitem1 = "cardoor"
    Config.scrapitem1Label = "Car Door"
    Config.scrapitem2 = "oldtyre"
    Config.scrapitem2Label = "Old Tyre"
    Config.scrapitem3 = "carhood"
    Config.scrapitem3Label = "Car Hood"
    Config.scrapitem4 = "carbattery"
    Config.scrapitem4Label = "Car Battery"
    Config.scrapitem5 = "gearshift"
    Config.scrapitem5Label = "Gear Shift"
    Config.scrapitem6 = "airfilter"
    Config.scrapitem6Label = "Air Filter"
    Config.scrapitem7 = "carradio"
    Config.scrapitem7Label = "Car Radio"
    Config.scrapitem8 = "sparkplugs"
    Config.scrapitem8Label = "Spark Plugs"
    Config.scrapitem9 = "spoiler"
    Config.scrapitem9Label = "Car Spoiler"
    Config.scrapitem10 = "carengine"
    Config.scrapitem10Label = "Car Engine"

------------
--CRAFTING--
------------

    Config.craftingLocation = vector3(1176.08, 2635.15, 37.75)

-- CRAFTING USES BL-UI SKILLCHECKS/HACKS WITH THE FOLLOWING PARAMETERS
    Config.craftskillType = "pathfind"

-- If "Config.craftskillType = "pathfind" or "untangle" then: 
    Config.craftingParses = 1
    Config.craftingNodes = 7
    Config.craftingDuration = 15000
-- ELSE If "Config.craftskillType = "numslide" then: 
    -- Config.craftingParses - EDIT "Config.craftingParses = 1" above (Recommended to keep at 1)
    Config.craftingDifficulty = 50
    Config.craftingKeys = 7

-- CAR DOORS
-- Item Required = "Config.scrapitem1"
    Config.scrapitem1req = 5                -- Amount Required to breakdown
-- Rewards for breaking down "Config.scrapitem1"
    Config.ScrapCraft1Item = "metalscrap"   -- Return item
    Config.ScrapCraft1Low = 25              -- Lowest Amount
    Config.ScrapCraft1High = 35             -- Highest Amount
-- Loss if skillcheck failed
    Config.ScrapCraft1LossLow = 1           -- Lowest amount of "Config.scrapitem1" lost for a failed skill check
    Config.ScrapCraft1LossHigh = 5          -- Highest amount of "Config.scrapitem1" lost for a failed skill check

-- CAR TYRES    
-- Item Required = "Config.scrapitem2"
    Config.scrapitem2req = 5                -- Amount Required to breakdown
-- Rewards for breaking down "Config.scrapitem2"
    Config.ScrapCraft2Item = "rubber"       -- Return item
    Config.ScrapCraft2Low = 25              -- Lowest Amount
    Config.ScrapCraft2High = 35             -- Highest Amount
-- Loss if skillcheck failed
    Config.ScrapCraft2LossLow = 1           -- Lowest amount of "Config.scrapitem2" lost for a failed skill check
    Config.ScrapCraft2LossHigh = 5          -- Highest amount of "Config.scrapitem2" lost for a failed skill check

-- CAR HOOD    
-- Item Required = "Config.scrapitem3"
    Config.scrapitem3req = 5                -- Amount Required to breakdown
-- Rewards for breaking down "Config.scrapitem3"
    Config.ScrapCraft3Item = "iron"         -- Return item
    Config.ScrapCraft3Low = 25              -- Lowest Amount
    Config.ScrapCraft3High = 35             -- Highest Amount
-- Loss if skillcheck failed
    Config.ScrapCraft3LossLow = 1           -- Lowest amount of "Config.scrapitem3" lost for a failed skill check
    Config.ScrapCraft3LossHigh = 5          -- Highest amount of "Config.scrapitem3" lost for a failed skill check

-- AIR FILTER   
-- Item Required = "Config.scrapitem6"
    Config.scrapitem6req = 5                -- Amount Required to breakdown
-- Rewards for breaking down "Config.scrapitem6"
    Config.ScrapCraft6Item = "glass"         -- Return item
    Config.ScrapCraft6Low = 25              -- Lowest Amount
    Config.ScrapCraft6High = 35             -- Highest Amount
-- Loss if skillcheck failed
    Config.ScrapCraft6LossLow = 1           -- Lowest amount of "Config.scrapitem6" lost for a failed skill check
    Config.ScrapCraft6LossHigh = 5          -- Highest amount of "Config.scrapitem6" lost for a failed skill check

-- SPARK PLUGS   
-- Item Required = "Config.scrapitem8"
    Config.scrapitem8req = 5                -- Amount Required to breakdown
-- Rewards for breaking down "Config.scrapitem8"
    Config.ScrapCraft8Item = "gunpowder"         -- Return item
    Config.ScrapCraft8Low = 25              -- Lowest Amount
    Config.ScrapCraft8High = 35             -- Highest Amount
-- Loss if skillcheck failed
    Config.ScrapCraft8LossLow = 1           -- Lowest amount of "Config.scrapitem8" lost for a failed skill check
    Config.ScrapCraft8LossHigh = 5          -- Highest amount of "Config.scrapitem8" lost for a failed skill check

-- SPOILER   
-- Item Required = "Config.scrapitem9"
    Config.scrapitem9req = 5                -- Amount Required to breakdown
-- Rewards for breaking down "Config.scrapitem9"
    Config.ScrapCraft9Item = "plastic"      -- Return item
    Config.ScrapCraft9Low = 25              -- Lowest Amount
    Config.ScrapCraft9High = 35             -- Highest Amount
-- Loss if skillcheck failed
    Config.ScrapCraft9LossLow = 1           -- Lowest amount of "Config.scrapitem9" lost for a failed skill check
    Config.ScrapCraft9LossHigh = 5          -- Highest amount of "Config.scrapitem9" lost for a failed skill check

-- ENGINE
-- Item Required = "Config.scrapitem10"
    Config.scrapitem10req = 5                -- Amount Required to breakdown
-- Rewards for breaking down "Config.scrapitem10"
    Config.ScrapCraft10Item = "steel"        -- Return item
    Config.ScrapCraft10Low = 25              -- Lowest Amount
    Config.ScrapCraft10High = 35             -- Highest Amount
-- Loss if skillcheck failed
    Config.ScrapCraft10LossLow = 1           -- Lowest amount of "Config.scrapitem10" lost for a failed skill check
    Config.ScrapCraft10LossHigh = 5          -- Highest amount of "Config.scrapitem10" lost for a failed skill check

Config.Objects = {
    -- Scrap objects player can interact with
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