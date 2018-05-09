# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# test1s:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([
    {
    email: 'test1@mail.com',
    password: 'password'
    },
    {
    email: 'test2@mail.com',
    password: 'password'
    },
    {
    email: 'test3@mail.com',
    password: 'password'
    },
    {
    email: 'test4@mail.com',
    password: 'password'
    },
    {
    email: 'test5@mail.com',
    password: 'password'
    }
]) { |u| p u.email }

profiles = Profile.create!([
    {
        first_name: "Cherise",
        last_name: "Sampson",
        shopper_flytes: 0,
        flyer_flytes: 0,
        user_id: 1
    },
    {
        first_name: "Jolene",
        last_name: "Dawe",
        shopper_flytes: 0,
        flyer_flytes: 0,
        user_id: 2
    },
    {
        first_name: "Joel",
        last_name: "Houston",
        shopper_flytes: 0,
        flyer_flytes: 0,
        user_id: 3
    },
    {
        first_name: "Joshua",
        last_name: "Cheung",
        shopper_flytes: 0,
        flyer_flytes: 0,
        user_id: 4
    },
    {
        first_name: "Michelle",
        last_name: "Li",
        shopper_flytes: 0,
        flyer_flytes: 0,
        user_id: 5
    }
]) { |prof| p prof.user_id }

addresses = Address.create!([
    {
        street_address: "87 Chatsworth Quadrant",
        city: "Templestowe Lower",
        state: "VIC",
        postcode: "3107",
        country_code: "AU",
        user_id: 1
    },
    {
        street_address: "793 Rathdowne St",
        city: "Carlton North",
        state: "VIC",
        postcode: "3054",
        country_code: "AU",
        user_id: 2
    },
    {
        street_address: "480 Collins St",
        city: "Melbourne",
        state: "VIC",
        postcode: "3000",
        country_code: "AU",
        user_id: 3
    },
    {
        street_address: "15 East St",
        city: "Ascot Vale",
        state: "VIC",
        postcode: "3032",
        country_code: "AU",
        user_id: 4
    },
    {
        street_address: "16 Byron St",
        city: "Kew",
        state: "VIC",
        postcode: "3101",
        country_code: "AU",
        user_id: 5
    },
]) { |a| p a.user_id }

listings = Listing.create!([
    {
        shopper_city: "Melbourne, Australia",
        flyer_city: "Tokyo, Japan",
        item_description: "Seaweed Biscuits",
        price: "2500",
        user_id: 1
    },
    {
        shopper_city: "Melbourne, Australia",
        flyer_city: "Bali, Indonesia",
        item_description: "Coconut Kalimba x2",
        price: "4500",
        user_id: 2
    },
    {
        shopper_city: "Melbourne, Australia",
        flyer_city: "New York, USA",
        item_description: "'I ❤ NY' T-shirt Medium Size",
        price: "2500",
        user_id: 3
    }
]) { |l| p l.item_description } 