include "constants.lua"

-- pieces
local base = piece 'base'
local pelvis = piece 'pelvis'
local turret = piece 'turret'
local torso = piece 'torso'
local head = piece 'head'
local armhold = piece 'armhold'
local ruparm = piece 'ruparm'
local rloarm = piece 'rloarm'
local luparm = piece 'luparm'
local lloarm = piece 'lloarm'
local rupleg = piece 'rupleg'
local lupleg = piece 'lupleg'
local lloleg = piece 'lloleg'
local rloleg = piece 'rloleg'
local rfoot = piece 'rfoot'
local lfoot = piece 'lfoot'
local gun = piece 'gun'
local flare = piece 'flare'
local rhand = piece 'rhand'
local lhand = piece 'lhand'
local pelvis2 = piece 'pelvis2'
local turret2 = piece 'turret2'
local torso2 = piece 'torso2'
local head2 = piece 'head2'
local armhold2 = piece 'armhold2'
local ruparm2 = piece 'ruparm2'
local rloarm2 = piece 'rloarm2'
local luparm2 = piece 'luparm2'
local lloarm2 = piece 'lloarm2'
local rupleg2 = piece 'rupleg2'
local lupleg2 = piece 'lupleg2'
local lloleg2 = piece 'lloleg2'
local rloleg2 = piece 'rloleg2'
local rfoot2 = piece 'rfoot2'
local lfoot2 = piece 'lfoot2'
local rhand2 = piece 'rhand2'
local lhand2 = piece 'lhand2'
local gunbott = piece 'gunbott'

local smokePiece = {torso}

local SIG_RESTORE = 16
local SIG_AIM = 2
local SIG_AIM_2 = 4
local SIG_WALK = 8


local shieldOn = false
local dead = false
local bMoving = false
local bAiming = false
local crouching = false

local function basePose()
	crouching = false
	Move(base, z_axis, 0.0)
	Move(gun, x_axis, 0.0)
	Move(gun, y_axis, 0.0)
	Move(gun, z_axis, 0.0)
	Move(gunbott, x_axis, 0.0)
	Move(gunbott, y_axis, 0.0)
	Move(gunbott, z_axis, 0.0)
	Move(pelvis, y_axis, 0.0)
	Move(pelvis2, x_axis, 0.0)
	Move(pelvis2, y_axis, 0.0)


	Turn(armhold, x_axis, 0.0)
	Turn(armhold, y_axis, 0.0)
	Turn(armhold, z_axis, 0.0)
	Turn(armhold2, x_axis, 0.0)
	Turn(armhold2, y_axis, 0.0)
	Turn(armhold2, z_axis, 0.0)
	Turn(base, x_axis, 0.0)
	Turn(base, y_axis, 0.0)
	Turn(base, z_axis, 0.0)
	Turn(gun, x_axis, 0.0)
	Turn(gun, y_axis, 0.0)
	Turn(gun, z_axis, 0.0)
	Turn(gunbott, x_axis, 0.0)
	Turn(gunbott, y_axis, 0.0)
	Turn(gunbott, z_axis, 0.0)
	Turn(head, x_axis, 0.0)
	Turn(head, y_axis, 0.0)
	Turn(head, z_axis, 0.0)
	Turn(head2, x_axis, 0.0)
	Turn(head2, y_axis, 0.0)
	Turn(head2, z_axis, 0.0)
	Turn(lfoot, x_axis, 0.0)
	Turn(lfoot, y_axis, 0.0)
	Turn(lfoot, z_axis, 0.0)
	Turn(lfoot2, x_axis, 0.0)
	Turn(lfoot2, y_axis, 0.0)
	Turn(lfoot2, z_axis, 0.0)
	Turn(lhand, x_axis, 0.0)
	Turn(lhand, y_axis, 0.0)
	Turn(lhand, z_axis, 0.0)
	Turn(lhand2, x_axis, 0.0)
	Turn(lhand2, y_axis, 0.0)
	Turn(lhand2, z_axis, 0.0)
	Turn(lloarm, x_axis, 0.0)
	Turn(lloarm, y_axis, 0.0)
	Turn(lloarm, z_axis, 0.0)
	Turn(lloarm2, x_axis, 0.0)
	Turn(lloarm2, y_axis, 0.0)
	Turn(lloarm2, z_axis, 0.0)
	Turn(lloleg, x_axis, 0.0)
	Turn(lloleg, y_axis, 0.0)
	Turn(lloleg, z_axis, 0.0)
	Turn(lloleg2, x_axis, 0.0)
	Turn(lloleg2, y_axis, 0.0)
	Turn(lloleg2, z_axis, 0.0)
	Turn(luparm, x_axis, 0.0)
	Turn(luparm, y_axis, 0.0)
	Turn(luparm, z_axis, 0.0)
	Turn(luparm2, x_axis, 0.0)
	Turn(luparm2, y_axis, 0.0)
	Turn(luparm2, z_axis, 0.0)
	Turn(lupleg, x_axis, 0.0)
	Turn(lupleg, y_axis, 0.0)
	Turn(lupleg, z_axis, 0.0)
	Turn(lupleg2, x_axis, 0.0)
	Turn(lupleg2, y_axis, 0.0)
	Turn(lupleg2, z_axis, 0.0)
	Turn(pelvis, x_axis, 0.0)
	Turn(pelvis, y_axis, 0.0)
	Turn(pelvis, z_axis, 0.0)
	Turn(pelvis2, x_axis, 0.0)
	Turn(pelvis2, y_axis, 0.0)
	Turn(pelvis2, z_axis, 0.0)
	Turn(rfoot, x_axis, 0.0)
	Turn(rfoot, y_axis, 0.0)
	Turn(rfoot, z_axis, 0.0)
	Turn(rfoot2, x_axis, 0.0)
	Turn(rfoot2, y_axis, 0.0)
	Turn(rfoot2, z_axis, 0.0)
	Turn(rhand, x_axis, 0.0)
	Turn(rhand, y_axis, 0.0)
	Turn(rhand, z_axis, 0.0)
	Turn(rhand2, x_axis, 0.0)
	Turn(rhand2, y_axis, 0.0)
	Turn(rhand2, z_axis, 0.0)
	Turn(rloarm, x_axis, 0.0)
	Turn(rloarm, y_axis, 0.0)
	Turn(rloarm, z_axis, 0.0)
	Turn(rloarm2, x_axis, 0.0)
	Turn(rloarm2, y_axis, 0.0)
	Turn(rloarm2, z_axis, 0.0)
	Turn(rloleg, x_axis, 0.0)
	Turn(rloleg, y_axis, 0.0)
	Turn(rloleg, z_axis, 0.0)
	Turn(rloleg2, x_axis, 0.0)
	Turn(rloleg2, y_axis, 0.0)
	Turn(rloleg2, z_axis, 0.0)
	Turn(ruparm, x_axis, 0.0)
	Turn(ruparm, y_axis, 0.0)
	Turn(ruparm, z_axis, 0.0)
	Turn(ruparm2, x_axis, 0.0)
	Turn(ruparm2, y_axis, 0.0)
	Turn(ruparm2, z_axis, 0.0)
	Turn(rupleg, x_axis, 0.0)
	Turn(rupleg, y_axis, 0.0)
	Turn(rupleg, z_axis, 0.0)
	Turn(rupleg2, x_axis, 0.0)
	Turn(rupleg2, y_axis, 0.0)
	Turn(rupleg2, z_axis, 0.0)
	Turn(torso, x_axis, 0.0)
	Turn(torso, y_axis, 0.0)
	Turn(torso, z_axis, 0.0)
	Turn(torso2, x_axis, 0.0)
	Turn(torso2, y_axis, 0.0)
	Turn(torso2, z_axis, 0.0)
	Turn(turret, x_axis, 0.0)
	Turn(turret, y_axis, 0.0)
	Turn(turret, z_axis, 0.0)
	Turn(turret2, x_axis, 0.0)
	Turn(turret2, y_axis, 0.0)
	Turn(turret2, z_axis, 0.0)
	Sleep(100)
end

local function crouchPose()
	basePose()
	Move(base, z_axis, -5.594, 5.786)
	Move(gun, x_axis, 2.269, 2.347)
	Move(gun, y_axis, 3.258, 3.37)
	Move(gun, z_axis, -6.466, 6.689)
	Move(gunbott, x_axis, 1.17, 1.21)
	Move(gunbott, y_axis, -19.809, 20.492)
	Move(gunbott, z_axis, -4.547, 4.704)
	Move(pelvis, y_axis, 7.386, 7.64)
	Move(pelvis2, x_axis, -9.57, 9.9)
	Move(pelvis2, y_axis, -10.8, 11.172)

	Turn(gun, z_axis, 3.201, 3.312)
	Turn(gunbott, x_axis, -0.4, 0.414)
	Turn(gunbott, z_axis, -0.069, 0.071)
	Turn(head2, x_axis, 0.269, 0.278)
	Turn(head2, y_axis, 0.024, 0.024)
	Turn(head2, z_axis, -0.282, 0.291)
	Turn(lloarm, x_axis, -0.274, 0.283)
	Turn(lloarm, y_axis, 0.125, 0.129)
	Turn(lloarm, z_axis, -0.295, 0.305)
	Turn(lloarm2, x_axis, -0.247, 0.256)
	Turn(lloarm2, y_axis, 0.056, 0.058)
	Turn(lloarm2, z_axis, -0.202, 0.209)
	Turn(lloleg, x_axis, 1.761, 1.822)
	Turn(lloleg2, x_axis, 1.761, 1.822)
	Turn(luparm, x_axis, -0.87, 0.9)
	Turn(luparm, y_axis, -0.113, 0.117)
	Turn(luparm, z_axis, -0.203, 0.21)
	Turn(luparm2, x_axis, -0.821, 0.85)
	Turn(luparm2, y_axis, -0.205, 0.212)
	Turn(luparm2, z_axis, -0.763, 0.789)
	Turn(lupleg, x_axis, -1.779, 1.84)
	Turn(lupleg2, x_axis, -1.779, 1.84)
	Turn(pelvis2, z_axis, 1.571, 1.625)
	Turn(rloarm, x_axis, 1.311, 1.356)
	Turn(rloarm, y_axis, 0.262, 0.271)
	Turn(rloarm, z_axis, 0.431, 0.446)
	Turn(rloarm2, x_axis, 0.325, 0.336)
	Turn(rloarm2, y_axis, -0.28, 0.29)
	Turn(rloarm2, z_axis, 0.026, 0.027)
	Turn(rloleg, x_axis, 1.934, 2.001)
	Turn(rloleg2, x_axis, 1.934, 2.001)
	Turn(ruparm, x_axis, -0.17, 0.176)
	Turn(ruparm, y_axis, -0.258, 0.267)
	Turn(ruparm, z_axis, 0.002, 0.002)
	Turn(ruparm2, x_axis, 0.465, 0.481)
	Turn(ruparm2, y_axis, 0.165, 0.171)
	Turn(ruparm2, z_axis, -0.008, 0.008)
	Turn(torso, x_axis, 0.188, 0.194)
	Turn(torso2, x_axis, 0.188, 0.194)
	Sleep(1000)
	crouching = true
end

local function Run()
	Move(pelvis, y_axis, 0, 5)
	Turn(rloleg, x_axis, math.rad(85), math.rad(540))
	Turn(lloleg, x_axis, math.rad(10), math.rad(630))
	Turn(lupleg, x_axis, math.rad(30), math.rad(270))
	Turn(rupleg, x_axis, math.rad(-60), math.rad(270))

	Move(pelvis2, y_axis, 0, 5)
	Turn(rloleg2, x_axis, math.rad(85), math.rad(540))
	Turn(lloleg2, x_axis, math.rad(10), math.rad(630))
	Turn(lupleg2, x_axis, math.rad(30), math.rad(270))
	Turn(rupleg2, x_axis, math.rad(-60), math.rad(270))
	Sleep(350)

	Move(pelvis, y_axis, 0, 5)
	Turn(rloleg, x_axis, math.rad(10), math.rad(630))
	Turn(lloleg, x_axis, math.rad(85), math.rad(540))
	Turn(lupleg, x_axis, math.rad(-60), math.rad(270))
	Turn(rupleg, x_axis, math.rad(30), math.rad(270))

	Move(pelvis2, y_axis, 0, 5)
	Turn(rloleg2, x_axis, math.rad(10), math.rad(630))
	Turn(lloleg2, x_axis, math.rad(85), math.rad(540))
	Turn(lupleg2, x_axis, math.rad(-60), math.rad(270))
	Turn(rupleg2, x_axis, math.rad(30), math.rad(270))
	Sleep(350)

	Move(pelvis, y_axis, 1)
	Move(pelvis2, y_axis, 1)
end

local function MotionControl()
	local justmoved = false
	while true do
		if bMoving then
			if (justmoved == false) then 
				basePose()
			end		
			justmoved = true
			Run()
		else
			if justmoved then
				justmoved = false
				crouchPose()
			end
			Sleep(100)
		end
	end
end

function script.Create()
	StartThread(MotionControl)
end

function script.StartMoving()
	bMoving = true
end

function script.StopMoving()
	bMoving = false
end

function script.AimFromWeapon(num)
	return gun
end

function script.QueryWeapon(num)
	return flare
end

function script.AimWeapon(num, heading, pitch)
	Signal(SIG_AIM)
	SetSignalMask(SIG_AIM)
	bAiming = true
	--Turn(turret, z_axis, heading, math.rad(350))
	--Turn(armhold, x_axis, -pitch, math.rad(250))
	--WaitForTurn(turret, z_axis)
	--WaitForTurn(armhold, x_axis)
	return crouching
end

function script.FireWeapon(num)
	if num == 5 then
		EmitSfx(flare, 1024)
	elseif num == 3 then
		EmitSfx(flare, 1026)
	end
end

function script.Shot(num)
	if num == 5 then
		EmitSfx(flare, 1025)
	elseif num == 3 then
		EmitSfx(flare, 1027)
	end
end

function script.Killed(recentDamage, maxHealth)
	--local severity = recentDamage/maxHealth
	dead = true
	Turn(base, x_axis, math.rad(79), math.rad(80))
	Turn(rloleg, x_axis, math.rad(25), math.rad(250))
	Turn(lupleg, x_axis, math.rad(7), math.rad(250))
	Turn(lupleg, y_axis, math.rad(34), math.rad(250))
	Turn(lupleg, z_axis, math.rad(-(-9)), math.rad(250))
	Sleep(200)
	Turn(luparm, y_axis, math.rad(18), math.rad(350))
	Turn(luparm, z_axis, math.rad(-(-45)), math.rad(350))
	Sleep(650)
	--EmitSfx(turret, 1026) --impact
	Sleep(100)
	return 1
end
