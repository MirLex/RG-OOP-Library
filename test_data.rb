def createTestData
	authors = []
	authors << gregoryTBrown 	= Author.new('Gregory T Brown','Gregory Brown has run the independently published Practicing Ruby journal since 2010, and is the original author of the popular Prawn PDF generation library')
	authors << daveThomas 		= Author.new('Dave Thomas','wrote The Pragmatic Programmer with Andy Hunt at the end of the 90s, and that experience opened a new world for us. We discovered a love of writing that complemented our love of learning new things.')
	authors << davidFlanagan 	= Author.new('David Flanagan','David Flanagan is a computer programmer who has spent much of the last 20 years writing books about programming languages. He now works at Mozilla. David lives with his wife and children in the Pacific Northwest, between the cities of Seattle and Vancouver.')
	authors << georgeOrwell 	= Author.new('George Orwell','was born in India and served with the Imperial Police in Burma before joining the Republican Army in the Spanish Civil War. Orwell was the author of six novels as well as numerous essays and nonfiction works.')
	authors << rayBradbury 		= Author.new('Ray Bradbury','In a career spanning more than seventy years, Ray Bradbury, who died on June 5, 2012, at the age of 91, inspired generations of readers to dream, think, and create.')
	authors << chuckPalahniuk 	= Author.new('Chuck Palahniuk','Chuck Palahniuks novels are the bestselling Fight Club, which was made into a film by director David Fincher, Diary, Lullaby, Survivor, Haunted, and Invisible Monsters. Portions of Choke have appeared in Playboy, and Palahniuks nonfiction work has been published by Gear, Black Book, The Stranger, and the Los Angeles Times')

	readers = []
	readers << deborahBlack 	= Reader.new('Deborah Black', 'DeborahJBlack@armyspy.com', 'Pittsburgh', 'Eagle Street', '316')
	readers << annaDay 			= Reader.new('Anna Day', 'AnnaDDay@armyspy.com', 'Newark', 'Lakewood Drive', '1094')
	readers << dorisVergara 	= Reader.new('Doris Vergara', 'DorisRVergara@dayrep.com', 'Asheville', 'McVaney Road', '1199')
	readers << timothyConley 	= Reader.new('Timothy Conley', 'TimothyMConley@teleworm.us', 'Boston', 'Randolph Street', '4042')
	readers << haroldRay 		= Reader.new('Harold Ray', 'HaroldBRay@dayrep.com', 'Middleboro', 'Lyon Avenue', '4625')
	readers << marvinDuran 		= Reader.new('Marvin Duran', 'MarvinPDuran@armyspy.com', 'Jupiter', 'Wyatt Street', '91')

	books = []
	books << rubyBestPractices 	= Book.new('Ruby Best Practices',gregoryTBrown)
	books << programmingRuby 	= Book.new('Programming Ruby',daveThomas)
	books << thePragmaticProg 	= Book.new('The Pragmatic Programmer',daveThomas)
	books << theRubyProgLang 	= Book.new('The Ruby Programming Language',davidFlanagan)
	books << fahrenheit 		= Book.new('Fahrenheit 451',georgeOrwell)
	books << nineteenEightyFou 	= Book.new('1984',rayBradbury)
	books << dandelionWine 		= Book.new('Dandelion Wine',rayBradbury)
	books << fightClub 			= Book.new('Fight Club',chuckPalahniuk)

	orders = []
	orders << order01 = Order.new(rubyBestPractices, deborahBlack)
	orders << order02 = Order.new(programmingRuby, deborahBlack)
	orders << order03 = Order.new(nineteenEightyFou, deborahBlack)
	orders << order04 = Order.new(thePragmaticProg, annaDay)
	orders << order05 = Order.new(theRubyProgLang, dorisVergara)
	orders << order06 = Order.new(fahrenheit, dorisVergara)
	orders << order07 = Order.new(fightClub, timothyConley)
	orders << order08 = Order.new(rubyBestPractices, haroldRay)
	orders << order09 = Order.new(dandelionWine, haroldRay)
	orders << order10 = Order.new(fightClub, marvinDuran)
	orders << order11 = Order.new(nineteenEightyFou, marvinDuran)
	orders << order12 = Order.new(rubyBestPractices, marvinDuran)

	library = Library.new(books, orders, readers, authors)
	library.export('./data/library.dat', 'serialize')
	library.export('./data/library.yaml')
end