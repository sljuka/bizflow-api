class User < ActiveRecord::Base

  has_one :api_key, dependent: :destroy
  has_many :bf_processes
  has_many :user_comments
  has_many :tasks

  after_create :create_api_key

  def name
    "#{first_name} #{last_name}"
  end

  private

  def create_api_key
    ApiKey.create :user => self
  end

end
