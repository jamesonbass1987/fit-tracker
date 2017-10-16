module Slugifiable

  module ClassMethods
  end

  module InstanceMethods

    def slug
      self.name.split(" ").map{|word| word.downcase}.join("_")
    end
  end

end
