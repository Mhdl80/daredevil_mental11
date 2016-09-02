function run(msg,matches)
    local user_id = msg.from.id
    local chat_id = get_receiver(msg)
    local token = "توکن"--ye token inja bzar
    local db = 'https://api.telegram.org/bot'..token..'/getUserProfilePhotos?user_id='..user_id
      local path = 'https://api.telegram.org/bot'..token..'/getFile?file_id='
      local img = 'https://api.telegram.org/file/bot'..token..'/'
    local res, code = https.request(db)
      local jdat = json:decode(res)
      local fileid = jdat.result.photos[1][3].file_id
    local count = jdat.result.total_count
    if tonumber(count) == 0 then
      send_large_msg(chat_id,"Image Not Found",ok_cb,false)
    else
      local pt, code = https.request(path..fileid)
        local jdat2 = json:decode(pt)
        local path2 = jdat2.result.file_path
    local link = img..path2
    local photo = download_to_file(link,"..msg.from.id.jpg")
    local info = '#Name: '..msg.from.first_name..'\n'
..' #User : '..msg.from.id..'\n'
..'#Username @'..msg.from.username..'\n'
..' #User Group: '..msg.to.id..'\n'
..'#Group Name: '..msg.to.title..'\n'
..'#channel :  @specialteam_ch '
    send_photo2(receiver, photo, info, rmtmp_cb, cb_extra)
end
end
return {
patterns = {
"[!/#][Ii]nfo",
},
run = run
}
