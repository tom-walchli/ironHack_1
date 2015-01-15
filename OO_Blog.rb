#############################################
# 										   	#
#  Object oriented Blog 				   	#
#  To add a sponsored post use keyword		#
#  "[SPONSORED]" at beginning of title 		#
# 										    #
#############################################

class Blog
	def initialize
		@posts = []
		@posts.push(Post.new)
		update
	end

	def update
		puts "\n\n"
		@posts.each do |post|
			puts "#{post.time}: #{checkSponsored(post.title)}"
			puts "************************"
			puts post.text
			puts "------------------------"
		end
		puts "\n"
		@posts.push(Post.new)
		update
	end

	def checkSponsored(title)
		if title[0,11] == "[SPONSORED]"
			return "******#{title[12..-1]}******" # I'm sure there's a better way for substr...
		else
			return title
		end
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