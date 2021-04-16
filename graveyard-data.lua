

local graveyard = _G.Graveyard

local unpack = table.unpack

--default css used on all graveyard tooltips
local graveyardTableCSS = {}
local graveyardTRCSS = {}
local graveyardTDCSS = {}

--table indexes for 
local CONST_TEXT_LEFT = 2
local CONST_TEXT_RIGHT = 3
local CONST_TEXT_LEFT_COLOR = 4
local CONST_TEXT_RIGHT_COLOR = 5
local CONST_TEXT_SIZE = 6
local CONST_LINE_TR_CSS = 7
local CONST_LINE_TD_CSS = 8

local CONST_ICON_LEFT = 2
local CONST_ICON_RIGHT = 3
local CONST_ICON_WIDTH = 4
local CONST_ICON_HEIGHT = 5

local graveyardOnEnterRegion = function (regionHandle, tombstoneID)

    --clear tooltip html
    graveyard.npTooltips.ClearTooltip()

    --all tombstone data
    local tombstoneData = graveyard.tombstonesData [tombstoneID]
    --tooltip lines data (for this specific tombstone)
    local linesData = tombstoneData.tooltipLines

    --cache function references
    local addLine = graveyard.npTooltips.AddLine
    local addIcon = graveyard.npTooltips.AddIcon

    --build the tooltip
    for i = 1, #linesData do
        local line = linesData [i]

        if (line [1] == "line") then
            addLine (line [CONST_TEXT_LEFT], line [CONST_TEXT_RIGHT], line [CONST_TEXT_LEFT_COLOR], line [CONST_TEXT_RIGHT_COLOR], line [CONST_TEXT_SIZE], line [CONST_LINE_TR_CSS], line [CONST_LINE_TD_CSS])

        elseif (line [1] == "icon") then
            addIcon (line [CONST_ICON_LEFT], line [CONST_ICON_RIGHT], line [CONST_ICON_WIDTH], line [CONST_ICON_HEIGHT])

        end
    end

    --world location where the tooltip is shown when the player enters the region
    graveyard.npTooltips.SetWorldLocation (unpack (tombstoneData.tooltipWorldLocation))
    --tooltip css data for <table>
    graveyard.npTooltips.SetTableCSS (graveyardTableCSS)

    --show the tooltip
    graveyard.npTooltips.ShowTooltip()

end

local graveyardOnLeaveRegion = function (regionHandle, tombstoneID)
    graveyard.npTooltips.HideTooltip()
end

--graveyard tombstones data
graveyard.tombstonesData = {

    --jackie tombstone
    {
        --register the tombstone area
        region = {
                name = 'Jackie Thumbstone Region',
                isPermanent = true,
                debug = false,
                isNetwork = false,
                
                regionEnterCallback = graveyardOnEnterRegion,
                regionLeaveCallback = graveyardOnLeaveRegion,
                --index for this table within graveyard.tombstonesData
                payLoad = {
                    1,
                },

                --region location
                worldHeight = 53.73176574707,
                regionHeight = 20,
                squareSize = 3,
                regionCoords = {
                    [-590] = {-74, -75},
                    [-589] = {-74, -75},
                }
        },

        --world location where the tooltip is shown
        tooltipWorldLocation = vector3(-1769.0, -220.7863, 55.82655),

        --lines to show
        tooltipLines = {
            --left text | right text | left text color | right text color | test size | TR CSS | TD CSS
            --left icon | right icon | width | heigh
            {"line", "<center>Jaclyn Hyde</center>", false, "orange", "orange", 18, graveyardTRCSS, {"padding-top: 6px", "padding-bottom: 6px"}},

            {"line", false, false, "orange", "orange", 1, graveyardTRCSS, graveyardTDCSS},

            {"icon", [[https://i.imgur.com/G6EYfbN.png]], false, 260, 260},

            {"line", "February 15th 1992", false, "white", "white", 14, graveyardTRCSS, {
                "padding-top: 10px", "width: 100%", "vertical-align: middle", "text-align: center", }},

            {"line", "March 22th 2019", false, "white", "white", 14, graveyardTRCSS, {
                "padding-top: 10px", "width: 100%", "vertical-align: middle", "text-align: center", }},

            {"line", "if your dreams are pretty hot\nhead on down to your heart\nthere you can find peace\nand angels singing burger shot", false, "orange", "white", 14, graveyardTRCSS, {
                "width: 260", "padding-top: 10px", "padding-bottom: 2px", "font-style: italic", "text-align: center"}},
        },
    },

    --kurt leonard
    {
        --register the tombstone area
        region = {
            name = 'Kurt Leonard Thumbstone Region',
            isPermanent = true,
            debug = false,
            isNetwork = false,

            regionEnterCallback = graveyardOnEnterRegion,
            regionLeaveCallback = graveyardOnLeaveRegion,
            --index for this table within graveyard.tombstonesData
            payLoad = {
                2,
            },
            
            --region location
            worldHeight = 49.344493865967,
            regionHeight = 20,
            squareSize = 3,
            regionCoords = {
                [-590] = {-88, -87},
                [-589] = {-88, -87},
             },
        },

        --world location where the tooltip is shown
        tooltipWorldLocation = vector3(-1768.373, -257.1764, 51.94455),

        --lines to show
        tooltipLines = {
            --left text | right text | left text color | right text color | test size | TR CSS | TD CSS
            --left icon | right icon | width | heigh
            {"line", "<center>Kurt Leonard</center>", false, "orange", "orange", 18, graveyardTRCSS, {"padding-top: 6px", "padding-bottom: 6px"}},

            {"line", false, false, "orange", "orange", 1, graveyardTRCSS, graveyardTDCSS},

            {"icon", [[https://i.imgur.com/G8XZyWW.png]], false, 260, 260},

            {"line", "January 15th 1988", false, "white", "white", 14, graveyardTRCSS, {
                "padding-top: 10px", "width: 100%", "vertical-align: middle", "text-align: center", }},

            {"line", "August 7th 2019", false, "white", "white", 14, graveyardTRCSS, {
                "padding-top: 10px", "width: 100%", "vertical-align: middle", "text-align: center", }},

            {"line", [[You always believed on me and always push me to be the better person on my self and you were always pround of me.<br>
            And I want to thank you for that, you were the best coworked I ever had.<br>
            I love you and Ill miss you...   forever<BR>      ]], false, "orange", "white", 14, graveyardTRCSS, {
                "width: 260", "padding-top: 10px", "padding-bottom: 2px", "font-style: italic", "text-align: center"}},

                {"line", false, "- Emma Dupont", "white", "orange", 14, graveyardTRCSS, {
                    "width: 260", "padding-top: 10px", "padding-bottom: 2px", "font-style: italic", "text-align: right"}},
        },
    },

   --james carter
   {
    --register the tombstone area
    region = {
        name = 'James Carter Thumbstone Region',
        isPermanent = true,
        debug = false,
        isNetwork = false,

        regionEnterCallback = graveyardOnEnterRegion,
        regionLeaveCallback = graveyardOnLeaveRegion,
         --index for this table within graveyard.tombstonesData
        payLoad = {
            3,
        },

        --region location
        worldHeight = 59.516704559326,
        regionHeight = 20,
        squareSize = 3,
        regionCoords = {
            [-562] = {-46, -47},
            [-563] = {-46, -47},
        }
    },

    --world location where the tooltip is shown
    tooltipWorldLocation = vector3 (-1685.578, -137.9919, 61.50373),

    --lines to show
    tooltipLines = {
        --left text | right text | left text color | right text color | test size | TR CSS | TD CSS
        --left icon | right icon | width | heigh
        {"line", "<center>James Carter</center>", false, "orange", "orange", 18, graveyardTRCSS, {"padding-top: 6px", "padding-bottom: 6px"}},

        {"line", false, false, "orange", "orange", 1, graveyardTRCSS, graveyardTDCSS},

        {"icon", [[https://i.imgur.com/3IaKtHL.png]], false, 260, 260},

        {"line", "January 31th 1993", false, "white", "white", 14, graveyardTRCSS, {
            "padding-top: 10px", "width: 100%", "vertical-align: middle", "text-align: center", }},

        {"line", "July 8th  1019", false, "white", "white", 14, graveyardTRCSS, {
            "padding-top: 10px", "width: 100%", "vertical-align: middle", "text-align: center", }},

        {"line", [["Will be remembered as the hero, the man who fought until his death"<br>
        Who had courage  to suffer the consequences of his wounds <br>
        Even if one day, would bring him to his grave<br>
        ]], false, "orange", "white", 14, graveyardTRCSS, {
            "width: 260", "padding-top: 10px", "padding-bottom: 2px", "font-style: italic", "text-align: center"}},

            {"line", false, "", "white", "orange", 14, graveyardTRCSS, {
                "width: 260", "padding-top: 10px", "padding-bottom: 2px", "font-style: italic", "text-align: right"}},
    },
    },
}
