require('spec_helper')

describe(Client) do

  describe(".all") do
    it("displays all clients saved in the Client class") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a client to the array of saved clients") do
      test_client = Client.new({:client_name => "Dale", :id => 1, :stylist_id => 1})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  # describe("")

end
