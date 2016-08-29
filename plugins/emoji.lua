function run(msg, matches)
if matches[1] == 'emoji' then
  local text1 = matches[2]
  local url = "http://2wap.org/usf/text_sm_gen/sm_gen.php?text="..text1
  local file = download_to_file(url,'love.webp')
send_document(get_receiver(msg), file, rmtmp_cb, cb_extra)
end
end

return {
  patterns = {
   "^[/!#]([Ee][Mm][Oo][Jj][Ii]) (.*)$"
  },
  run = run
}
