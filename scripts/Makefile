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

start stop reboot:
	$(PROJECT_HOME)/scripts/$(@)-instances.sh

list:
	$(PROJECT_HOME)/scripts/$(@)-instances.sh | tee /tmp/instances.txt

install:
	$(PROJECT_HOME)/scripts/install.sh

traffic: list
	scp /tmp/instances.txt $(PROJECT_HOME)/scripts/apache-bench.sh \
		$(shell tail -n 1 /tmp/instances.txt):~
	ssh $(shell tail -n 1 /tmp/instances.txt) 'nohup bash ~/apache-bench.sh ~/instances.txt > ~/log.txt 2>&1 &'
