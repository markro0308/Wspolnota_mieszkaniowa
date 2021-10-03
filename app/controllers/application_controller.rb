class ApplicationController < ActionController::Base

    private

    def check_access
        unless (user_signed_in?) && (current_user.email == "admin@ruby.pl")
            redirect_to new_user_session_path, notice: "Dostęp tylko dla administratora. Zaloguj się i przejdz do swojej części"
        end
    end

    def authenticate_user
        unless user_signed_in?
            redirect_to new_user_session_path, notice: "Nie jesteś zalogowany. Zaloguj się"
        end
    end


end
