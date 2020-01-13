class Employe < ApplicationRecord
  belongs_to :manager, inverse_of: :employe
  self.table_name = "Employe"
end
