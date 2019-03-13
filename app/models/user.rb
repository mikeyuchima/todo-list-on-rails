class User < ApplicationRecord
    has_secure_password

    has_many :todo_list

    validates :username, uniqueness: { case_sensitive: false }
    validates :username, presence: true
    validates :password, length: { minimum: 8 }


    def authenticate_with_credentials(email, password)
        username = username.strip.downcase
        @user = User.find_by_email(username)

        if user && user.authenticate(password)
            return @user
        else
            return nil
        end
    end
end
