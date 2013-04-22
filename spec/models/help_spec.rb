require 'spec_helper'

describe Help do

  context "when initialized" do

    it "should have fixed(never-changing) attributes values" do
      help = FactoryGirl.build(:only_help)
      help.should be_valid
    end

  end

end
