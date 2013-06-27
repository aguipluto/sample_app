require 'spec_helper'

describe "Static pages" do
  describe "home page" do
    it "should have h1 'Sample App'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Sample App')
    end

    it "should have the title 'Home'" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => 'Ruby Tutorial | Home')
    end
  end

  describe "help page" do
    it "should have h1 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', :text => 'Help')
    end

    it "Should have the title 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('title', :text => 'Ruby Tutorial | Help')
    end
  end

  describe "about page" do
    it "should have h1 'About us'" do
      visit '/static_pages/about'
      page.should have_selector('h1', :text => 'About us')
    end

    it "Should have title 'About us'" do
      visit '/static_pages/about'
      page.should have_selector('title', :text => 'Ruby Tutorial | About')
    end
  end
end
