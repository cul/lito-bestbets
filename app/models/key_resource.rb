class KeyResource < ApplicationRecord
  strip_attributes collapse_spaces: true

  before_validation :hash_url

  validates :url, presence: true
  validates :url_hash, presence: true, uniqueness: true

  def hash_url
    return nil if self.url.nil?
    self.url_hash = Digest::SHA256.hexdigest(self.url)
  end
end
