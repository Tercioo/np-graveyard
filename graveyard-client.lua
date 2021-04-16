
_G.Graveyard = {}
local graveyard = _G.Graveyard
local npt
local tooltips

--add a gravestone
function graveyard.AddGrave(graveTable)
    npt.CreateRegion(graveTable.region)
end

--initialize
Citizen.CreateThread(function()
	Wait (100)
	--get the toolbox
    npt = exports ["np-toolbox"]:GetNoPixelToolbox()
    tooltips = exports ["np-tooltips"]:GetTooltip()
    
    --cache the toolbox and tooltips
    graveyard.npToolbox = npt
    graveyard.npTooltips = tooltips

	--register regions in the client region manager
    for i = 1, #graveyard.tombstonesData do
		graveyard.AddGrave(graveyard.tombstonesData [i])
    end
end)