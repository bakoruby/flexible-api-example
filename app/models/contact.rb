class Contact < ActiveRecord::Base
  validates_presence_of :name

  has_many :phones
  has_many :addresses
end
