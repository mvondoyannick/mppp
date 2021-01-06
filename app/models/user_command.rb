class UserCommand < ApplicationRecord

  def complete_name
    "#{self.name} #{self.second_name}"
  end
end
