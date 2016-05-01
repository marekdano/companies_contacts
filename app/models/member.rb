class Member < ActiveRecord::Base
  audited
  belongs_to :organization
end
