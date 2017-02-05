class Errand < ActiveRecord::Base
  belongs_to :hero, class_name: 'User'
end
