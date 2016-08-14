--by @alireza_PT (@CliApi)

--Our channel: @create_antispam_bot
do 

local function pre_process(msg)
local alireza = msg['id']
local alireza1 = 'alirezapt:'..msg.to.id
local link = msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm]%.[Mm][Ee]/") or msg.text:match("[Tt][Ll][Gg][Rr][Mm]%.[Mm][Ee]/") or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm]%.[Oo][Rr][Gg]") or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm]%.[Mm][Ee]")
local bot = msg.text:match("?[Ss][Tt][Aa][Rr][Tt]=") or msg.text:match("?[Ss][Tt][Oo][Pp]=")
            if link and redis:get(alireza1) and not bot then
            delete_msg(msg.id, ok_cb, true)
            local text = "کاربر [@"..(msg.from.username or "---").."] از ارسال لینک خودداری کنید"
reply_msg(alireza, text, ok_cb, true) 
        end 

        return msg 
    end 

local function alireza(msg, matches) 
local alireza = msg['id'] 
    chat_id =  msg.to.id 
    if matches[1] == 'warn' and matches[2] == "link" and is_momod(msg) then 
                    local alireza1 = 'alirezapt:'..msg.to.id 
                    redis:set(alireza1, true) 
                    local dd = 'انجام شد!\n اکنون پس از ارسال لینک کاربر اخطار دریافت میکند' 
reply_msg(alireza, dd, ok_cb, true) 
elseif matches[1] == 'warn' and matches[2] == 'link' and not is_momod(msg) then 
local text = 'فقط مدیران! @create_antispam_bot' 
reply_msg(alireza, text, ok_cb, true) 

    elseif matches[1] == 'unwarn' and matches[2] == 'link' and is_momod(msg) then 
      local alireza1 = 'alirezapt:'..msg.to.id 
      redis:del(alireza1) 
    local text = 'انجام شد!\n ارسال لینک آزاد است' 
reply_msg(alireza, text, ok_cb, true) 
elseif matches[1] == 'unwarn' and matches[2] == 'link' and not is_momod(msg) then 
local text = 'فقط مدیران! @create_antispam_bot' 
reply_msg(alireza, text, ok_cb, true) 
end 
end 

return { 
    patterns = { 
        '^[!/#](warn) (.*)$', 
        '^[!/#](unwarn) (.*)$' 
    }, 
    run = alireza, 
    pre_process = pre_process 
} 

end
--by @alireza_PT (@CliApi)

--Our channel: @create_antispam_bot
