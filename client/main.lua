function DrawName3D(x,y,z, text, colorR, colorG, colorB, scaleX, ScaleY) 
    SetDrawOrigin(x, y, z, 0);
	SetTextFont(0)
	SetTextProportional(0)
	SetTextScale(scaleX, ScaleY)
	SetTextColour(colorR, colorG, colorB, 240)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextEdge(2, 0, 0, 0, 150)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(0.0, 0.0)
	ClearDrawOrigin()
end


CreateThread(function()
    while true do 
        local interval = 500
        local posPlayer = GetEntityCoords(PlayerPedId())
        for _,v in pairs(Config.Text) do 
            local dest = v.pos 
            local dist = #(posPlayer-dest)
            if dist <= 5 then 
                interval = 0
                DrawName3D(dest.x, dest.y, dest.z, v.text, v.R, v.G, v.B, v.scaleXText, v.scaleYText)
            end
        end
        Wait(interval)
    end
end)