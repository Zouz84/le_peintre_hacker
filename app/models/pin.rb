class Pin < ApplicationRecord
  # un 'pin' appartient à un "user"
  # un 'pin' peut avoir plusieurs 'comments', qui seront supprimé si le 'pin' est supprimé
  belongs_to :user
  has_many :comments, dependent: :destroy

  # on veut absolument un integer pour l'user_id
  validates :user_id, numericality: { only_integer: true }

  validates :url, presence: true # on veut une url absolument
end
