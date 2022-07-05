## MZ-SCRAP
A FiveM resource which allows players to scrap wrecks found in GTA V with experience and item progression.

_By Mr_Zain#4139_

## PREVIEW

[![mz-scrap](https://i.imgur.com/pyXfLzP.png)](https://www.youtube.com/watch?v=8nxTcmuyYBI "mz-scrap for FiveM by Mr_Zain#4139")

## INTRODUCTION 
- A scrap task (no job required) designed to allow players to interact with scrap found in the base GTA V models, particularly the scrap yard south of the main city, the car and plane scrap yard found South of the main part of Sandy Shores and (to a lesser extent) the scrap yard found in the heart of Paleto. Props can be added to the list of items a player can interact with by adding those props to the config.lua file.
- Scraping commences with the player using their hands. Each successful scrap attended to this way yields low-tier items + low-tier experience gain for the player.
- Mid-tier scraping involves the use of a screwdriver. The scraping function is slightly harder by way of skillcheck (and can be made more or less difficult by manipulation of the qb-lock export found in the client.lua), takes slightly longer and produces mid-tier items and mid-tier XP.
- High-tier scraping involves the use of a blowtorch. Again, the scraping function is slightly harder (and can be modified), takes slightly longer and produces top-tier items.
- Certain items obtained from scraping can then be broken down into materials used for crafting in other scripts. mz-scrap utilises the conventional iron, copper, steel materials which can then be used elsewhere for crafting. 

## DEPENDENCIES

NOTE: You should have each of the dependencies other than qb-lock and mz-skills as part of a conventional qb-core install.

**[mz-skills](https://github.com/MrZainRP/mz-skills)** - to track skill progress. All credit to Kings#4220 for the original qb-skillz now **[B1-skillz](https://github.com/Burn-One-Studios/B1-skillz)**

**[progressbar](https://github.com/qbcore-framework/progressbar)**

**[qb-target](https://github.com/qbcore-framework/qb-target)**

**[qb-skillbar](https://github.com/qbcore-framework/qb-skillbar)**

**[qb-lock](https://github.com/Nathan-FiveM/qb-lock)**

OPTIONAL: (Configured to work with okokNotify as well as base qb-core notifications).

### INSTALLATION INSTRUCTIONS/GUIDE

## A. MZ-SKILLS

1. Ensure that mz-skills forms part of your running scripts. 

2. Run the "skills.sql" sql file and open the database. (This will add a data table to the existing "players" database which will hold the skill value for "Scraping" as well as other jobs)

## B. QB-CORE/SHARED/ITEMS.LUA

3. Add the following items to qb-core/shared/items.lua:

ITEMS WHICH WILL NEED TO BE ADDED TO A SHOP OR MADE CRAFTABLE (See D. QB-Shops below at point 5, for a suggestion to be added to the 'hardware' store within qb-shops):

```lua
['screwdriver'] 				 = {['name'] = 'screwdriver', 			  		['label'] = 'Screwdriver', 				['weight'] = 100, 		['type'] = 'item', 		['image'] = 'screwdriver.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'A flathead screwdriver. I mean sure the handle is a bit worn but this thing probably works.'},
['blowtorch'] 				 	 = {['name'] = 'blowtorch', 			    	['label'] = 'Blowtorch', 				['weight'] = 3500, 		['type'] = 'item', 		['image'] = 'blowtorch.png', 			['unique'] = true, 		['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'A high propane instrument used for welding and other things...'},
['wd40'] 				 	 	 = {['name'] = 'wd40', 			    			['label'] = 'WD-40', 					['weight'] = 250, 		['type'] = 'item', 		['image'] = 'wd40.png', 				['unique'] = true, 		['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'A chemical compound with multiple purposes, including the removal of corrosion.'},
```

RARE ITEM DROPS (OPTIONAL WITH A 1% DROP RATE)

```lua
["pistol1"] 					 = {["name"] = "pistol1", 						["label"] = "Pistol Grip", 				["weight"] = 100, 		["type"] = "item", 		["image"] = "pistol1.png", 				["unique"] = false, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "The barrel of a Walther P-99 Pistol."},
["pistol2"] 					 = {["name"] = "pistol2", 						["label"] = "Slide Assembly", 			["weight"] = 100, 		["type"] = "item", 		["image"] = "pistol2.png", 				["unique"] = false, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "The frame of a Walther P-99 Pistol."},
["pistol3"] 					 = {["name"] = "pistol3", 						["label"] = "Slide", 					["weight"] = 100, 		["type"] = "item", 		["image"] = "pistol3.png", 				["unique"] = false, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "The grip of a Walther P-99 Pistol."},
["pistol4"] 					 = {["name"] = "pistol4", 						["label"] = "Pistol Chassis", 			["weight"] = 100, 		["type"] = "item", 		["image"] = "pistol4.png", 				["unique"] = false, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "The chassis of a Walther P-99 Pistol."},
```

SCRAP ITEMS

```lua
["tissuebox"]         	     = {["name"] = "tissuebox",         		["label"] = "Tissue Box",    			["weight"] = 100,       ["type"] = "item",      ["image"] = "tissuebox.png",     	    ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An old box of tissues... Wonderful..."},
["chewinggum"]               = {["name"] = "chewinggum",         		["label"] = "Old pack of gum",    		["weight"] = 120,       ["type"] = "item",      ["image"] = "chewinggum.png",           ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "An old looking pack of chewing gum... Wouldn't trust it..."},
["rustynails"]         	 	 = {["name"] = "rustynails",         		["label"] = "Rusted Nails",    			["weight"] = 150,       ["type"] = "item",      ["image"] = "rustynails.png",     		["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "A collection of nails that have seen better days... Perhaps they can be cleaned?"},
["carwipers"]         	     = {["name"] = "carwipers",         		["label"] = "Windsheild Wipers",    	["weight"] = 250,       ["type"] = "item",      ["image"] = "windshieldwipers.png",     ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Looks like these wipers can still be used, not bad."},
["oldtire"]             	 = {["name"] = "oldtire",         			["label"] = "Old worn tire",    		["weight"] = 320,       ["type"] = "item",      ["image"] = "oldtire.png",         		["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "This tire looks like it has seen better days, might be able to salvage some of it..."},
["fuelcap"]         	 	 = {["name"] = "fuelcap",         			["label"] = "Fuel Cap",    				["weight"] = 160,       ["type"] = "item",      ["image"] = "fuelcap.png",     			["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Used to keep the fuel in the tank, could use a spare couple of these..."},
["carjack"]         	     = {["name"] = "carjack",         			["label"] = "Car Jack",    				["weight"] = 1000,      ["type"] = "item",      ["image"] = "carjack.png",     	    	["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "A battery used to power motor vehicles. Not sure if this has any charge left."},
["carbattery"]         	     = {["name"] = "carbattery",         		["label"] = "Car Battery",    			["weight"] = 800,       ["type"] = "item",      ["image"] = "carbattery.png",     	    ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "A battery used to power motor vehicles. Not sure if this has any charge left."},
["carradio"]             	 = {["name"] = "carradio",         			["label"] = "Car Radio",    			["weight"] = 550,       ["type"] = "item",      ["image"] = "carradio.png",         	["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "A radio equipped to play through changes in radio signals."},
["gearshift"]         	 	 = {["name"] = "gearshift",         		["label"] = "Gearshift",    			["weight"] = 450,       ["type"] = "item",      ["image"] = "gearshift.png",     		["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "A manual car stick shifter."},
["airfilter"]         	     = {["name"] = "airfilter",         		["label"] = "Airfilter",    			["weight"] = 550,       ["type"] = "item",      ["image"] = "airfilter.png",     	    ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "A filter to avoid contimaination of airflow into the motor vehicle."},
["sparkplugs"]             	 = {["name"] = "sparkplugs",         		["label"] = "Sparkplugs",    			["weight"] = 250,       ["type"] = "item",      ["image"] = "sparkplugs.png",           ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Car part generating electrical spark for combustion of motor vehicle fuel."},
["spoiler"]         	 	 = {["name"] = "spoiler",         			["label"] = "Car Spoiler",    			["weight"] = 1300,      ["type"] = "item",      ["image"] = "spoiler.png",     			["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "A car spoiler used to improve aerodynamics and slip stream performance of a motor vehicle."},
["cardoor"]         	     = {["name"] = "cardoor",         			["label"] = "Car Door",    				["weight"] = 1650,      ["type"] = "item",      ["image"] = "cardoor.png",     	    	["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "A door which has been stripped off a motor vehicle."},
["carrim"]             		 = {["name"] = "carrim",         			["label"] = "Sports Rim",    			["weight"] = 850,       ["type"] = "item",      ["image"] = "carrim.png",         		["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "A chrome rim alloy."},
["cargrill"]         	 	 = {["name"] = "cargrill",         			["label"] = "Car Grill",    			["weight"] = 850,       ["type"] = "item",      ["image"] = "cargrill.png",     		["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Front grill chrome alloy from a motor vehicle."},
["carengine"]         	 	 = {["name"] = "carengine",         		["label"] = "Engine Block",    			["weight"] = 2250,      ["type"] = "item",      ["image"] = "carengine.png",     		["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Combustion engine from a motor vehicle."},
["carhood"]         	 	 = {["name"] = "carhood",         			["label"] = "Car Hood",    				["weight"] = 1450,      ["type"] = "item",      ["image"] = "carhood.png",     			["unique"] = false,     ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "The hood component of a motor vehicle."},
['electronicscrap'] 			 = {['name'] = 'electronicscrap', 			    ['label'] = 'Electronic Scrap', 		['weight'] = 100, 		['type'] = 'item', 		['image'] = 'electronics.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'A couple of wires and a circuit board, might be able to do something with this?'},
```

## C. IMAGES

4. Add the images which appear in the "images" folder to your inventory images folder. If using lj-inventory, add the images to: lj-inventory/html/images/

## D. CONFIGURE QB-SHOPS

5. Depending on how you want to incorporate the screwdriver, blowtorch and wd40 within your server/city you can make these items craftable or rare drops from other activities for more depth. The simplest option is to add them to the hardware section of qb-shops for players to purchase.

Working off the default configuration of qb-shops, if you wish to simply make them purchaseable, navigate to line 257 of qb-shops/config.lua and add the following after line 257 but before the closing } of the "hardware" store configuration:

```lua
        [16] = {
            name = "screwdriver",
            price = 250,
            amount = 50,
            info = {},
            type = "item",
            slot = 16,
        },
        [17] = {
            name = "wd40",
            price = 40,
            amount = 50,
            info = {},
            type = "item",
            slot = 17,
        },
        [18] = {
            name = "blowtorch",
            price = 1000,
            amount = 50,
            info = {},
            type = "item",
            slot = 18,
        },		
```

## F. OTHER MATTERS

6. If you attend to all of the above steps you will need to restart the server in order for the new added items to be recognised by qb-core. Starting the mz-scrap resource without doing this will cause errors. Please restart your server ensuring that mz-scrap is ensured/starts after qb-core starts (ideally it should just form part of your [qb] folder). Happy scraping!

P.S. Loot tables appear in the server.lua file. They are reasonably self-explanatory - there are no doubt more efficient ways to provide for loot (including by way of drawing to config) which I might include in a later release - but it functions as is for now. Pistol1, 2, 3 and 4 are items that I have previously used to combine into a low tier hand gun in other crafting resources (using lj-inventory or qb-inventory to craft is fine if you know what you are doing). If you are not interested in that, remove that items from the loot table (they are each no more than 1% drop at each tier). 
