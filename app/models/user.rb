class User < ActiveRecord::Base

  has_secure_password

  has_one :api_key, dependent: :destroy
  after_create :create_api_key

  validates_presence_of :username
  validates_presence_of :password, :on => :create

  def name
    "#{first_name} #{last_name}"
  end

  private

  def create_api_key
    ApiKey.create :user => self
  end

end
