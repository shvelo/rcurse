describe Rcurse::Helper do
	it "Initializes with dummy name and callback" do
		helper = Rcurse::Helper.new("dummy") {}
		expect(helper).to be_a(Rcurse::Helper)
		expect(helper.name).to eq("dummy")
		expect(helper.callback).to be_a(Proc)
	end
end