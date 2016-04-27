class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :rememberable, :trackable,
  devise :database_authenticatable, :registerable, :recoverable, :validatable

  validates :email, presence: true
  validates :password, presence: true
end
