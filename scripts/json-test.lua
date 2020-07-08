local cjson = require('cjson')
local cjson2 = cjson.new()
local cjson_safe = require('cjson.safe')
local inspect = require('inspect')

math.randomseed(os.time())

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

  if #data.requests <= 0 then
    error("No requests found")
  end

  print("Found requests: " .. #data.requests)

  for key, val in pairs(data.headers) do
    print("Found header: " .. key .. " " .. val)
  end

  return data
end

test = configuration("/data/requests.json")

request = function()
  local request_object = test.requests[math.random(#test.requests)]
  return wrk.format(request_object.method, request_object.path, test.headers, request_object.body)
end
