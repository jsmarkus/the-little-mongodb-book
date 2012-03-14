en/mongodb.epub:	en/title.txt en/mongodb.markdown
	pandoc -o $@ $^

en/mongodb.mobi:	en/mongodb.epub
	kindleGen $^

ru/mongodb.epub:	ru/title.txt ru/mongodb.markdown
	pandoc -o $@ $^

ru/mongodb.mobi:	ru/mongodb.epub
	kindleGen $^
