include "constants.lua"

-- pieces
local base = piece 'base'
local pelvis = piece 'pelvis'
local turret = piece 'turret'
local torso = piece 'torso'
local head = piece 'head'
local armhold = piece 'armhold'
local ruparm = piece 'ruparm'
local rarm = piece 'rarm'
local rloarm = piece 'rloarm'
local luparm = piece 'luparm'
local larm = piece 'larm'
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
local gunpod = piece 'gunpod'
local ac1 = piece 'ac1'
local ac2 = piece 'ac2'
local nanospray = piece 'nanospray'

local smokePiece = {torso}
local nanoPieces = {nanospray}

--------------------------------------------------------------------------------
-- constants
--------------------------------------------------------------------------------
local SIG_RESTORE = 16
local SIG_AIM = 2
local SIG_AIM_2 = 4

--------------------------------------------------------------------------------
-- vars
--------------------------------------------------------------------------------
local restoreHeading, restorePitch = 0, 0

local canDgun = UnitDefs[unitDefID].canDgun

local shieldOn = false
local dead = false
local bMoving = false
local bAiming = false
local inBuildAnim = false

local moving = false
local deployed = false

local spGetUnitVelocity = Spring.GetUnitVelocity
local spGetUnitPosition = Spring.GetUnitPosition

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
local function SetDeploy(wantDeploy)
	if wantDeploy then
        Turn(base, x_axis, math.rad(90), 1)
        Sleep(2000);
		deployed = true
	else
		deployed = false
        Turn(base, x_axis, math.rad(0), 1)
		Sleep(2000)
	end
end

local function IsMoving()
	local speed = select(4, spGetUnitVelocity(unitID))
	if speed <= 0.05 then
		return false
	end
	return true
end

local function CheckMoving()
	while true do
		if moving then
			if not IsMoving() then
				StopMoving()
			end
		else
			if IsMoving()  then
				StartMoving()
			end
		end
		Sleep(33)
	end
end

local function BuildPose(heading, pitch)
	Turn(torso, x_axis, math.rad(5), math.rad(250))
	Turn(torso, y_axis, 0, math.rad(250))
	Turn(torso, z_axis, 0, math.rad(250))
	--head
	Turn(head, x_axis, 0, math.rad(250))
	Turn(head, y_axis, 0, math.rad(250))
	Turn(head, z_axis, 0, math.rad(250))
	--rarm
	Turn(ruparm, x_axis, math.rad(-55), math.rad(250))
	Turn(ruparm, y_axis, 0, math.rad(250))
	Turn(ruparm, z_axis, 0, math.rad(250))
	
	Turn(rarm, x_axis, math.rad(13), math.rad(250))
	Turn(rarm, y_axis, math.rad(46), math.rad(250))
	Turn(rarm, z_axis, math.rad(9), math.rad(250))
	
	Turn(rloarm, x_axis, math.rad(16), math.rad(250))
	Turn(rloarm, y_axis, math.rad(-23), math.rad(250))
	Turn(rloarm, z_axis, math.rad(11), math.rad(250))
	
	Turn(gun, x_axis, math.rad(17.0), math.rad(250))
	Turn(gun, y_axis, math.rad(-19.8), math.rad(250)) ---20 is dead straight
	Turn(gun, z_axis, math.rad(2.0), math.rad(250))
	--larm
	Turn(luparm, x_axis, math.rad(-70), math.rad(250))
	Turn(luparm, y_axis, math.rad(-20), math.rad(250))
	Turn(luparm, z_axis, math.rad(-10), math.rad(250))
	
	Turn(larm, x_axis, math.rad(-13), math.rad(250))
	Turn(larm, y_axis, math.rad(-60), math.rad(250))
	Turn(larm, z_axis, math.rad(9), math.rad(250))
	
	Turn(lloarm, x_axis, math.rad(73), math.rad(250))
	Turn(lloarm, y_axis, math.rad(19), math.rad(250))
	Turn(lloarm, z_axis, math.rad(58), math.rad(250))
	
	--aim
	Turn(turret, y_axis, heading, math.rad(350))
	Turn(armhold, x_axis, -pitch, math.rad(250))
	WaitForTurn(turret, y_axis)
	WaitForTurn(armhold, x_axis) --need to make sure not
	WaitForTurn(lloarm, x_axis) --stil setting up
end

local function RestoreAfterDelay()
	Signal(SIG_RESTORE)
	SetSignalMask(SIG_RESTORE)
	Sleep(4000)
	if not dead then
		if GetUnitValue(COB.INBUILDSTANCE) == 1 then
			BuildPose(restoreHeading, restorePitch)
		else
			Turn(turret, x_axis, 0, math.rad(150))
			Turn(turret, y_axis, 0, math.rad(150))
			--torso
			Turn(torso, x_axis, 0, math.rad(250))
			Turn(torso, y_axis, 0, math.rad(250))
			Turn(torso, z_axis, 0, math.rad(250))
			--head
			Turn(head, x_axis, 0, math.rad(250))
			Turn(head, y_axis, 0, math.rad(250))
			Turn(head, z_axis, 0, math.rad(250))
			
			-- at ease pose
			Turn(armhold, x_axis, math.rad(-45), math.rad(250)) --upspring at -45
			Turn(ruparm, x_axis, 0, math.rad(250))
			Turn(ruparm, y_axis, 0, math.rad(250))
			Turn(ruparm, z_axis, 0, math.rad(250))
			Turn(rarm, x_axis, math.rad(2), math.rad(250))	 --up 2
			Turn(rarm, y_axis, 0, math.rad(250))
			Turn(rarm, z_axis, math.rad(12), math.rad(250))	--up -12
			Turn(rloarm, x_axis, math.rad(47), math.rad(250)) --up 47
			Turn(rloarm, y_axis, math.rad(76), math.rad(250)) --up 76
			Turn(rloarm, z_axis, math.rad(47), math.rad(250)) --up -47
			--left
			Turn(luparm, x_axis, math.rad(12), math.rad(250))	 --up -9
			Turn(luparm, y_axis, 0, math.rad(250))
			Turn(luparm, z_axis, 0, math.rad(250))
			Turn(larm, x_axis, math.rad(-35), math.rad(250))	 --up 5
			Turn(larm, y_axis, math.rad(-3), math.rad(250))	 --up -3
			Turn(larm, z_axis, math.rad(-(22)), math.rad(250))	 --up 22
			Turn(lloarm, x_axis, math.rad(92), math.rad(250))	-- up 82
			Turn(lloarm, y_axis, 0, math.rad(250))
			Turn(lloarm, z_axis, math.rad(-94), math.rad(250)) --upspring 94
			
			Turn(gun, x_axis, 0, math.rad(250))
			Turn(gun, y_axis, 0, math.rad(250))
			Turn(gun, z_axis, 0, math.rad(250))
			-- done at ease
			Sleep(100)
		end
		bAiming = false
	end
end

local function Walk()
	if not bAiming then
		Turn(torso, x_axis, math.rad(12)) --tilt forward
		--Turn(pelvis, x_axis, math.rad(-45)) --tilt forward
	end

	Move(pelvis, y_axis, 0, 5)
	Turn(rloleg, x_axis, math.rad(85), math.rad(540))
	Turn(lloleg, x_axis, math.rad(10), math.rad(630))
	Turn(lupleg, x_axis, math.rad(30), math.rad(270))
	Turn(rupleg, x_axis, math.rad(-60), math.rad(270))
	--Turn(torso, y_axis, math.rad(10), math.rad(90))
	Sleep(350)

	Move(pelvis, y_axis, 0, 5)
	Turn(rloleg, x_axis, math.rad(10), math.rad(630))
	Turn(lloleg, x_axis, math.rad(85), math.rad(540))
	Turn(lupleg, x_axis, math.rad(-60), math.rad(270))
	Turn(rupleg, x_axis, math.rad(30), math.rad(270))
	--Turn(torso, y_axis, math.rad(-10), math.rad(90))
	Sleep(350)

	Move(pelvis, y_axis, 1, 5)
end

local function WalkO()
	if not bAiming then
		Turn(torso, x_axis, math.rad(12)) --tilt forward
		Turn(torso, y_axis, math.rad(3.335165))
	end
	Move(pelvis, y_axis, 0)
	Turn(rupleg, x_axis, math.rad(5.670330), math.rad(200))
	Turn(lupleg, x_axis, math.rad(-26.467033), math.rad(200))
	Turn(lloleg, x_axis, math.rad(26.967033), math.rad(200))
	Turn(rloleg, x_axis, math.rad(26.967033), math.rad(200))
	Turn(rfoot, x_axis, math.rad(-19.824176), math.rad(200))
	Sleep(60) --had to + 20 to all sleeps in walk
	
	if not bAiming then
		Turn(torso, y_axis, math.rad(1.681319))
	end
	Turn(rupleg, x_axis, math.rad(-5.269231), math.rad(200))
	Turn(lupleg, x_axis, math.rad(-20.989011), math.rad(200))
	Turn(lloleg, x_axis, math.rad(20.945055), math.rad(200))
	Turn(rloleg, x_axis, math.rad(41.368132), math.rad(200))
	Turn(rfoot, x_axis, math.rad(-15.747253))
	Sleep(50)
	
	if not bAiming then
		Turn(torso, y_axis, 0)
	end
	Turn(rupleg, x_axis, math.rad(-9.071429), math.rad(200))
	Turn(lupleg, x_axis, math.rad(-12.670330), math.rad(200))
	Turn(lloleg, x_axis, math.rad(12.670330), math.rad(200))
	Turn(rloleg, x_axis, math.rad(43.571429), math.rad(200))
	Turn(rfoot, x_axis, math.rad(-12.016484), math.rad(200))
	Sleep(45)
	
	if not bAiming then
		Turn(torso, y_axis, math.rad(-1.77))
	end
	Turn(rupleg, x_axis, math.rad(-21.357143), math.rad(200))
	Turn(lupleg, x_axis, math.rad(2.824176), math.rad(200))
	Turn(lloleg, x_axis, math.rad(3.560440), math.rad(200))
	Turn(lfoot, x_axis, math.rad(-4.527473), math.rad(200))
	Turn(rloleg, x_axis, math.rad(52.505495), math.rad(200))
	Turn(rfoot, x_axis, 0)
	Sleep(45)
	
	if not bAiming then
		Turn(torso, y_axis, math.rad(3.15))
	end
	Turn(rupleg, x_axis, math.rad(-35.923077), math.rad(200))
	Turn(lupleg, x_axis, math.rad(7.780220), math.rad(200))
	Turn(lloleg, x_axis, math.rad(8.203297), math.rad(200))
	Turn(lfoot, x_axis, math.rad(-12.571429), math.rad(200))
	Turn(rloleg, x_axis, math.rad(54.390110), math.rad(200))
	Sleep(45)
	
	if not bAiming then
		Turn(torso, y_axis, math.rad(-4.21))
	end
	Turn(rupleg, x_axis, math.rad(-37.780220), math.rad(200))
	Turn(lupleg, x_axis, math.rad(10.137363), math.rad(200))
	Turn(lloleg, x_axis, math.rad(13.302198), math.rad(200))
	Turn(lfoot, x_axis, math.rad(-16.714286), math.rad(200))
	Turn(rloleg, x_axis, math.rad(32.582418), math.rad(200))
	Sleep(45)
	
	if not bAiming then
		Turn(torso, y_axis, math.rad(-3.15))
	end
	Turn(rupleg, x_axis, math.rad(-28.758242), math.rad(200))
	Turn(lupleg, x_axis, math.rad(12.247253), math.rad(200))
	Turn(lloleg, x_axis, math.rad(19.659341), math.rad(200))
	Turn(lfoot, x_axis, math.rad(-19.659341), math.rad(200))
	Turn(rloleg, x_axis, math.rad(28.758242), math.rad(200))
	Sleep(55)
	
	if not bAiming then
		Turn(torso, y_axis, math.rad(-1.88))
	end
	Turn(rupleg, x_axis, math.rad(-22.824176), math.rad(200))
	Turn(lupleg, x_axis, math.rad(2.824176), math.rad(200))
	Turn(lloleg, x_axis, math.rad(34.060440), math.rad(200))
	Turn(rfoot, x_axis, math.rad(-6.313187), math.rad(200))
	Sleep(55)
	
	if not bAiming then
		Turn(torso, y_axis, 0)
	end
	Turn(rupleg, x_axis, math.rad(-11.604396), math.rad(200))
	Turn(lupleg, x_axis, math.rad(-6.725275), math.rad(200))
	Turn(lloleg, x_axis, math.rad(39.401099), math.rad(200))
	Turn(lfoot, x_axis, math.rad(-13.956044), math.rad(200))
	Turn(rloleg, x_axis, math.rad(19.005495), math.rad(200))
	Turn(rfoot, x_axis, math.rad(-7.615385), math.rad(200))
	Sleep(45)
	
	if not bAiming then
		Turn(torso, y_axis, math.rad(1.88))
	end
	Turn(rupleg, x_axis, math.rad(1.857143), math.rad(200))
	Turn(lupleg, x_axis, math.rad(-24.357143), math.rad(200))
	Turn(lloleg, x_axis, math.rad(45.093407), math.rad(200))
	Turn(lfoot, x_axis, math.rad(-7.703297), math.rad(200))
	Turn(rloleg, x_axis, math.rad(3.560440), math.rad(200))
	Turn(rfoot, x_axis, math.rad(-4.934066), math.rad(200))
	Sleep(45)
	
	if not bAiming then
		Turn(torso, y_axis, math.rad(3.15))
	end
	Turn(rupleg, x_axis, math.rad(7.148352), math.rad(200))
	Turn(lupleg, x_axis, math.rad(-28.181319), math.rad(200))
	Sleep(45)
	
	if not bAiming then
		Turn(torso, y_axis, math.rad(4.20))
	end
	Turn(rupleg, x_axis, math.rad(8.423077), math.rad(200))
	Turn(lupleg, x_axis, math.rad(-32.060440), math.rad(200))
	Turn(lloleg, x_axis, math.rad(27.527473), math.rad(200))
	Turn(lfoot, x_axis, math.rad(-2.857143), math.rad(200))
	Turn(rloleg, x_axis, math.rad(24.670330), math.rad(200))
	Turn(rfoot, x_axis, math.rad(-33.313187), math.rad(200))
	Sleep(55)
end

local function MotionControl()
	local moving, aiming
	local justmoved = true
	while true do
		moving = bMoving
		aiming = bAiming
		if moving then
			Walk()
			justmoved = true
		else
			if justmoved then
				Turn(rupleg, x_axis, 0, math.rad(200.071429))
				Turn(rloleg, x_axis, 0, math.rad(200.071429))
				Turn(rfoot, x_axis, 0, math.rad(200.071429))
				Turn(lupleg, x_axis, 0, math.rad(200.071429))
				Turn(lloleg, x_axis, 0, math.rad(200.071429))
				Turn(lfoot, x_axis, 0, math.rad(200.071429))
				if not (aiming or inBuildAnim) then
					Turn(torso, x_axis, 0) --untilt forward
					Turn(torso, y_axis, 0, math.rad(90.027473))
					Turn(ruparm, x_axis, 0, math.rad(200.071429))
--					Turn(luparm, x_axis, 0, math.rad(200.071429))
				end
				justmoved = false
			end
			Sleep(100)
		end
	end
end

function script.Create()
	moving = false
	
	StartThread(CheckMoving)
	
	local stunned_or_inbuild = Spring.GetUnitIsStunned(unitID)
	if not stunned_or_inbuild then
		StartThread(SetDeploy, true)
	end
	--alert to dirt
	Turn(armhold, x_axis, math.rad(-45), math.rad(250)) --upspring
	Turn(ruparm, x_axis, 0, math.rad(250))
	Turn(ruparm, y_axis, 0, math.rad(250))
	Turn(ruparm, z_axis, 0, math.rad(250))
	Turn(rarm, x_axis, math.rad(2), math.rad(250))	 --
	Turn(rarm, y_axis, 0, math.rad(250))
	Turn(rarm, z_axis, math.rad(-(-12)), math.rad(250))	--up
	Turn(rloarm, x_axis, math.rad(47), math.rad(250)) --up
	Turn(rloarm, y_axis, math.rad(76), math.rad(250)) --up
	Turn(rloarm, z_axis, math.rad(-(-47)), math.rad(250)) --up
	Turn(luparm, x_axis, math.rad(12), math.rad(250))	 --up
	Turn(luparm, y_axis, 0, math.rad(250))
	Turn(luparm, z_axis, 0, math.rad(250))
	Turn(larm, x_axis, math.rad(-35), math.rad(250))	 --up
	Turn(larm, y_axis, math.rad(-3), math.rad(250))	 --up
	Turn(larm, z_axis, math.rad(-(22)), math.rad(250))	 --up
	Turn(lloarm, x_axis, math.rad(92), math.rad(250))	-- up
	Turn(lloarm, y_axis, 0, math.rad(250))
	Turn(lloarm, z_axis, math.rad(-(94)), math.rad(250)) --upspring

	Hide(flare)
	Hide(ac1)
	Hide(ac2)

	StartThread(MotionControl)
	StartThread(RestoreAfterDelay)
	--Spring.SetUnitNanoPieces(unitID, nanoPieces)
end

function script.StartMoving()
	bMoving = true
	moving = true
	StartThread(SetDeploy, false)
end

function script.StopMoving()
	bMoving = false
	moving = false
	StartThread(SetDeploy, true)
end

function script.AimFromWeapon(num)
	return armhold
end

function script.QueryWeapon(num)
	return flare
end

local function AimRifle(heading, pitch)
	--torso
	Turn(torso, x_axis, math.rad(5), math.rad(250))
	Turn(torso, y_axis, 0, math.rad(250))
	Turn(torso, z_axis, 0, math.rad(250))
	--head
	Turn(head, x_axis, 0, math.rad(250))
	Turn(head, y_axis, 0, math.rad(250))
	Turn(head, z_axis, 0, math.rad(250))
	--rarm
	Turn(ruparm, x_axis, math.rad(-55), math.rad(250))
	Turn(ruparm, y_axis, 0, math.rad(250))
	Turn(ruparm, z_axis, 0, math.rad(250))
	
	Turn(rarm, x_axis, math.rad(13), math.rad(250))
	Turn(rarm, y_axis, math.rad(46), math.rad(250))
	Turn(rarm, z_axis, math.rad(9), math.rad(250))
	
	Turn(rloarm, x_axis, math.rad(16), math.rad(250))
	Turn(rloarm, y_axis, math.rad(-23), math.rad(250))
	Turn(rloarm, z_axis, math.rad(11), math.rad(250))
	
	Turn(gun, x_axis, math.rad(-90), math.rad(250))
	Turn(gun, y_axis, math.rad(-120), math.rad(250)) ---20 is dead straight
	Turn(gun, z_axis, math.rad(2.0), math.rad(250))
	--larm
	Turn(luparm, x_axis, math.rad(-70), math.rad(250))
	Turn(luparm, y_axis, math.rad(-20), math.rad(250))
	Turn(luparm, z_axis, math.rad(-10), math.rad(250))
	
	Turn(larm, x_axis, math.rad(-13), math.rad(250))
	Turn(larm, y_axis, math.rad(-60), math.rad(250))
	Turn(larm, z_axis, math.rad(9), math.rad(250))
	
	Turn(lloarm, x_axis, math.rad(73), math.rad(250))
	Turn(lloarm, y_axis, math.rad(19), math.rad(250))
	Turn(lloarm, z_axis, math.rad(58), math.rad(250))
	
	--aim
	Turn(turret, y_axis, heading, math.rad(350))
	Turn(armhold, x_axis, -pitch, math.rad(250))
	WaitForTurn(turret, y_axis)
	WaitForTurn(armhold, x_axis) --need to make sure not
	WaitForTurn(lloarm, x_axis) --stil setting up
	StartThread(RestoreAfterDelay)
	return true
end

function script.AimWeapon(num, heading, pitch)
	inBuildAnim = false
	if num == 1 then
		if moving or not deployed then
			return false
		else
			Signal(SIG_AIM)
			SetSignalMask(SIG_AIM)
			bAiming = true
			return AimRifle(heading, pitch)
		end
	end
end

function script.FireWeapon(num)
	EmitSfx(flare, 1024)
end

function script.Shot(num)
	EmitSfx(flare, 1025)
end

function script.StopBuilding()
	inBuildAnim = false
	SetUnitValue(COB.INBUILDSTANCE, 0)
	if not bAiming then
		StartThread(RestoreAfterDelay)
	end
end

function script.StartBuilding(heading, pitch)
	restoreHeading, restorePitch = heading, pitch
	BuildPose(heading, pitch)
	SetUnitValue(COB.INBUILDSTANCE, 1)
end

function script.Killed(recentDamage, maxHealth)
	--local severity = recentDamage/maxHealth
	dead = 1
	Turn(base, x_axis, math.rad(79), math.rad(80))
	Turn(rloleg, x_axis, math.rad(25), math.rad(250))
	Turn(lupleg, x_axis, math.rad(7), math.rad(250))
	Turn(lupleg, y_axis, math.rad(34), math.rad(250))
	Turn(lupleg, z_axis, math.rad(-(-9)), math.rad(250))
	Sleep(200)
	Turn(luparm, y_axis, math.rad(18), math.rad(350))
	Turn(luparm, z_axis, math.rad(-(-45)), math.rad(350))
	Sleep(650)
	Sleep(100)
	return 1
end

