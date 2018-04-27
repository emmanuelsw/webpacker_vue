class Sign < ApplicationRecord
	has_many :goals

	validates :name, presence: true
	validates :email, presence: true, uniqueness: true, email: true
	validates :phone, presence: true, numericality: { only_integer: true }
	validates :birthdate, presence: true
	validates :sign, presence: true, length: { minimum: 3, too_short: "can't be blank" }

	def birthdate
		super.strftime("%d %B %Y") unless super.nil?
	end

	def created_at
		super.strftime("%d %B %Y %H:%M:%S")
	end

	def updated_at
		super.strftime("%d %B %Y %H:%M:%S")
	end

end