class Product < ActiveRecord::Base 
  enum type: [ :pledge, :event ]
end

