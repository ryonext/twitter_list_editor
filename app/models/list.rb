class List
  include ActiveModel::Model

  class << self
    def all
      []
    end
  end
end
