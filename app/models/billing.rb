class Billing < ApplicationRecord
  belongs_to :user
  has_many :detcarros
end
