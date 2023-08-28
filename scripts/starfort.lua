include "constants.lua"

local spGetUnitRulesParam 	= Spring.GetUnitRulesParam

local base = piece 'base'

local turret1 = piece 'rurett1'
local barrel1 = piece 'gun1'
local flare1 = piece 'flare1'

local turret2 = piece 'rurett2'
local barrel2 = piece 'gun2'
local flare2 = piece 'flare2'

local turret3 = piece 'rurett3'
local barrel3 = piece 'gun3'
local flare3 = piece 'flare3'

local turret4 = piece 'rurett4'
local barrel4 = piece 'gun4'
local flare4 = piece 'flare4'

local gun_1 = 1

local gunPieces = {
	{ turret = turret1, barrel = barrel1, flare = flare1 },
	{ turret = turret2, barrel = barrel2, flare = flare2 },
	{ turret = turret3, barrel = barrel3, flare = flare3 },
	{ turret = turret4, barrel = barrel4, flare = flare4 }
}

-- Signal definitions
local SIG_AIM = 2

local RECOIL_DISTANCE = -1.5
local RECOIL_RESTORE_SPEED = 1.5

local smokePiece = {base, turret1}

function script.Create()
	StartThread(GG.Script.SmokeUnit, unitID, smokePiece)
end

function script.AimWeapon(num, heading, pitch)
	Signal(SIG_AIM)
	SetSignalMask(SIG_AIM)
	Turn(turret1, z_axis, heading + math.rad(270), math.rad(75))
	Turn(turret2, z_axis, heading + math.rad(180), math.rad(75))
	Turn(turret3, z_axis, heading + math.rad(90), math.rad(75))
	Turn(turret4, z_axis, heading, math.rad(75))

	Turn(barrel1, x_axis, -pitch, math.rad(30))
	Turn(barrel2, x_axis, -pitch, math.rad(30))
	Turn(barrel3, x_axis, -pitch, math.rad(30))
	Turn(barrel4, x_axis, -pitch, math.rad(30))

	WaitForTurn(turret1, z_axis)
	WaitForTurn(turret2, z_axis)
	WaitForTurn(turret3, z_axis)
	WaitForTurn(turret4, z_axis)

	WaitForTurn(barrel1, x_axis)
	WaitForTurn(barrel2, x_axis)
	WaitForTurn(barrel3, x_axis)
	WaitForTurn(barrel4, x_axis)
	return true
end

function script.Shot(num)
	gun_1 = gun_1 + 1
	if gun_1 > 4 then
		gun_1 = 1
	end
	
	EmitSfx(gunPieces[gun_1].flare, 1024)
	-- TODO: different recoil for each gun
	Move(gunPieces[gun_1].barrel, y_axis, -RECOIL_DISTANCE)
	Move(gunPieces[gun_1].barrel, y_axis, 0, RECOIL_RESTORE_SPEED)
end

function script.QueryWeapon(num)
	return gunPieces[gun_1].flare
end

function script.AimFromWeapon(num)
	return gunPieces[gun_1].barrel
end