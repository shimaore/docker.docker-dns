NAME=shimaore/docker-dns

image:
	docker build -t ${NAME} .

image-no-cache:
	docker build --no-cache -t ${NAME} .

test:
	cd test && for test in ./*.sh; do "$test"; done

push: image
	docker push ${NAME}
