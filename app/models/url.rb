class Url < ApplicationRecord
  # validates :long_url, :presence => true
def to_params
  self.short_url
end
end
