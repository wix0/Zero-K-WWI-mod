VFS.Include("LuaRules/Configs/customcmds.h.lua")

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Order and State Panel Positions

-- Commands are placed in their position, with conflicts resolved by pushng those
-- with less priority (higher number = less priority) along the positions if
-- two or more commands want the same position.
-- The command panel is propagated left to right, top to bottom.
-- The state panel is propagate top to bottom, right to left.
-- * States can use posSimple to set a different position when the panel is in
--   four-row mode.
-- * Missing commands have {pos = 1, priority = 100}

local cmdPosDef = {
	-- Commands
	[CMD.STOP]          = {pos = 1, priority = 1},
	[CMD.FIGHT]         = {pos = 1, priority = 2},
	[CMD_RAW_MOVE]      = {pos = 1, priority = 3},
	[CMD.PATROL]        = {pos = 1, priority = 4},
	[CMD.ATTACK]        = {pos = 1, priority = 5},
	[CMD_JUMP]          = {pos = 1, priority = 6},
	[CMD_AREA_GUARD]    = {pos = 1, priority = 10},
	[CMD.AREA_ATTACK]   = {pos = 1, priority = 11},
	
	[CMD_UPGRADE_UNIT]  = {pos = 7, priority = -8},
	[CMD_UPGRADE_STOP]  = {pos = 7, priority = -7},
	[CMD_MORPH]         = {pos = 7, priority = -6},
	
	[CMD_STOP_NEWTON_FIREZONE] = {pos = 7, priority = -4},
	[CMD_NEWTON_FIREZONE]      = {pos = 7, priority = -3},
	
	[CMD.MANUALFIRE]      = {pos = 7, priority = 0.1},
	[CMD_PLACE_BEACON]    = {pos = 7, priority = 0.2},
	[CMD_ONECLICK_WEAPON] = {pos = 7, priority = 0.24},
	[CMD.STOCKPILE]       = {pos = 7, priority = 0.25},
	[CMD_ABANDON_PW]      = {pos = 7, priority = 0.3},
	[CMD_GBCANCEL]        = {pos = 7, priority = 0.4},
	[CMD_STOP_PRODUCTION] = {pos = 7, priority = 0.7},
	
	[CMD_BUILD]         = {pos = 7, priority = 0.8},
	[CMD_AREA_MEX]      = {pos = 7, priority = 1},
	[CMD.REPAIR]        = {pos = 7, priority = 2},
	[CMD.RECLAIM]       = {pos = 7, priority = 3},
	[CMD.RESURRECT]     = {pos = 7, priority = 4},
	[CMD.WAIT]          = {pos = 7, priority = 5},
	[CMD_FIND_PAD]      = {pos = 7, priority = 6},
	
	[CMD.LOAD_UNITS]    = {pos = 7, priority = 7},
	[CMD.UNLOAD_UNITS]  = {pos = 7, priority = 8},
	[CMD_RECALL_DRONES] = {pos = 7, priority = 10},
	
	[CMD_AREA_TERRA_MEX]= {pos = 13, priority = 1},
	[CMD_UNIT_SET_TARGET_CIRCLE] = {pos = 13, priority = 2},
	[CMD_UNIT_CANCEL_TARGET]     = {pos = 13, priority = 3},
	[CMD_EMBARK]        = {pos = 13, priority = 5},
	[CMD_DISEMBARK]     = {pos = 13, priority = 6},
	[CMD_EXCLUDE_PAD]   = {pos = 13, priority = 7},

	-- States
	[CMD.REPEAT]              = {pos = 1, priority = 1},
	[CMD_RETREAT]             = {pos = 1, priority = 2},
	
	[CMD.MOVE_STATE]          = {pos = 6, posSimple = 5, priority = 1},
	[CMD.FIRE_STATE]          = {pos = 6, posSimple = 5, priority = 2},
	[CMD_FACTORY_GUARD]       = {pos = 6, posSimple = 5, priority = 3},
	
	[CMD_SELECTION_RANK]      = {pos = 6, posSimple = 1, priority = 1.5},
	
	[CMD_PRIORITY]            = {pos = 1, priority = 10},
	[CMD_MISC_PRIORITY]       = {pos = 1, priority = 11},
	[CMD_CLOAK_SHIELD]        = {pos = 1, priority = 11.5},
	[CMD_WANT_CLOAK]          = {pos = 1, priority = 11.6},
	[CMD_WANT_ONOFF]          = {pos = 1, priority = 13},
	[CMD_PREVENT_BAIT]        = {pos = 1, priority = 13.1},
	[CMD_PREVENT_OVERKILL]    = {pos = 1, priority = 13.2},
	[CMD_FIRE_TOWARDS_ENEMY]  = {pos = 1, priority = 13.25},
	[CMD_FIRE_AT_SHIELD]      = {pos = 1, priority = 13.3},
	[CMD.TRAJECTORY]          = {pos = 1, priority = 14},
	[CMD_UNIT_FLOAT_STATE]    = {pos = 1, priority = 15},
	[CMD_TOGGLE_DRONES]       = {pos = 1, priority = 16},
	[CMD_PUSH_PULL]           = {pos = 1, priority = 17},
	[CMD.IDLEMODE]            = {pos = 1, priority = 18},
	[CMD_AP_FLY_STATE]        = {pos = 1, priority = 19},
	[CMD_AUTO_CALL_TRANSPORT] = {pos = 1, priority = 21},
}

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Factory Units Panel Positions

-- These positions must be distinct
-- Locally defined intermediate positions to cut down repetitions.
local unitTypes = {
	_1x1            = {order = 1, row = 1, col = 1},
	_1x2            = {order = 2, row = 1, col = 2},
	_1x3            = {order = 3, row = 1, col = 3},
	_1x4            = {order = 4, row = 1, col = 4},
	_1x5         = {order = 5, row = 1, col = 5},
	_1x6       = {order = 6, row = 1, col = 6},

	-- note: row 2 column 1 purposefully skipped, since
	-- that allows giving facs Attack orders via hotkey
	_2x2    = {order = 7, row = 2, col = 2},
	_2x3        = {order = 8, row = 2, col = 3},
	_2x4 = {order = 9, row = 2, col = 4},
	_2x5         = {order = 10, row = 2, col = 5},
	_2x6         = {order = 11, row = 2, col = 6},
}

local factoryUnitPosDef = {
	barracks = {
		brengineer            = unitTypes._1x1,
		brinfrifle            = unitTypes._1x2,
		gerinfrifle           = unitTypes._1x3,
		frinfrifle            = unitTypes._1x4,
	},
	tankfactory = {
		gertanka7v            = unitTypes._1x1,
		brtankmarkiv          = unitTypes._1x2,
	},
	hangar = {
		gerplanefokker        = unitTypes._1x1,
	},
	factorycloak = {
		cloakcon          = unitTypes._1x1,
		cloakraid         = unitTypes._1x2,
		cloakheavyraid    = unitTypes._2x2,
		cloakriot         = unitTypes._1x4,
		cloakskirm        = unitTypes._1x3,
		cloakarty         = unitTypes._1x6,
		cloakaa           = unitTypes._2x3,
		cloakassault      = unitTypes._1x5,
		cloaksnipe        = unitTypes._2x4,
		cloakbomb         = unitTypes._2x5,
		cloakjammer       = unitTypes._2x6,
	},
	factoryshield = {
		shieldcon         = unitTypes._1x1,
		shieldscout       = unitTypes._2x2,
		shieldraid        = unitTypes._1x2,
		shieldriot        = unitTypes._1x4,
		shieldskirm       = unitTypes._1x3,
		shieldarty        = unitTypes._1x6,
		shieldaa          = unitTypes._2x3,
		shieldassault     = unitTypes._1x5,
		shieldfelon       = unitTypes._2x4,
		shieldbomb        = unitTypes._2x5,
		shieldshield      = unitTypes._2x6,
	},
	factoryveh = {
		vehcon            = unitTypes._1x1,
		vehscout          = unitTypes._2x2,
		vehraid           = unitTypes._1x2,
		vehriot           = unitTypes._1x4,
		vehsupport        = unitTypes._1x3,
		veharty           = unitTypes._1x6,
		vehaa             = unitTypes._2x3,
		vehassault        = unitTypes._1x5,
		vehheavyarty      = unitTypes._2x4,
		vehcapture        = unitTypes._2x5,
	},

	factoryhover = {
		hovercon          = unitTypes._1x1,
		hoverraid         = unitTypes._1x2,
		hoverheavyraid    = unitTypes._2x2,
		hoverdepthcharge  = unitTypes._2x5,
		hoverriot         = unitTypes._1x4,
		hoverskirm        = unitTypes._1x3,
		hoverarty         = unitTypes._1x6,
		hoveraa           = unitTypes._2x3,
		hoverassault      = unitTypes._1x5,
	},
	factorygunship = {
		gunshipcon        = unitTypes._1x1,
		gunshipemp        = unitTypes._2x2,
		gunshipraid       = unitTypes._1x2,
		gunshipheavyskirm = unitTypes._1x6,
		gunshipskirm      = unitTypes._1x3,
		gunshiptrans      = unitTypes._2x5,
		gunshipheavytrans = unitTypes._2x6,
		gunshipaa         = unitTypes._2x3,
		gunshipassault    = unitTypes._1x5,
		gunshipkrow       = unitTypes._2x4,
		gunshipbomb       = unitTypes._1x4,
	},
	factoryplane = {
		planecon          = unitTypes._1x1,
		planefighter      = unitTypes._1x2,
		bomberriot        = unitTypes._1x4,
		bomberstrike      = unitTypes._1x3,
		-- No Plane Artillery
		planeheavyfighter = unitTypes._2x2,
		planescout        = unitTypes._2x6,
		planelightscout   = unitTypes._1x6,
		bomberprec        = unitTypes._1x5,
		bomberheavy       = unitTypes._2x4,
		bomberdisarm      = unitTypes._2x5,
	},
	factoryspider = {
		spidercon         = unitTypes._1x1,
		spiderscout       = unitTypes._1x2,
		spiderriot        = unitTypes._1x4,
		spiderskirm       = unitTypes._1x3,
		-- No Spider Artillery
		spideraa          = unitTypes._2x3,
		spideremp         = unitTypes._2x2,
		spiderassault     = unitTypes._1x5,
		spidercrabe       = unitTypes._2x4,
		spiderantiheavy   = unitTypes._2x5,
	},
	factoryjump = {
		jumpcon           = unitTypes._1x1,
		jumpscout         = unitTypes._2x2,
		jumpraid          = unitTypes._1x2,
		jumpblackhole     = unitTypes._1x4,
		jumpskirm         = unitTypes._1x3,
		jumparty          = unitTypes._1x6,
		jumpaa            = unitTypes._2x3,
		jumpassault       = unitTypes._1x5,
		jumpsumo          = unitTypes._2x4,
		jumpbomb          = unitTypes._2x5,
	},
	factorytank = {
		tankcon           = unitTypes. CONSTRUCTOR,
		tankraid          = unitTypes._2x2,
		tankheavyraid     = unitTypes._1x2,
		tankriot          = unitTypes._1x4,
		tankarty          = unitTypes._1x6,
		tankheavyarty     = unitTypes._2x6,
		tankaa            = unitTypes._2x3,
		tankassault       = unitTypes._1x5,
		tankheavyassault  = unitTypes._2x4,
	},
	factoryamph = {
		amphcon           = unitTypes._1x1,
		amphraid          = unitTypes._1x2,
		amphimpulse       = unitTypes._2x2,
		amphriot          = unitTypes._1x4,
		amphfloater       = unitTypes._1x3,
		amphsupport       = unitTypes._1x5,
		amphaa            = unitTypes._2x3,
		amphassault       = unitTypes._2x4,
		amphlaunch        = unitTypes._1x6,
		amphbomb          = unitTypes._2x5,
		amphtele          = unitTypes._2x6,
	},
	factoryship = {
		shipcon           = unitTypes._1x1,
		shiptorpraider    = unitTypes._1x2,
		shipriot          = unitTypes._1x4,
		shipskirm         = unitTypes._1x3,
		shiparty          = unitTypes._1x6,
		shipaa            = unitTypes._2x3,
		shipscout         = unitTypes._2x2,
		shipassault       = unitTypes._1x5,
		-- No Ship HEAVY_SOMETHING (yet)
		subraider         = unitTypes._2x5,
	},
	pw_bomberfac = {
		bomberriot        = unitTypes._1x4,
		bomberprec        = unitTypes._1x5,
		bomberheavy       = unitTypes._2x4,
		bomberdisarm      = unitTypes._2x5,
	},
	pw_dropfac = {
		gunshiptrans      = unitTypes._2x5,
		gunshipheavytrans = unitTypes._2x6,
	},
}

-- Factory plates copy their parents.
factoryUnitPosDef.platecloak   = Spring.Utilities.CopyTable(factoryUnitPosDef.factorycloak)
factoryUnitPosDef.plateshield  = Spring.Utilities.CopyTable(factoryUnitPosDef.factoryshield)
factoryUnitPosDef.plateveh     = Spring.Utilities.CopyTable(factoryUnitPosDef.factoryveh)
factoryUnitPosDef.platehover   = Spring.Utilities.CopyTable(factoryUnitPosDef.factoryhover)
factoryUnitPosDef.plategunship = Spring.Utilities.CopyTable(factoryUnitPosDef.factorygunship)
factoryUnitPosDef.plateplane   = Spring.Utilities.CopyTable(factoryUnitPosDef.factoryplane)
factoryUnitPosDef.platespider  = Spring.Utilities.CopyTable(factoryUnitPosDef.factoryspider)
factoryUnitPosDef.platejump    = Spring.Utilities.CopyTable(factoryUnitPosDef.factoryjump)
factoryUnitPosDef.platetank    = Spring.Utilities.CopyTable(factoryUnitPosDef.factorytank)
factoryUnitPosDef.plateamph    = Spring.Utilities.CopyTable(factoryUnitPosDef.factoryamph)
factoryUnitPosDef.plateship    = Spring.Utilities.CopyTable(factoryUnitPosDef.factoryship)

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Construction Panel Structure Positions

-- These positions must be distinct

local factory_commands = {
	factorycloak      = {order = 1, row = 1, col = 1},
	factoryshield     = {order = 2, row = 1, col = 2},
	factoryveh        = {order = 3, row = 1, col = 3},
	factoryhover      = {order = 4, row = 1, col = 4},
	factorygunship    = {order = 5, row = 1, col = 5},
	factoryplane      = {order = 6, row = 1, col = 6},
	factoryspider     = {order = 7, row = 2, col = 1},
	factoryjump       = {order = 8, row = 2, col = 2},
	factorytank       = {order = 9, row = 2, col = 3},
	factoryamph       = {order = 10, row = 2, col = 4},
	factoryship       = {order = 11, row = 2, col = 5},
	striderhub        = {order = 12, row = 2, col = 6},
	[CMD_BUILD_PLATE] = {order = 13, row = 3, col = 4},
	barracks          = {order = 14, row = 3, col = 1},
	tankfactory       = {order = 15, row = 3, col = 2},
	hangar            = {order = 16, row = 3, col = 3},
}

local econ_commands = {
	staticmex         = {order = 1, row = 1, col = 1},
	energywind        = {order = 2, row = 2, col = 1},
	energysolar       = {order = 3, row = 2, col = 2},
	energygeo         = {order = 4, row = 2, col = 3},
	energyfusion      = {order = 5, row = 2, col = 4},
	energysingu       = {order = 6, row = 2, col = 5},
	staticstorage     = {order = 7, row = 3, col = 1},
	energypylon       = {order = 8, row = 3, col = 2},
	staticcon         = {order = 9, row = 3, col = 3},
	staticrearm       = {order = 10, row = 3, col = 4},
}

local defense_commands = {
	turretlaser       = {order = 2, row = 1, col = 1},
	turretmissile     = {order = 1, row = 1, col = 2},
	turretriot        = {order = 2, row = 1, col = 3},
	turretemp         = {order = 3, row = 1, col = 4},
	turretgauss       = {order = 5, row = 1, col = 5},
	turretheavylaser  = {order = 6, row = 1, col = 6},

	turretaaclose     = {order = 9, row = 2, col = 1},
	turretaalaser     = {order = 10, row = 2, col = 2},
	turretaaflak      = {order = 11, row = 2, col = 3},
	turretaafar       = {order = 12, row = 2, col = 4},
	turretaaheavy     = {order = 13, row = 2, col = 5},
	trench      	  = {order = 20, row = 2, col = 6},

	turretimpulse     = {order = 4, row = 3, col = 1},
	turrettorp        = {order = 14, row = 3, col = 2},
	turretheavy       = {order = 16, row = 3, col = 3},
	turretantiheavy   = {order = 17, row = 3, col = 4},
	starfort          = {order = 18, row = 3, col = 5},
	pillbox      	  = {order = 19, row = 3, col = 6},
}

local special_commands = {
	staticradar       = {order = 10, row = 1, col = 1},
	staticjammer      = {order = 12, row = 1, col = 2},
	staticheavyradar  = {order = 14, row = 1, col = 3},
	staticmissilesilo = {order = 15, row = 1, col = 4},
	staticantinuke    = {order = 16, row = 1, col = 5},
	staticarty        = {order = 2, row = 2, col = 1},
	staticheavyarty   = {order = 3, row = 2, col = 2},
	staticnuke        = {order = 4, row = 2, col = 3},
	zenith            = {order = 5, row = 2, col = 4},
	raveparty         = {order = 6, row = 2, col = 5},
	mahlazer          = {order = 7, row = 2, col = 6},
	[CMD_RAMP]        = {order = 16, row = 3, col = 1},
	[CMD_LEVEL]       = {order = 17, row = 3, col = 2},
	[CMD_RAISE]       = {order = 18, row = 3, col = 3},
	[CMD_RESTORE]     = {order = 19, row = 3, col = 4},
	[CMD_SMOOTH]      = {order = 20, row = 3, col = 5},
}

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

return cmdPosDef, factoryUnitPosDef, factory_commands, econ_commands, defense_commands, special_commands

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
