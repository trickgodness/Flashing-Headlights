local flashing = false
local rgb = false
local sleep = 100

function fh()
    local player = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(player, false)
    if IsPedInAnyVehicle(player, false) then
        if flashing == false then
            flashing = true
        elseif flashing == true then
            flashing = false
            SetVehicleLights(vehicle, 0)
            SetVehicleXenonLightsCustomColor(vehicle, 255,255,255)
        end
        while flashing == true do
            ToggleVehicleMod(vehicle, 22, true)
            SetVehicleLights(vehicle, 2)
            SetVehicleFullbeam(vehicle, true)
            Citizen.Wait(sleep)
            SetVehicleLights(vehicle, 1)
            SetVehicleFullbeam(vehicle, true)
            Citizen.Wait(sleep)
            SetVehicleLights(vehicle, 2)
            SetVehicleFullbeam(vehicle, true)
            if rgb then
                SetVehicleXenonLightsCustomColor(vehicle, 255,0,0)
            else
                SetVehicleXenonLightsCustomColor(vehicle, 255,255,255)
            end
            Citizen.Wait(sleep)
            SetVehicleLights(vehicle, 1)
            SetVehicleFullbeam(vehicle, true)
            Citizen.Wait(sleep)
            SetVehicleLights(vehicle, 2)
            SetVehicleFullbeam(vehicle, true)
            if rgb then
                SetVehicleXenonLightsCustomColor(vehicle, 0,255,0)
            else
                SetVehicleXenonLightsCustomColor(vehicle, 255,255,255)
            end
            Citizen.Wait(sleep)
            SetVehicleLights(vehicle, 1)
            SetVehicleFullbeam(vehicle, true)
            Citizen.Wait(sleep)
            SetVehicleLights(vehicle, 2)
            SetVehicleFullbeam(vehicle, true)
            if rgb then
                SetVehicleXenonLightsCustomColor(vehicle, 0,0,255)
            else
                SetVehicleXenonLightsCustomColor(vehicle, 255,255,255)
            end
            Citizen.Wait(sleep)
            SetVehicleLights(vehicle, 1)
            SetVehicleFullbeam(vehicle, true)
            Citizen.Wait(sleep)
            Citizen.Wait(1000)
        end
    end
end

RegisterCommand("fh", function()
    fh()
end, false)

RegisterCommand("fhrgb", function()
    if rgb == false then
        rgb = true
    elseif rgb == true then
        rgb = false
    end
end, false)

RegisterCommand("fhspeed", function()
    if sleep == 50 then
        sleep = 100
    elseif sleep == 100 then
        sleep = 150
    elseif sleep == 150 then
        sleep = 200
    elseif sleep == 200 then
        sleep = 300
    elseif sleep == 300 then
        sleep = 50
    end
end, false)
