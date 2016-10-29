require_relative "../check_subject.rb"
require "spec_helper"

class EmailProvider
	def get_subjects(dir_email)		
		if (dir_email == nil)
			return nil
		elsif (dir_email == "bad@email.com")
			return ["Compra en Alcampo", "Let's Bonus: oferta", "BBVA results" ]
		elsif (dir_email == "good@email.com")
			return ["Oferta en compra en Alcampo", "Let's Bonus: oferta", "BBVA results oferta"]
		else
			return []
		end

	end
end


describe "Checker_Subject" do 

	let (:good_search) {(EmailProvider.new).get_subjects("good@email.com")}
	let (:bad_search) {(EmailProvider.new).get_subjects("bad@email.com")}
	let (:nil_search) {(EmailProvider.new).get_subjects(nil)}
	let (:empty_search) {(EmailProvider.new).get_subjects("whatever@email.com")}

	before :each do
		@checkerSubject = CheckerSubject.new
		@palabras = ["oferta", "BBVA", "results"]

	end

	describe "#check" do

		it "returns false when the subjects are nil" do
			expect(@checkerSubject.check(@palabras, nil_search)).to eq(false)
		end

		it "returns false when the subjects are empty" do
			expect(@checkerSubject.check(@palabras, empty_search)).to eq(false)
		end

		it "returns false when all the words aren't in any the subjects" do
			expect(@checkerSubject.check(@palabras, bad_search)).to eq(false)
		end

		it "returns true when all the words are in at least in any the subjects" do
			expect(@checkerSubject.check(@palabras, good_search)).to eq(true)
		end

		it "returns false when palabras=nil least in any the subjects" do
			expect(@checkerSubject.check(nil, good_search)).to eq(false)
		end

		it "returns true when palabras=[] least in an empty search" do
			expect(@checkerSubject.check([], empty_search)).to eq(false)
		end

		it "returns true when palabras=[] least in any the subjects" do
			expect(@checkerSubject.check([], good_search)).to eq(true)
		end
	end
end
