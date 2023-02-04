plan refresh init validate output:
	terraform $(@)

format:
	terraform fmt

upgrade:
	terraform init -upgrade

apply up:
	terraform apply -auto-approve

update:
	terraform get -update

clean:
	terraform apply --destroy

cost:
	@echo "["
	@echo "  .totalHourlyCost,"
	@echo "  .diffTotalHourlyCost,"
	@echo "  .totalMonthlyCost,"
	@echo "  .diffTotalMonthlyCost"
	@echo "]"

	@infracost breakdown \
		--path=. \
		--format=json | \
		jq -r '. | [.totalHourlyCost, .diffTotalHourlyCost, .totalMonthlyCost, .diffTotalMonthlyCost]'

start:
	$(PROJECT_HOME)/scripts/start-instances.sh

stop:
	$(PROJECT_HOME)/scripts/stop-instances.sh

install:
	$(PROJECT_HOME)/scripts/install.sh

list:
	$(PROJECT_HOME)/scripts/list-instances.sh
