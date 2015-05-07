---
--- Algernon Server Configuration
--- /etc/algernon/server.lua
---

--- If set to true, errors will be shown in the browsers,
--- and request will be buffered (which results in cookies not working, for now)
SetDebug(false)

-- If set to true, log messages will be more frequent
SetVerbose(false)

--- Logging (will log to console if an empty string is given)
--LogTo("/var/log/algernon.log")

-- Custom permission denied handler
DenyHandler(function()
  content("text/html")
  print[[<!doctype html><html><head><title>Permission denied</title><link href='//fonts.googleapis.com/css?family=Lato:300' rel='stylesheet' type='text/css'></head><body style="background: #f0f0f0; color: #101010; font-family: 'Lato', sans-serif; font-weight: 300; margin: 4em; font-size: 2em;">]]
  print("<strong>HTTP "..method()..[[</strong> <font color="red">denied</font> for ]]..urlpath())
  error([[</body></html>]])
end)
