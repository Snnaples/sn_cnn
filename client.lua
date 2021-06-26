vRP = Proxy.getInterface("vRP")

local function textFain(text, secconds)
	ClearPrints()
	SetTextEntry_2("STRING")
	AddTextComponentString(text)
	DrawSubtitleTimed(secconds * 1000, 1)
end

local function drawText3D(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = #(vector3(px,py,pz) - vector3(x,y,z))
    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*130
    local scale = scale*fov

    if onScreen then
        SetTextScale(0.2*scale, 0.5*scale)
        SetTextFont(6)
        SetTextProportional(1)
	SetTextColour( 1,1, 1, 255 )
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
	    World3dToScreen2d(x,y,z, 0) --Added Here
        DrawText(_x,_y)
    end
end
local function drawInfo(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

Citizen.CreateThread(function()
while true do 
    Citizen.Wait(1)
    if #(vector3(-599.94482421875,-929.68103027344,23.864994049072) - GetEntityCoords(PlayerPedId())) < 1 then 
            drawInfo("Apasa ~b~E~w~ pentru a da un ~b~anunt")
            if IsControlJustPressed(1,51) then
                TriggerServerEvent("snnaples:AnuntCNN")
            end
        end
     end
end)

