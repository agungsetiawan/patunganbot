module Lita
  module Handlers
    class PaymentInfoHandler < BaseHandler
      route /^\/payment_info\n?(?<note>.+)/m, :perform 

      def perform(response)
        note = response.match_data[:note]
        current_course.update(payment_info: note)
        
        response.reply("Informasi pembayaran telah ditambahkan")
      end

      Lita.register_handler self
    end
  end
end