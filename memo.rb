class Memo < Post

	def read_from_console
		puts "New note (enter all your thoughts, when finish type 'end'"
		@text = []
		line = nil

		while line != "end"
			line = STDIN.gets.chomp
			@text << line
		end

		@text.pop
	end

	def to_strings
		time_string = "Created:#{@created_at.strftime("%d.%m.%Y, %H:%M:%S")} \n\r \n\r"

		return @text.unshift(time_string)		
	end

end
