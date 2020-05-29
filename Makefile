SHELL:=/bin/bash
TERRAFORM_VERSION=0.12.24
TERRAFORM=docker run --rm -v "${PWD}:/work" -v "${HOME}:/root" -e AWS_DEFAULT_REGION=$(AWS_DEFAULT_REGION) -e http_proxy=$(http_proxy) --net=host -w /work hashicorp/terraform:$(TERRAFORM_VERSION)

.PHONY: all clean test docs format

all: test docs format

clean:
	rm -rf .terraform/

test:
	$(TERRAFORM) init && $(TERRAFORM) validate && \
		$(TERRAFORM) init modules/codecommit && $(TERRAFORM) validate modules/codecommit
		$(TERRAFORM) init modules/codecommit && $(TERRAFORM) validate modules/scheduled

docs:
	docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./ >./README.md && \
		docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./modules/codecommit >./modules/codecommit/README.md
		docker run --rm -v "${PWD}:/work" tmknom/terraform-docs markdown ./modules/scheduled >./modules/scheduled/README.md

format:
	$(TERRAFORM) fmt -list=true ./ && \
		$(TERRAFORM) fmt -list=true ./modules/codecommit
		$(TERRAFORM) fmt -list=true ./modules/scheduled
