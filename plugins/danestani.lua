local function run(msg)
	local file = io.open("./file/danestani.db", "r")
	local text = file:read("*all")
	local danestani = text:split(",")
	return danestani[math.random(#danestani)]
end

return {
	description = "",
	usagehtm = '<tr><td align="center">danestani</td><td align="right">ارسال مطالب علمی یا به عبارتی دانستنیها به صورت رندوم</td></tr>',
	usage = "danestani : دانستنیها",
	patterns = {"^[Dd]anestani$"},
	run = run
}
