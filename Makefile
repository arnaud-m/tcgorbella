JEKYLL=bundle exec jekyll
JOPTS= #--trace --verbose
DEVCONF= #--config _config.yml,_config_dev.yml

SYNC=rclone
SOPTS=-v sync

SITE=./_site/
MINIFY=gominify
MOPTS=--recursive --output ${SITE}
HTMOPTS=--html-keep-special-comments --html-keep-default-attrvals --html-keep-document-tags --html-keep-end-tags --html-keep-quotes

clean:
	rm -fr ${SITE}

serve:
	${JEKYLL} serve ${JOPTS} ${DEVCONF}

build:
	${JEKYLL} build ${JOPTS} ${DEVCONF}

minify:
	${MINIFY} ${MOPTS} ${HTMOPTS} --type html --match '*.html' -- ${SITE}
	${MINIFY} ${MOPTS} --type xml --match '*.xml' -- ${SITE}


deploy: clean build minify
	${SYNC} ${SOPTS} ${SITE} ovh:www
