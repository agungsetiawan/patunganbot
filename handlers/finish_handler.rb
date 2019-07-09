module Lita
  module Handlers
    class FinishHandler < BaseHandler
      route /^\/finish$/, :perform

      def perform(response)
        current_course.update(finish: true)

        response.reply "Course sudah selesai"
      end

      Lita.register_handler self
    end
  end
end