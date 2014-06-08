describe Rcurse::Context do
	it "initializes" do
		context = Rcurse::Context.new
		expect(context).to be_a(Rcurse::Context)
	end

	it "returns binding" do
		context = Rcurse::Context.new
		expect(context.get_binding).to be_a(Binding)
	end

	it "returns the same binding every time" do
		context = Rcurse::Context.new
		expect(context.get_binding).to eq(context.get_binding)
	end
end