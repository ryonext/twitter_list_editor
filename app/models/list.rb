class List
  include ActiveModel::Model
  include Twitter::REST::Lists
  attr_accessor :list
end
