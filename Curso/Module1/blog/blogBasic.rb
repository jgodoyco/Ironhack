class Post
  attr_reader(:title, :date, :text)

  def initialize(title, date, text)
    @title = title 
    @date = date 
    @text = text
  end

  def to_s
  	return (" #{@title}\n ******************\n #{@text}\n -----------------")
  end

end

class AdvancePost < Post

  def to_s
    return (" ******#{@title}*******\n ******************\n #{@text}\n -----------------")
  end

end


class Blog
  attr_reader(:lista_de_post)

  def initialize
    @lista_de_post = []
  end

  def publish_front_page
      @lista_de_post.each do |post|
        puts post
      end
  end

  def add_post(post)
      @lista_de_post << post
  end
end

blog = Blog.new
blog.add_post Post.new("Mi casa", "30/09/2016", "Mi casa esta en la montaña. ¿Te gusta?.")
blog.add_post AdvancePost.new("El perro de Juan", "3/12/2015", "El perro del Hortelano ni come ni deja comer.")
blog.add_post Post.new("Ir sobre ruedas", "01/02/2016", "En mi coche voy muy agustito.")

blog.publish_front_page