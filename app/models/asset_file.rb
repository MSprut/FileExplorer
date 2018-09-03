class AssetFile < ApplicationRecord
	belongs_to :user
	belongs_to :folder

	has_attached_file :uploaded_file, 
               :url => "/uploads/get/:id", 
               :path => ":rails_root/public/uploads/:id/:basename.:extension"
  
	validates_attachment_size :uploaded_file, :less_than => 10.megabytes   
	validates_attachment_content_type :uploaded_file, content_type: /\Aimage\/.*\z/
	validates_attachment_presence :uploaded_file

	def file_name 
	  uploaded_file_file_name 
	end

	def file_size 
    uploaded_file_file_size 
	end
end
