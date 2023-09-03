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
local rhand = piece 'rhand'
local lhand = piece 'lhand'

local SIGBUILD = 1
local SIGMOVE = 2

local dead = false
local bMoving = false
local inBuildAnim = false

local function basePose()
	Turn(base, x_axis, 0.0, 6.0)
	Turn(base, y_axis, 0.0, 6.0)
	Turn(base, z_axis, 0.0, 6.0)
	Turn(lfoot, x_axis, 0.0, 6.0)
	Turn(lfoot, y_axis, 0.0, 6.0)
	Turn(lfoot, z_axis, 0.0, 6.0)
	Turn(lhand, x_axis, 0.0, 6.0)
	Turn(lhand, y_axis, 0.0, 6.0)
	Turn(lhand, z_axis, 0.0, 6.0)
	Turn(lloarm, x_axis, 0.0, 6.0)
	Turn(lloarm, y_axis, 0.0, 6.0)
	Turn(lloarm, z_axis, 0.0, 6.0)
	Turn(lloleg, x_axis, 0.0, 6.0)
	Turn(lloleg, y_axis, 0.0, 6.0)
	Turn(lloleg, z_axis, 0.0, 6.0)
	Turn(luparm, x_axis, 0.0, 6.0)
	Turn(luparm, y_axis, 0.0, 6.0)
	Turn(luparm, z_axis, 0.0, 6.0)
	Turn(lupleg, x_axis, 0.0, 6.0)
	Turn(lupleg, y_axis, 0.0, 6.0)
	Turn(lupleg, z_axis, 0.0, 6.0)
	Turn(rfoot, x_axis, 0.0, 6.0)
	Turn(rfoot, y_axis, 0.0, 6.0)
	Turn(rfoot, z_axis, 0.0, 6.0)
	Turn(rhand, x_axis, 0.0, 6.0)
	Turn(rhand, y_axis, 0.0, 6.0)
	Turn(rhand, z_axis, 0.0, 6.0)
	Turn(rloarm, x_axis, 0.0, 6.0)
	Turn(rloarm, y_axis, 0.0, 6.0)
	Turn(rloarm, z_axis, 0.0, 6.0)
	Turn(rloleg, x_axis, 0.0, 6.0)
	Turn(rloleg, y_axis, 0.0, 6.0)
	Turn(rloleg, z_axis, 0.0, 6.0)
	Turn(ruparm, x_axis, 0.0, 6.0)
	Turn(ruparm, y_axis, 0.0, 6.0)
	Turn(ruparm, z_axis, 0.0, 6.0)
	Turn(rupleg, x_axis, 0.0, 6.0)
	Turn(rupleg, y_axis, 0.0, 6.0)
	Turn(rupleg, z_axis, 0.0, 6.0)
	Turn(torso, x_axis, 0.0, 6.0)
	Turn(torso, y_axis, 0.0, 6.0)
	Turn(torso, z_axis, 0.0, 6.0)
end

local function buildAnim()
	Turn(lloarm, x_axis, -0.528, 0.736)
	Turn(luparm, x_axis, 0.174, 1.303)
	Turn(rhand, x_axis, 0.666, 4.992)
	Turn(rhand, y_axis, 0.171, 1.28)
	Turn(rhand, z_axis, 0.575, 4.312)
	Turn(rloarm, x_axis, -0.051, 9.384)
	Turn(rloarm, y_axis, -0.208, 2.145)
	Turn(rloarm, z_axis, -0.675, 6.741)
	Turn(ruparm, x_axis, -1.125, 0.408)
	Turn(ruparm, z_axis, 0.188, 1.411)
	Turn(torso, x_axis, 0.024, 0.181)
	Turn(torso, z_axis, 0.078, 0.587)


	Sleep(133.333)

	Turn(lloarm, x_axis, -0.626, 0.268)
	Turn(luparm, x_axis, 0.0, 0.474)
	Turn(rhand, x_axis, 0.0, 1.815)
	Turn(rhand, y_axis, 0.0, 0.466)
	Turn(rhand, z_axis, 0.0, 1.568)
	Turn(rloarm, x_axis, -1.302, 3.412)
	Turn(rloarm, y_axis, -0.494, 0.78)
	Turn(rloarm, z_axis, 0.224, 2.451)
	Turn(ruparm, x_axis, -1.179, 0.148)
	Turn(ruparm, z_axis, 0.0, 0.513)
	Turn(torso, x_axis, 0.0, 0.066)
	Turn(torso, z_axis, 0.0, 0.214)


	Sleep(366.667)
	if(inBuildAnim and not dead) then
		buildAnim()
	end
end

local function buildState()
	Signal(SIGBUILD)
	Signal(SIGMOVE)
	SetSignalMask(SIGBUILD)
	buildAnim()
end

function script.StopBuilding()
	inBuildAnim = false
	Signal(SIGBUILD)
	SetUnitValue(COB.INBUILDSTANCE, 0)
end

function script.StartBuilding(heading, pitch)
	inBuildAnim = true
	SetUnitValue(COB.INBUILDSTANCE, 1)
end

local function run()

	Turn(torso, x_axis, math.rad(12)) --tilt forward
	
	Move(pelvis, y_axis, 0, 5)
	Turn(rloleg, x_axis, math.rad(85), math.rad(540))
	Turn(lloleg, x_axis, math.rad(10), math.rad(630))
	Turn(lupleg, x_axis, math.rad(30), math.rad(270))
	Turn(rupleg, x_axis, math.rad(-60), math.rad(270))

	Turn(lloarm, x_axis, -0.415, 1.81)
	Turn(luparm, x_axis, -0.65, 5.149)
	Turn(rloarm, x_axis, -0.139, 0.547)
	Turn(ruparm, x_axis, 0.377, 1.997)

	--Turn(torso, y_axis, math.rad(10), math.rad(90))
	Sleep(350)

	Move(pelvis, y_axis, 0, 5)
	Turn(rloleg, x_axis, math.rad(10), math.rad(630))
	Turn(lloleg, x_axis, math.rad(85), math.rad(540))
	Turn(lupleg, x_axis, math.rad(-60), math.rad(270))
	Turn(rupleg, x_axis, math.rad(30), math.rad(270))

	Turn(lloarm, x_axis, -1.018, 1.81)
	Turn(luparm, x_axis, 1.066, 5.149)
	Turn(rloarm, x_axis, -0.322, 0.547)
	Turn(ruparm, x_axis, -0.288, 1.997)
	--Turn(torso, y_axis, math.rad(-10), math.rad(90))
	Sleep(350)

	Move(pelvis, y_axis, 1, 5)
	run()
end

local function runState()
	Signal(SIGMOVE)
	Signal(SIGBUILD)
	SetSignalMask(SIGMOVE)
	run()
end

local function waitBasePose()
	Signal(SIGMOVE)
	Signal(SIGBUILD)
	Sleep(100)
	basePose()
end

local function MotionControl()
	local justmoved = false
	local wasBuilding = false
	while true do
		if bMoving then
			if (justmoved == false) then 
				inBuildAnim = false
				waitBasePose()
				StartThread(runState)
				justmoved = true
			else
				Sleep(100)
			end		
		elseif inBuildAnim then
			if (not wasBuilding) then
				wasBuilding = true
				justmoved = false
				waitBasePose()
				StartThread(buildState)
			else
				Sleep(100)
			end	
		else
			if (wasBuilding or justmoved) then 
				waitBasePose()
				wasBuilding = false
				justmoved = false
				inBuildAnim = false
			else
				Sleep(100)
			end		
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
