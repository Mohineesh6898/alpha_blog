class ApplicationController < ActionController::Base
    helper_method :current_user,:logged_in?
    def current_user
        if session[:user_id]
            @current_user ||=User.find(session[:user_id])
        end    
    end    

    def logged_in?
        !!current_user
    end    
    def req_user
        if !logged_in?
            flash[:alert]="Need to login"
            redirect_to 'login'
        end    
    end    
end
