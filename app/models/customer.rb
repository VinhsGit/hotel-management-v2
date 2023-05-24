class Customer < ApplicationRecord
    validates_presence_of :fullName, :phone
    validates_uniqueness_of :phone
end
