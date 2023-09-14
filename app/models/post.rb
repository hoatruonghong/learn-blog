class Post < ApplicationRecord
    before_save :default_value

    def default_value
        self.likes ||= 0
    end
end
