class Detcarro < ApplicationRecord
  belongs_to   :user
  belongs_to  :producto
  belongs_to :billing, optional: true



  
end
