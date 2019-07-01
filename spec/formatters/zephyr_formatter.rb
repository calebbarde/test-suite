module Formatters
  class ZephyrFormatter
    RSpec::Core::Formatters.register self, :example_passed, :example_failed, :stop

    def initialize(output)
      @results = []
      @output = output
    end

    def example_passed(notification)
      @results << {
        description: notification.example.description,
        card: notification.example.metadata[:card],
        success: true
      }
    end

    def example_failed(notification)
      @results << {
        description: notification.example.description,
        card: notification.example.metadata[:card],
        message: notification.exception.message,
        success: false
      }
    end

    def stop(_summary)
      @output.puts(@results.to_json)
    end
  end
end
