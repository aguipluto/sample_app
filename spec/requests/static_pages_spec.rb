require 'spec_helper'

describe "Static pages" do

  let (:base_title) { "Ruby on Rails Tutorial Sample App" }

  describe "home page" do
    it "should have h1 'Sample App'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Sample App')
    end

    it "should have the base title" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => "#{base_title}")
    end

    it "should not have custom page title" do
      visit '/static_pages/home'
      page.should_not have_selector('title', :text => '| Home')
    end
  end

  describe "help page" do
    it "should have h1 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', :text => 'Help')
    end

    it "Should have the title 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('title', :text => "#{base_title} | Help")
    end
  end

  describe "about page" do
    it "should have h1 'About us'" do
      visit '/static_pages/about'
      page.should have_selector('h1', :text => 'About us')
    end

    it "Should have title 'About us'" do
      visit '/static_pages/about'
      page.should have_selector('title', :text => "#{base_title} | About")
    end
  end

  describe "contact page" do
    it "Should have h1 'Contact us'" do
      visit '/static_pages/contact'
      page.should have_selector('h1', :text => 'Contact us')
    end

    it "Should have title 'Contact'" do
      visit '/static_pages/contact'
      page.should have_selector('title', :text => "#{base_title} | Contact")
    end
  end
end
