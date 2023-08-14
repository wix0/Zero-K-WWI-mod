include "constants.lua"
include "rockPiece.lua"

local base, turret, firepoint = piece('tank', 'turret', 'Muzzle')

function script.StartMoving()
end

function script.StopMoving()
end

local rockData

local gun = 1
local lastHeading = 0
function script.AimFromWeapon(num)
	return turret
end

function script.QueryWeapon(num)
	return firepoint
end

local function BarrelRecoil(thisGun)
	EmitSfx(firepoint, 1024)
	--Move (barrels[thisGun], z_axis, -10, 75)
	Sleep (130)
end

function script.Shot(num)
	StartThread(GG.ScriptRock.Rock, rockData[z_axis], lastHeading, 0.04)
	StartThread(GG.ScriptRock.Rock, rockData[x_axis], lastHeading - (math.pi/2), 0.04)
	
	StartThread(BarrelRecoil, 1)
end

local function RestoreAfterDelay()
	SetSignalMask(2)
	Sleep (8000)

	Turn(turret, y_axis, 0, 0.3)
end

local TURRET_TURN_SPEED = math.rad(70)
local TURRET_PITCH_SPEED = math.rad(50)
function script.AimWeapon(num, heading, pitch)
	Signal(2)
	SetSignalMask(2)

	Turn(turret, z_axis, heading, TURRET_TURN_SPEED)
	WaitForTurn(turret, z_axis)

	StartThread(RestoreAfterDelay)
	lastHeading = heading

	return true
end

local spGetUnitSeparation = Spring.GetUnitSeparation
function script.BlockShot(num, targetID)
	if Spring.ValidUnitID(targetID) then
		-- TTL at max range determined to be 37f empirically
		-- at projectile speed 255 elmo/s and 360 range
		local framesETA = 37 * (spGetUnitSeparation(unitID, targetID) or 0) / 360
		return GG.OverkillPrevention_CheckBlock(unitID, targetID, 640.1, framesETA, false, false, true)
	end
	return false
end

function script.Create()
	rockData = GG.ScriptRock.InitializeRock({
		[x_axis] = {
			piece = base,
			speed = 3,
			decay = -0.2,
			minPos = 0.01,
			maxPos = 1,
			signal = 4,
			axis = x_axis,
		},
		[z_axis] = {
			piece = base,
			speed = 6,
			decay = -0.2,
			minPos = 0.01,
			maxPos = 1,
			signal = 8,
			axis = z_axis,
		},
	})
	StartThread(GG.Script.SmokeUnit, unitID, {body, turret}, 2)
end

local explodables = {turret}
function script.Killed(recentDamage, maxHealth)
	local severity = recentDamage / maxHealth
	local brutal = (severity > 0.5)

	local sfx = SFX
	local effect = sfx.FALL + (brutal and (sfx.SMOKE + sfx.FIRE) or 0)
	for i = 1, #explodables do
		if math.random() < severity then
			Explode (explodables[i], effect)
		end
	end

	if not brutal then
		return 1
	else
		Explode (base, sfx.SHATTER)
		return 2
	end
end
