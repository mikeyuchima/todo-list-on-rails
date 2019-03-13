class UserController < ApplicationController
    def new
    end
    
    def create
        user = User.new(user_params)
        if user.save
          session[:user_id] = user.id
          redirect_to '/', notice: 'Account created successfully'
        else
          flash[:error] = 'An error occured!'
          redirect_to '/signup'
        end
      end
      
      private
      
      def user_params
        params.permit(:username, :password, :password_confirmation)
      end
end
