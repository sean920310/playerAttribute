local MySQLReady = false
local Attr = {}

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

MySQL.ready(function()
    MySQLReady = true
end)

--------------------------------------------------------------------------------------
--                                                                                  --
--                                 member function                                  --
--                                                                                  --
--------------------------------------------------------------------------------------

function Attr:load(source)
    local data = {}

    while not MySQLReady do
        Wait(5)
    end
    
    local xPlayer = ESX.GetPlayerFromId(source)
    local sync = false
    MySQL.Async.fetchAll('SELECT `attr` FROM `users` WHERE `identifier`=@identifier;', {['@identifier'] = xPlayer.getIdentifier()}, function(collect)
        if collect[1] then
           local temp = json.decode(collect[1].attr)
           data = temp
           sync = true
        end
    end)

    while not sync do
        Wait(0)
    end

    return data
end

--------------------------------------------------------------------------------------
--                                                                                  --
--                              esx callback function                               --
--                                                                                  --
--------------------------------------------------------------------------------------

ESX.RegisterServerCallback("playerAttr:load",function(source,cb)
    cb(Attr:load(source))
end)


