require('spec_helper')

describe(Stylist) do

  describe(".all") do
    it("displays all stylists saved in the Stylist class") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves the new object into the database") do
      test_stylist = Stylist.new({:stylist_name => "Tyler", :id => 1})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end

  describe("#stylist_name") do
    it("tells you the name of the stylist") do
      test_stylist = Stylist.new({:stylist_name => "Tyler", :id => 1})
      test_stylist.save()
      expect(test_stylist.stylist_name()).to(eq("Tyler"))
    end
  end

end
