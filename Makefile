
deploy:
	git push origin master:gh-pages

compile:
	coffee -c -o lib/ src/

watch:
	coffee -wc -o lib/ src/
