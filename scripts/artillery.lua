include 'constants.lua'
local moving = false
local deployed = false

local spGetUnitVelocity = Spring.GetUnitVelocity
local spGetUnitPosition = Spring.GetUnitPosition

local base, turret, firepoint = piece('tank', 'turret', 'Muzzle')

local function SetDeploy(wantDeploy)
    local rand = math.random
	if wantDeploy then
        Move(turret, z_axis, 20, 5)
        Turn(base, x_axis, math.rad(-20), 1)
        Sleep(1000);
		deployed = true
	else
		deployed = false
        Move(turret, z_axis, 0, 5)
        Turn(base, x_axis, math.rad(20), 1)
		Sleep(1000)
	end
end

function StartMoving()
	moving = true
	StartThread(SetDeploy, false)
end

function StopMoving()
	moving = false
	StartThread(SetDeploy, true)
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

local function WeaponRangeUpdate()
	while true do
		local height = select(2, Spring.GetUnitPosition(unitID))
		if height < -20 then
			Spring.SetUnitWeaponState(unitID, 2, {range = 550 - height})
			Spring.SetUnitMaxRange(unitID, 550 - height)
		else
			Spring.SetUnitWeaponState(unitID, 2, {range = 600})
			Spring.SetUnitMaxRange(unitID, 600)
		end
		Sleep(500)
	end
end

function script.Create()
	moving = false
	
	StartThread(CheckMoving)
	StartThread(WeaponRangeUpdate)
	
	local stunned_or_inbuild = Spring.GetUnitIsStunned(unitID)
	if not stunned_or_inbuild then
		StartThread(SetDeploy, true)
	end
end

function script.AimWeapon(num, heading, pitch)
	if num == 1 then
		if moving or not deployed then
			return false
		else
			return true
		end
	end
end