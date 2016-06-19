class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  def mailboxer_email(object)
 #return the model's email here
end

  acts_as_messageable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file	:avatar, styles: { medium: "200x200#", thumb: "150x150#" }, default_url: "missing.png",
				    :storage => :dropbox,
				    :dropbox_credentials => Rails.root.join("config/dropbox.yml")

  ratyrate_rateable 'skill', 'reliability', 'professionalism', 'value'

  ratyrate_rater

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  has_many :jobs, dependent: :destroy
  has_many :proposals, dependent: :destroy
  has_many :reviews, dependent: :destroy

end
