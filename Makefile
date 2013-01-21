
default:
	@echo "deploy: 	Deploy to Github"
	@echo "compile: 	Compile coffeescript and sass"
	@echo "watch-coffee: 	Watch coffeescript"
	@echo "watch-sass: 	Watch sass"

deploy:
	git push origin master:gh-pages

compile:
	coffee -c -o lib/ src/
	sass --update sass:css

watch-coffee:
	coffee -wc -o lib/ src/

watch-sass:
	sass --watch sass:css

