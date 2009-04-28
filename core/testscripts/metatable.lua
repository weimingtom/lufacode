x = { value = 3 }
mt = { __sub = function (a, b) return { value = a.value - b.value } end, __add = function (a, b) return { value = a.value + b.value } end }
setmetatable(x, mt)
local a = x + x
print(a.value)
local b = a - x
print(b.value)
