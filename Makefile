# @authors   pintoved (Pinto Veda)

TAG   	  	   		:= v2
REPOSITORY			:= eleott
IMAGE 	  	   		:= $(REPOSITORY)/eleott:$(TAG)
CONTAINER 	   		:= wndtn

PORT_CONTAINER 		:= 8080
PORT           		:= 80

DOCKERFILE_DIR 		:= src

all: stop_container delete_image build_image run_container

build_image:
	docker build -t $(IMAGE) $(DOCKERFILE_DIR)

run_container:
	docker run -it --rm --name $(CONTAINER) -p $(PORT):$(PORT_CONTAINER) $(IMAGE)

stop_container:
	-docker stop $(CONTAINER)

delete_image:
	-docker rmi $(IMAGE)

# INFORMATION
info: 
	-docker ps
	-docker ps -a
	-docker images

connection:
	-curl localhost:$(PORT)

push:
	docker push $(IMAGE)

# run: my_image
# 	docker run -d -it -p 80:81 \
# 	-v /home/student/SimpleDocker/src/nginx/nginx.conf:/etc/nginx/nginx.conf \
# 	--name Eleott \
# 	my_image:server \



