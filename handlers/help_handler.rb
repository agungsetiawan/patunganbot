module Lita
  module Handlers
    class HelpHandler < BaseHandler
      template_root File.expand_path("../../templates", __FILE__)

      route /^\/help$/, :perform

      def perform(response)
        response.reply render_template('help')
      end

      Lita.register_handler self
    end
  end
end