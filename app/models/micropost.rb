class Micropost < ApplicationRecord
    belongs_to :user
    has_many :comments

    has_one_attached :picture
    validates :picture, content_type: ['image/png', 'image/jpg', 'image/jpeg']

    validates :content, length: { maximum: 140 }, presence: true
    validates :user_id, presence: true


end
