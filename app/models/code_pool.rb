class CodePool < ApplicationRecord

  def self.generate
    new_code = SecureRandom.alphanumeric(7).downcase
    while exists?(code: new_code)
      new_code = SecureRandom.alphanumeric(7).downcase
    end
    create(code: new_code)
  end

end
