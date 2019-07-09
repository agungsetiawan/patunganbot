module Lita
  module Handlers
    class BaseHandler < Handler

      private

      def current_course
        GetCurrentCourse.call
      end
    end
  end
end