class Band < ActiveRecord::Base
	has_and_belongs_to_many(:venues)
	validates(:name, :presence => true)
	before_save(:capitalize_band)
	
	private
	define_method(:capitalize_band) do
    	self.name=(name().capitalize())
   	end
end

