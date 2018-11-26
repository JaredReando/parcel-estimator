require('rspec')
require('parcel')

describe(Parcel) do
  describe("#volume") do
    it("returns volume of parcel in cubic inches") do
      test_parcel = Parcel.new(3, 3, 4, 10, "Ground")
      expect(test_parcel.volume()).to(eq(36))
    end
  end

  describe("#dimensional_weight") do
    it("returns dimensional weight of parcel") do
      test_parcel = Parcel.new(15, 10, 6, 24, "Ground")
      expect(test_parcel.dimensional_weight()).to(eq(6))
    end
  end

  describe("#dimensional_weight") do
    it("returns dimensional weight of parcel") do
      test_parcel = Parcel.new(15, 10, 26, 24, "Ground")
      expect(test_parcel.dimensional_weight()).to(eq(28))
    end
  end

  describe("#surface_area") do
    it("returns surface area of parcel") do
      test_parcel = Parcel.new(15, 10, 26, 24, "Ground")
      expect(test_parcel.surface_area()).to(eq(1600))
    end
  end

  describe("#ship_cost") do
    it("returns ship cost of parcel") do
      test_parcel = Parcel.new(15, 10, 6, 24, "Ground")
      expect(test_parcel.ship_cost()).to(eq("$40.00"))
    end
  end

  describe("#ship_cost") do
    it("returns ship cost of parcel") do
      test_parcel = Parcel.new(15, 10, 26, 24, "Next Day Air")
      expect(test_parcel.ship_cost()).to(eq("$55.00"))
    end
  end

end
