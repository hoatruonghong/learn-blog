class Micropost < ApplicationRecord
    belongs_to :user
    has_many :comments

    # has_one_attached :picture
    # validates :picture, file_size: { less_than_or_equal_to: 100.kilobytes }, file_content_type: { allow: ['image/jpeg', 'image/png', 'image/jpg'] }

    validates :content, length: { maximum: 140 }, presence: true
    validates :user_id, presence: true


end
