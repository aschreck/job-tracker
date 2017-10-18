class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
	has_many :contacts

	def self.average_interest_of_jobs
		joins(:jobs)
		.group(:name)
		.average(:level_of_interest)
	end 

	def self.top_three_by_average_interest
		companies_by_average_interest	= average_interest_of_jobs.sort_by do |company,average|
			average
		end.reverse.to_h
		companies_by_average_interest.each do |company, interest|
			companies_by_average_interest[company]= interest.to_f.round(2)
		end 
		companies_by_average_interest
	end 
end
