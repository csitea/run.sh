.PHONY: do-generate-config-for-step ## @-> 02.01 generate the conf for the steps
do-generate-config-for-step: demand_var-ENV  demand_var-ORG demand_var-APP demand_var-STEP
	docker exec con-$(ORG)-$(APP)-conf-validator /bin/bash -c 'set -e; cd $(APP_PATH)/$(ORG)-$(APP)-cnf/src/python/conf-validator && poetry run validate $(APP_PATH)/$(ORG)-$(APP)-cnf/$(ORG)-$(APP)/$(ENV).env.yaml $(ENV)' || { echo "Validation failed, stopping"; exit 1; }
	docker exec -e ORG=$(ORG) -e APP=$(APP) -e ENV=$(ENV) -e STEP=$(STEP) -e DATA_KEY_PATH='.env.steps["$(STEP)"]' -e TPL_SRC=$(APP_PATH)/$(ORG)-$(APP)-cnf/src/tpl/%org%-%app%/%env%/tf/$(STEP)*.tpl -e CNF_SRC=$(APP_PATH)/$(ORG)-$(APP)-cnf/$(ORG)-$(APP)/$(ENV).env.yaml -e TGT=$(APP_PATH)/$(ORG)-$(APP)-cnf con-$(ORG)-$(APP)-tpl-gen /bin/bash -c 'cd $(UTL_PROJ_PATH) && make tpl-gen'
#docker exec -e ORG=$(ORG) -e APP=$(APP) -e ENV=$(ENV) -e STEP=$(STEP) -e DATA_KEY_PATH='.env.steps["$(STEP)"]' -e SRC=$(APP_PATH)/$(ORG)-$(APP)-inf/src/tpl/src/terraform/$(STEP)-remote-bucket/*.tpl -e CNF_SRC=$(APP_PATH)/$(ORG)-$(APP)-cnf/$(ORG)-$(APP)/$(ENV).env.yaml -e TGT=$(APP_PATH)/$(ORG)-$(APP)-inf con-$(ORG)-$(APP)-tpl-gen /bin/bash -c 'cd $(UTL_PROJ_PATH) && make tpl-gen'
#docker exec -e ORG=$(ORG) -e APP=$(APP) -e ENV=$(ENV) -e STEP=$(STEP) -e DATA_KEY_PATH='.env.steps["$(STEP)"]' -e SRC=$(APP_PATH)/$(ORG)-$(APP)-inf/src/tpl/src/terraform/$(STEP)-remote-bucket/*.tpl -e CNF_SRC=$(APP_PATH)/$(ORG)-$(APP)-cnf/$(APP)/$(ENV)/050-wireguard/peers.yaml -e TGT=$(APP_PATH)/$(ORG)-$(APP)-inf con-$(ORG)-$(APP)-tpl-gen /bin/bash -c 'cd $(UTL_PROJ_PATH) && make convert-yaml-to-json'