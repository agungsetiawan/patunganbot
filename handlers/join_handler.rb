module Lita
  module Handlers
    class JoinHandler < Handler 
      route /^\/join\s+(?<name>[\w\.\s]+)\s+(?<username>@.+)$/, :perform

      def perform(response)
        name = response.match_data[:name]
        username = response.match_data[:username]

        participant = Participant.new(
          name: name,
          username: username,
          course_id: course_id
        )

        if participant.save
          response.reply("Berhasil ikut patungan")
        else
          response.reply("Gagal ikut patungan")
        end
      end

      Lita.register_handler self

      private

      def course_id
        Course.find_by(finish: false).id
      end
    end
  end
end