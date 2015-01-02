class BfProcess < ActiveRecord::Base

  belongs_to :user
  has_many :process_comments
  has_many :tasks

end
