class CalculationsController < ApplicationController
    def flex_square
        # the incoming parameters for this action look like {"a_number" => "5"}
        # Rail's stores that has in a variable called params
        
        @user_number = params["a_number"].to_i
        @squared_number = @user_number**2
        
        render("calculations/flexible_square_template.html.erb")
    end
    
    def flex_square_root
        # the incoming parameters for this action look like {"a_number" => "5"}
        # Rail's stores that has in a variable called params
        
        @user_number = params["a_number"].to_i
        @square_root_number = Math.sqrt(@user_number)
        render ("calculations/flexible_square_root_template.html.erb")
    end
    def flex_payment
        # the incoming parameters look like
        # :a_number interest rate
        # :b_number years
        # :c_number amount
        @interest_rate = params["a_number"].to_f / 100
        @years = params["b_number"].to_f
        @loan_amount = params["c_number"].to_f
        # @number_of_payments = @years * -12
        
        # @monthly_interest_rate = @interest_rate / 12
        # @numerator = @monthly_interest_rate * @loan_amount
        
        # @divisor = 1 + @monthly_interest_rate
        # @divisor = @divisor ** @number_of_payments
        # @divisor = 1 - @divisor
        
        # @number_of_payments = @years * 12
        # @number_of_payments.to_f
        # @monthly_interest_rate = (@interest_rate) / 12
        # @one_plus_monthly = @monthly_interest_rate + 1
        # @monthly_number_of_payments = @one_plus_monthly**@number_of_payments
        # @numerator = @monthly_number_of_payments * @monthly_interest_rate
        # @divisor = @monthly_number_of_payments- 1
        
        
        @number_of_payments = @years * 12
        @number_of_payments.to_f
        @monthly_interest_rate = (@interest_rate / 100) / 12
        @one_plus_monthly = @monthly_interest_rate + 1
        @monthly_number_of_payments = @one_plus_monthly**@number_of_payments
        @numerator = @monthly_number_of_payments * @monthly_interest_rate
        @divisor = @monthly_number_of_payments- 1
        
        @monthly_payment_2 = @loan_amount * ( @numerator / @divisor)
        
        @interest_rate = @interest_rate.round(4)
        @monthly_payment_2 = @monthly_payment_2.round(2)
        
        # @monthly_payment =  @numerator / @divisor
        
        render ("calculations/flexible_payment_template.html.erb")
    end
    
    def square_form
        
        render("calculations/square_form_template.html.erb")
    end
    
    def process_square
        
        @user_number = params["the_user_number"].to_i
        @squared_number = @user_number**2
        
        render("calculations/square_results_template.html.erb")
    end
    
    def payment_form
        
       
        render("calculations/payment_form_template.html.erb")
    end
    
    def process_payment
        
        @interest_rate = params["the_user_interest_rate"].to_f
        @years = params["the_user_years"].to_f
        @principal = params["the_user_principal"].to_f
        
        
        @number_of_payments = @years * 12
        @number_of_payments.to_f
        @monthly_interest_rate = (@interest_rate / 100) / 12
        @one_plus_monthly = @monthly_interest_rate + 1
        @monthly_number_of_payments = @one_plus_monthly**@number_of_payments
        @numerator = @monthly_number_of_payments * @monthly_interest_rate
        @divisor = @monthly_number_of_payments- 1
        
        @monthly_payment_2 = @principal * ( @numerator / @divisor)
        
        @monthly_payment_2 = @monthly_payment_2.round(2)
        @interest_rate = @interest_rate.round(4)
        
        render("calculations/payment_results_template.html.erb")
    end
    
    def random_form
        render ("calculations/random_form_template.html.erb")
    end
    
    def random_number_results
        @user_number_2 = params["user_number_2"].to_f
        @user_number_1 = params["user_number_1"].to_f
        @random_placeholder = @user_number_2 - @user_number_1 + 1
        @random_number = rand(@random_placeholder) + @user_number_1 
        render("calculations/random_number_results_template.html.erb")
    end
        
end
