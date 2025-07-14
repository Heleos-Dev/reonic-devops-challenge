.PHONY: all build push clean

AWS_ACCOUNT_ID := 378753314729
AWS_REGION := us-east-1
REPO := helloworld

all: build

build:
	docker buildx build --platform linux/amd64 -t $(REPO) --load  .

push:
	docker tag $(REPO):latest $(AWS_ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com/$(REPO):latest
	docker push $(AWS_ACCOUNT_ID).dkr.ecr.$(AWS_REGION).amazonaws.com/$(REPO):latest

clean:
	-docker rmi $(REPO):latest
