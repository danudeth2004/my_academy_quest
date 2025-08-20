class Quest < ApplicationRecord
  validates :title, presence: true
  default_scope -> { order(id: :desc) }
end
