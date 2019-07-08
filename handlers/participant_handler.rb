module Lita
  module Handlers
    class ParticipantHandler < Handler 
      template_root File.expand_path("../../templates", __FILE__)

      route /^\/participant$/, :perform

      def perform(response)
        participants = Participant.where(course_id: course_id)

        response.reply render_template('participant', participants: participants)
      end

      Lita.register_handler self

      private

      def course_id
        Course.find_by(finish: false).id
      end
    end
  end
end