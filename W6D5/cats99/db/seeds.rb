# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    # t.date "birth_date", null: false
    # t.string "color", null: false
    # t.string "name", null: false
    # t.string "sex", limit: 1, null: false
    # t.text "description"
    # t.datetime "created_at", null: false
    # t.datetime "updated_at", null: false

Cat.destroy_all
cats = Cat.create([
    {birth_date: '2008/11/04', color: 'black', name: 'Cookie', sex: 'F', description: 'So nice and furry.'},
    {birth_date: '2005/05/24', color: 'orange', name: 'Mr. Whiskers', sex: 'M', description: 'Fat, plump, and hungry'},
    {birth_date: '2015/07/12', color: 'white', name: 'Cynthia', sex: 'F', description: 'Playful but clingy'},
    {birth_date: '2013/12/31', color: 'gray', name: 'Momo', sex: 'F', description: 'Skinny and quiet.'},
    {birth_date: '2018/01/05', color: 'brown', name: 'Tofu', sex: 'M', description: 'Very cuddly.'}
])    