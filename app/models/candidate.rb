class Candidate < ApplicationRecord
  before_save :set_full_name


  protected

  def set_full_name
    self.full_name = "#{self.first_name} #{self.last_name}".strip
  end
end
