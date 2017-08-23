module CommissionHub
  module ShareasaleV22
    class Connection < CommissionHub::Connection

      def_endpoint :api, nil, class: :Base

      def initialize(settings)
        @settings = settings
      end

    end
  end
end
