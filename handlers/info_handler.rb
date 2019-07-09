module Lita
  module Handlers
    class InfoHandler < BaseHandler
      template_root File.expand_path("../../templates", __FILE__)

      route /^\/info$/, :perform

      def perform(response)
        response.reply render_template('info', course: current_course)
      end

      Lita.register_handler self
    end
  end
end