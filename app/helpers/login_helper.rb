module LoginHelpers

    def logged_in?
      !!session[:id]
    end

    def current_user
      User.find_by_id(session[:id])
    end

    def nil_submission?
      params.any? {|key, value| value == "" }
    end

    def user_exists?
      User.any?{|user| user.username == params[:username]} || User.any?{|user| user.email == params[:email]}
    end

    def logged_in_redirect_check
      if !logged_in?
        session[:no_login_error_message] = "Please log in to view this page."
        redirect to '/login'
      end
    end

end
