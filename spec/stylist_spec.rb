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

  describe("#clients") do
    it("returns an array of the clients for that particular stylist") do
      test_stylist1 = Stylist.new({:stylist_name => "Tyler", :id => 1})
      test_stylist1.save()
      test_client1 = Client.new({:client_name => "Dale", :id => 1, :stylist_id => test_stylist1.id()})
      test_client1.save()
      test_client2 = Client.new({:client_name => "Alex", :id => 2, :stylist_id => test_stylist1.id()})
      test_client2.save()
      expect(test_stylist1.clients()).to(eq([test_client1, test_client2]))
    end
  end
      # I am having a hard time understanding why the above spec works when I pull 'test_stylist1.id()' with my method, but it doesn't work when I put in the number 1 for stylist_id. They are the exact same variable, no?
end
