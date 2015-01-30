require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/") do
	@groups = Band.all()
	erb(:index)
end

post("/groups") do
	name = params.fetch("group")
	@group = Band.create({:name => name})
	@groups = Band.all()
	erb(:index)
end

delete("/venues/:id") do
	@band = Band.find(params.fetch("id").to_i())
	@band_name = Band.find(params.fetch("id").to_i())
	@band_name1 = Band.find(params.fetch("id").to_i())
	@band.delete()
	@band = Band.all()
	@venues = Venue.all()
	@groups = Band.all()
	erb(:index)
end

patch("/venues/:id/edit") do
	name = params.fetch("update")
	@band = Band.find(params.fetch("id").to_i())
	@band.update({:name => name})
	@venues = Venue.all()
	@band_name = Band.find(params.fetch("id").to_i())
	@band_name1 = Band.find(params.fetch("id").to_i())
	erb(:venues)
end

get("/venues/:id") do
	@band_name = Band.find(params.fetch("id").to_i())
	@band_name1 = Band.find(params.fetch("id").to_i())
	@venues = Venue.all()
	erb(:venues)
end

post("/venues/:id") do
	@band_name = Band.find(params.fetch("id").to_i())
	@band_name1 = Band.find(params.fetch("id").to_i())
	name = params.fetch("venue")
	@venue = Venue.create({:name => name})
	@groups = Band.all()
	@venues = Venue.all()
	erb(:venues)
end

patch("/venues/:id") do
	@band_name = Band.find(params.fetch("id").to_i())
	@band_name1 = Band.find(params.fetch("id").to_i())
	venue_ids = params.fetch("venue_ids")
	@band_name1 = Band.create({:name => nil})
	venue_ids.each() do |venue_id|
		@band_name1.venues << Venue.find(venue_id.to_i())
		@band_name.update({:venue_ids => [venue_id.to_i()]})
	end
	@venues = Venue.all()
	erb(:venues)
end

