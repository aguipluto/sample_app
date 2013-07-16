namespace :db do
  desc 'populate with some fake date'
  task populate: :enviroment do
    User.create! (name: 'Example User',
                  email: 'example@railstutorial.org',
                  password: 'foobar',
                  password_confirmation: 'foobar')
    99.times do |n|
      name = Faker.Name.name
      email = "example-#{}"
    end
  end
end