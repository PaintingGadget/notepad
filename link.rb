class Link < Post

	def initialize
		super

		@url = ''
	end

	def read_from_console
		puts "Enter the link address"
		@url = STDIN.gets.chomp

		puts "What is it about?"
		@text = STDIN.gets.chomp
		
	end

	def to_strings
		time_string = "Created:#{@created_at.strftime("%d.%m.%Y, %H:%M:%S")} \n\r \n\r"

		return [@url, @text, time_string]		
	end
end
