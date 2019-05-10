class Notification < ApplicationRecord
  # acts_as_paranoid
  belongs_to :notificable, polymorphic: true
  scope :recent, -> (last_logout_at) {where("created_at > ?", last_logout_at)}
end
