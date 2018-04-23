class Sign < ApplicationRecord
	validates :name, presence: true
	validates :email, presence: true, uniqueness: true, email: true
	validates :phone, presence: true, numericality: { only_integer: true }
	validates :birthdate, presence: true
	validates :sign, presence: true

	def birthdate
		super.strftime("%d %B %Y") unless super.nil?
	end
end

