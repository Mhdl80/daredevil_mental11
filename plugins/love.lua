function run(msg, matches)
if matches[1] == 'lovep' then
  local text1 = matches[2]
  local text2 = matches[3]
  local text3 = matches[4]
  local url = "http://www.iloveheartstudio.com/-/p.php?t="..text1.."%0D%0A%EE%BB%AE%0D%0A"..text2.."&bc=F7FF82&tc=000000&hc=FF0000&f=c&uc=true&ts=true&ff=PNG&w="..text3.."&ps=sq"
  local file = download_to_file(url,'love.png')
   send_photo(get_receiver(msg),file,ok_cb,true)
end
if matches[1] == 'love' then
  local text1 = matches[2]
  local text2 = matches[3]
  local text3 = matches[4]
  local url = "http://www.iloveheartstudio.com/-/p.php?t="..text1.."%0D%0A%EE%BB%AE%0D%0A"..text2.."&bc=F7FF82&tc=000000&hc=FF0000&f=c&uc=true&ts=true&ff=PNG&w="..text3.."&ps=sq"
  local files = download_to_file(url,'sticker.webp')
   send_document(get_receiver(msg),files,ok_cb,true)
   end
   end

return {
  patterns = {
   "^([Ll][Oo][vV][Ee][Pp]) (.*) (.*) (.*)$",
   "^([Ll][Oo][Vv][Ee]) (.*) (.*) (.*)$",
  },
  run = run
}
--Edit by @p0kerfa3e
