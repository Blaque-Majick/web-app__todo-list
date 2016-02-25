class Todo < ActiveRecord::Base

  def user_access
    x = self.user_id
    y = User.find_by_id(x)
    return y
  end

end