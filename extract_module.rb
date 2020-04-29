# before

class Item < ApplicationRecord
  #・・・
  before_save :set_default_name

  def set_default_name
    self.name = default_name
  end
  #・・・
end

class User < ApplicationRecord
  #・・・
  before_save :set_default_name

  def set_default_name
    self.name = default_name
  end
  #・・・
end

# after

module SetDefaultName
  def self.included(klass)
    klass.class_eval do
      before_save :set_default_name
    end
  end

  def set_default_name
    self.name = default_name
  end
end

class Item < ApplicationRecord
  #・・・
  include SetDefaultName
  #・・・
end

class User < ApplicationRecord
  #・・・
  include SetDefaultName
  #・・・
end
