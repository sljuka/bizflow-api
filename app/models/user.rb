class User < ActiveRecord::Base

  has_one :api_key, dependent: :destroy
  has_many :bf_processes

  after_create :create_api_key

  private

  def create_api_key
    ApiKey.create :user => self
  end

end
