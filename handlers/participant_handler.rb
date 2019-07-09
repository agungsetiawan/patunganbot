module Lita
  module Handlers
    class ParticipantHandler < BaseHandler 
      template_root File.expand_path("../../templates", __FILE__)

      route /^\/participant$/, :perform

      def perform(response)
        participants = Participant.where(course_id: current_course.id)

        response.reply render_template('participant', participants: participants)
      end

      Lita.register_handler self
    end
  end
end