class Example < Object

	#this is a comment

	#These are attributes that we can set for each
	#instance of this class. Use attr_accessor
	#to establish. once attributes, can be called as methods.
	attr_accessor :honorific
	attr_accessor :name
	attr_accessor :date
	# a Symbol is an immutable variable (FINAL)
	# shown by :name (the colon first character)


	#This is overwriting a method inherited from parent class
	def to_s
		@name
	end

	#'.' is method operator
	#Date provides class method which can be called on class without 
	#first instantiating.
	#Obviously, methods can still be chained 
	#initiialize method is the constructor method
	def initialize(name, date)
		@name = name
		#instance variable --> maps the scope of the variable
		# to the entire class (global)
		# --> Will also be avaliable across corresponding views 
		# ----> A RAILS VIEW IS NOT A SEPARATE CLASS!!
		# -----			instead, a template and part of the current controller object
		@date = date.nil? ? Date.today : date
		#Question mark indicates a boolean return
		
		#THIS IS A TERNARY OPERATOR
		# condition ? value_if_true : value_if_false
		# 
		# if date.nil?
		# 	@date = Date.today
		# else
		# 	@date = date
		# end


	end

	def titled_name
		@honorific ||= 'Esteemed'
		#short hand 'or equals' operator
		# Condidtional assignment 
		# --> only assign value to variable if no value previously assigned
		# if not x
		# 	x = y
		# end
		# Used to assign a default value


		titled_name = "#{@honorific} #{@name}"
		#interpolation --> evaluate hash and return as string
		#requires quotation - streamlines string concatination
		#titled_name = @honorific + ' ' + @name
	end

	def december_birthdays
		# Declare an array
		born_in_december = []
		# Arrays can hold multiple data types!
		# NB: 
		# my_list = ['apples', 'organges'] 
		# 			is the same as:
		# my_list = %w( apples oranges )
		#
		# Add elements using the push method
		# my_list.push('banana')
		# my_list << melon
		# size, sort, etc are all avaiable by default


		#Iterator (for loop)
		#begin block - unnamed method
		# local variables passed through pipe
		famous_birthdays.each do |name, date|
			#every item in array of value pair in hash

			if date.month == 12
				born_in_december << name
			end
		end
		born_in_december
	end




	private
	#Access Control
	#Method can only be used by other methods in the same class def
	#--> Anything below private is a private method of the class

	def famous_birthdays
		birthdays = {
			'Ludwig van Beethoven' => Date.new(1770, 12, 16),
			'Dave Brubeck' => Date.new(1920, 12, 6),
			'Buddy Holly' => Date.new(1936, 9, 7),
			'Keith Richards' => Date.new(1943,12,18)

		}
		# A hash
		# Data structure -> collection --> retrive value based on key
		# AKA - DICTIONARY
		# use key to lookup value

		# a hashrocket ( => ) operator associates a key and a value pair
		# ADDITION
		birthdays2 = {
			beethoven: Date.new(1770, 12, 16),
			brubeck: Date.new(1920, 12, 6),
			holly: Date.new(1936, 9, 7),
			richards: Date.new(1943,12,18)
		}
		# In this example, the colon associates the key and the value
		# Ordinarily, a symbol is defined with a leading colon character.
		# In a hash, a trailing colon makes a string into a symbol. 
		# --> Remember a symbol is a final, immuatable variable

		# NB: String with spaces to symbol in a hash is:
		# birthdays3 = {
		#:'Ludwig van Beethoven' => Date.new(1770, 12, 16)
		# }



	end
end