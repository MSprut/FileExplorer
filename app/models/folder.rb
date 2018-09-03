class Folder < ApplicationRecord
	acts_as_tree
	belongs_to :user

	has_many :asset_files, dependent: :destroy
end
