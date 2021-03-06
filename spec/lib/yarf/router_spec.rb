describe Yarf::Router do
  describe "#register" do
    it "adds the route" do
      route_a = Yarf::Route.new(path: "/hello", method: :get, action: nil)
      router = described_class.send(:new)

      router.register(route_a)

      expect(router.routes_list.size).to eq(1)
      expect(router.routes_list).to include(route_a)

      route_b = Yarf::Route.new(path: "/hi", method: :post, action: nil)

      router.register(route_b)

      expect(router.routes_list.size).to eq(2)
      expect(router.routes_list).to include(route_b)
    end
  end
  describe "#find" do
    context "when the route exists" do
      it "returns the route" do
        route_a = Yarf::Route.new(path: "/hello", method: :get, action: nil)
        router = described_class.send(:new)
        router.register(route_a)

        found_route = router.find(path: route_a.path, method: route_a.method)

        expect(found_route).to eq(route_a)
      end
    end
    context "when the route does not exist" do
      it "does not return a route" do
        router = described_class.send(:new)

        found_route = router.find(path: "/hello", method: :get)

        expect(found_route).to be_nil
      end
    end
  end
  describe "global get" do
    it "registers a get route" do
      router = Yarf::Router.send(:new)

      allow(Yarf::Router).to receive(:instance).and_return(router)
      get "/bla" do
        { results: [1, 2, 3] }
      end

      expect(router.routes_list.size).to eq(1)
      route = router.routes_list.first
      expect(route.method).to eq("GET")
      expect(route.path).to eq("/bla")
      expect(route.action).to_not be_nil
    end
  end
  describe "global post" do
    it "registers a post route" do
      router = Yarf::Router.send(:new)

      allow(Yarf::Router).to receive(:instance).and_return(router)
      post "/bla" do |params|
        name = params[:name]

        { name: name }
      end

      expect(router.routes_list.size).to eq(1)
      route = router.routes_list.first
      expect(route.method).to eq("POST")
      expect(route.path).to eq("/bla")
      expect(route.action).to_not be_nil
    end
  end
end
