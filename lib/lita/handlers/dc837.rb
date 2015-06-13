module Lita
  module Handlers
    class Dc837 < Handler
      
      # NO U
      NO_YOUS = [
        'http://i2.photobucket.com/albums/y26/Lupin_Sansei/no20u.jpg',
        'http://emotibot.net/pix/45.jpg',
        'http://skrie.danoli3.com/no_U.jpg',
        'http://i3.kym-cdn.com/photos/images/original/000/002/897/NOU.jpg',
        'http://s219.photobucket.com/user/Liberal_Slayer/media/nou.gif.html'
        ]
      
      route(/\bno u\b/i, :no_u, command: false,
            help: {t("help.no_u_key") => t("help.no_u_value")})
      
      def no_u(response)
        response.reply "#{NO_YOUS.sample}"
      end
    end

    Lita.register_handler(Dc837)
  end
end
