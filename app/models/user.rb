class User < ApplicationRecord
  validates_uniqueness_of :username, uniqueness: { case_sensitive: false}
  validates :username, :password, :type, :name, presence: true

  has_secure_password

  scope :customers, -> { where(type: 'Customer')}
  scope :sellers, -> { where(type: 'Seller')}



# def invalidate_token
#   self.update_columns(auth_token: nil)
#
# end
#
# def self.validate_login(username, password)
#   user = find_by(username: username)
#   if user && user.authenticate(password)
#     user
#   end
# end

end
