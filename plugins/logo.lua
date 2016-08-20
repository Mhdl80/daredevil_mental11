function run(msg, matches)
  local sudo1 = matches[1]
local sudo2 = matches[2]
  local url = "http://api.iteam-co.ir/imgmaker.php?text="..sudo1.."&size="..sudo2..""
   local file = download_to_file(url,'iteam.jpg')
   send_photo2(get_receiver(msg), file, "لطفا در کانال زیر عضو شوید:\n@SUDO_TM", rmtmp_cb, cb_extra)

        
end


return {
  description = "تبدیل متن به لوگو",
  usage = {
    "ساخت لوگو",
  },
  patterns = {
   "^logo (.*) (.*)$"
  },
  run = run
}
--@sudo_tm
--iteam(AMIR-SBSS)
