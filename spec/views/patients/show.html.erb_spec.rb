require 'spec_helper'

describe "patients/show" do
  before(:each) do
    @patient = assign(:patient, stub_model(Patient,
      :first_name => "First Name",
      :middle_name => "Middle Name",
      :last_name => "Last Name",
      :gender => "Gender"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Middle Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Gender/)
  end
end
