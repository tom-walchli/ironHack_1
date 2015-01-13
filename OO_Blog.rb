class Blog
	def initialize
		@posts = []
		@posts.push(Post.new)
		update
	end

	def update
		puts "\n\n"
		@posts.each do |post|
			puts "#{post.time}: #{post.title}"
			puts "************************"
			puts post.text
			puts "------------------------"
		end
		puts "\n"
		@posts.push(Post.new)
		update
	end
end

class Post
	attr_reader :time, :title, :text
	def initialize
		@title = input("Type title:")
		@text  = input("Type text:")
		@time  = Time.new
	end

	def input(phrase)
		puts phrase
		return gets.chomp
	end
end

Blog.new