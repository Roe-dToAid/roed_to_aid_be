class User < ApplicationRecord
  validates_presence_of :email, :token
  validates_uniqueness_of :email, :token
end
