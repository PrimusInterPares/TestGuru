require 'rails_helper'

RSpec.describe "answers/show", type: :view do
  before(:each) do
    assign(:answer, Answer.create!(
      body: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
  end
end
