TEST_FILES=$(shell find test -name '*.rb')

run:
	REDIS_DOC=../redis-doc rackup

test:
	test -x redis-doc || git clone https://github.com/antirez/redis-doc --depth=1
	cutest $(TEST_FILES)

deploy:
	cd /srv/redis-doc && git pull
	cd /srv/redis-io  && git pull
	service redis-io-app restart

.PHONY: deploy test
