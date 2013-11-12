require "spec_helper"
require "romans_converter"

describe "RomansConverter" do
  let ( :romans_converter) { RomansConverter.new }

  it "should return 1 given I" do
    romans_converter.to_roman("I").should eq(1)
  end

  it "should return 5 given V" do
    romans_converter.to_roman("V").should eq(5)
  end  

  it "should return 10 given X" do
    romans_converter.to_roman("X").should eq(10)
  end

  it "should return 50 given L" do
    romans_converter.to_roman("L").should eq(50)
  end

  it "should return 100 given C" do
    romans_converter.to_roman("C").should eq(100)
  end        

  it "should return 500 given D" do
    romans_converter.to_roman("D").should eq(500)
  end

  it "should return 1000 given M" do
    romans_converter.to_roman("M").should eq(1000)
  end

  it "should return 2 given II" do
    romans_converter.to_roman("II").should eq(2)
  end

  it "should return 3 given III" do
    romans_converter.to_roman("III").should eq(3)
  end

  it "should return 4 given IV" do
    romans_converter.to_roman("IV").should eq(4)
  end

  it "should return 40 given XL" do
    romans_converter.to_roman("XL").should eq(40)
  end

  it "should return 40 given CD" do
    romans_converter.to_roman("CD").should eq(400)
  end  

  it "should return 8 given VIII" do
    romans_converter.to_roman("VIII").should eq(8)
  end

  it "should return 158 given CLVIII" do
    romans_converter.to_roman("CLVIII").should eq(158)
  end

  it "should raise exception given IIII" do
    expect { romans_converter.to_roman("IIII") }.to raise_error
  end

  it "should raise exception given VV" do
    expect { romans_converter.to_roman("VV") }.to raise_error
  end  

  it "should raise exception given lower case" do
    expect { romans_converter.to_roman("v") }.to raise_error
  end

  it "should raise exception given T" do
    expect { romans_converter.to_roman("T") }.to raise_error
  end
end