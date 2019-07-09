module Lita
  module Handlers
    class PayHandler < BaseHandler
      route /^\/pay\s+(?<username>@.+)$/, :perform 

      def perform(response)
        username = response.match_data[:username]

        participant = Participant.where(username: username, course_id: current_course.id)

        if participant
          participant.update(paid: true)
          response.reply("Terima kasih sudah bayar course")
        else
          response.reply("Peserta tidak ditemukan")
        end
      end

      Lita.register_handler self
    end
  end
end