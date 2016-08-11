local function run(msg, matches)
	if matches[1]:lower() == "clash>" then
		local base = 'curl -X GET --header "Accept: application/json" --header "authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6ImI4OWJkZWJmLTE3MWEtNDA2Yy05YWQzLTkxNzMwNDc3OWQ1MSIsImlhdCI6MTQ1ODY4OTM5Mywic3ViIjoiZGV2ZWxvcGVyLzVmNTE5Y2ZlLTI3NTQtODVhMi03ZThjLWE5YmMwMWQ2NTAyMyIsInNjb3BlcyI6WyJjbGFzaCJdLCJsaW1pdHMiOlt7InRpZXIiOiJkZXZlbG9wZXIvc2lsdmVyIiwidHlwZSI6InRocm90dGxpbmcifSx7ImNpZHJzIjpbIjE3OC4xOC4yNS4xNjgiXSwidHlwZSI6ImNsaWVudCJ9XX0.Bu_X49PM17SVYm1ieM3TkwdJiTnzuOilmnOM8QX-HVd7wna9fsCXj91-AGeZuToS97KVnxFDSIUeycrE-dGgww" '
		local src_tag = base..'"https://api.clashofclans.com/v1/clans/%23"'..matches[2]
		local data = io.popen(src_tag):read('*all')
		local jdat = JSON.decode(data)
		if jdat.reason then
			return "تگ کلن وارد شده صحیح نیست. دقت کنید تگ کلن را بدون # وارد کنید"
		end
		clash_member = ""
		i = 1
		v = #jdat.memberList
		for k=1,v do
			if jdat.memberList[i].role == "admin" then
				role = "elder"
			else
				role = jdat.memberList[i].role
			end
			clash_member = clash_member..i.."- Name: "..jdat.memberList[i].name.."\nlvl: "..jdat.memberList[i].expLevel.."  |  "..role.."  |  "..jdat.memberList[i].league.name.."\n____________________\n"
			i = i+1
		end
		return "نام کلن: "..jdat.name.."\n"
			.."افراد: "..jdat.members.." نفر\n"
			.."لیست افراد:\n\n"..clash_member
	else
		--local src_name = base..'"https://api.clashofclans.com/v1/clans?name=shayan&locationId=32000115&minMembers=2&maxMembers=50&minClanPoints=1&minClanLevel=2&limit=1"'
		local base = 'curl -X GET --header "Accept: application/json" --header "authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6ImI4OWJkZWJmLTE3MWEtNDA2Yy05YWQzLTkxNzMwNDc3OWQ1MSIsImlhdCI6MTQ1ODY4OTM5Mywic3ViIjoiZGV2ZWxvcGVyLzVmNTE5Y2ZlLTI3NTQtODVhMi03ZThjLWE5YmMwMWQ2NTAyMyIsInNjb3BlcyI6WyJjbGFzaCJdLCJsaW1pdHMiOlt7InRpZXIiOiJkZXZlbG9wZXIvc2lsdmVyIiwidHlwZSI6InRocm90dGxpbmcifSx7ImNpZHJzIjpbIjE3OC4xOC4yNS4xNjgiXSwidHlwZSI6ImNsaWVudCJ9XX0.Bu_X49PM17SVYm1ieM3TkwdJiTnzuOilmnOM8QX-HVd7wna9fsCXj91-AGeZuToS97KVnxFDSIUeycrE-dGgww" '
		local src_tag = base..'"https://api.clashofclans.com/v1/clans/%23"'..matches[2] --LYGPCJ28
		local data = io.popen(src_tag):read('*all')
		local jdat = JSON.decode(data)
		if jdat.reason then
			return "تگ کلن وارد شده صحیح نیست. دقت کنید تگ کلن را بدون # وارد کنید"
		end
		local base = "curl '"..jdat.badgeUrls.medium.."'"
		local data = io.popen(base):read('*all')
		f = io.open("file/badge.webp", "w+")
		f:write(data)
		f:close()
		send_document("chat#id"..msg.to.id, "file/badge.webp", ok_cb, false)
		return "نام کلن: "..jdat.name.."\n"
			.."تگ: "..jdat.tag.."\n"
			.."لول: "..jdat.clanLevel.."\n"
			.."افراد: "..jdat.members.." نفر\n"
			.."موقعیت مکانی: "..jdat.location.name.."\n"
			.."وضعیت عضوگیری: "..jdat.type.."\n"
			.."وارهای پیروز: "..jdat.warWins.."\n"
			.."وضعیت وار: "..jdat.warFrequency.."\n"
			.."امتیاز کلن: "..jdat.clanPoints.."\n"
			.."حداقل امتیاز مورد نیاز: "..jdat.requiredTrophies.."\n"
			.."درباره کلن:\n"..jdat.description
	end
end

return {
	description = "Clash of Clans Informations",
	usagehtm = '<tr><td align="center">clash تگ</td><td align="right">جهت بدست آوردن مشخصات کلن های بازی کلش آف کلنز از این پلاگین بهره بگیرید. دقت کنید تگ کلن بدون # وارد شود</td></tr>'
	..'<tr><td align="center">clash> تگ</td><td align="right">با این دستور میتوانید افراد یک کلن را ببینید. همچنین مشخصات افراد را شامل لول، کاپ و مقام</td></tr>',
	usage = {
		"clash (tag) : اطلاعات کلن در بازی کلش",
		"clash> (tag) : لیست افراد و مشخصاتشان",
		},
	patterns = {
		"^([Cc]lash>) (.*)",
		"^([Cc]lash) (.*)",
		},
	run = run
}
