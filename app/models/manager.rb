class Manager < ApplicationRecord
  has_one :employe, foreign_key: 'id'

  self.table_name = "Manager"
end
