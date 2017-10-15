module LoginHelpers

    def logged_in?
      !!current_user
    end

    def current_user
      User.find(session[:user_id])
    end

    def nil_submission?
      params.any? {|key, value| value == "" }
    end

    def logged_in_redirect_check
      if !logged_in?
        flash[:notice] = "Please log in to view this page."
        redirect to '/login'
      end
    end

end
