class ProcessComment < ActiveRecord::Base

  belongs_to :bf_process
  belongs_to :user

end
