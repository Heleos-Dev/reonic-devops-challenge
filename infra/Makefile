.PHONY: all init plan apply destroy clean

TF_PLAN := tf.plan
VARS := reonic.tfvars

all: apply

apply: $(TF_PLAN)
	terraform apply -auto-approve -no-color $(TF_PLAN)

$(TF_PLAN): plan

plan: init
	terraform plan -var-file=$(VARS) -out=$(TF_PLAN)

init:
	terraform init

destroy:
	terraform destroy -auto-approve -var-file=$(VARS)

clean: destroy
	rm -f $(TF_PLAN)
