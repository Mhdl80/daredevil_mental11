do

function run(msg, matches)
  return 'command'.. [[ 
Commands list :
!image [sticker to photo]
You can also do it by reply
!sticker [photo to sticker]
You can also do it by reply
!file [sticker and photo to file]
You can also do it by reply
gif [text]
make gif
love [text1] [text2]
make stickers love
!keepcalm [text] color1 color2 color3 600
make keepcalm sticker
!t2i [text]
make sticker

end

return {
  description = "Shows bot version", 
  usage = "!version: Shows infernal robot version",
  patterns = {
    "^!helpen$"
  }, 
  run = run 
}

end
