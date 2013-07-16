namespace :db do
  desc 'populate with some fake date'
  task populate: :environment do
    admin = User.create!(name: 'Antonio',
                         email: 'aguipluto@gmail.com',
                         password: '27101988',
                         password_confirmation: '27101988')
    admin.toggle!(:admin)
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end