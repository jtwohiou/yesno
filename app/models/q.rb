class Q < ActiveRecord::Base
	validates :title, :presence => true
	has_attached_file :image_yes,
		:styles => 
		{
			:large => "1000x1000>",
			:thumb => "400x400#"
		},
		:convert_options => {
			:thumb => "-quality 65 -strip"
		}

	has_attached_file :image_no,
		:styles => 
		{
			:large => "1000x1000>",
			:thumb => "400x400#"
		},
		:convert_options => {
			:thumb => "-quality 65 -strip"
		}

	before_create :generate_unique_id

	def generate_unique_id
		self.unique_id = SecureRandom.urlsafe_base64(6, padding=false)
	end

	def to_param
		self.unique_id
	end

	attr_accessible :description, :title, :votes, :image_yes, :image_no, :unique_id, :votes_no

end