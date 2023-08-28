include "constants.lua"
include "transports.lua"

local base, link 	= piece('base', 'link')
local AttachUnit = Spring.UnitScript.AttachUnit
local DropUnit = Spring.UnitScript.DropUnit

local loaded = false
local unitLoaded = nil
local smokePiece = {base}


--Special ability: drop unit midair
function ForceDropUnit()
	if (unitLoaded ~= nil) and Spring.ValidUnitID(unitLoaded) then
		local x,y,z = Spring.GetUnitPosition(unitLoaded) --cargo position
		local _,ty = Spring.GetUnitPosition(unitID) --transport position
		local vx,vy,vz = Spring.GetUnitVelocity(unitID) --transport speed
		DropUnit(unitLoaded) --detach cargo
		local transRadius = Spring.GetUnitRadius(unitID)
		Spring.SetUnitPosition(unitLoaded, x,math.min(y, ty-transRadius),z) --set cargo position below transport
		Spring.AddUnitImpulse(unitLoaded,0,4,0) --hax to prevent teleport to ground
		Spring.AddUnitImpulse(unitLoaded,0,-4,0) --hax to prevent teleport to ground
		Spring.SetUnitVelocity(unitLoaded,0,0,0) --remove any random velocity caused by collision with transport (especially Spring 91)
		Spring.AddUnitImpulse(unitLoaded,vx,vy,vz) --readd transport momentum
	end
	unitLoaded = nil
	StartThread(script.EndTransport) --formalize unit drop (finish animation, clear tag, ect)
end

function OnStartingCrash()
	ForceDropUnit()
end

--fetch unit id of passenger (from the load command)
local function getPassengerId()
	local cmd = Spring.GetCommandQueue(unitID, 1)
	local unitId = nil
	
	if cmd and cmd[1] then
		if cmd[1]['id'] == 75 then -- CMDTYPE.LOAD_UNITS = 75
			unitId = cmd[1]['params'][1]
		end
	end
	
	return unitId
end


--fetch id of command
local function getCommandId()
	local cmd=Spring.GetCommandQueue(unitID, 1)
	if cmd and cmd[1] then
		return cmd[1]['id']
	end
	return nil
end

local function getDropPoint()
	local cmd = Spring.GetCommandQueue(unitID, 1)
	if cmd and cmd[1] and cmd[1].id == 81 then -- CMDTYPE.LOAD_UNITS = 75
		return cmd[1]['params'][1], cmd[1]['params'][2], cmd[1]['params'][3]
	end
	return false
end

local function isNearPickupPoint(passengerId, requiredDist)
	if passengerId == nil then
		return false
	end

	local px, py, pz = Spring.GetUnitBasePosition(passengerId)
	if not px then
		return
	end
	
	local px2, py2, pz2 = Spring.GetUnitBasePosition(unitID)
	if not px2 then
		return
	end
	
	local dx = px2 - px
	local dz = pz2 - pz
	local dist = (dx^2 + dz^2)
	
	if dist < requiredDist^2 then
		return true
	else
		return false
	end
end


local function isNearDropPoint(transportUnitId, requiredDist)
	if transportUnitId == nil then
		return false
	end

	local px, py, pz = Spring.GetUnitBasePosition(transportUnitId)
	if not px then
		return false
	end
	local px2, py2, pz2 = getDropPoint()
	if not px2 then
		return false
	end
	
	local dx = px - px2
	local dz = pz - pz2
	local dist = (dx^2 + dz^2)
	
	if dist < requiredDist^2 then
		return true
	else
		return false
	end
end

local function isValidCargo(soonPassenger, passenger)
	return ((soonPassenger and Spring.ValidUnitID(soonPassenger)) or (passenger and Spring.ValidUnitID(passenger)))
end

local function PickupAndDropFixer()
	while true do
		local passengerId = getPassengerId()
		if passengerId and (getCommandId() == 75) and isValidCargo(passengerId) and isNearPickupPoint(passengerId, 120) then
			Sleep(1500)
			local passengerId = getPassengerId()
			if passengerId and (getCommandId() == 75) and isValidCargo(passengerId) and isNearPickupPoint(passengerId, 120) then
				Spring.GiveOrderToUnit(unitID, CMD.WAIT, {}, 0)
				Spring.GiveOrderToUnit(unitID, CMD.WAIT, {}, 0)
			end
		end
		
		if unitLoaded and (getCommandId() == 81) and isNearDropPoint(unitLoaded, 80) then
			Sleep(1500)
			if unitLoaded and (getCommandId() == 81) and isNearDropPoint(unitLoaded, 80) then
				Spring.GiveOrderToUnit(unitID, CMD.WAIT, {}, 0)
				Spring.GiveOrderToUnit(unitID, CMD.WAIT, {}, 0)
			end
		end
		
		Sleep(500)
	end
end


function script.MoveRate(curRate)
	local passengerId = getPassengerId()

	if not isValidCargo(passengerId,unitLoaded) then
		unitLoaded = nil
		StartThread(script.EndTransport) --formalize unit drop (finish animation, clear tag, ect)
	end
end


function script.BeginTransport(passengerID)
	if loaded then
		return
	end
	--Move(link, y_axis, -Spring.GetUnitHeight(passengerID), nil, true)
	
	if not GG.TransportAllowed(unitID, passengerID) then
		Sleep(10)
		unitLoaded = passengerID
		ForceDropUnit()
		return
	end
	
	SetUnitValue(COB.BUSY, 1)

	AttachUnit(link, passengerID)
	unitLoaded = passengerID
	loaded = true
	
	Sleep(500)
end


function script.Create()
	StartThread(GG.Script.SmokeUnit, unitID, smokePiece)
	StartThread(PickupAndDropFixer)
end


function script.QueryTransport(passengerID)
	return link
end

function script.EndTransport()
	if (unitLoaded ~= nil) then
		DropUnit(unitLoaded)
		unitLoaded = nil
	end
	loaded = false
	SetUnitValue(COB.BUSY, 0)
	Sleep(500)
end

function script.Killed(recentDamage, maxHealth)
	local severity = recentDamage / maxHealth
	StartThread(ForceDropUnit)
	if severity <= 0.25 then
		Explode(base, SFX.NONE)
		return 1
	elseif severity <= 0.50 or ((Spring.GetUnitMoveTypeData(unitID).aircraftState or "") == "crashing") then
		Explode(base, SFX.SHATTER)
		return 1
	elseif severity <= 0.75 then
		Explode(base, SFX.SHATTER)
		return 2
	else
		Explode(base, SFX.SHATTER)
	end
end
