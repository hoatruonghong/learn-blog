class Comment < ApplicationRecord
   belongs_to :user
   belongs_to :micropost
   
   validates :content, presence: true
   validates :rate, presence: true, comparison: {less_than: 6, greater_than: 0}
end
