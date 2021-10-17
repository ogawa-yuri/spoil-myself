class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  def update_without_current_password(params, *options)
  params.delete(:current_password)

  if params[:password].blank? && params[:password_confirmation].blank?
    params.delete(:password)
    params.delete(:password_confirmation)
  end

  result = update_attributes(params, *options)
  clean_up_passwords
  result
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tasks, dependent: :destroy
  has_many :rewards, dependent: :destroy
  has_many :schedules, dependent: :destroy

  validates :name, presence: true
  mount_uploader :image, ImageUploader
end
