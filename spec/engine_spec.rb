describe Rcurse::Engine do
  it "renders an empty template" do
  	result = Rcurse::render("")
    expect(result).to eq("")
  end
end
