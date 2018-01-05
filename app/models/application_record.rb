class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  Array.class_eval do
   def median
     sorted = self.sort
     len = sorted.length
     (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
   end
 end


end
