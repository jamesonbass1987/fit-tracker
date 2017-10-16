module Slugifiable

  module ClassMethods

    def find_by_slug(input)
      unslugged_input = input.split("-").join(" ")
      output ||= User.where('username like ?', unslugged_input).first
    end
  end

end
