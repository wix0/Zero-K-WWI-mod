include "constants.lua"

--pieces
local base, flare, rotor, turret, smoke
	= piece("base", "flare",  "rotor", "turret", "smoke" )

local IN_LOS = {inlos = true}

--variables
local shotCycle = 0
local isMoving = false

local MOVE_THRESHOLD = 8

local OKP_DAMAGE = tonumber(UnitDefs[unitDefID].customParams.okp_damage)

----------------------------------------------------------

local CMD_ONECLICK_WEAPON = Spring.Utilities.CMD.ONECLICK_WEAPON

local function RetreatThread()
	Sleep(800)
	local specialReloadState = Spring.GetUnitRulesParam(unitID,"specialReloadFrame")
	if (not specialReloadState or (specialReloadState <= Spring.GetGameFrame())) then
		Spring.GiveOrderToUnit(unitID, CMD.INSERT, {0, CMD_ONECLICK_WEAPON, CMD.OPT_INTERNAL,}, CMD.OPT_ALT)
	end
end

function RetreatFunction()
	StartThread(RetreatThread)
end

----------------------------------------------------------

function OnLoadGame()
	Spring.SetUnitRulesParam(unitID, "selfMoveSpeedChange", 1)
	GG.UpdateUnitAttributes(unitID)
end

local function MotionControl()
	local lastMoving
	while true do
		if lastMoving ~= isMoving then
			lastMoving = isMoving
			if isMoving then
				Spin(rotor, y_axis, 30, 6)
			else
				StopSpin(rotor, y_axis, 6)
			end
		--Turn(rotor, y_axis, math.rad(360), math.rad(300))
		--
		--Turn(rotor, y_axis, math.rad(0), math.rad(300))
		end
		Sleep(500)
	end
end

----------------------------------------------------------

local WING_DISTANCE = 8

function script.Create()
	--Spin(rotor, y_axis, math.rad(2000))
	--StartThread(MotionControl)
	--StartThread(GG.Script.SmokeUnit, unitID, base)
end

function script.StartMoving()
	Spin(rotor, y_axis, 30, 1)
	isMoving = true
end

function script.StopMoving()
	StopSpin(rotor, y_axis, 0.5)
	isMoving = false
end

function script.QueryWeapon(num)
	return flare
end

function script.AimFromWeapon(num)
	return base
end

function script.AimWeapon(num, heading, pitch)
	if not (GetUnitValue(COB.CRASHING) == 1) and isMoving then
		local x,y,z = Spring.GetUnitVelocity(unitID)
		return (x ~=0 or z ~= 0)
	end
	return false
end

function script.FireWeapon(num)
	if num == 1 then
		shotCycle = 1 - shotCycle
		EmitSfx(flare, GG.Script.UNIT_SFX3)
	elseif num == 2 then
		EmitSfx(flare, GG.Script.UNIT_SFX3)
	elseif num == 3 then
		EmitSfx(flare, GG.Script.UNIT_SFX2)
	end
end

function script.BlockShot(num, targetID)
	if (GetUnitValue(COB.CRASHING) == 1) then
		return true
	end
	if num == 2 then
		return GG.Script.OverkillPreventionCheck(unitID, targetID, OKP_DAMAGE, 530, 38, 0.1, false, 100)
	end
	return false
end

function script.Killed(recentDamage, maxHealth)
	local severity = (recentDamage/maxHealth)
	if severity < 0.5 or (Spring.GetUnitMoveTypeData(unitID).aircraftState == "crashing") then
		Explode(base, SFX.NONE)
		--Explode(smoke, SFX.SFX.SMOKE + SFX.FIRE + SFX.EXPLODE + SFX.SHATTER + SFX.EXPLODE_ON_HIT)
		return 1
	else
		Explode(base, SFX.NONE)
		--Explode(smoke, SFX.SFX.SMOKE + SFX.FIRE + SFX.EXPLODE + SFX.SHATTER + SFX.EXPLODE_ON_HIT)
		return 2
	end
end
