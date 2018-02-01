class Comment < ApplicationRecord
  # un 'comment' appartient à un 'pin' qui appartient à un 'user'
  belongs_to :pin
  belongs_to :user

  validates :pin_id, numericality: { only_integer: true }
  validates :user_id, numericality: { only_integer: true }
end
