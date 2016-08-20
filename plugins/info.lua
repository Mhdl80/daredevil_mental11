local function run(msg, matches)
local reply_id = msg['id']

local info = '⏩Name : '..msg.from.first_name..'\n\n'
..'🆔ID : '..msg.from.id..'\n'
..'⏩Username : @'..msg.from.username..'\n'
..'🔢Mobile Number : \n\n'
..'🆔Group ID : '..msg.to.id..'\n'
..'⏩Group Name : '..msg.to.title

reply_msg(reply_id, info, ok_cb, false)
end

return {
patterns = {
"^[!/#]info"
},
run = run
}
