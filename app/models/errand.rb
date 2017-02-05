class Errand < ActiveRecord::Base
  validates :completed, inclusion: {in: [0,1]}
end
