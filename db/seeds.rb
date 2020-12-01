# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Cleaning DB"


RoomFee.destroy_all
ProfessionalFee.destroy_all

# PlaceRoom.destroy_all

AvailableTime.destroy_all
Fee.destroy_all
Room.destroy_all

ClientTelephone.destroy_all
ClientAddress.destroy_all
ClientDocument.destroy_all

ProfessionalTelephone.destroy_all
ProfessionalAddress.destroy_all
ProfessionalDocument.destroy_all
ProfessionalPlace.destroy_all

PlaceTelephone.destroy_all
PlaceAddress.destroy_all
PlaceDocument.destroy_all

puts "Destroying #{Client.count} clients..."
Client.destroy_all
puts "Destroying #{Place.count} places..."
Place.destroy_all
puts "Destroying #{Professional.count} professionals..."
Professional.destroy_all
puts "Destroying #{User.count} users..."
User.destroy_all
puts "Destroying #{Telephone.count} telephones..."
Telephone.destroy_all
puts "Destroying #{Address.count} addresses..."
Address.destroy_all
puts "Destroying #{Document.count} documents..."
Document.destroy_all

puts "Creating a new admin..."
User.create!(email: 'admin@bookety.com.br', password: '123456', admin: true)


30.times do
    Telephone.create!(
        telephone_type: ['comercial', 'personal'].sample,
        telephone_number: Faker::PhoneNumber.cell_phone_with_country_code,
        )
        
    puts "Creating telefone ##{Telephone.count}..."
    Address.create!(
        address: Faker::Address.street_address,
        number: Faker::Address.building_number,
        city: Faker::Address.city,
        complement: Faker::Address.secondary_address,
        address_type: ['comercial', 'personal'].sample,
        )
    puts "Creating address ##{Address.count}..."
    
    Document.create!(
        document_type: ['cpf', 'comercial'].sample,
        document_number: (1111111..3333333).to_a.sample,
        )
    puts "Creating document ##{Document.count}..."
end

5.times do
    place_admin = User.create(
        email: Faker::Internet.safe_email,
        password: Faker::Internet.password(min_length: 6),
        admin: false
    )
    
    place = Place.create!(
        user: place_admin,
        company_name: Faker::Company.name,
        fantasy_name: Faker::Company.name,
        admin_full_name: Faker::Name.name,
        admin_job_position: Faker::Job.position,
    )

    PlaceTelephone.create!(
        place: place,
        telephone: Telephone.where(telephone_type: 'comercial').sample
    )
    PlaceAddress.create!(
        place: place,
        address: Address.where(address_type: 'comercial').sample
    )
    PlaceDocument.create!(
        place: place,
        document: Document.where(document_type: 'comercial').sample
    )
end

5.times do
    user = User.create(
        email: Faker::Internet.safe_email,
        password: Faker::Internet.password(min_length: 6),
        admin: false
    )
    
    professional = Professional.create!(
        user: user,
        name: Faker::Name.name,
        nickname:Faker::FunnyName.name,
        professional_type:Faker::Job.title,
        specialties:Faker::Job.key_skill,
    )
    
    ProfessionalTelephone.create!(
        professional: professional,
        telephone: Telephone.where(telephone_type: 'personal').sample
    )
    
    ProfessionalAddress.create!(
        professional: professional,
        address: Address.where(address_type: 'personal').sample
    )
    
    ProfessionalDocument.create!(
        professional: professional,
        document: Document.where(document_type: 'cpf').sample
    )

    3.times do
        ProfessionalPlace.create!(
            professional: professional,
            place: Place.all.sample
        )
    end
    puts "Created professional: #{professional.name}"
end

5.times do
    user = User.create(
        email: Faker::Internet.safe_email,
        password: Faker::Internet.password(min_length: 6),
        admin: false
    )
    
    client = Client.create!(
        user: user,
        full_name: Faker::Name.name,
    )
    
    ClientTelephone.create!(
        client: client,
        telephone: Telephone.where(telephone_type: 'personal').sample
    )
    
    ClientAddress.create!(
        client: client,
        address: Address.where(address_type: 'personal').sample
    )
    
    ClientDocument.create!(
        client: client,
        document: Document.where(document_type: 'cpf').sample
    )
    puts "Created client: #{client.full_name}"
    
end

70.times do
    room = Room.create!(
        room_name:Faker::BossaNova.song,
        room_number: (101..399).to_a.sample.to_s,
        place: Place.all.sample,
    )
    puts "Created room: #{room.room_name}"
end

50.times do
    AvailableTime.create!(
        start: Faker::Time.between(from: DateTime.now, to: DateTime.now + 5),
        end: Faker::Time.between(from: DateTime.now - 5, to: DateTime.now)
    )
end

# Room.all.each do |room|
#     place_room = PlaceRoom.create!(
#         room: room,
#         place: Place.all.sample,
#         available_time: AvailableTime.all.sample
#     )
#     puts "the room #{place_room.room.room_name} is in #{place_room.place.fantasy_name}."
# end

50.times do
    Fee.create!(
        fee_type: ['hour', 'four hours', 'night', 'day', 'entire-day', 'week'].sample,
        fee_value_in_cents: (5000..99999).to_a.sample
    )
end


10.times do
    ProfessionalFee.create!(
        professional: Professional.all.sample,
        fee: Fee.all.sample,
        available_time: AvailableTime.all.sample
    )
    end
    
10.times do
    RoomFee.create!(
        room: Room.all.sample,
        fee: Fee.all.sample,
        available_time: AvailableTime.all.sample
    )
end