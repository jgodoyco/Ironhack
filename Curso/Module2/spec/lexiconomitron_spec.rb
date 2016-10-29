require_relative "../lexiconomitron.rb"
require "spec_helper"



describe "Lexiconomitron" do 
	before :each do
		@lexi = Lexiconomitron.new
	end

	describe "#eat_t"
		it "returns "" for eat all the t in the word empty" do
			expect(@lexi.eat_t("")).to eq("")
		end

		it "returns rigonomery for eat all the t in the word trigonometry" do
			expect(@lexi.eat_t("Trigonometry")).to eq("rigonomery")
		end

		it "returns house for eat all the t in the word house" do
			expect(@lexi.eat_t("house")).to eq("house")
		end
	end

	describe "#shazam"
		it "returns [] for shazam , it reverse the letters of the all the words" do
			expect(@lexi.shazam([])).to eq([])
		end

		it "returns [“sih, “se”] for shazam , it reverse the letters of the all the words" do
			expect(@lexi.shazam(["This", "is", "a", "boring", "test"])).to eq(["sih","se"])
		end

		it "returns [“yM", "gib”] for shazam , it reverse the letters of the all the words" do
			expect(@lexi.shazam(["My", "house", "is", "big"])).to eq(["yM", "gib"])
		end
	end
	
	describe "#oompa_loompa"
		it "returns [] for oompa_loompa  with a empty array" do
			expect(@lexi.oompa_loompa([])).to eq([])
		end

		it "returns ['if','you','be','my'] for oompa_loompa , it select the words with 3 or less letters" do
			expect(@lexi.oompa_loompa(["if", "you", "wanna", "be", "my", "lover"])).to eq(["if","you","be","my"])
		end

		it "returns ['if','you','be','my'] for oompa_loompa , it select the words with 3 or less letters" do
			expect(@lexi.oompa_loompa(["if", "you", "put", "the", "table"])).to eq(["if","you","pu","he"])
		end
	end

end