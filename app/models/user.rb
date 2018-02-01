class User < ApplicationRecord
  # un "user" peut avoir plusieurs "pins" et plusieurs "comments".
  # les "pins" et "comments" de l'"user" seront supprimer si l'"user" est supprimé
  has_many :pins, dependent: :destroy
  has_many :comments, dependent: :destroy

  # validation sur "username"
  validates :username, presence: true, # présence obligatoire
                       length: { maximum: 50 }, # 50 caractères max
                       uniqueness: true # il doit être unique

  # variable qui prend la synthax d'un mail
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }, # le mail doit prendre le format du "regex"
                    uniqueness: { case_sensitive: false } # on ne tient pas compte de la casse

  validates :password, presence: true,
                       length: { minimum: 6 }
end
