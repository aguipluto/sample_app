require 'spec_helper'

describe "Static pages" do

  let (:base_title) { "Ruby on Rails Tutorial Sample App" }

  subject { page }
  describe "home page" do
    before { visit root_path }

    it "should have h1 'Sample App'" do
      should have_selector('h1', :text => 'Sample App')
    end
    it "should have the base title" do
      should have_selector('title', :text => full_title(''))
    end
    it "should not have custom page title" do
      should_not have_selector('title', :text => '| Home')
    end
  end

  describe "help page" do
    before { visit help_path }
    it "should have h1 'Help'" do
      should have_selector('h1', :text => 'Help')
    end
    it "Should have the title 'Help'" do
      should have_selector('title', :text => full_title('Help'))
    end
  end

  describe "about page" do
    before { visit about_path }
    it "should have h1 'About us'" do
      should have_selector('h1', :text => 'About us')
    end
    it "Should have title 'About us'" do
      should have_selector('title', :text => full_title('About'))
    end
  end

  describe "contact page" do
    before { visit contact_path }
    it "Should have h1 'Contact us'" do
      should have_selector('h1', :text => 'Contact us')
    end
    it "Should have title 'Contact'" do
      should have_selector('title', :text => full_title('Contact'))
    end
  end
end
