# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

quantity = (10..100).to_a
average_unit_price = (12..50).to_a
category = ['construcao', 'material escolar', 'livros']
school_year = ["1 ano", "2 ano", "3 ano"]
material = ["lapis", "Livro x", "caneta", "giz", "lousa", "cadeiras", "mesas"]
status = ["doacao recebida", "aguardando doacao", "nenhum doador até agora"]
payment_status = ["aprovado", "negado"]
value_donated = (15..300).to_a
puts 'seeding schools'
10.times do
  school = School.new(
    address: Faker::Address.street_address,
    name: Faker::Educator.secondary_school,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zipcode: Faker::Address.zip_code
  )
  school.save
end

puts 'seeding teachers'
30.times do
  teacher = Teacher.new(
    # school: School.all.sample,
    name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "password",
    registration_code: Faker::Code.sin,
    course: Faker::Educator.subject,
    telephone: Faker::PhoneNumber.phone_number
  )
  teacher.save
end

puts 'seeding projects'
50.times do
  project = Project.new(
    teacher: Teacher.all.sample,
    title: Faker::BossaNova.song,
    description: Faker::Hipster.paragraph(sentence_count: 2),
    material: material.sample,
    quantity: quantity.sample,
    average_unit_price: average_unit_price.sample,
    category: category.sample,
    school_year: school_year.sample,
    limit_date: DateTime.new(2019, 10, [14,15,16].sample, rand(8..18), [00,30].sample, 0),
  )
  project.save
end

puts 'seeding donators'
60.times do
  donator = Donator.new(
    email: Faker::Internet.email,
    password: "password",
    name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    cpf: Faker::IDNumber.brazilian_citizen_number,
    telephone: Faker::PhoneNumber.phone_number
  )
  donator.save
end

puts 'seeding donations'
100.times do
  donation = Donation.new(
    project: Project.all.sample,
    donator: Donator.all.sample,
    quantity_donated: quantity.sample,
    status: status.sample
  )
  donation.save
end

puts 'seeding payments'
60.times do
  payment = Payment.new(
    donator: Donator.all.sample,
    status: payment_status.sample,
    date: Faker::Date.between(from: 2.days.ago, to: Date.today),
    value_cents: value_donated.sample
  )
  payment.save
end
