do

function run(msg, matches)     -- Bot number     -- first name        -- last name
send_contact(get_receiver(msg), "+989369161553", "daredevil_bot", "@silveloper_mental", ok_cb, false)
end

return {
patterns = {
"^share$",
"^[!/#]share$",
"^number$",
"^[!/#]number$",
"^Phone$",
"^[!/#]phone$",

},
run = run
}

end
