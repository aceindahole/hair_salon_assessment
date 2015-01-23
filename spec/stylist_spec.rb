require('spec_helper')

describe(Stylist) do
  describe(".all") do
    it("displays all stylists saved in the Stylist class") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  
end
