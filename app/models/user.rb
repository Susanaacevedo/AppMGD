class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
has_many  :detcarros
has_many :products, through: :detcarros


has_many  :goals

  after_initialize do
      if self.new_record?
        self.role ||= :visit
      end
  end
  enum role: [:visit, :admin]
end
