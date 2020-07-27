require 'pry'
require 'csv'

class Comment

	attr_accessor :id, :content

	def initialize(id, content)
		@id = id
		@content = content
	end

	def save
		CSV.open("./db/comment.csv", "ab") do |csv|
		    csv << [@id, @content]
		end	
	end

	def self.all
		all_comment = []
	  	CSV.parse(File.open("db/comment.csv", "r+").read).each do |line|
	  		one_comment = Comment.new(line[0], line[1])
	  		all_comment << one_comment 
	  	end
		return all_comment		
	end
end

