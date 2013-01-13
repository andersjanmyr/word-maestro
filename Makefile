
deploy:
	git push origin master:gh-pages

compile:
	coffee -c -o lib src/*.coffee

watch:
	coffee -wc -o lib src/*.coffee
