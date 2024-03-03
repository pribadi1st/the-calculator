class CalculatorController < ApplicationController
    include RegexHelper
    before_action :check_expression, only: %i[calculate]

    def calculate
        # Cache to optimize result
        result = Rails.cache.fetch("calc:#{params[:expression]}", expires_in: 12.hours) do
            service = Calculator.new(params)
            service.call
        end
        render json: { expression: params[:expression], result: result }
    end

    private
    def check_expression
        unless valid_expression?(params[:expression])
            return render json: { error: "Invalid expression" }, status: :bad_request
        end
    end
end
