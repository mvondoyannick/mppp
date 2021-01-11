class UserCommand < ApplicationRecord

  def complete_name
    "#{self.name.upcase} #{self.second_name}"
  end
end
