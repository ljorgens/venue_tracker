class CreateVenues1 < ActiveRecord::Migration
  def change
  	create_table(:venues) do |t|
  		t.column(:name, :string)
  		t.column(:band_id, :integer)
  		
  		t.timestamps
  	end
  end
end
