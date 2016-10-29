require_relative "../exercicesModule.rb"
require "spec_helper"

describe "StringCalculator" do 
	it "returns 0 for an empty string" do
		expect(StringCalculator.add("")).to eq(0)
	end
	it "returns 5 add numbers in string" do
		expect(StringCalculator.add("2\n3")).to eq(5)
	end
	it "returns 5 add numbers in string" do
		expect(StringCalculator.add("2;3")).to eq(5)
	end
	it "returns 2 the number if only has a number in string" do
		expect(StringCalculator.add("2")).to eq(2)
	end
	it "returns 14 add numbers in string" do
		expect(StringCalculator.add("2,3,4, 5")).to eq(14)
	end
end