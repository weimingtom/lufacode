myclass = {}
mymetatable = {__index = myclass}
function myclass.new (objectvalue)
  local self = {value = objectvalue}
  setmetatable(self,mymetatable)
  return self
end

function myclass:print()
  print(self.value)
end

obj = myclass.new("hello world")
obj:print()
obj.print = function (self)
  print("my value is still hello world:",self.value)
end
obj:print()
myclass.print(obj)