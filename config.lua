Config = Config or {}

------------
--MZ-SCRAP--
------------

--DEFAULT CRAFT LOCATION:                   1176.08, 2635.15, 37.75

Config.NotifyType = 'okok'                  -- notification type: 'qb' for qb-core standard notifications, 'okok' for okokNotify notifications

Config.mzskills = true                      -- change to "false" if you wish to use this resource without using mz-skills

Config.SellLocation = {
    [1] = {
            coords = vector3(-54.9, 6392.3, 31.62),
            length = 1.4,
            width = 0.5,
            heading = 315,
            debugPoly = false,
            minZ = 29.02,
            maxZ = 33.02,
            distance = 1.0
        },
    }

------------------
--HAND SCRAPPING--
------------------

Config.handsearchlow = 3                    -- Lowest time (in seconds) to search a wreck by hand
Config.handsearchhigh = 6                   -- Lowest time (in seconds) to search a wreck by hand

--if using mz-skills, the following will apply for hand scrapping:
Config.handXPlow = 1                        -- Lowest possible amount of XP for hand scrapping.
Config.handXPhigh = 3                       -- Highest possible amount of XP for hand scrapping.
Config.handXPloss = 2                       -- Amount of XP lost if skill check failed
-----------------------------------------------------------------------------------
Config.Handskillcheck = true                -- change to 'false' if you do not want to skill check when searching by hand
--if the above is set to 'true' the following parameters apply:
Config.handscrapparses = 1                  -- Number of parses to scrap a wreck by hand.
Config.handsearchtime = 13                  -- time given to player regarding skill check
-----------------------------------------------------------------------------------

-------------------------
--SCREWDRIVER SCRAPPING--
-------------------------

Config.ScrewdriverRequiredItem = "screwdriver"          -- The qb-core/items.lua name or label of the required item.
Config.ScrewdriverRequiredItemLabel = "Screwdriver"     -- The name of the above item which will appear in notifications.

--if using mz-skills, the following will apply for screwdriver scrapping:
Config.screwdriverXP = 400                  -- Minimum amount of "Scraping" XP to access screwdriver salvaging
Config.screwdriverXPlow = 1                 -- Lowest possible amount of XP for screwdriver scrapping.
Config.screwdriverXPmid = 2                 -- Mid possible amount of XP for screwdriver scrapping.
Config.screwdriverXPhigh = 4                -- Highest possible amount of XP for screwdriver scrapping.
Config.screwdriverXPloss = 3                -- Amount of XP lost for failing skillcheck
-----------------------------------------------------------------------------------
Config.screwdriversuccess = 2               -- Chance (in %) for the screwdriver to break from wear and tear (Set to 0 if you want to disable).
Config.screwsearchlow = 3                   -- Lowest time (in seconds) to search a wreck with a screwdriver.
Config.screwsearchhigh = 5                  -- Lowest time (in seconds) to search a wreck with a screwdriver.
Config.Screwdriverskillcheck = true         -- change to 'false' if you do not want to skill check when searching by screwdriver.
--if the above is set to 'true' the following parameters apply:
Config.screwscrapparses = 2                 -- Number of parses to scrap a wreck with a screwdriver.
Config.screwsearchtime = 12                 -- time given to player regarding skill check
Config.screwdriverfail = 10                 -- Chance (in %) for the screwdriver to break if skillcheck fails (Set to 0 if you want to disable).
-----------------------------------------------------------------------------------

-----------------------
--BLOWTORCH SCRAPPING--
-----------------------

Config.BlowtorchRequiredItem = "blowtorch"          -- The qb-core/items.lua name or label of the required item.
Config.BlowtorchRequiredItemLabel = "Blowtorch"     -- The name of the above item which will appear in notifications.

--if using mz-skills, the following will apply for blowtorch scrapping:
Config.blowtorchXP = 1600                   -- Minimum amount of "Scraping" XP to access blowtorch salvaging.
Config.blowtorchXPlow = 2                   -- Lowest possible amount of XP for blowtorch scrapping.
Config.blowtorchXPmid = 3                   -- Mid possible amount of XP for blowtorch scrapping.
Config.blowtorchXPhigh = 5                  -- Highest possible amount of XP for blowtorch scrapping.
Config.blowtorchXPloss = 4                  -- Amount of XP lost for failing skill check with blowtorch.
-----------------------------------------------------------------------------------
Config.blowtorchsuccess = 2                 -- Chance (in %) for the blowtorch to burn out from wear and tear (Set to 0 if you want to disable).
Config.blowsearchlow = 3                    -- Lowest time (in seconds) to search a wreck with a blowtorch.
Config.blowsearchhigh = 8                   -- Lowest time (in seconds) to search a wreck with a blowtorch.
Config.Blowtorchskillcheck = true           -- change to 'false' if you do not want to skill check when searching by blowtorch.
--if the above is set to 'true' the following parameters apply:
Config.blowscrapparses = 3                  -- Number of parses to scrap a wreck with a blowtorch.
Config.blowsearchtime = 10                  -- time given to player regarding skill check.
Config.blowtorchfail = 15                   -- Chance (in %) for the blowtorch to break if skillcheck fails (Set to 0 if you want to disable).
-----------------------------------------------------------------------------------

------------
--CRAFTING--
------------

-----------------------
--BREAKING DOWN TIRES--
-----------------------
Config.tirelow = 4                          -- Lowest number of skillcheck parses to break down tires
Config.tirehigh = 6                         -- Highest number of skillcheck parses to break down tires
Config.tiretimelow = 10                     -- Lowest time (in seconds) to strip down tires.
Config.tiretimehigh = 15                    -- Highest time (in seconds) to strip down tires.
Config.tiresneeded = 5                      -- Number of tires needed to perform breakdown
Config.Rubberoutputlow = 15                 -- Lowest amount of rubber from tire breakdown
Config.Rubberoutputhigh = 20                -- Highest amount of rubber from tire breakdown
--If you are using mz-skills, the following parameters apply:
Config.tireXPlow = 2                        -- Lowest amount of "Scraping" XP obtained for breaking down tires.
Config.tireXPhigh = 4                       -- Highest amount of "Scraping" XP obtained for breaking down tires.
Config.tireXPloss = 2                       -- Amount of "Scraping" XP lost for failing crafting skillcheck.
-----------------------------------------------------------------------------------

------------------
--CLEANING NAILS--
------------------
Config.naillow = 4                          -- Lowest number of skillcheck parses to clean nails.
Config.nailhigh = 6                         -- Highest number of skillcheck parses to clean nails.
Config.nailtimelow = 10                     -- Lowest time (in seconds) to clean nails.
Config.nailtimehigh = 15                    -- Highest time (in seconds) to clean nails.
Config.nailsneeded = 5                      -- Number of nails needed to perform clean
Config.metaloutputlow = 15                  -- Lowest amount of metalscrap from nails.
Config.metaloutputhigh = 20                 -- Highest amount of metalscrap from nails.
--If you are using mz-skills, the following parameters apply:
Config.nailXPlow = 2                        -- Lowest amount of "Scraping" XP obtained for cleaning nails.
Config.nailXPhigh = 4                       -- Highest amount of "Scraping" XP obtained for cleaning nails.
Config.nailXPloss = 2                       -- Amount of "Scraping" XP lost for failing crafting skillcheck.
-----------------------------------------------------------------------------------

---------------------
--BREAK APART RADIO--
---------------------
Config.radiolow = 7                         -- Lowest number of skillcheck parses to break apart radio.
Config.radiohigh = 9                        -- Highest number of skillcheck parses to break apart radio.
Config.radiotimelow = 10                    -- Lowest time (in seconds) to break apart radio.
Config.radiotimehigh = 15                   -- Highest time (in seconds) to break apart radio.
Config.radiosneeded = 3                     -- Number of radio needed to strip components.
Config.elecoutputlow = 7                    -- Lowest amount of electric scrap from radio components. 
Config.elecoutputhigh = 11                  -- Highest amount of electric scrap from radio components. 
--If you are using mz-skills, the following parameters apply:
Config.radioXPlow = 2                       -- Lowest amount of "Scraping" XP obtained to break apart radio.
Config.radioXPhigh = 4                      -- Highest amount of "Scraping" XP obtained to break apart radio.
Config.radioXPloss = 2                      -- Amount of "Scraping" XP lost for failing crafting skillcheck.
-----------------------------------------------------------------------------------

-------------
--CAR JACKS--
-------------
Config.jackslow = 7                         -- Lowest number of skillcheck parses to break apart jacks.
Config.jackshigh = 9                        -- Highest number of skillcheck parses to break apart jacks.
Config.jackstimelow = 10                    -- Lowest time (in seconds) to break apart jacks.
Config.jackstimehigh = 15                   -- Highest time (in seconds) to break apart jacks.
Config.jacksneeded = 3                      -- Number of jacks needed to break apart.
Config.jacksmetaloutputlow = 6              -- Lowest amount of metal scrap from broken up jacks. 
Config.jacksmetaloutputhigh = 9             -- Highest amount of metal scrap from broken up jacks. 
Config.jackssteeloutputlow = 3              -- Lowest amount of steel from broken up jacks. 
Config.jackssteeloutputlow = 6              -- Highest amount of steel from broken up jacks. 
--If you are using mz-skills, the following parameters apply:
Config.jacksXPlow = 2                       -- Lowest amount of "Scraping" XP obtained to break apart jacks.
Config.jacksXPhigh = 4                      -- Highest amount of "Scraping" XP obtained to break apart jacks.
Config.jacksXPloss = 2                      -- Amount of "Scraping" XP lost for failing crafting skillcheck.
-----------------------------------------------------------------------------------

-------------
--CAR DOORS--
-------------
Config.doorslow = 6                         -- Lowest number of skillcheck parses to break apart car doors.
Config.doorshigh = 8                        -- Highest number of skillcheck parses to break apart car doors.
Config.doorstimelow = 10                    -- Lowest time (in seconds) to break apart car doors.
Config.doorstimehigh = 15                   -- Highest time (in seconds) to break apart car doors.
Config.doorsneeded = 3                      -- Number of doors needed to break apart.
Config.doorglasslow = 5                     -- Lowest amount of glass from broken up doors.
Config.doorglasshigh = 15                   -- Highest amount of glass from broken up doors.
Config.doorironlow = 3                      -- Lowest amount of iron from broken up doors.
Config.doorironhigh = 6                     -- Highest amount of iron from broken up doors.
--If you are using mz-skills, the following parameters apply:
Config.doorsXPlow = 2                       -- Lowest amount of "Scraping" XP obtained to break apart car doors.
Config.doorsXPhigh = 4                      -- Highest amount of "Scraping" XP obtained to break apart car doors.
Config.doorsXPloss = 2                      -- Amount of "Scraping" XP lost for failing crafting skillcheck.
-----------------------------------------------------------------------------------

-------------
--CAR HOODS--
-------------
Config.hoodslow = 6                         -- Lowest number of skillcheck parses to break apart car hood.
Config.hoodshigh = 8                        -- Highest number of skillcheck parses to break apart car hood.
Config.hoodstimelow = 10                    -- Lowest time (in seconds) to break apart car hood.
Config.hoodstimehigh = 15                   -- Highest time (in seconds) to break apart car hood.
Config.hoodneeded = 3                       -- Number of hoods needed to break apart.
Config.hoodscraplow = 5                     -- Lowest amount of metal scrap from broken up hood.
Config.hoodscraphigh = 15                   -- Highest amount of metal scrap from broken up hood.
Config.hoodcopperlow = 3                    -- Lowest amount of copper from broken up hood.
Config.hoodcopperhigh = 6                   -- Highest amount of copper from broken up hood.
--If you are using mz-skills, the following parameters apply:
Config.hoodsXPlow = 2                       -- Lowest amount of "Scraping" XP obtained to break apart car hood.
Config.hoodsXPhigh = 4                      -- Highest amount of "Scraping" XP obtained to break apart car hood.
Config.hoodsXPloss = 2                      -- Amount of "Scraping" XP lost for failing crafting skillcheck.
-----------------------------------------------------------------------------------

--------------
--CAR ENGINE--
--------------
Config.enginelow = 10                       -- Lowest number of skillcheck parses to break apart car engine.
Config.enginehigh = 13                      -- Highest number of skillcheck parses to break apart car engine.
Config.enginetimelow = 20                   -- Lowest time (in seconds) to break apart car engine.
Config.enginetimehigh = 30                  -- Highest time (in seconds) to break apart car engine.
Config.engineneeded = 1                     -- Number of engines needed to break apart.
Config.enginescraplow = 7                   -- Lowest amount of metal scrap from a broken up engine.
Config.enginescraphigh = 12                 -- Highest amount of metal scrap from a broken up engine.
Config.enginecopperlow = 4                  -- Lowest amount of copper from a broken up engine.
Config.enginecopperhigh = 8                 -- Highest amount of copper from a broken up engine.
Config.engineironlow = 3                    -- Lowest amount of iron from a broken up engine.
Config.engineironhigh = 6                   -- Highest amount of iron from a broken up engine.
Config.enginesteellow = 5                   -- Lowest amount of steel from a broken up engine.
Config.enginesteelhigh = 10                 -- Highest amount of steel from a broken up engine.
--If you are using mz-skills, the following parameters apply:
Config.engineXPlow = 5                      -- Lowest amount of "Scraping" XP obtained to break apart car engine.
Config.engineXPhigh = 8                     -- Highest amount of "Scraping" XP obtained to break apart car engine.
Config.engineXPloss = 5                     -- Amount of "Scraping" XP lost for failing crafting skillcheck.

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

Config.CarItems = {
    [1] = {
        item = "tissuebox",
        price = math.random(20, 40)
    },
    [2] = {
        item = "chewinggum",
        price = math.random(25, 50)
    },
    [3] = {
        item = "carwipers",
        price = math.random(40, 60)
    },
    [4] = {
        item = "fuelcap",
        price = math.random(60, 80)
    },
    [5] = {
        item = "carbattery",
        price = math.random(100, 130)
    },
    [6] = {
        item = "gearshift",
        price = math.random(130, 175)
    },
    [7] = {
        item = "airfilter",
        price = math.random(160, 190)
    },
    [8] = {
        item = "spoiler",
        price = math.random(220, 260)
    },
    [9] = {
        item = "carrim",
        price = math.random(260, 300)
    },
    [10] = {
        item = "cargrill",
        price = math.random(300, 325)
    },
    [11] = {
        item = "sparkplugs",
        price = math.random(270, 310)
    }
}