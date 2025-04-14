require "date"

class Task < Post

	def initialize
		super

		@due_date = ''
	end

	def read_from_console
		puts "What needs to be done?"
		@text = STDIN.gets.chomp

		puts "By what date do you need to do it? \n
		Specify the date in the format dd.mm.yyyy,\n
		for example 21.03.2026"
		input = STDIN.gets.chomp

		@due_date = input
		
	end

	def save
		file = File.new(file_path, "w:UTF-8")
		time_string = @created_at.strftime("%d.%m.%Y, %H:%M:%S")
		file.puts(time_string + "\n\r")
		file.puts("Deadline: #{@due_date.strftime("%d.%m.%Y")}")
		file.puts(@text)
		file.close

		puts "Your task is saved!"
	end

	def to_db_hash
		return super.merge(
		{
			'text' => @text,
			'due_date' => @due_date
		})
		
	end

	def load_data(data_hash)
		super(data_hash)
		@due_date = Date.parse(data_hash['due_date'])		
	end
end