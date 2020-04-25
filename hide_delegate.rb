# class Article
#   attr_accessor :blog
# end
#
# class Blog
#   attr_reader :writer
#
#   def initialize(writer)
#     @writer = writer
#   end
# end
#
# article1 = Article.new
# blog1 = Blog.new('ブロガーくん')
# article1.blog = blog1
#
# puts article1.blog.writer


# class Article
#   attr_accessor :blog
#
#   def writer
#     blog.writer
#   end
# end
#
# class Blog
#   attr_reader :writer
#
#   def initialize(writer)
#     @writer = writer
#   end
# end
#
# article1 = Article.new
# blog1 = Blog.new('ブロガーくん')
# article1.blog = blog1
#
# puts article1.writer # -> ブロガーくん


require 'forwardable'

class Article
  extend Forwardable

  def_delegator :blog, :writer

  attr_accessor :blog
end

class Blog
  attr_reader :writer

  def initialize(writer)
    @writer = writer
  end
end

article1 = Article.new
blog1 = Blog.new('ブロガーくん')
article1.blog = blog1

puts article1.writer
