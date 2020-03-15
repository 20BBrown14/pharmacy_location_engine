# frozen_string_literal: true

# Public: Application Record class extends ActiveRecord::Base
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
