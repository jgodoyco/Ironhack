class Post
  attr_reader(:title, :date, :text)

  def initialize(title, date, text)
    @title = title 
    @date = date 
    @text = text
  end

  def to_s
  	return (" #{@title} [#{@date}]\n ******************\n #{@text}\n -----------------")
  end

end

class AdvancePost < Post

  def to_s
    return (" ******#{@title}  [#{@date}]*******\n ******************\n #{@text}\n -----------------")
  end

end


class Blog
  attr_reader(:lista_de_post, :tam_pagina)

  def initialize
    @lista_de_post = []
  end

  def publish_front_page
      @lista_de_post.each do |post|
        puts post
      end
  end

  def orderPostByDate
    @lista_de_post.sort_by {|post| post.date}
  end

  def add_post(post)
      @lista_de_post << post
      @lista_de_post = orderPostByDate
  end
end

blog = Blog.new
blog.add_post Post.new("Mi casa", "2016/12/01", "Mi casa esta en la montaña. ¿Te gusta?.")
blog.add_post AdvancePost.new("El perro de Juan", "2015/07/23", "El perro del Hortelano ni come ni deja comer.")
blog.add_post Post.new("Ir sobre ruedas", "2016/02/01", "En mi coche voy muy agustito.")

blog.publish_front_page