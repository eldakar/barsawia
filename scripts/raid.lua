raid = raid or {
    party = {},
    enemies = {},
    neutrals = {},
    objects = {}
}

function raid:init()
    self.party = {}
    self.enemies = {}
    self.neutrals = {}
    self.objects = {}
end

raid.hpmap = {
    ["w swietnej kondycji"] = 6,
    ["w dobrym stanie"] = 5,
    ["lekko ranny"] = 4,
    ["lekko ranna"] = 4,
    ["ranny"] = 3,
    ["ranna"] = 3,
    ["w zlej kondycji"] = 2,
    ["ciezko ranny"] = 1,
    ["ciezko ranna"] = 1,
    ["LEDWO ZYWY"] = 0,
    ["LEDWO ZYWA"] = 0
}

function raid:set_hp(_name, _hp)
    local lowName = string.lower(_name)
    if self.objects[lowName] then
       self.objects[lowName][hp] = self.hpmap(_hp) 
    end
end
