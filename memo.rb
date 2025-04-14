class Memo < Post

	def read_from_console
		puts "New note (enter all your thoughts, when finish type 'end'"
		line = nil

		while line != "end"
			line = STDIN.gets.chomp
			@text << line
		end

		@text.pop
	end

	def save
		file = File.new(file_path, "w:UTF-8")
		time_string = @created_at.strftime("%d.%m.%Y, %H:%M:%S")
		file.puts(time_string + "\n\r")

		for item in @text do 
			file.puts(item)			
		end
		file.close

		puts "Your note is saved!"
	end

	def to_db_hash
		return super.merge(
		{
			'text' => @text.join('\n\r')
		})
		
	end

	def to_strings
	    # Сгенерируем строку с датой создания заметки используя объект класса Time,
	    # который у нас находится в переменной @created_at (смотрите конструктор
	    # класса-родителя Post).
	    time_string = "Created: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')}\n\r"

	    # Возвращаем массив @text с добавление в начало (методом массива unshift)
	    # строчки с датой создания заметки.
	    @text.unshift(time_string)
	end

	def load_data(data_hash)
		super(data_hash)
		@text = data_hash['text'].split('\n\r')		
	end
end
