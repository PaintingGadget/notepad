require "date"

class Task < Post

	def initialize
		super

		@due_date = Time.now
	end

	def read_from_console
		puts "What needs to be done?"
		@text = STDIN.gets.chomp

		puts "By what date do you need to do it? \
		Specify the date in the format dd.mm.yyyy,\
		for example 21.03.2026"
		input = STDIN.gets.chomp

		@due_date = Date.parse(input)
		
	end

	def to_strings
		time_string = "Created:#{@created_at.strftime("%d.%m.%Y, %H:%M:%S")} \n\r \n\r"

		deadline = "Deadline: #{@due_date}"

		return [deadline, @text, time_string]		
	end
end