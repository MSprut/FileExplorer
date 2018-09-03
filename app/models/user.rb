class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true

  has_many :asset_files
  has_many :folders
end
