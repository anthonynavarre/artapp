class User < ActiveRecord::Base

  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX }, 
                    length: { maximum: 100 },
                    uniqueness: true
  validates :password, presence: true, length: { minimum: 6, maximum: 16 }, on: :create

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    self.save!
    Mailer.password_reset(self).deliver
  end

  def generate_token(column)
  	begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def delete_token_after_password_reset
  end

  def require_password_length_when_it_is_reset
  end

end