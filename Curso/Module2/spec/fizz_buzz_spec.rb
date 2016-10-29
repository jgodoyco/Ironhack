require_relative "../fizzBuzz.rb"
require "spec_helper"



describe "FizzBuzz" do 
	before :each do
		@fizz = FizzBuzz.new
	end

	it "returns fizz for multipled of 3" do
		expect(@fizz.testNumber(3)).to eq("fizz")
	end

	it "returns buzz for multipled of 5" do
		expect(@fizz.testNumber(5)).to eq("buzz")
	end

	it "returns fizzbuzz for multipled of 3 and 5" do
		expect(@fizz.testNumber(15)).to eq("fizzbuzz")
	end

	it "returns 1 for not multipled of 3 or 5" do
		expect(@fizz.testNumber(1)).to eq(1)
	end
end