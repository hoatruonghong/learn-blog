class ApiToken < ApplicationRecord
  belongs_to :user
  before_validation :generate_token, on: :create

  validates :tokens, presence: true, uniqueness: true

  encrypts :token, deterministic: true
  
  private
  def generate_token
    self.token = Digest::MD5.hexdigest(SecureRandom.hex)
  end
end
