include "constants.lua"

local base = piece('base')
local Nanoframe = piece('Nanoframe')

local open = false
local SIG_OPEN = 1
local SIG_TRAIN = 2

local function GetDisabled()
	return Spring.GetUnitIsStunned(unitID) or (Spring.GetUnitRulesParam(unitID,"disarmed") == 1)
end

local function Open()
	if open then
		return
	end
	Signal(SIG_OPEN)
	SetSignalMask(SIG_OPEN)
	open = true
	
	while GetDisabled() do
		Sleep(500)
	end
	
	-- set values
	SetUnitValue(COB.YARD_OPEN, 1)
	SetUnitValue(COB.BUGGER_OFF, 1)
	SetUnitValue(COB.INBUILDSTANCE, 1)
	GG.Script.UnstickFactory(unitID)
end

local function Close()
	if not open then
		return
	end
	Signal(SIG_OPEN)
	SetSignalMask(SIG_OPEN)
	open = false

	-- set values
	SetUnitValue(COB.YARD_OPEN, 0)
	SetUnitValue(COB.BUGGER_OFF, 0)
	SetUnitValue(COB.INBUILDSTANCE, 0)
	
	while GetDisabled() do
		Sleep(500)
	end
end

local function MoveTrain()
	Signal(SIG_TRAIN)
	SetSignalMask(SIG_TRAIN)
end

function script.Create()
	StartThread(Open)	
	--Spring.SetUnitNanoPieces(unitID, {Nano1, Nano2})
end

function script.StopBuilding()
	Signal(SIG_TRAIN)
end

function script.StartBuilding(heading, pitch)
	StartThread(MoveTrain)
end

function script.Activate()
	StartThread(Open)
end

local firstDeactivate = true
function script.Deactivate()
	if firstDeactivate then
		firstDeactivate = false
		return
	end
	StartThread(Close)
end

function script.QueryBuildInfo()
	return Nanoframe
end

function script.Killed(recentDamage, maxHealth)
	local severity = recentDamage / maxHealth
	if (severity <= 0.5) then
		Explode(base, SFX.SHATTER)
		return 1
	end
	Explode(base, SFX.SMOKE + SFX.SHATTER + SFX.FALL)

	return 2
end
            
