describe Yarf::Router do
  describe "#register" do
    it "adds the route" do
      route_a = Yarf::Route.new(path: "/hello", method: :get, action: nil)
      router = described_class.new

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
        router = described_class.new
        router.register(route_a)

        found_route = router.find(path: route_a.path, method: route_a.method)

        expect(found_route).to eq(route_a)
      end
    end
    context "when the route does not exist" do
      it "returns the not_found route" do
        router = described_class.new

        found_route = router.find(path: "/hello", method: :get)

        expect(found_route).to eq(Yarf::Route.not_found)
      end
    end
  end
end
