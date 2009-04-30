shards = {}

function registerShard(name, shard)
    io.write("Register shard: "..name)
    shards[name] = shard
    shard.load()
end

function unregisterShard(name)
    io.write("Unregister shard: "..name)
    shards[name].unload()
    shards[name] = nil
end

function doSomeMagic()
    shards["shard1"].doMagic()
    shards["shard2"].doMagic()
end

function unregisterAllShards()
    table.foreach(shards, unregisterShard)
end

-- This is our shard1 code that gets loaded in independently.

local newgt = {}
setmetatable(newgt, {__index = _G})
setfenv(1, newgt)
NAME = "shard1"

function unload()
    io.write("shard1 should now unload")
end

function doMagic()
    io.write("Hello from shard1")
end

function load()
    io.write("shard1 should now initialise")
end

registerShard(NAME, newgt)

setfenv(1, _G)

-- This is our shard2 code that gets loaded in independently

local newgt = {}
setmetatable(newgt, {__index = _G})
setfenv(1, newgt)
NAME = "shard2"

function unload()
    io.write("shard2 should now unload")
end

function doMagic()
    io.write("Hello from shard2")
end

function load()
    io.write("shard2 should now initialise")
end

registerShard(NAME, newgt)

setfenv(1, _G)

-- And we're back to the main code

doSomeMagic()
unregisterAllShards()