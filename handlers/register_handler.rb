module Lita
  module Handlers
    class RegisterHandler < Handler
      route /^\/register\s+(?<name>[\w\s]+)(?<link>http.+)$/, :perform

      def perform(response)
        name = response.match_data[:name]
        link = response.match_data[:link]

        if Course.exists?(finish: false)
          response.reply("Tidak bisa membuat patungan. Sedang ada patungan lain yang aktif")
          return
        end

        course = Course.new(name: name, link: link)

        if course.save
          response.reply("Patungan berhasil dibuat")
        else
          response.reply("Gagal membuat patungan")
        end
      end

      Lita.register_handler self
    end
  end
end