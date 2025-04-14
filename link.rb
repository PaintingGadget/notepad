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

	def save
		file = File.new(file_path, "w:UTF-8")
		time_string = @created_at.strftime("%d.%m.%Y, %H:%M:%S")
		file.puts(time_string + "\n\r")
		file.puts(@url)
		file.puts(@text)
		file.close

		puts "Your link is saved!"		
	end

	def to_db_hash
		return super.merge(
		{
			'text' => @text,
			'url' => @url
		})
		
	end

	def load_data(data_hash)
		super(data_hash)
		@url = data_hash['url']		
	end
end
