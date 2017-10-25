module LoginHelpers

    def logged_in?
      !!current_user
    end

    def current_user #=> User Instance || nil
      @current_user ||= User.find_by_id(session[:user_id])
    end

    def nil_submission?
      params.any? {|key, value| value == "" }
    end

    def user_exists?
      User.any?{|user| user.username == params[:username]} || User.any?{|user| user.email == params[:email]}
    end

    def logged_in_redirect_check
      if !logged_in?
        redirect to '/login'
      end
    end

    def profile_page_redirect
      if logged_in?
        redirect to "/users/#{current_user.username}"
      end
    end

end
