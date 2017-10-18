class Job < ApplicationRecord
  validates  :title, :level_of_interest, :city, presence: true
  belongs_to :company
	belongs_to :category
	has_many   :comments

	def self.sort_by_city
		order("city ASC")
	end

	def self.select_all_from_city(city)
		where("city = ?", city) 
	end 

	def self.sort_by_level_of_interest
		order(:level_of_interest)
	end  

	def self.count_by_level_of_interest
		group(:level_of_interest)
		.order("count(level_of_interest) DESC")
		.count(:id)
	end 

	def self.count_by_city
	group(:city)
	.order("count(city) DESC")
	.count(:id)
	end 
end
