function run(msg, matches)
if matches[1] == 'keyboard' then
  local muteteam = matches[2]
  local url = "http://www.myfunstudio.com/-/p.php?d=glt&t="..muteteam.."&a=z&b=d3&s=Classic&l=en&uc=1&ts=1&s3=&c_tb=302209&c_tf=E6ED1F&c_tt=030708&c_nt=FFFFFF&c_d3=54340A&c_bc=41992B&ff=PNG&w=500&ps=sq
  local ext = "muteteam.webp"
  local cb_extra = {file_path=file}
  local receiver = get_receiver(msg)
  local file = download_to_file(url, "love.webp")
  send_document(receiver, file, rmtmp_cb, cb_extra)
end
   end
return {
  patterns = {
   "[!#/](keyboard) (.*)",
  },
  run = run
}
