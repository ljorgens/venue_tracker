require("spec_helper")

describe (Band) do
	it("validates presence of a name") do
    band = Band.new({:name => ""})
    expect(band.save()).to(eq(false))
  end
  it("converts the name to lowercase") do
    band = Band.create({:name => "ANOTHER"})
    expect(band.name()).to(eq("Another"))
  end
end