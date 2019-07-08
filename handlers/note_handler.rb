module Lita
  module Handlers
    class NoteHandler < Handler
      route /^\/note\n?(?<note>.+)/m, :perform 
      
      def perform(response)
        note = response.match_data[:note]

        course.update(note: note)

        response.reply("Catatan ditambahkan")
      end

      Lita.register_handler self

      private

      def course
        Course.find_by(finish: false)
      end
    end
  end
end