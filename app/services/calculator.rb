class Calculator
    def initialize(params)
        @expression = params[:expression].to_s.gsub(/[^0-9\+\-\*\/\(\)\.]/, '')
    end

    def call
        eval(@expression)
    end
end