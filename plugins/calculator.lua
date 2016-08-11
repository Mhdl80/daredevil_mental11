local function mathjs(exp)
	local url = 'http://api.mathjs.org/v1/?expr='..URL.escape(exp)
	local b,c = http.request(url)
	local text = nil
	if c == 200 then
		text = '= '..b
	elseif c == 400 then
		text = 'معادله وارد شده صحیح نیست'
	else
		text = 'معادله وارد شده صحیح نیست'
	end
	return text
end

local function run(msg, matches)
	if msg.text == "?calc" then
		return "با اين ماشين حساب قادريد معادلات پيچيده حل کنيد\n"
		.."+ جمع\n- تفريق\n* ضرب\n/ تقسيم\n() پرانتز\n^ توان\n"
		.."ex. (2+8)^2/4*3"
	else
		return mathjs(matches[1])
	end
end

return {
	description = "Calculate Your Formulas",
	usagehtm = '<tr><td align="center">calc فرمول</td><td align="right">ماشین حساب مهندسی و بسیار پیشرفته با قابلیت محاسبه ی جمع، تفریق، ضرب، تقسیم، توان، پرانتز، سینوس، کسینوس، تانژانت، کتانژانت و.. میباشد<br>+ جمع | - تفريق | * ضرب | / تقسيم | () پرانتز | ^ توان | sin(n) سینونس | ...<br>مثال: (2+8)^2/4*3</td></tr>',
	usage = {
		"calc (formulas) : ماشين حساب",
		--"?calc : توضيح کامل",
	},
	patterns = {
		"^[Cc]alc (.*)$",
		--"^?calc$",
	},
	run = run
}
