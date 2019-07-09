module Lita
  module Handlers
    class NoteHandler < BaseHandler
      route /^\/note\n?(?<note>.+)/m, :perform 
      
      def perform(response)
        note = response.match_data[:note]

        current_course.update(note: note)

        response.reply("Catatan ditambahkan")
      end

      Lita.register_handler self
    end
  end
end