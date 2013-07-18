require 'spec_helper'

feature "Last Address" do
  stub_authorization!

  given!(:user) { create(:user) }

  background do
    # TODO
    # build cart obj
  end

  scenario "checkout" do
    visit "/"
    # TODO
    # visit checkout
    # find and fill last address
    # submit
  end
end
