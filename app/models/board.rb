class Board < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :follows, dependent: :destroy
    validates :title, presence: true
    validates :content, presence: true

    def follow_user(user_id)
        follows.find_by(user_id: user_id)
    end
    
end
