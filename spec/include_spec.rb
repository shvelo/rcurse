describe "include helper" do
	it "includes another template" do
		file_path = File.expand_path("../../spec-data/includes.html", __FILE__)
    out_file_path = File.expand_path("../../spec-data/includes.html.out", __FILE__)

    result = Rcurse::render_file(file_path, out_file_path)

    expect(File.read out_file_path).to eq("hello world")
  end
end