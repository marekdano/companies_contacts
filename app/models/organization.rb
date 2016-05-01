class Organization < ActiveRecord::Base
  audited
  has_many :members, dependent: :destroy
end
