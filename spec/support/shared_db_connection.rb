# Due to how Selenium handles database transactions, we need to share data state across the Selenium web server and the test code itself. Without this patch we're apt to get sporadic error messages resulting from tests not properly cleaning up after themselves.

class ActiveRecord::Base
  mattr_accessor :shared_connection
  @@shared_connection = nil

  def self.shared_connection
    @@shared_connection || retrieve_connection
  end
end

ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection