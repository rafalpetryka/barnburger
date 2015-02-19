# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

News.create(text_with_link: "24, 25 i 26 grudnia Barn Burger będzie zamknięty", text: "24, 25 i 26 grudnia Barn Burger będzie zamknięty", date: DateTime.now-5.days)
News.create(text_with_link: "<a href='https://www.facebook.com/BarnBurger/photos/a.441810219170805.104287.431519026866591/907029125982243/?type=1'>6 stycznia</a> Barn będzie nieczynny", text: "<a href='https://www.facebook.com/BarnBurger/photos/a.441810219170805.104287.431519026866591/907029125982243/?type=1'>6 stycznia</a> Barn będzie nieczynny", date: DateTime.now-4.days)
News.create(text_with_link: "Od jutra (8 stycznia) dwa nowe limitowane burgery! Zobacz ich skład w zakładce <a href='#menu'>Menu</a>", text: "Od jutra (8 stycznia) dwa nowe limitowane burgery! Zobacz ich skład w zakładce <a href='#menu'>Menu</a>", date: DateTime.now-2.days)
News.create(text_with_link: "Nowa limitowana edycja od 29 stycznia. Zobacz <a href='#menu'>Menu</a>", text: "Nowa limitowana edycja od 29 stycznia. Zobacz <a href='#menu'>Menu</a>", date: DateTime.now)