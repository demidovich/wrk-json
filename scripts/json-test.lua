local cjson = require('cjson')
local cjson2 = cjson.new()
local cjson_safe = require('cjson.safe')
local inspect = require('inspect')

math.randomseed(os.time())
math.random(); math.random(); math.random()

function shuffle(paths)
  local j, k
  local n = #paths

  for i = 1, n do
    j, k = math.random(n), math.random(n)
    paths[j], paths[k] = paths[k], paths[j]
  end

  return paths
end

function error(message)
  print(message)
  os.exit(1)
end

function configuration(file)
  local data = {}
  local content

  local f = io.open(file, "r")
  if f == nil then
    error("File " .. file .. " not found")
  end
    
  content = f:read("*all")
  data = cjson.decode(content)
  io.close(f)

  if data.headers == nil then
    error("File " .. file .. " dont contains headers section")
  end

  if data.requests == nil then
    error("File " .. file .. " dont contains requests section")
  end

  return data
end

test = configuration("/data/requests.json")

print(inspect(#test.requests))
os.exit()


if #test.requests <= 0 then
  error("No requests found")
end

print("Found " .. #requests .. " requests")

-- run requests

-- counter = 1
-- request = function()

--   local request_object = requests[counter]

--   counter = counter + 1
--   if counter > #requests then
--     counter = 1
--   end

--   return wrk.format(request_object.method, request_object.path, request_object.headers, request_object.body)
-- end
