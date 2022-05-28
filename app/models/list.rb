class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy  #en caso de borrar lista va a destruir todos los bookmarks que tenga esta lista
  has_many :movies, through: :bookmarks
  validates :name, presence: true, uniqueness: true

end
