require_relative "post"
require_relative "link"
require_relative "memo"
require_relative "task"
require 'optparse'

options = {}

OptionParser.new do |opt|
	opt.banner = 'Usage: read.rb [options]'

	opt.on('-h', 'Prints this help') do 
		puts opt 
		exit		
	end

	opt.on('--type POST_TYPE', 'What kind of post to show? (any by default)') { |o| options[:type] = o } #
	opt.on('--id POST_ID', "Show post by id number?") { |o| options[:id] = o } 
	opt.on('--limit NUMBER', 'How many post to show? (all by default)') { |o| options[:limit] = o }

end.parse!	

result  = Post.find(options[:limit], options[:type], options[:id])

if result.is_a? Post
	puts "#{result.class.name} id number #{options[:id]} "

	result.to_strings.each do |line|
		puts line
	end

else
	print "| id\t| @type\t| @created_at\t\t\t| @text\t\t\t| @url\t\t| @due_date \t "

	result.each do |row|
		puts

		row.each do |element|
			print "| #{element.to_s.delete("\n\r")[0..40]}\t"
		end
	end
end

puts