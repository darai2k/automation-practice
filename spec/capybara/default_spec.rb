require 'spec_helper'

describe "/", type: :feature do
  before { visit('/') }
  it { page.should have_content "Hello, world" }
end
