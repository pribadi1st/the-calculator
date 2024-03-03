module RegexHelper
    def valid_expression?(expression)
        # Ensure only valid characters are present in the expression
        !(expression =~ /^[0-9+\-*\/().\s]+$/).nil?
    end
end