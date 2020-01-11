class Producto < ApplicationRecord
has_many  :Detcarros
has_many :users, through: :Detcarros
end
