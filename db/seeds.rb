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

LimitedBurger.create(date: DateTime.now, date_on_website: Date.today, name1: "7 SINS", composition1: "burger 200g, cheddar, crack bacon (karmelizowany bekon z pieprzem), sos z musztardy francuskiej i czosnkiem niedźwiedzim, biała cebulka, sałata + sos BBQ, salsa fresca, colesław, fryty", name2: "GARBATO MAFIO", composition2: "burger 200g, ser, bekon, pastrami wołowe, papryka pieczona w balsamico, cebula czerwona, rukola, suszone pomidory, sałata + sos BBQ, salsa fresca, colesław, fryty", price1: 26, price2: 26, how_many_mark1: 5, average1: rand(3.75..5), how_many_mark2: 5, average2: rand(3.75..5))

Burger.create(name: "NAGI INSTYNKT", composition: "warzywa, burger 200g + sos BBQ, salsa fresca, colesław, fryty", price: 19, how_many_mark: 5, average: rand(3.75..5), limited: false)
Burger.create(name: "SIR BURGER", composition: "warzywa, burger 200g, ser + sos BBQ, salsa fresca, colesław, fryty", price: 21, how_many_mark: 5, average: rand(3.75..5), limited: false)
Burger.create(name: "MUPPET BURGER", composition: "warzywa, burger 200g, ser, jalapeno, bekon + sos BBQ, salsa fresca, colesław, fryty ", price: 23, how_many_mark: 5, average: rand(3.75..5), limited: false)
Burger.create(name: "HEART ATTACK", composition: "warzywa, burger 200g, podwójny bekon, podwójny ser, chipsy + sos BBQ, salsa fresca, colesław, fryty ", price: 26, how_many_mark: 5, average: rand(3.75..5), limited: false)
Burger.create(name: "SEX & VIOLENCE", composition: "warzywa, burger 200g, rukola, mascarpone ziołowe, bekon, ser + sos BBQ, salsa fresca, colesław, fryty ", price: 26, how_many_mark: 5, average: rand(3.75..5), limited: false)
Burger.create(name: "MAMAS, PAPAS & DUPAS BLADAS", composition: "warzywa, burger 200g, ser, bekon, kiełbaska chorizo, guacamole + sos BBQ, colesław, fryty", price: 26, how_many_mark: 5, average: rand(3.75..5), limited: false)
Burger.create(name: "SEKRET ZDZICHA", composition: "warzywa, burger 200g, ser, jajko sadzone, szpinak, bekon, sos holenderski + sos BBQ, salsa fresca, colesław, fryty ", price: 26, how_many_mark: 5, average: rand(3.75..5), limited: false)
Burger.create(name: "POPEYE BURGER", composition: "warzywa, ser z grilla, szpinak, chleb orkiszowy, ser + sos BBQ, salsa fresca, colesław, fryty ", price: 21, how_many_mark: 5, average: rand(3.75..5), limited: false)
Burger.create(name: "PORANEK KOJOTA", composition: "warzywa, burger 200g, bekon, sos serowy Cheddar, nachos i salsa fresca z jalapeno + sos BBQ, salsa fresca, colesław, fryty", price: 26, how_many_mark: 5, average: rand(3.75..5), limited: false)
Burger.create(name: "BYPASS CZYLI ROZJEMCA TASIEMCA", composition: "2 X BURGER 200g, podwójny ser, podwójny bekon, duszona cebula, warzywa + sos BBQ, salsa fresca, colesław, fryty", price: 35, how_many_mark: 5, average: rand(3.75..5), limited: false)
Burger.create(name: "SZPETNA HELA", composition: "warzywa, burger 200g, 4 oryginalne sery (cheddar, mimolette, dor blue, mozzarella), pesto szczypiorkowe, bekon, rukola + sos BBQ, salsa fresca, colesław, fryty ", price: 26, how_many_mark: 5, average: rand(3.75..5), limited: false)
Burger.create(name: "PONURY ŻNIWIARZ", composition: "warzywa, burger 200g, ser, chutney z chilli z zielonego i czerwonego peperoncino, piri - piri, jalapeno i habanero, bekon, roszponka + sos BBQ, salsa fresca, colesław, fryty ", price: 26, how_many_mark: 5, average: rand(3.75..5), limited: false)
Burger.create(name: "DIRTY HARRY", composition: "warzywa, burger 200g, ser, remoulada, bekon, cebula krążki + sos BBQ, salsa fresca, colesław, fryty ", price: 26, how_many_mark: 5, average: rand(3.75..5), limited: false)
Burger.create(name: "KUSZENIE GAŹDZINY", composition: "warzywa, burger 200g, oscypek, żurawina, roszponka, krążki cebulowe + sos BBQ, salsa fresca, colesław, fryty ", price: 26, how_many_mark: 5, average: rand(3.75..5), limited: false)
Burger.create(name: "GENDER BURGER", composition: "burger 200g, pulled pork, bekon, cheddar + sos BBQ, salsa fresca, colesław, fryty ", price: 26, how_many_mark: 5, average: rand(3.75..5), limited: false)
Burger.create(name: "RIB-EYE STEAK", composition: "300g steka Antrykot + sos BBQ, salsa fresca, colesław, fryty ", price: 39, how_many_mark: 5, average: rand(3.75..5), limited: false)
Burger.create(name: "TOP LION STEAK", composition: "300g steka Rostbef + sos BBQ, salsa fresca, colesław, fryty ", price: 39, how_many_mark: 5, average: rand(3.75..5), limited: false)
Burger.create(name: "SOFT TACO Z WOŁOWINĄ", composition: "3 tortille pszenne, papryka, wołowina, cebula, ser, guacamole, salsa, śmietana, fryty ", price: 21, how_many_mark: 5, average: rand(3.75..5), limited: false)
Burger.create(name: "SOFT TACO Z KUR WIELU", composition: "3 tortille pszenne, papryka, kurczak, cebula, ser, guacamole, salsa, śmietana, fryty ", price: 21, how_many_mark: 5, average: rand(3.75..5), limited: false)