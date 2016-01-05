class News < ActiveRecord::Base
  has_one :category
end
