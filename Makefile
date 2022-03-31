SHELL:=/bin/bash
include .env

EXAMPLE=$(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))
VERSION=$(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))

.PHONY: all clean validate test diagram docs format release

all: test docs format

clean:
	rm -rf .terraform/

validate:
	$(TERRAFORM) init -upgrade && $(TERRAFORM) validate && \
		$(TERRAFORM) -chdir=modules/codecommit init -upgrade && $(TERRAFORM) -chdir=modules/codecommit validate && \
		$(TERRAFORM) -chdir=modules/health init -upgrade && $(TERRAFORM) -chdir=modules/health validate

test: validate
	$(CHECKOV) -d /work
	$(TFSEC) /work

diagram:
	$(DIAGRAMS) diagram.py

docs: diagram
	$(TERRAFORM_DOCS) markdown ./ >./README.md && \
		$(TERRAFORM_DOCS) markdown ./modules/codecommit >./modules/codecommit/README.md && \
		$(TERRAFORM_DOCS) markdown ./modules/health >./modules/health/README.md

format:
	$(TERRAFORM) fmt -list=true ./ && \
		$(TERRAFORM) fmt -list=true ./modules/codecommit && \
		$(TERRAFORM) fmt -list=true ./modules/health

example:
	$(TERRAFORM) -chdir=examples/$(EXAMPLE) init -upgrade && $(TERRAFORM) -chdir=examples/$(EXAMPLE) plan -input=false

release: test
	git tag $(VERSION) && git push --tags
