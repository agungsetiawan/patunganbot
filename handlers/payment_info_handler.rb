module Lita
  module Handlers
    class PaymentInfoHandler < Handler
      route /^\/payment_info\n?(?<note>.+)/m, :perform 

      def perform(response)
        note = response.match_data[:note]
        course.update(payment_info: note)
        
        response.reply("Informasi pembayaran telah ditambahkan")
      end

      Lita.register_handler self

      private

      def course
        Course.find_by(finish: false)
      end
    end
  end
end