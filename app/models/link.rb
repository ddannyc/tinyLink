class Link < ApplicationRecord

  def active?
    expire_at > Time.now
  end

  def expire!
    update(expire_at: Time.now - 1.minute)
  end

end
