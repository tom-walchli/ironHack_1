require 'imdb'

moviesArr = IO.read("Movies.txt").split("\n")

movies  = moviesArr.map {|movieStr| Imdb::Search.new(movieStr)}

ratings		 = movies.map 	{ |movie| movie.movies[0].rating }
titles		 = movies.map 	{ |movie| movie.movies[0].title  }
ratingsRound = ratings.map  { |e| e.round  }

ratingsRound.each_with_index do |rating, j| 
	for i in 0..rating-1
		print 'x'
	end
	print "\t"
	print titles[j]
	print "\n"
end

hiRate = ratingsRound.max

puts hiRate

rate = hiRate
while rate >= 0
	ratingsRound.each do |rating|
		if rating >= rate
			print '#'
		else
			print " "
		end
	end
	print "\n"
	rate -= 1
end 
