class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

has_many  :detcarros, dependent: :destroy
has_many :products, through: :detcarros
has_many :billings, dependent: :destroy

has_many  :goals

def self.from_omniauth(auth)
   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
     user.email = auth.info.email
     user.password = Devise.friendly_token[0,20]
     user.name = auth.info.name
   end
end

  after_initialize do
      if self.new_record?
        self.role ||= :visit
      end
  end
  enum role: [:visit, :admin]
end
