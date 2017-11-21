# Author: Michelle Dudley (2017)
# Obviously I'm new to Ruby, so this isn't particularly elegant but it gets the job done
# Takes a tab-separated list of phrases from a file or user input and scrambles them 
# for a word scramble, then generates the lines for the solver to fill in.

class Scrambler
	def self.scramble(scr_words)
		chunk = scr_words.chomp.split("\t")
		chunk.each do |w|
			# array of words denoted by spaces
			indiv_words = w.split("\s")
			phrase = ""
			underscores = ""
			indiv_words.each do |k|
				# converts the word to an uppercase char array, 
				# which gets shuffled and then converted back to a string
				word = ""
				u_word = ""
				k.strip.upcase.chars.shuffle!.each do |c| 
					word += c
					u_word += "_ "
				end
				phrase += word + " "
				underscores += u_word + "  "
			end
			puts phrase.strip
			puts underscores.strip
		end
	end

	# I/O, just for fun. File reading is brittle right now--will crash with bad input.
	puts "Upload a file or type in your words? (f/t)"
	case gets.chomp!
		# User requests file input
		when 'f'
			puts "What's the filename?"
			filename = gets.chomp
			scr_file = File.read(File.realdirpath(filename).to_s).to_s
			#learn try/catch blocks please
			puts "File read successfully! \n\n"
			self.scramble(scr_file)
		# User requests written input
		when 't'
			puts "Type in your words/phrases separated by tabs:"
			scr_input = gets
			self.scramble(scr_input)
	end
end
