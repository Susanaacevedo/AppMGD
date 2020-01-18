class Producto < ApplicationRecord
mount_uploader :photo, ImageUploader  
has_many  :detcarros
has_many :users, through: :detcarros
end
