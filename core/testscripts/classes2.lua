function Class(members)
  members = members or {}
  local mt = {
    __metatable = members;
    __index     = members;
  }
  local function new(_, init)
    return setmetatable(init or {}, mt)
  end
  local function copy(obj, ...)
    local newobj = obj:new(unpack(arg))
    for n,v in pairs(obj) do newobj[n] = v end
    return newobj
  end
  members.new  = members.new  or new
  members.copy = members.copy or copy
  return mt
end


Vector = {}

local Vector_mt = Class(Vector)

function Vector:new(x,y)
  return setmetatable( {x=x, y=y}, Vector_mt)
end

function Vector:mag()
  return math.sqrt(self:dot(self))
end

function Vector:dot(v)
  return self.x * v.x + self.y * v.y
end

v1 = Vector:new(3,4)
table.foreach(v1,print)