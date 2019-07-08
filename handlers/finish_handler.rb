module Lita
  module Handlers
    class FinishHandler < Handler
      route /^\/finish$/, :perform

      def perform(response)
        course.update(finish: true)

        response.reply "Course sudah selesai"
      end

      Lita.register_handler self

      private

      def course
        Course.find_by(finish: false)
      end
    end
  end
end