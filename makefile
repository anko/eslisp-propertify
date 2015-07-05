export PATH := node_modules/.bin:$(PATH)

all: index.js

index.js: index.esl
	eslc < $< > $@

test.js: test.esl
	eslc < $< > $@

test: index.js test.js
	node test.js

clean:
	rm -f index.js test.js

.PHONY: all test clean
