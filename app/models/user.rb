class User < ApplicationRecord
  validates_uniqueness_of :username, uniqueness: { case_sensitive: false}
  has_secure_password



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
