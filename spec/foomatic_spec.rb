require "spec_helper"

describe Foomatic::DB do
  subject(:db) do
    foomatic = Foomatic::DB.open(File.expand_path("../db", __FILE__))
  end

  describe "#printers" do
    it "should return list of printers" do
      db.printers.should be_an_instance_of(Array)
      db.printers[0].should be_an_instance_of(Foomatic::Printer)
    end

    it "should include 'HP LaserJet 1200' printer" do
      printer = db.printers[0]
      printer.make.should eq "HP"
      printer.model.should eq "LaserJet 1200"
      printer.should be_laser
      printer.should_not be_color
    end
  end
end