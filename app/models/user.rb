class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file	:avatar, styles: { medium: "200x200#", thumb: "200x200#" }, default_url: "missing.png",
				    :storage => :dropbox,
				    :dropbox_credentials => Rails.root.join("config/dropbox.yml")


  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  has_many :jobs, dependent: :destroy
  has_many :proposals, dependent: :destroy
  has_many :reviews, dependent: :destroy

end
