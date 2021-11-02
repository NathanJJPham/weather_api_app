class Home < ApplicationRecord
  def self.search(search)
    if search
      location = search
      if location.include?(" ")
        location.gsub(" ", "%20")
      else
        location
      end
    else
      location
    end
end
