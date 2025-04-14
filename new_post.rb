require_relative "post"
require_relative "link"
require_relative "memo"
require_relative "task"

puts "Hi! This is Version 2 of Notepad with SQLite"
puts "Want to take a note?"

choices = Post.post_types.keys

choice = -1

until choice >=0 && choice < choices.size
	choices.each_with_index do |type, index|
		puts "\t#{index}. #{type}"
	end

	choice = STDIN.gets.chomp.to_i
end

entry = Post.create(choices[choice])

entry.read_from_console
id = entry.save_to_db

puts "Your note is saved! id = #{id}"
