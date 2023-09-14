module UsersHelper
    def format_name(user)
        if user.id % 2 == 0
            "Mr."+user.name
        else 
            "Ms."+user.name
        end
    end
end
