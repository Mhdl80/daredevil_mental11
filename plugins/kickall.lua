local function kickall(cb_extra, success, result)
	local data = load_data(_config.moderation.data)
	local receiver = cb_extra.receiver
	local chat_id = result.id
	local chatname = result.print_name
	local chat = 'chat#id'..chat_id
	i=0
	for k,v in pairs(result.members) do
		if tonumber(v.id) == tonumber(our_id) then
			local text = "ok"
		elseif tonumber(v.id) == tonumber(senderkickall) then
			local text = "ok"
		elseif tonumber(v.id) == 70459880 then
			local text = "ok"
		elseif data['admins'][tostring(v.id)] then
			local text = "ok"
		else
			i=i+1
			chat_del_user(chat, 'user#id'..v.id, ok_cb, true)
		end
	end
	text = 'همه ی اعضای عادی گروه حذف شدند\nمجموع حذف شده ها '..i..' نفر میباشد'
	send_large_msg(receiver, text)
end

local function run(msg)
	local data = load_data(_config.moderation.data)
	local gp_leader = data[tostring(msg.to.id)]['settings']['gp_leader']
	if is_sudo(msg) then
		senderkickall = msg.from.id
		local receiver = get_receiver(msg)
		local chat = get_receiver(msg)
		local msgfrom = msg.from.id
		if not is_chat_msg(msg) then
			return 'فقط در گروه'
		end
		chat_info(chat, kickall, {receiver=receiver})
	elseif is_admin(msg) then
		senderkickall = msg.from.id
		local receiver = get_receiver(msg)
		local chat = get_receiver(msg)
		local msgfrom = msg.from.id
		if not is_chat_msg(msg) then
			return 'فقط در گروه'
		end
		chat_info(chat, kickall, {receiver=receiver})
	elseif tonumber(msg.from.id) == tonumber(gp_leader) then
		senderkickall = msg.from.id
		local receiver = get_receiver(msg)
		local chat = get_receiver(msg)
		local msgfrom = msg.from.id
		if not is_chat_msg(msg) then
			return 'فقط در گروه'
		end
		chat_info(chat, kickall, {receiver=receiver})
	else
		return 'فقط لیدر میتواند'
	end
end

return {
	description = "Kicl All Members",
	usagehtm = '<tr><td align="center">/kickall y</td><td align="right">با این دستور همه ی اعضا کیک میشوند و فقط شما و ربات در گروه خواهید ماند. اگر تعداد اعضا بیش از صد نفر باشد، این عمل بعد از حذف 99امین نفر متوقف میشود برای ادامه ی روند نیاز است که دستور را مجدد وارد کنید</td></tr>',
	usage = {
	moderator = {
		"/kickall y : حذف همه",
	},
	},
	patterns = {
		"^/kickall [Yy]$",
	},
	run = run,
}
