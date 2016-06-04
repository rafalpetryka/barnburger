# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

News.delete_all
News.create(text_with_link: "24, 25 i 26 grudnia Barn Burger będzie zamknięty", text: "24, 25 i 26 grudnia Barn Burger będzie zamknięty", date: DateTime.now-5.days)
News.create(text_with_link: "<a href='https://www.facebook.com/BarnBurger/photos/a.441810219170805.104287.431519026866591/907029125982243/?type=1'>6 stycznia</a> Barn będzie nieczynny", text: "<a href='https://www.facebook.com/BarnBurger/photos/a.441810219170805.104287.431519026866591/907029125982243/?type=1'>6 stycznia</a> Barn będzie nieczynny", date: DateTime.now-4.days)
News.create(text_with_link: "Od jutra (8 stycznia) dwa nowe limitowane burgery! Zobacz ich skład w zakładce <a href='#menu'>Menu</a>", text: "Od jutra (8 stycznia) dwa nowe limitowane burgery! Zobacz ich skład w zakładce <a href='#menu'>Menu</a>", date: DateTime.now-2.days)
News.create(text_with_link: "Nowa limitowana edycja od 29 stycznia. Zobacz <a href='#menu'>Menu</a>", text: "Nowa limitowana edycja od 29 stycznia. Zobacz <a href='#menu'>Menu</a>", date: DateTime.now-1.days)
News.create(text_with_link: "<a href='http://facebook.com/BarnBurger/photos/p.937853186233170/937853186233170/'>Dwa nowe limitowane burgery</a> już od 3 marca. Więcej w <a href='#menu'>menu</a>",text: "<a href='http://facebook.com/BarnBurger/photos/p.937853186233170/937853186233170/'>Dwa nowe limitowane burgery</a> już od 3 marca. Więcej w <a href='#menu'>menu</a>", date: DateTime.now)

LimitedBurger.delete_all
LimitedBurger.create(date: DateTime.now, date_on_website: Date.today, name1: "7 SINS", composition1: "burger 200g, cheddar, crack bacon (karmelizowany bekon z pieprzem), sos z musztardy francuskiej i czosnkiem niedźwiedzim, biała cebulka, sałata + sos BBQ, salsa fresca, colesław, fryty", name2: "GARBATO MAFIO", composition2: "burger 200g, ser, bekon, pastrami wołowe, papryka pieczona w balsamico, cebula czerwona, rukola, suszone pomidory, sałata + sos BBQ, salsa fresca, colesław, fryty", price1: 26, price2: 26, how_many_mark1: 5, average1: rand(3.75..5), how_many_mark2: 5, average2: rand(3.75..5))

Burger.delete_all
Burger.create(name: "NAGI INSTYNKT", composition: "warzywa, burger 200g + sos BBQ, salsa fresca, colesław, fryty", price: 19, how_many_mark: 5, average: rand(3.75..5), limited: false)
Burger.create(name: "SIR BURGER", composition: "warzywa, burger 200g, ser + sos BBQ, salsa fresca, colesław, fryty", price: 21, how_many_mark: 5, average: rand(3.75..5), limited: false)
Burger.create(name: "MUPPET BURGER", composition: "warzywa, burger 200g, ser, jalapeno, bekon + sos BBQ, salsa fresca, colesław, fryty", price: 23, how_many_mark: 5, average: rand(3.75..5), limited: false)
Burger.create(name: "HEART ATTACK", composition: "warzywa, burger 200g, podwójny bekon, podwójny ser, chipsy + sos BBQ, salsa fresca, colesław, fryty", price: 26, how_many_mark: 5, average: rand(3.75..5), limited: false)
Burger.create(name: "SEX & VIOLENCE", composition: "warzywa, burger 200g, rukola, mascarpone ziołowe, bekon, ser + sos BBQ, salsa fresca, colesław, fryty", price: 26, how_many_mark: 5, average: rand(3.75..5), limited: false)
Burger.create(name: "MAMAS, PAPAS & DUPAS BLADAS", composition: "warzywa, burger 200g, ser, bekon, kiełbaska chorizo, guacamole + sos BBQ, colesław, fryty", price: 26, how_many_mark: 5, average: rand(3.75..5), limited: false)
Burger.create(name: "SEKRET ZDZICHA", composition: "warzywa, burger 200g, ser, jajko sadzone, szpinak, bekon, sos holenderski + sos BBQ, salsa fresca, colesław, fryty", price: 26, how_many_mark: 5, average: rand(3.75..5), limited: false)
Burger.create(name: "POPEYE BURGER", composition: "warzywa, ser z grilla, szpinak, chleb orkiszowy, ser + sos BBQ, salsa fresca, colesław, fryty", price: 21, how_many_mark: 5, average: rand(3.75..5), limited: false)
Burger.create(name: "PORANEK KOJOTA", composition: "warzywa, burger 200g, bekon, sos serowy Cheddar, nachos i salsa fresca z jalapeno + sos BBQ, salsa fresca, colesław, fryty", price: 26, how_many_mark: 5, average: rand(3.75..5), limited: false)
Burger.create(name: "BYPASS CZYLI ROZJEMCA TASIEMCA", composition: "2 X BURGER 200g, podwójny ser, podwójny bekon, duszona cebula, warzywa + sos BBQ, salsa fresca, colesław, fryty", price: 35, how_many_mark: 5, average: rand(3.75..5), limited: false)
Burger.create(name: "SZPETNA HELA", composition: "warzywa, burger 200g, 4 oryginalne sery (cheddar, mimolette, dor blue, mozzarella), pesto szczypiorkowe, bekon, rukola + sos BBQ, salsa fresca, colesław, fryty", price: 26, how_many_mark: 5, average: rand(3.75..5), limited: false)
Burger.create(name: "PONURY ŻNIWIARZ", composition: "warzywa, burger 200g, ser, chutney z chilli z zielonego i czerwonego peperoncino, piri - piri, jalapeno i habanero, bekon, roszponka + sos BBQ, salsa fresca, colesław, fryty", price: 26, how_many_mark: 5, average: rand(3.75..5), limited: false)
Burger.create(name: "DIRTY HARRY", composition: "warzywa, burger 200g, ser, remoulada, bekon, cebula krążki + sos BBQ, salsa fresca, colesław, fryty", price: 26, how_many_mark: 5, average: rand(3.75..5), limited: false)
Burger.create(name: "KUSZENIE GAŹDZINY", composition: "warzywa, burger 200g, oscypek, żurawina, roszponka, krążki cebulowe + sos BBQ, salsa fresca, colesław, fryty", price: 26, how_many_mark: 5, average: rand(3.75..5), limited: false)
Burger.create(name: "GENDER BURGER", composition: "burger 200g, pulled pork, bekon, cheddar + sos BBQ, salsa fresca, colesław, fryty", price: 26, how_many_mark: 5, average: rand(3.75..5), limited: false)
Burger.create(name: "RIB-EYE STEAK", composition: "300g steka Antrykot + sos BBQ, salsa fresca, colesław, fryty", price: 39, how_many_mark: 5, average: rand(3.75..5), limited: false)
Burger.create(name: "TOP LION STEAK", composition: "300g steka Rostbef + sos BBQ, salsa fresca, colesław, fryty", price: 39, how_many_mark: 5, average: rand(3.75..5), limited: false)
Burger.create(name: "SOFT TACO Z WOŁOWINĄ", composition: "3 tortille pszenne, papryka, wołowina, cebula, ser, guacamole, salsa, śmietana, fryty", price: 21, how_many_mark: 5, average: rand(3.75..5), limited: false)
Burger.create(name: "SOFT TACO Z KUR WIELU", composition: "3 tortille pszenne, papryka, kurczak, cebula, ser, guacamole, salsa, śmietana, fryty", price: 21, how_many_mark: 5, average: rand(3.75..5), limited: false)

EnglishNews.delete_all
EnglishNews.create(text_with_link: "<a href='http://facebook.com/BarnBurger/photos/p.937853186233170/937853186233170/'>Two new limited burgers</a> from 3rd March. See more on the <a href='#menu'>menu</a>", text: "<a href='http://facebook.com/BarnBurger/photos/p.937853186233170/937853186233170/'>Two new limited burgers</a> from 3rd March. See more on the <a href='#menu'>menu</a>", date: DateTime.now-5.days)
EnglishNews.create(text_with_link: "29th January we welcome to the new Limited Burgers - check out the burgers in <a href='#menu'>Menu</a> bookmark", text: "29th January we welcome to the new Limited Burgers - check out the burgers in <a href='#menu'>Menu</a> bookmark", date: DateTime.now-4.days)
EnglishNews.create(text_with_link: "Tomorrow (8th January) we welcome to new <a href='#menu'>LIMITED EDITION :)</a>", text: "Tomorrow (8th January) we welcome to new <a href='#menu'>LIMITED EDITION :)</a>", date: DateTime.now-3.days)
EnglishNews.create(text_with_link: "January 6th Barn Burger will be closed", text: "January 6th Barn Burger will be closed", date: DateTime.now-2.days)

EnglishLimitedBurger.delete_all
EnglishLimitedBurger.create(date: DateTime.now, date_on_website: Date.today, name1: "AL ADIN AHMED WISIMULAHA", composition1: "200 g/0.44 lb ground beef, hummus, roasted peppers and eggplant, cucumber, red onion, rocket salad + homemade fries, coleslaw, salsa fresca and BBQ sauce", name2: "ŻETEN", composition2: "200 g/0.44 lb ground beef, cheese, breaded camembert, peach sauce with green pepper, corn salad, roasted almonds, red onion, vegetables + homemade fries, coleslaw, salsa fresca and BBQ sauce", price1: 26, price2: 26, how_many_mark1: 5, average1: rand(3.75..5), how_many_mark2: 5, average2: rand(3.75..5))

EnglishBurger.delete_all
EnglishBurger.create(name: "NAGI INSTYNKT", composition: "200 g/0.44 lb ground beef, vegetables + homemade fries, coleslaw, salsa fresca and BBQ sauce", price: 19, how_many_mark: 5, average: rand(3.75..5), limited: false)
EnglishBurger.create(name: "SIR BURGER", composition: "200 g/0.44 lb ground beef, cheese, vegetables + homemade fries, coleslaw, salsa fresca and BBQ sauce", price: 21, how_many_mark: 5, average: rand(3.75..5), limited: false)
EnglishBurger.create(name: "MUPPET BURGER", composition: "200 g/0.44 lb ground beef, cheese, bacon, jalapeno peppers, vegetables + homemade fries, coleslaw, salsa fresca and BBQ sauce", price: 23, how_many_mark: 5, average: rand(3.75..5), limited: false)
EnglishBurger.create(name: "HEART ATTACK", composition: "200 g/0.44 lb ground beef, double cheese, double bacon, crisps, vegetables + homemade fries, coleslaw, salsa fresca and BBQ sauce", price: 26, how_many_mark: 5, average: rand(3.75..5), limited: false)
EnglishBurger.create(name: "SEX & VIOLENCE", composition: "200 g/0.44 lb ground beef, cheese, mascarpone with herbs, bacon, rocket salad, vegetables + homemade fries, coleslaw, salsa fresca and BBQ sauce", price: 26, how_many_mark: 5, average: rand(3.75..5), limited: false)
EnglishBurger.create(name: "MAMAS, PAPAS & DUPAS BLADAS", composition: "200 g/0.44 lb ground beef, cheese, bacon, chorizo sausage, guacamole, vegetables + homemade fries, coleslaw, salsa fresca and BBQ sauce", price: 26, how_many_mark: 5, average: rand(3.75..5), limited: false)
EnglishBurger.create(name: "SEKRET ZDZICHA", composition: "200 g/0.44 lb ground beef, cheese, bacon, sunny-side up, sauteed spinach, hollandaise sauce, vegetables + homemade fries, coleslaw, salsa fresca and BBQ sauce", price: 26, how_many_mark: 5, average: rand(3.75..5), limited: false)
EnglishBurger.create(name: "POPEYE BURGER", composition: "150 g/0.33 lb grilled cheese, sauteed spinach, vegetables, cheese, spelt bread + homemade fries, coleslaw, salsa fresca and BBQ sauce", price: 21, how_many_mark: 5, average: rand(3.75..5), limited: false)
EnglishBurger.create(name: "PORANEK KOJOTA", composition: "150 g/0.33 lb grilled cheese, sauteed spinach, vegetables, cheese, spelt bread + homemade fries, coleslaw, salsa fresca and BBQ sauce", price: 26, how_many_mark: 5, average: rand(3.75..5), limited: false)
EnglishBurger.create(name: "BYPASS CZYLI ROZJEMCA TASIEMCA", composition: "2x 200 g/2x 0,44 lb ground beef, quadruple cheese, quadruple bacon, caramelized onion, vegetables + homemade fries, coleslaw, salsa fresca and BBQ sauce", price: 35, how_many_mark: 5, average: rand(3.75..5), limited: false)
EnglishBurger.create(name: "SZPETNA HELA", composition: "200 g/0.44 lb ground beef, four kind of cheese (cheddar, mimolette, dor blue, mozzarella), bacon, chive pesto, rocket salad, vegetables + homemade fries, coleslaw, salsa fresca and BBQ sauce", price: 26, how_many_mark: 5, average: rand(3.75..5), limited: false)
EnglishBurger.create(name: "PONURY ŻNIWIARZ", composition: "200 g/0.44 lb ground beef, cheese, hot chilli chutney, piri-piri, jalapeno, habanero, corn salad, bacon, vegetables + homemade fries, coleslaw, salsa fresca and BBQ sauce", price: 26, how_many_mark: 5, average: rand(3.75..5), limited: false)
EnglishBurger.create(name: "DIRTY HARRY", composition: "200 g/0.44 lb ground beef, cheese, bacon, onion rings, remoulade, vegetables + homemade fries, coleslaw, salsa fresca and BBQ sauce", price: 26, how_many_mark: 5, average: rand(3.75..5), limited: false)
EnglishBurger.create(name: "KUSZENIE GAŹDZINY", composition: "200 g/0.44 lb ground beef, cheese, onion rings, traditional Polish smoked sheep cheese ‘Oscypek’, cranberry sauce, corn salad, vegetables + homemade fries, coleslaw, salsa fresca and BBQ sauce", price: 26, how_many_mark: 5, average: rand(3.75..5), limited: false)
EnglishBurger.create(name: "GENDER BURGER", composition: "200 g/0.44 lb ground beef, cheddar, bacon, pulled pork + homemade fries, coleslaw, salsa fresca and BBQ sauce", price: 26, how_many_mark: 5, average: rand(3.75..5), limited: false)
EnglishBurger.create(name: "RIB-EYE STEAK", composition: "300 gr/0.66 lb entrecote steak + homemade fries, coleslaw, salsa fresca and BBQ sauce", price: 39, how_many_mark: 5, average: rand(3.75..5), limited: false)
EnglishBurger.create(name: "TOP LION STEAK", composition: "300 gr/0.66 lb roast beef steak + homemade fries, coleslaw, salsa fresca and BBQ sauce", price: 39, how_many_mark: 5, average: rand(3.75..5), limited: false)
EnglishBurger.create(name: "SOFT TACO Z WOŁOWINĄ", composition: "3 wheat tortillas, beef, vegetables, pepper, onion, cheese, guacamole, salsa fresca, cream, homemade fries", price: 21, how_many_mark: 5, average: rand(3.75..5), limited: false)
EnglishBurger.create(name: "SOFT TACO Z KUR WIELU", composition: "3 wheat tortillas, chicken, vegetables, pepper, onion, cheese, guacamole, salsa fresca, cream, homemade fries", price: 21, how_many_mark: 5, average: rand(3.75..5), limited: false)

OpeningHour.delete_all
OpeningHour.create(place: 'zlota', monday: [1200, 2200, 2130], tuesday: [1200, 2200, 2130], wednesday: [1200, 2200, 2130], thursday: [1200, 2200, 2130], friday: [1200, 2200, 2130], saturday: [1300, 2200, 2130], sunday: [1300, 2100, 2030])
OpeningHour.create(place: 'zgoda', monday: [1200, 2200, 2130], tuesday: [1200, 2200, 2130], wednesday: [1200, 2200, 2130], thursday: [1200, 2200, 2130], friday: [1200, 2200, 2130], saturday: [1300, 2200, 2130], sunday: [1300, 2100, 2030])
