Config = Config or {}

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

Config.BankMoney = false -- Set to true if you want the money to go into the players bank
Config.UseTimes = false -- Set to false if you want the pawnshop open 24/7

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true'

Config.NotifyType = 'okok' -- notification type: 'qb' for qb-core standard notifications, 'okok' for okokNotify notifications

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