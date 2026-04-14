local function DebugPrint(message)
    if Config.Debug then
        print(('[rs-ignition] %s'):format(message))
    end
end

local function Notify(message)
    if not Config.Notifications then
        return
    end

    lib.notify({
        description = message
    })
end

local function IsPlayerDriver(vehicle, ped)
    return vehicle ~= 0 and GetPedInVehicleSeat(vehicle, -1) == ped
end

function toggleEngine()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)

    if not IsPlayerDriver(vehicle, ped) then
        return
    end

    local newState = not GetIsVehicleEngineRunning(vehicle)
    SetVehicleEngineOn(vehicle, newState, true, true)

    DebugPrint(('Engine toggled %s'):format(newState and 'on' or 'off'))
    Notify(newState and 'Engine on' or 'Engine off')
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)
        local enteringVehicle = GetVehiclePedIsTryingToEnter(ped)

        if IsPedGettingIntoAVehicle(ped) and enteringVehicle ~= 0 then
            if not GetIsVehicleEngineRunning(enteringVehicle) then
                SetVehicleEngineOn(enteringVehicle, false, true, true)
                DisableControlAction(2, 71, true)
                DebugPrint('Prevented engine auto-start while entering vehicle')
            end
        end

        if vehicle ~= 0 and IsPedInAnyVehicle(ped, false) and not IsEntityDead(ped) and not GetIsVehicleEngineRunning(vehicle) then
            DisableControlAction(2, 71, true)
        end

        if (IsControlJustReleased(0, Config.ToggleKey) or IsDisabledControlJustReleased(0, Config.ToggleKey)) and IsPlayerDriver(vehicle, ped) then
            toggleEngine()
        end

        if vehicle ~= 0 and IsPlayerDriver(vehicle, ped) and IsControlPressed(2, 75) and not IsEntityDead(ped) then
            if GetIsVehicleEngineRunning(vehicle) then
                Citizen.Wait(150)
                SetVehicleEngineOn(vehicle, true, true, false)
                DebugPrint('Kept engine running while exiting vehicle')
                TaskLeaveVehicle(ped, vehicle, 0)
            else
                TaskLeaveVehicle(ped, vehicle, 0)
            end
        end
    end
end)
