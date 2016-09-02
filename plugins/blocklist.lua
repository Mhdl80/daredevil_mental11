do
function run(msg, matches)
if matches[1] == "block" and is_sudo(msg) then
local version = matches[2]
redis:sadd('bot:bk',version)
block_user("user#id"..matches[2],ok_cb,false)
return 'Done! \n User Blocked'
end
if matches[1] == "unblock" and is_sudo(msg) then
local id = matches[2]
redis:srem('bot:bk',id)
unblock_user("user#id"..matches[2],ok_cb,false)
return 'Done! \n User UnBlocked'
end
if matches[1] == 'clean bk' and is_sudo(msg) then
    local hash = ('bot:bk')
    redis:del(hash)
return ' done!'
end
	if matches[1]:lower() == 'block list' then
local gethash = redis:smembers('bot:bk')
local blocklist = ''
for k,v in pairs(gethash) do
  blocklist = blocklist .. '> ('.. k ..') '..v..'\n'
end
return 'Blocked Users : \n'..blocklist
end
end
return {
	patterns = {
		"^([Bb]lock list)$",
		"^([Bb]lock) (.*)$",
        "^([Uu]nblock) (.*)$",
		"^([Cc]lean bk)$",
	},
	run = run
} end
