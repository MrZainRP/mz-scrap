### MZ-SCRAP - a skill-based, scraping job for qbox and qb-core FiveM servers

By Mr_Zain: https://dsc.gg/mzresources

## Introduction 
- Updated for qbox - configured with ox_target and ox_inventory;
- Advanced debug functionality via config to quickly track down errors even if the code is modified; 
- Updated reward outputs to avoid exploitation even with open-source code (for both scraping and crafting functionality);
- Self-explanatory and broad config file to help easily set up a custom experience without having to have extensive coding experience; 
- Optimised code to remove depricated functions and old loops; 

## Description
- A scrap job designed to allow players to interact with scrap found in the base GTA V models, particularly the scrap yard south of the main city, the car and plane scrap yard found South of the main part of Sandy Shores and (to a lesser extent) the scrap yard found in the heart of Paleto; 
- Scraping commences with the player using their hands, then using a screwdriver, then using a blowtorch. Using better equipment improves the prospects of obtaining better scrap car parts;
- The higher the level of the player, the better the chance of getting more scrap items when scraping;
- Each successful scrap yields low-tier items + low-tier experience (customisable via config);
- Mid-tier scrapping involves the use of a screwdriver. If using a skill check, the skill check is slightly harder, takes slightly longer and produces mid-tier items and mid-tier XP;
- High-tier scrapping involves the use of a blowtorch. scrapping function is, again, slightly harder, takes slightly longer and produces top-tier items;
- Certain items obtained from scrapping can be broken down into materials used for crafting. 

## Dependencies
- mz-skills: https://github.com/MrZainRP/mz-skills
- ps-ui: https://github.com/Project-Sloth/ps-ui
- bl-ui: https://github.com/Byte-Labs-Studio/bl_ui

### Installation Instruction

## A. MZ-SKILLS

1. Ensure that mz-skills forms part of your running scripts if using this script with mz-skills. 

2. Run the "skills.sql" sql file and open the database. (This will add a data table to the existing "players" database which will hold the skill value for "scrapping" as well as other jobs)

## B. SETTING UP INVENTORY ITEMS

3A. Add the following to your ox_inventory/data/items.lua file:

-- MZ-SCRAP
    ['blowtorch'] = {
        label = 'Blow Torch',
        description = 'Ooo hot...',
        weight = 125,
        client = {
            image = "blowtorch.png",
        }
    },
    ['screwdriver'] = {
        label = 'Screwdriverset',
        description = 'A Screw driver',
        weight = 125,
        stack = false,
        client = {
            image = "screwdriver.png",
        }
    },
    ['airfilter'] = {
        label = 'Air Filter',
        weight = 100,
        stack = true,
        description = "A car air filter.",
        client = {
            image = "airfilter.png",
        }
    },
    ['carbattery'] = {
        label = 'Car Battery',
        weight = 100,
        stack = true,
        description = "A car battery.",
        client = {
            image = "carbattery.png",
        }
    },
    ['cardoor'] = {
        label = 'Car Door',
        weight = 100,
        stack = true,
        description = "A car door.",
        client = {
            image = "cardoor.png",
        }
    },
    ['carengine'] = {
        label = 'Car Engine',
        weight = 100,
        stack = true,
        description = "A car engine.",
        client = {
            image = "carengine.png",
        }
    },
    ['carhood'] = {
        label = 'Car Hood',
        weight = 100,
        stack = true,
        description = "A car bonnet.",
        client = {
            image = "carhood.png",
        }
    },
    ['carradio'] = {
        label = 'Car Radio',
        weight = 100,
        stack = true,
        description = "A car radio.",
        client = {
            image = "carradio.png",
        }
    },
    ['gearshift'] = {
        label = 'Gear Shift',
        weight = 100,
        stack = true,
        description = "A car gear shift.",
        client = {
            image = "gearshift.png",
        }
    },
    ['oldtyre'] = {
        label = 'Old Tyre',
        weight = 100,
        stack = true,
        description = "An old Tyre, looks like it has a bit of wear on it...",
        client = {
            image = "oldtyre.png",
        }
    },
    ['sparkplugs'] = {
        label = 'Spark Plugs',
        weight = 100,
        stack = true,
        description = "Car spark plugs.",
        client = {
            image = "sparkplugs.png",
        }
    },
    ['spoiler'] = {
        label = 'Spoiler',
        weight = 100,
        stack = true,
        description = "An old school car spoiler.",
        client = {
            image = "spoiler.png",
        }
    },

3B. If still using qb-core: Add the following to qb-core/shared/items.lua:

```lua
	['screwdriver'] 				 = {['name'] = 'screwdriver', 			  		['label'] = 'Screwdriver', 				['weight'] = 100, 		['type'] = 'item', 		['image'] = 'screwdriver.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'A flathead screwdriver. I mean sure the handle is a bit worn but this thing probably works.'},
	['blowtorch'] 				 	 = {['name'] = 'blowtorch', 			    	['label'] = 'Blowtorch', 				['weight'] = 3500, 		['type'] = 'item', 		['image'] = 'blowtorch.png', 			['unique'] = true, 		['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'A high propane instrument used for welding and other things...'},
	['wd40'] 				 	 	 = {['name'] = 'wd40', 			    			['label'] = 'WD-40', 					['weight'] = 250, 		['type'] = 'item', 		['image'] = 'wd40.png', 				['unique'] = true, 		['useable'] = false, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'A chemical compound with multiple purposes, including the removal of corrosion.'},

	["pistol1"] 					 = {["name"] = "pistol1", 						["label"] = "Pistol Grip", 				["weight"] = 100, 		["type"] = "item", 		["image"] = "pistol1.png", 				["unique"] = false, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "The barrel of a Walther P-99 Pistol."},
	["pistol2"] 					 = {["name"] = "pistol2", 						["label"] = "Slide Assembly", 			["weight"] = 100, 		["type"] = "item", 		["image"] = "pistol2.png", 				["unique"] = false, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "The frame of a Walther P-99 Pistol."},
	["pistol3"] 					 = {["name"] = "pistol3", 						["label"] = "Slide", 					["weight"] = 100, 		["type"] = "item", 		["image"] = "pistol3.png", 				["unique"] = false, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "The grip of a Walther P-99 Pistol."},
	["pistol4"] 					 = {["name"] = "pistol4", 						["label"] = "Pistol Chassis", 			["weight"] = 100, 		["type"] = "item", 		["image"] = "pistol4.png", 				["unique"] = false, 		["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = "The chassis of a Walther P-99 Pistol."},
	['electronicscrap'] 			 = {['name'] = 'electronicscrap', 			    ['label'] = 'Electronic Scrap', 		['weight'] = 100, 		['type'] = 'item', 		['image'] = 'electronics.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'A couple of wires and a circuit board, might be able to do something with this?'},

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
```

4. Add the images in the "images" folder to your inventory images source (for ox_inventory - web/images folder).

## C. SUPPORT

5. Extended support for mz-resources has ended. Limited support is available via Discord: https://dsc.gg/mzresources 

6. When seeking support, please address the following questions and ensure you are seeking support in the correct sub-forum if possible. This will allow myself and others to address your concerns quicker than would otherwise be the case.

- A. What is the issue? What were you doing to cause the issue? 

- B. Have you checked for console errors? If yes, please provide them. If not, please check both F8 and server sided consoles for error messages. 

- C. Have you restarted the server to see if console errors arise upon loading the resource? Please do this and provide screenshots of your console.

- D. What have you done to try and fix the issue? 

- E. Do you have any evidence to show what the issue is? (Screengrabs or short clips are very useful in working out how the error is caused in the first place - which makes finding a fix a lot easier).

Failure to provide the detail set out above will simply mean that time needs to be spent working out what the issue is in the first place rather than responding to it.
