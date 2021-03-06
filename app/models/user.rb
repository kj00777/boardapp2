class User < ApplicationRecord
  authenticates_with_sorcery!
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end
  mount_uploader :image, UserImageUploader

  has_many :boards, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :follows, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true

  enum user_type: 
  {
    user: 0,
    admin: 1
  }
  acts_as_paranoid
end
