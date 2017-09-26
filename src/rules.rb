require_relative 'directory'
require_relative 'income_tax'

module Rules
  class Engine
    def initialize
      @preferent_rule = GoBonus
      @rules = [GoToJail, IncomeTax, LuxuryTax]
    end

    def apply(player, initial_location)
      @preferent_rule.apply(player, initial_location)
      @rules.each do |rule| 
        rule.apply(player)
      end
    end
  end

  class GoBonus
    class << self
      BONUS = 200

      def apply(player, initial_location)
        first = Directory.to_index(initial_location)
        last = Directory.to_index(player.where)
        player.receive(BONUS) if first > last
      end
    end
  end

  class GoToJail
    class << self
      LOCATION = 30
      JUST_VISITING = 10

      def apply(player)
        location = Directory.to_index(player.where)

        player.send_to(just_visiting) if location == LOCATION
      end

      private

      def just_visiting
        Directory.to_name(JUST_VISITING)
      end
    end
  end

  class IncomeTax
    class << self
      INCOME_TAX = 4

      def apply(player)
        location = Directory.to_index(player.where)
        tax = ::IncomeTax.calculate(player.balance)

        player.charge(tax) if location == INCOME_TAX
      end
    end
  end

  class LuxuryTax
    class << self
      LOCATION = 38
      TAX = 75

      def apply(player)
        location = Directory.to_index(player.where)

        player.charge(TAX) if location == LOCATION
      end
    end
  end
end