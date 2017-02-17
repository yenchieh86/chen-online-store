module ApplicationHelper
    
    def full_name(user)
        @fullname = "#{user.first_name} #{user.last_name}"
    end
end
