class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable

  has_many :registered_applications, dependent: :destroy
  enum role:[:standard, :admin]
  after_initialize {self.role ||= :standard}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable
end
