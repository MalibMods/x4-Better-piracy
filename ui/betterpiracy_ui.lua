-- Better Piracy UI enhancements
-- Shows faction name (with icon) instead of ship/station name for the
-- Corsair "faction_refs" order parameter list items.
--
-- Technique: monkey-patch two MapMenu functions.
--   1. displayOrderParam  – injects inputparams into the stripped-down
--      param2 table that the game builds for list items, so that
--      getParamValue can see our "bpFactionRef" marker.
--   2. getParamValue      – when the marker is present, resolves the
--      stored component reference to a faction display name + icon.

local function init()
    local mapMenu = Helper.getMenu("MapMenu")
    if not mapMenu then
        DebugError("BetterPiracy: MapMenu not found – faction name display disabled")
        return
    end

    -- 1. Inject inputparams for list items that carry the bpFactionRef marker.
    --    The game builds a stripped param2 = { type, value, text, editable, … }
    --    without inputparams for list entries, which means getParamValue never
    --    sees our custom marker.  We restore it here.
    if mapMenu.displayOrderParam then
        local orig_displayOrderParam = mapMenu.displayOrderParam
        mapMenu.displayOrderParam = function(ftable, orderidx, order, paramidx, param, listidx, instance, ...)
            if listidx and param.type == "object" and not param.inputparams then
                local parentParam = order and order.params and order.params[paramidx]
                if parentParam and parentParam.inputparams and parentParam.inputparams.bpFactionRef then
                    local newParam = {
                        text           = param.text,
                        value          = param.value,
                        type           = param.type,
                        editable       = param.editable,
                        playerreadonly = param.playerreadonly,
                        inputparams    = parentParam.inputparams,
                    }
                    return orig_displayOrderParam(ftable, orderidx, order, paramidx, newParam, listidx, instance, ...)
                end
            end
            return orig_displayOrderParam(ftable, orderidx, order, paramidx, param, listidx, instance, ...)
        end
    end

    -- 2. When a value is rendered for a bpFactionRef object param, return the
    --    owner faction's name (and icon) instead of the component's own name.
    if mapMenu.getParamValue then
        local orig_getParamValue = mapMenu.getParamValue
        mapMenu.getParamValue = function(paramtype, value, inputparams, ...)
            if paramtype == "object" and inputparams and inputparams.bpFactionRef and value then
                local ok, factionid = pcall(GetComponentData, value, "owner")
                if ok and factionid and factionid ~= "" and factionid ~= "ownerless" then
                    local ok2, name, icon = pcall(GetFactionData, factionid, "name", "icon")
                    if ok2 and name and name ~= "" then
                        if icon and icon ~= "" then
                            return string.format("\027[%s] %s", icon, name)
                        end
                        return name
                    end
                end
            end
            return orig_getParamValue(paramtype, value, inputparams, ...)
        end
    end
end

init()
