include "constants.lua"
include "pieceControl.lua"

local base, garrison1, garrison2 = piece('base')
local linkPieces  = {piece('garrison1', 'garrison2')}
local explodables = {base}
local smokePiece = { base }
local numUnits = 0;

local LOS_ACCESS = {inlos = true}
local SigAim = 1

local function RestoreAfterDelay()
	Sleep (5000)
end

function script.Create()
	StartThread (GG.Script.SmokeUnit, unitID, smokePiece)
end

function script.AimWeapon (num, heading, pitch)
	return false
end

function script.Killed (recentDamage, maxHealth)
	local severity = recentDamage / maxHealth

	for i = 1, #explodables do
		if (math.random() < severity) then
			Explode (explodables[i], SFX.SMOKE + SFX.FIRE)
		end
	end

	if (severity <= .5) then
		return 1
	else
		Explode (base, SFX.SHATTER)
		return 2
	end
end

function script.TransportPickup (passengerID)
	if(numUnits < 2) then
		numUnits = numUnits + 1
		Spring.Echo(passengerID)
		SetUnitValue(6, 1)-- BUSY set BUSY to 1;
		Spring.UnitScript.AttachUnit(linkPieces[numUnits], passengerID)
		SetUnitValue(6, 0)--set BUSY to 0;
	end
end

function script.EndTransport(each, passengerID)--ground UnloadLandFlood after the last unit unloaded.
end


function script.TransportDrop (passengerID, x, y, z )
SetUnitValue(6,1)-- BUSY
Spring.UnitScript.DropUnit(passengerID)
Spring.SetUnitPosition (passengerID, x, z , true) 
SetUnitValue(6,0)
numUnits = numUnits - 1
end
