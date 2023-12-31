include "constants.lua"

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

local SIG_AIM = 1

local dead = false
local bMoving = false
local bAiming = false
local crouching = false

local function basePose()
	crouching = false
	Move(base, z_axis, 0.0, 20)

	Turn(armhold, x_axis, 0.0)
	Turn(armhold, y_axis, 0.0)
	Turn(armhold, z_axis, 0.0)
	Turn(base, x_axis, 0.0)
	Turn(base, y_axis, 0.0)
	Turn(base, z_axis, 0.0)
	Turn(gun, x_axis, 0.0)
	Turn(gun, y_axis, 0.0)
	Turn(gun, z_axis, 0.0)
	Turn(head, x_axis, 0.0)
	Turn(head, y_axis, 0.0)
	Turn(head, z_axis, 0.0)
	Turn(lfoot, x_axis, 0.0)
	Turn(lfoot, y_axis, 0.0)
	Turn(lfoot, z_axis, 0.0)
	Turn(lhand, x_axis, 0.0)
	Turn(lhand, y_axis, 0.0)
	Turn(lhand, z_axis, 0.0)
	Turn(lloarm, x_axis, 0.0)
	Turn(lloarm, y_axis, 0.0)
	Turn(lloarm, z_axis, 0.0)
	Turn(lloleg, x_axis, 0.0)
	Turn(lloleg, y_axis, 0.0)
	Turn(lloleg, z_axis, 0.0)
	Turn(luparm, x_axis, 0.0)
	Turn(luparm, y_axis, 0.0)
	Turn(luparm, z_axis, 0.0)
	Turn(lupleg, x_axis, 0.0)
	Turn(lupleg, y_axis, 0.0)
	Turn(lupleg, z_axis, 0.0)
	Turn(pelvis, x_axis, 0.0)
	Turn(pelvis, y_axis, 0.0)
	Turn(pelvis, z_axis, 0.0)
	Turn(rfoot, x_axis, 0.0)
	Turn(rfoot, y_axis, 0.0)
	Turn(rfoot, z_axis, 0.0)
	Turn(rhand, x_axis, 0.0)
	Turn(rhand, y_axis, 0.0)
	Turn(rhand, z_axis, 0.0)
	Turn(rloarm, x_axis, 0.0)
	Turn(rloarm, y_axis, 0.0)
	Turn(rloarm, z_axis, 0.0)
	Turn(rloleg, x_axis, 0.0)
	Turn(rloleg, y_axis, 0.0)
	Turn(rloleg, z_axis, 0.0)
	Turn(ruparm, x_axis, 0.0)
	Turn(ruparm, y_axis, 0.0)
	Turn(ruparm, z_axis, 0.0)
	Turn(rupleg, x_axis, 0.0)
	Turn(rupleg, y_axis, 0.0)
	Turn(rupleg, z_axis, 0.0)
	Turn(torso, x_axis, 0.0)
	Turn(torso, y_axis, 0.0)
	Turn(torso, z_axis, 0.0)
	Turn(turret, x_axis, 0.0)
	Turn(turret, y_axis, 0.0)
	Turn(turret, z_axis, 0.0)
end

local function crouchPose()
	basePose()
	Move(base, z_axis, -5.858, 6.06)

	Turn(gun, x_axis, 0.443, 0.458)
	Turn(gun, y_axis, 0.215, 0.222)
	Turn(gun, z_axis, -0.13, 0.134)
	Turn(head, y_axis, -0.342, 0.354)
	Turn(lloarm, x_axis, 0.504, 0.521)
	Turn(lloarm, y_axis, 0.499, 0.517)
	Turn(lloarm, z_axis, -0.031, 0.032)
	Turn(lloleg, x_axis, 1.825, 1.888)
	Turn(luparm, x_axis, -0.115, 0.119)
	Turn(luparm, y_axis, -0.134, 0.138)
	Turn(luparm, z_axis, -0.794, 0.822)
	Turn(lupleg, x_axis, -1.771, 1.832)
	Turn(rloarm, x_axis, -0.351, 0.364)
	Turn(rloarm, y_axis, -0.473, 0.489)
	Turn(rloarm, z_axis, -0.323, 0.334)
	Turn(rloleg, x_axis, 1.856, 1.92)
	Turn(ruparm, x_axis, 0.398, 0.411)
	Turn(ruparm, y_axis, 0.049, 0.051)
	Turn(ruparm, z_axis, -0.117, 0.121)
	Sleep(1000)
	crouching = true
end

local function Run()
	if not bAiming then
		Turn(torso, x_axis, math.rad(12)) --tilt forward
	end
	Move(pelvis, y_axis, 0, 5)
	Turn(rloleg, x_axis, math.rad(85), math.rad(540))
	Turn(lloleg, x_axis, math.rad(10), math.rad(630))
	Turn(lupleg, x_axis, math.rad(30), math.rad(270))
	Turn(rupleg, x_axis, math.rad(-60), math.rad(270))
	Sleep(350)

	Move(pelvis, y_axis, 0, 5)
	Turn(rloleg, x_axis, math.rad(10), math.rad(630))
	Turn(lloleg, x_axis, math.rad(85), math.rad(540))
	Turn(lupleg, x_axis, math.rad(-60), math.rad(270))
	Turn(rupleg, x_axis, math.rad(30), math.rad(270))
	Sleep(350)
	Move(pelvis, y_axis, 1, 5)
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
				basePose()
				crouchPose()
				justmoved = false
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
	return armhold
end

function script.QueryWeapon(num)
	return flare
end

function script.AimWeapon(num, heading, pitch)
	Signal(SIG_AIM)
	SetSignalMask(SIG_AIM)
	bAiming = true
	Turn(turret, z_axis, heading, math.rad(350))
	Turn(armhold, x_axis, -pitch, math.rad(250))
	WaitForTurn(turret, z_axis)
	WaitForTurn(armhold, x_axis)
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
