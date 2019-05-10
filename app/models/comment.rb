class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :board
    has_one :notification, :as => :notificable
end
