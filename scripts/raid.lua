raid = raid or {
    party = {},
    enemies = {},
    neutrals = {},
    objects = {},
    data = {},
    timer = 0
}

function raid:init()
    data = {}
    self.party = {}
    self.enemies = {}
    self.neutrals = {}
    self.objects = {}
    self.data = {}
    self.timer = 0
end

function raid:reset()
    self.timer = 0
    self.data = {}
    data = {}
    self.objects = {}
end


raid.hpmap = {
    ["w swietnej kondycji"] = "6",
    ["w dobrym stanie"] = "5",
    ["lekko ranny"] = "4",
    ["lekko ranna"] = "4",
    ["ranny"] = "3",
    ["ranna"] = "3",
    ["w zlej kondycji"] = "2",
    ["ciezko ranny"] = "1",
    ["ciezko ranna"] = "1",
    ["LEDWO ZYWY"] = "0",
    ["LEDWO ZYWA"] = "0"
}

raid.hpbars = {
    ["0"] = "[<red>#      <reset>]",
    ["1"] = "[<red>##     <reset>]",
    ["2"] = "[<yellow>###    <reset>]",
    ["3"] = "[<yellow>####   <reset>]",
    ["4"] = "[<green>#####  <reset>]",
    ["5"] = "[<green>###### <reset>]",
    ["6"] = "[<green>#######<reset>]"
}

function raid:set_hp(_name, _hp)
    local lowName = string.lower(_name)
    local exists = false
    
--    print("Name: " .. lowName .. "  HP: " .. _hp)
    for k,v in pairs(self.objects) do
        if v == lowName then
--            print(k .. " " .. v .. " " .. lowName .. " " .. self.hpmap[_hp])
            data[k] = self.hpmap[_hp]
            exists = true
        end
    end
    if exists == false then
        table.insert(self.objects, lowName)
        data[lowName] = self.hpmap[_hp]
    end
end

function raid:display()
    for k, v in pairs(self.objects) do
        cecho("[<white>" .. k .. "<reset>] " .. raid.hpbars[data[v]] .. " " .. v .. "\n")
    end
end

function raid:eval()
    --reset values
    raid:init()
    send("kondycja wszystkich")
    killTimer(self.timer)
    self.timer = tempTimer(0.3, [[raid:display()]] )
end

--lua raid.hpmap["w dobrym stanie"] lua data[1]

raid:init()