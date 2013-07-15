require 'spec_helper'

describe "User Pages" do
  subject { page }
  describe "signup page" do
    before { visit signup_path }
    it { should have_selector('h1', text: 'Sign up') }
    it { should have_selector('title', text: full_title('Sign up')) }

    let(:submit) { "Create my acount" }

    describe "with invalid info" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid info " do
      before do
        fill_in "Name", with: "Example user"
        fill_in "Email", with: "user@example.com"
        fill_in "Password", with: "27101988"
        fill_in "Confirmation", with: "27101988"
      end
      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
      describe "after creating a user" do
        before { click_button submit }
        let (:user) { User.find_by_email('user@example.com') }
        it { should have_selector 'title', text: user.name }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
        it { should have_link('Sign out') }
        describe "make a signout" do
          before { click_link 'Sign out' }
          it { should have_link 'Sign in' }
        end
      end
    end
  end

  describe "profile page " do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }
    it { should have_selector('h1', text: user.name) }
    it { should have_selector('title', text: user.name) }
  end

  describe "edit " do
    let (:user) { FactoryGirl.create(:user) }
    before do
      visit signin_path
      valid_signin(user)
      visit edit_user_path(user)
    end

    describe "page" do
      it { should have_selector('h1', text: 'Update your profile') }
      it { should have_selector('title', text: 'Edit user') }
      it { should have_link('Change', href: 'http://gravatar.com/emails') }
    end

    describe 'with invalid information' do
      before { click_button 'Save your changes' }
      it { should have_content('error') }
    end

    describe "with valid information" do
      let(:new_name) { 'New name' }
      let(:new_email) { 'new@example.com' }
      before do
        fill_in 'Name', with: new_name
        fill_in 'Email', with: new_email
        fill_in 'Password', with: user.password
        fill_in 'Confirmation', with: user.password
        click_button 'Save your changes'
      end

      it { should have_selector('title', text: new_name) }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Sign out', href: signout_path) }
      specify { user.reload.name.should == new_name }
      specify { user.reload.email.should == new_email }
    end
  end

  describe 'index' do
    before do
      sign_in FactoryGirl.create(:user)
      FactoryGirl.create(:user, name: 'Bob', email: 'bob@example.com')
      FactoryGirl.create(:user, name: 'Ben', email: 'ben@example.com')
      visit users_path
    end

    it {should have_selector('title', text:'All users')}
    it {should have_selector('h1', text: 'All users')}

    it 'should list each user' do
      User.all.each do |user|
        page.should have_selector('li', text: user.name)
      end
    end
  end
end
