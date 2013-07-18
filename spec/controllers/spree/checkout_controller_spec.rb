require 'spec_helper'

describe Spree::CheckoutController do
  stub_authorization!

  before { controller.stub spree_current_user: nil }

  context "#before_address" do
    specify do
    end
  end
end
