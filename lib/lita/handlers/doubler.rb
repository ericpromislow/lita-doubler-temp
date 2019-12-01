module Lita
  module Handlers
    class Doubler < Handler
      # insert handler code here

      route(
        /^double\s+(\d+)$/i,
        :respond_with_double,
        command: true,
        help: {'double N' => 'prints 2*N'}
      )
      Lita.register_handler(self)

      def double_number(n)
        2*n
      end

      def respond_with_double(response)
        n = response.match_data[1].to_i
        
        response.reply "#{n} + #{n} = #{double_number n}"
      end
      
    end
  end
end
