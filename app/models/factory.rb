class Factory < ActiveRecord::Base
  validates :name, presence: true, length: { minimum:2 }
  validates :email, email_format: { message: "Please provide a valid email address"}
  validates :address1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true
end
