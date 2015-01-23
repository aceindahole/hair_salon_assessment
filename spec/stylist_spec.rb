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

  describe("#id") do
    it("tells you the id tied to the called upon stylist") do
      test_stylist = Stylist.new({:stylist_name => "Tyler", :id => 1})
      test_stylist.save()
      expect(test_stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe(".find") do
    it("returns a stylist by their given id number") do
      test_stylist1 = Stylist.new({:stylist_name => "Tyler", :id => 1})
      test_stylist1.save()
      test_stylist2 = Stylist.new({:stylist_name => "Sean", :id => 2})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end

end
