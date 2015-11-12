require('libraries/playertables')
require('libraries/containers')

local unit = PlayerResource:GetSelectedHeroEntity(0)

if not gmt then
  gmt = getmetatable(_G)
  print(gmt)
  PrintTable(gmt)
  setmetatable(_G, {
    __newindex = function(t, n, v)
      print('smt for _G',t,n,v)
      rawset(t,n,v)
    end
    })
end

print(gmt)

function ActivateTest()
  
end

if true then
  return
end

local asdf = {}
for i=0,50 do
  table.insert(asdf, CreateItem("item_bfury",nil,nil))
end

c5 = Containers:CreateContainer({
     layout =      {10,10,10,10,10,10,10},
     headerText =  "",
     entity =      unit,
     items = asdf,
    })

c5:Open(0)

Timers:CreateTimer(4, function()
  c5:Delete(true)
end)



Containers:SetRangeAction(unit, {
  range = 100,
  position = unit:GetAbsOrigin() + RandomVector(400),
  action = function(playerID, unit, target)
    print("Range ACTION")
  end
  })

if true then
  return
end

id = id or -1
id = id + 1

if not Test then
  Test = {}
end

function Test:OrderFilter(order)
  print('----Test:OrderFilter------')
  --PrintTable(order)

  return true
end

--GameRules:GetGameModeEntity():SetStashPurchasingDisabled(true)
--GameRules:SetUseUniversalShopMode(true)

GameRules:GetGameModeEntity():SetExecuteOrderFilter(Dynamic_Wrap(Test, 'OrderFilter'), Test)

--[[local owner = PlayerResource:GetSelectedHeroEntity(0)
for i=5,11 do
  local item = owner:GetItemInSlot(i)
  if item and item:GetOwner() == owner then
    print("SET OWNER")
    item:SetOwner(nil)
    item:SetPurchaser(nil)
  end
end


local item = CreateItem("item_quelling_blade", owner, owner)
owner:AddItem(item)

item = CreateItem("item_ring_of_health", owner, owner)
owner:AddItem(item)

item = CreateItem("item_void_stone", owner, owner)
owner:AddItem(item)

item = CreateItem("item_broadsword", owner, owner)
owner:AddItem(item)

for i=5,11 do
  local item = owner:GetItemInSlot(i)
  if item and item:GetOwner() == nil then
    item:SetOwner(owner)
    item:SetPurchaser(owner)
  end
end]]

if true then
  --return
end

--[[local player =PlayerResource:GetPlayer(0)
local tt = {
     buttons={},
     headerText="Container Test",
     id=id,
     layout={2,3,4},
     ptID="cont_" .. id,
     rowStarts={1,3,6},
     size=9,
     skins={HourGlass=true, Something=true},
     slot4=255,
     slot9=256}

tt = {name="cont_" .. id, table=tt}

DeepPrintTable(tt)


CustomGameEventManager:Send_ServerToPlayer(player, "pt_table_full_update", tt )


Timers:CreateTimer(1, function()
tt = {
  id=id,
  ptID="cont_" .. id,
  layout={2,3,4},
  size=0,
  rowStarts={},
  skins={},
  buttons={},
  headerText="Container Test"
}

tt.size = 9
table.insert(tt.rowStarts, 1)
table.insert(tt.rowStarts, 3)
table.insert(tt.rowStarts, 6)

tt.skins["HourGlass"] = true
tt.skins["Something"] = true

tt["slot4"] = 255
tt["slot9"] = 256

tt = {name="cont_" .. id, table=tt}

DeepPrintTable(tt)

CustomGameEventManager:Send_ServerToPlayer(player, "pt_table_full_update", tt )
end)]]
local abil = unit:FindAbilityByName("containers_lua_targeting")
--[[if not abil then
  unit:RemoveAbility("axe_culling_blade")
  unit:AddAbility("containers_lua_targeting")
  abil = unit:FindAbilityByName("containers_lua_targeting")
  abil:SetLevel(1)
end
print(abil:GetAbilityIndex())

unit:AddAbility("axe_culling_blade")
print(abil:GetAbilityIndex())
print(unit:FindAbilityByName("axe_culling_blade"))
print(unit:FindAbilityByName("axe_culling_blade"):GetAbilityIndex())

for i=0,15 do
  local abil = unit:GetAbilityByIndex(i)
  print(abil and abil:GetAbilityName() or abil)
end

print(abil:IsActivated(), abil:IsHidden(), abil:IsInAbilityPhase())
abil:SetHidden(false)]]

if true then
  --return
end

function makeString(len)
  local t = {}
  for i=1,len do
    table.insert(t, string.char(math.random(32,126)))
  end

  return table.concat(t)
end

function makeVal(len, min, max)
  local r = RandomInt(min,max)
  if r == 1 then
    return RandomInt(len*-1000, len*1000)
  elseif r == 2 then
    return RandomFloat(len*-100, len*100)
  elseif r == 3 then
    return makeString(len)
  elseif r == 4 then
    local t = {}
    for i=1,RandomInt(0,5) do
      t[makeString(len)] = makeVal(len,1,4)
    end

    return t
  end
end

if c and c.Delete then
  c:Delete()
else
  local oldfun = CustomGameEventManager.Send_ServerToPlayer
  CustomGameEventManager.Send_ServerToPlayer = function(_, player, event, tt )
    print("send_servertoplayer", player, event)
    DeepPrintTable(tt)
    oldfun(CustomGameEventManager, player, event, tt)
  end
end

if c2 and c2.Delete then
  c2:Delete()
end
if c3 and c3.Delete then
  c3:Delete()
end

local ProcessTable = nil
ProcessTable = function(t, strings)
  local st = strings or {}
  if strings == nil then
    t = PlayerTables:copy(t)
  end

  for k,v in pairs(t) do
    if type(v) == "string" then
      st[k] = v
      t[k] = nil
    elseif type(v) == "table" then
      st[k] = {}
      ProcessTable(v, st[k])
    end
  end

  if strings == nil then
    t["__strings__"] = st
    return t
  end
end



local player = PlayerResource:GetPlayer(0)
local tt = {}

if timer4 then Timers:RemoveTimer(timer4) end
timer4 = Timers:CreateTimer(function()
  tt[makeString(3)] = makeVal(4,4,4)
  CustomGameEventManager:Send_ServerToPlayer(player, "aaa", tt)

  --DeepPrintTable(tt)
  --print('-------------------------')
  --DeepPrintTable(ProcessTable(tt))
  --return .1
end)

c = {Delete = function() end}

if true then
  --return
end

c = Containers:CreateContainer({
     layout =      {2,3,4},
     skins =       {"HourGlass", "Something"},
     headerText =  "Container Test",
     pids =        {0},
     buttons =     {"Button 1", "Button 2"},
     entity =      unit,
     closeOnOrder = false,
     position =    "1200px 600px 0px",
    })

PrintTable(c)

--[[print('header: ', c:GetHeaderText())
print('set header: ', c:SetHeaderText("asdfasdf"))
print('header: ', c:GetHeaderText())
print('set header: ', c:SetHeaderText("asdfasdf"))
print('size: ', c:GetSize())
print('layout: ')
PrintTable(c:GetLayout())
print(c:SetLayout({2,3,2}))
print('layout: ')
PrintTable(c:GetLayout())

print('GetSkins: ')
PrintTable(c:GetSkins())
print('hasskin: ', c:HasSkin("HourGlass"))
print('hasskin: ', c:HasSkin("HourG"))
print('removeskin: ', c:RemoveSkin("Something"))
print('removeskin: ', c:RemoveSkin("Something"))
print('hasskin: ', c:HasSkin("Something"))
print('GetSkins: ')
PrintTable(c:GetSkins())
print('removeskin: ', c:AddSkin("Something"))
print('GetSkins: ')
PrintTable(c:GetSkins())
print('removeskin: ', c:AddSkin("Something"))
print('GetSkins: ')
PrintTable(c:GetSkins())

print('contindex: ', c:GetContainerIndex())]]
if items then
  for _,it in ipairs(items) do 
    UTIL_Remove(it)
  end
end

items = {}
item = CreateItem("item_tango", unit, unit)
table.insert(items, item)
print(c:AddItem(item, 4))
--print(item:GetEntityIndex())

--print(item:GetCurrentCharges())

item2 = CreateItem("item_tango", unit, unit)
table.insert(items, item)
--print(item2:GetEntityIndex())
--print(c:GetSlotForItem(item))
--print(c:GetItemInRowColumn(1,1))
--print(c:GetRowColumnForItem(item))
print(c:AddItem(item2, 3,4))
--[[print(item:GetCurrentCharges())
print(c:GetItemInRowColumn(3,4))
print(c:GetRowColumnForItem(item2))
print(c:GetItemInSlot(1))
print(c:ContainsItem(item))
print(c:ContainsItem(item2))
print('itemsbyname')
PrintTable(c:GetItemsByName("item_tango"))
print(c:GetItemsByName("item_tango")[1]:GetEntityIndex())
print(c:GetItemsByName("item_tango")[2]:GetEntityIndex())
print(c:SwapSlots(1,4))
print(c:SwapItems(item, item2))

print('----------')

print('subs')
PrintTable(c.subs)
print('opens')
PrintTable(c.opens)

print(c:IsSubscribed(0))
print(c:IsSubscribed(1))
PrintTable(c:GetSubscriptions())
PrintTable(c:GetAllOpen())
print(c:IsOpen(0))
print(c:IsOpen(1))
--print(c:Close(1))

print('subs')
PrintTable(c.subs)
print('opens')
PrintTable(c.opens)

--print(c:Open(0))
print(c:IsOpen(0))

print('subs')
PrintTable(c.subs)
print('opens')
PrintTable(c.opens)
PrintTable(c:GetAllOpen())

--print(c:Close(0))
print(c:AddSubscription(0))
print(c:IsSubscribed(0))
--print(c:RemoveSubscription(0))
print(c:IsSubscribed(0))

print('subs')
PrintTable(c.subs)
print('opens')
PrintTable(c.opens)

print(c:SwapItems(item, item2))
--print(c:Open(0))

item3 = CreateItem("item_tango", unit, unit)
table.insert(items, item3)
c:AddItem(item3)

--item3 = CreateItem("item_diffusal_blade", unit, unit)
--table.insert(items, item3)
--item3 = unit:GetItemInSlot(1)
--c:AddItem(item3)
--print(item3:GetLevel())

Timers:CreateTimer(1, function()
  print(c:SwapItems(item, item2))
  print(c:SwapSlots(1,2))
end)

Timers:CreateTimer(1, function()
  --c:RemoveSubscription(0)
  --c:AddSubscription(0)
  c:RemoveSkin("Hourglass")
  c:RemoveItem(item2)
  Timers:CreateTimer(1, function()
    c:RemoveButton(1)
    c:SetLayout({3,2,1})

    Timers:CreateTimer(1, function()
      c:SetButton(3, "New Button")
      c:SetButton(1, "Restored Button")
      c:SetHeaderText("CHANGED TEXT")

      Timers:CreateTimer(1, function()
        c:SetHeaderText("Lots")
        c:SetLayout({10,10,10,10,10,10,10})
        c:AddSkin("SmallItems")
        for k,v in pairs(c:GetButtons()) do
          c:RemoveButton(k)
        end
      end)
    end)
  end)
end)]]

--c:SetDraggable(false)

--c:RemoveSubscription(0)
--c:AddSubscription(0)

c:Open(0)

c2 = Containers:CreateContainer({
     layout =      {2,2},
     skins =       {"Hourglass"},
     headerText =  "2x2",
     pids =        {0},
     buttons =     {"Take All"},
     position =    "900px 200px 0px",
     OnEmptyAndClosed = function(container)
       print("Empty and closed")
       container:GetEntity():RemoveSelf()
       container:Delete()
     end,
     closeOnOrder= true,
    OnButtonPressed = function(playerID, unit, container, button, buttonName)
      if button == 1 then
        local items = container:GetAllItems()
        for _,item in ipairs(items) do
          container:RemoveItem(item)
          Containers:AddItemToUnit(unit,item)
        end

        container:Close(playerID)
      end
    end,
    })

--c2:Open(0)
item = CreateItem("item_blade_mail", unit, unit)
table.insert(items, item)
c2:AddItem(item)

item = CreateItem("item_tango", unit, unit)
table.insert(items, item)
c2:AddItem(item)


item = CreateItem("item_force_staff", unit, unit)
table.insert(items, item)
c:AddItem(item)

local sdf = item

item = CreateItem("item_veil_of_discord", unit, unit)
table.insert(items, item)
c:AddItem(item)

item = CreateItem("item_example_item", unit, unit)
table.insert(items, item)
c:AddItem(item)

item = CreateItem("item_quelling_blade", unit, unit)
table.insert(items, item)
c:AddItem(item)

item = CreateItem("item_bfury", unit, unit)
table.insert(items, item)
c:AddItem(item)

for iname,v in pairs(items) do
  v:SetOwner(unit)
end 


local sItems = {}
local prices = {}
local stocks = {}

local ii = {
  {"item_quelling_blade", 150, 3},
  {"item_quelling_blade"},
  {"item_clarity"},
  {"item_bfury", 9000},
}

for _,i in ipairs(ii) do
  item = CreateItem(i[1], unit, unit)
  local index = item:GetEntityIndex()
  sItems[#sItems+1] = item
  if i[2] ~= nil then prices[index] = i[2] end
  if i[3] ~= nil then stocks[index] = i[3] end
end

sItems[3]:SetCurrentCharges(3)

c3 = Containers:CreateShop({
     layout =      {2,2,2,2,2,2},
     skins =       {},
     headerText =  "Shop Test",
     pids =        {0},
     --buttons =     {"Button 1"},
     position =    "1600px 300px 0px",
     entity =        unit:GetEntityIndex(),
     items =       sItems,
     prices =      prices,
     stocks =      stocks,
     closeOnOrder= true,
     range=300,
  })

--c3:Open(0)


if timer5 then Timers:RemoveTimer(timer5) end
timer5 = Timers:CreateTimer(.3,function()
  c3:SetPrice(sItems[3], c3:GetPrice(sItems[3])+30)
  --return .3
end)

Containers:SetDefaultInventory(unit, c)
Containers:SetDisableItemLimit(true)

--PrintTable(c)

--PrintTable(PlayerTables)

if phys then
  Containers:SetEntityOrderAction(phys, nil)
  if IsValidEntity(phys) then
    if phys:GetContainedItem() then phys:GetContainedItem():RemoveSelf() end
    phys:RemoveSelf()
  end
end
phys = CreateItemOnPositionSync(unit:GetAbsOrigin() + RandomVector(300), nil) --CreateItem("item_bfury", nil, nil)
c2:SetEntity(phys)
Containers:SetEntityOrderAction(phys, {
  range = 100,
  action = function(playerID, unit, target)
    print("ORDER ACTION", playerID, unit, target)
    c2:Open(0)
    unit:Stop()
  end,
  })

if viper then
  Containers:SetEntityOrderAction(viper, nil)
  if IsValidEntity(viper) then viper:RemoveSelf() end
end

viper = CreateUnitByName("npc_dummy_unit", unit:GetAbsOrigin() + RandomVector(300), true, nil, nil, DOTA_TEAM_GOODGUYS)
viper:AddNewModifier(viper, nil, "modifier_shopkeeper", {})
viper:SetModel("models/heroes/viper/viper.vmdl")
viper:SetOriginalModel("models/heroes/viper/viper.vmdl")
viper:StartGesture(ACT_DOTA_IDLE)
Containers:SetEntityOrderAction(viper, {
  container = c3,
  action = function(playerID, unit, target)
    print("ORDER ACTION", playerID, unit, target)
    c3:Open(0)
    unit:Stop()
  end,
  })


if true then
  return
end

--CustomGameEventManager:Send_ServerToPlayer(PlayerResource:GetPlayer(0), "pt_table_full_update", {name="AS", changes={}} )

if not PlayerTables:TableExists("cont_0") then
  print('not exists')
  PlayerTables:CreateTable("cont_0", {test="asdf", [222]=2345}, {0})
else
  print('exists')
  --PlayerTables:DeleteTable("cont_0")
  PlayerTables:CreateTable("cont_0", {test="asdf", [222]=2345}, {0})
end

PlayerTables:SetPlayerSubscriptions("cont_0", {1,2})
PlayerTables:AddPlayerSubscription("cont_0", 0)
--PlayerTables:RemovePlayerSubscription("cont_0", 0)

DeepPrintTable(PlayerTables:GetAllTableValues("cont_0"))

PlayerTables:SetTableValue("cont_0", "test", "asdfasdf")
PlayerTables:SetTableValue("cont_0", "test2", {aaa=234, [111]="asdvzxc"})

DeepPrintTable(PlayerTables:GetAllTableValues("cont_0"))

PlayerTables:SetTableValues("cont_0", {test="zzzzz", test2={}, [222]=nil, zxcv="zsxdv"})

DeepPrintTable(PlayerTables:GetAllTableValues("cont_0"))
