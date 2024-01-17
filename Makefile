JEKYLL=bundle exec jekyll
JOPTS= #--trace --verbose
DEVCONF= #--config _config.yml,_config_dev.yml

SYNC=rclone
SYNCONF=-v sync

serve:
	${JEKYLL} serve ${JOPTS} ${DEVCONF}

draft:
	${JEKYLL} serve ${JOPTS} ${DEVCONF} --draft --future

build:
	${JEKYLL} build ${JOPTS} ${DEVCONF}

deploy: build
	${SYNC} ${SYNCONF} _site ovh:www

clean:
	rm -fr _site/
