require 'spec_helper'

describe "patients/edit" do
  before(:each) do
    @patient = assign(:patient, stub_model(Patient,
      :first_name => "MyString",
      :middle_name => "MyString",
      :last_name => "MyString",
      :gender => "MyString"
    ))
  end

  it "renders the edit patient form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", patient_path(@patient), "post" do
      assert_select "input#patient_first_name[name=?]", "patient[first_name]"
      assert_select "input#patient_middle_name[name=?]", "patient[middle_name]"
      assert_select "input#patient_last_name[name=?]", "patient[last_name]"
      assert_select "input#patient_gender[name=?]", "patient[gender]"
    end
  end
end
