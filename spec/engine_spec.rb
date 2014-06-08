describe Rcurse::Engine do
  it "renders an empty template" do
  	result = Rcurse::render("")
    expect(result).to eq("")
  end

  it "renders a template with text" do
  	result = Rcurse::render("Hello World")
    expect(result).to eq("Hello World")
  end

  it "renders a template with unicode text" do
  	result = Rcurse::render("გამარჯობა")
    expect(result).to eq("გამარჯობა")
  end

  it "renders {% nil %} as empty"do
  	result = Rcurse::render("{% nil %}")
    expect(result).to eq("")
  end

  it "renders {%= 1 %} as 1"do
  	result = Rcurse::render("{%=1 %}")
    expect(result).to eq("1")
  end
end
