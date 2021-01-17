local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_cnn")
local cfg = {}
cfg.announces = {
  ["commercial"] = {
    --image = "nui://vrp_mod/announce_commercial.png",
    image = "http://i.imgur.com/b2O9WMa.png"
  }
}
--[[
  Snnaples#1864
  SCRIPT CNN BUCURATI-VA DE EL!
--]]
local cfg2 = cfg
local announces = cfg2.announces
RegisterNetEvent("snnaples:AnuntCNN")
AddEventHandler("snnaples:AnuntCNN", function()
 local user_id = vRP.getUserId({source})
     local playerSource = vRP.getUserSource({user_id})
     local playerName = GetPlayerName(playerSource)
vRP.prompt({playerSource,"Scrie anuntul:","", function(player,anunt)
      local anunt = tostring(anunt) 
   if string.len(anunt) >= 10 and string.len(anunt) <= 800 then
  if vRP.tryFullPayment({user_id, 300}) then     
     local users = vRP.getUsers()
     for k,v in pairs(users) do
        vRPclient.announce(v,{announces.commercial.image,"[" .. user_id .. "] " .. playerName  .. ": " .. anunt})
       end
vRPclient.notify(playerSource,{"[~b~CNN~w~] ~g~Ai dat un anunt!"})
else
vRPclient.notify(playerSource,{"[~b~CNN~w~] ~r~Nu ai destui bani pentru a da un anunt!"})
end
else
  vRPclient.notify(playerSource,{"[~b~CNN~w~] ~r~Anuntul trebuie sa contina minim 10 caractere!"})
end
 end})
 end)
