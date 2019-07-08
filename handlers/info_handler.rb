module Lita
  module Handlers
    class InfoHandler < Handler
      template_root File.expand_path("../../templates", __FILE__)

      route /^\/info$/, :perform

      def perform(response)
        response.reply render_template('info', course: course)
      end

      Lita.register_handler self

      private

      def course
        Course.find_by(finish: false)
      end
    end
  end
end