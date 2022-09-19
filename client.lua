local Attr = {}
Attr.data = {config.defaultAttr}

ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent("esx:getSharedObject", function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end
end)

--------------------------------------------------------------------------------------
--                                                                                  --
--                                 member function                                  --
--                                                                                  --
--------------------------------------------------------------------------------------

function Attr:load()
    local loaded = false
    ESX.TriggerServerCallback("playerAttr:load", function(data)
        self.data = data
        self:setAll()
        loaded = true
    end)

    while not loaded do
        Wait(5)
    end
end

function Attr:setAll()
    SetPedMaxHealth(PlayerPedId(), self.data.maxHealth)
    if GetEntityHealth(PlayerPedId()) > self.data.maxHealth then
        SetEntityHealth(PlayerPedId(),self.data.maxHealth)
    end


end

function Attr:setMaxHealth(data)

end

function Attr:setMaxStamina(data)

end

function Attr:setCriticalStrikeRate(data)

end

function Attr:setCriticalStrikeHarm(data)

end

function Attr:setPhysicalDefense(data)

end

function Attr:setMagicDefense(data)

end

function Attr:setPhysicalAttack(data)

end

function Attr:setMagicAttack(data)

end

--------------------------------------------------------------------------------------
--                                                                                  --
--                                 exports function                                 --
--                                                                                  --
--------------------------------------------------------------------------------------

--- setAttr --- 

exports("setMaxHealth", function(...)
    Attr:setMaxHealth(...)
end)

exports("setMaxStamina", function(...)
    Attr:setMaxStamina(...)
end)

exports("setCriticalStrikeRate", function(...)
    Attr:setCriticalStrikeRate(...)
end)

exports("setCriticalStrikeHarm", function(...)
    Attr:setCriticalStrikeHarm(...)
end)

exports("setPhysicalDefense", function(...)
    Attr:setPhysicalDefense(...)
end)

exports("setMagicDefense", function(...)
    Attr:setMagicDefense(...)
end)

exports("setPhysicalAttack", function(...)
    Attr:setPhysicalAttack(...)
end)

exports("setMagicAttack", function(...)
    Attr:setMagicAttack(...)
end)

--- getAttr --- 

exports("getMaxHealth", function()
    return Attr.data.maxHealth
end)

exports("getMaxStamina", function()
    return Attr.data.maxStamina
end)

exports("getCriticalStrikeRate", function()
    return Attr.data.criticalStrikeRate
end)

exports("getCriticalStrikeHarm", function()
    return Attr.data.criticalStrikeHarm
end)

exports("getPhysicalDefense", function()
    return Attr.data.physicalDefense
end)

exports("getMagicDefense", function()
    return Attr.data.magicDefense
end)

exports("getPhysicalAttack", function()
    return Attr.data.physicalAttack
end)

exports("getMagicAttack", function()
    return Attr.data.magicAttack
end)

--------------------------------------------------------------------------------------
--                                                                                  --
--                                  main function                                   --
--                                                                                  --
--------------------------------------------------------------------------------------

RegisterNetEvent("esx:playerLoaded", function()
    Citizen.Wait(1000)
    Attr:load()
end)

Citizen.CreateThread(function()
    Wait(1000)
    Attr:load()
    -- while true do
    --     Citizen.Wait(1000)
    --     print(GetEntityHealth(PlayerPedId()) .. "/" .. GetEntityMaxHealth(PlayerPedId()))
    -- end
end)
