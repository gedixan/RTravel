class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :status_user
  belongs_to :role

  has_many :area_users, dependent: :destroy
  has_many :areas, through: :area_users

  validates :fname, :lname, :username, :email, :jobtitle, :role_id, :status_user_id, presence: true
  #validates :username, format: { with: /^[0-9a-zA-Z\.\_]+$/ }
  #validates :email, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ }
  

  def full_name
    "#{lname.titleize} #{fname.capitalize}"
  end
end
