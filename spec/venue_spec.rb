require("spec_helper")

describe(Venue) do
	it("validates presence of a name") do
    venue = Venue.new({:name => ""})
    expect(venue.save()).to(eq(false))
  end
  it("converts the name to lowercase") do
    venue = Venue.create({:name => "TODAY"})
    expect(venue.name()).to(eq("Today"))
  end
end