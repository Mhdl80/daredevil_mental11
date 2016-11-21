-- Plugin > @Flooding
-- Channel > @MuteTeam

do

local function muteteam(msg, matches)

 if matches[1]:lower() == "sticker" then
    local modes = {'comics-logo','water-logo','3d-logo','blackbird-logo','runner-logo','graffiti-burn-logo','electric','standing3d-logo','style-logo','steel-logo','fluffy-logo','surfboard-logo','orlando-logo','fire-logo','clan-logo','chrominium-logo','harry-potter-logo','amped-logo','inferno-logo','uprise-logo','winner-logo','star-wars-logo','silver-logo','Design-Dance'}
    local text = URL.escape(matches[2])
    local url = 'http://www.flamingtext.com/net-fu/image_output.cgi?_comBuyRedirect=false&script='..modes[math.random(#modes)]..'&text='..text..'&symbol_tagname=popular&fontsize=70&fontname=futura_poster&fontname_tagname=cool&textBorder=15&growSize=0&antialias=on&hinting=on&justify=2&letterSpacing=0&lineSpacing=0&textSlant=0&textVerticalSlant=0&textAngle=0&textOutline=off&textOutline=false&textOutlineSize=2&textColor=%230000CC&angle=0&blueFlame=on&blueFlame=false&framerate=75&frames=5&pframes=5&oframes=4&distance=2&transparent=off&transparent=false&extAnim=gif&animLoop=on&animLoop=false&defaultFrameRate=75&doScale=off&scaleWidth=240&scaleHeight=120&&_=1469943010141'
    local title , res = http.request(url)
    local jdat = json:decode(title)
    local sticker = jdat.src
    local file = download_to_file(sticker,'sticker.webp')
     send_document(get_receiver(msg), file, ok_cb, false)  
     --reply_document(msg.id, file, ok_cb, false) -- Edit Tg   
 end
    
end

return {
  patterns = {
   "^([Ss][Tt][Ii][Cc][Kk][Ee][Rr]) (.*)$",    
    },
  run = muteteam
}
end
