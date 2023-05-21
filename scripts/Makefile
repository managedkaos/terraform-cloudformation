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

start stop reboot describe:
	$(PROJECT_HOME)/scripts/$(@)-instances.sh

list:
	$(PROJECT_HOME)/scripts/$(@)-instances.sh | tee /tmp/servers.txt

install:
	$(PROJECT_HOME)/scripts/install.sh

traffic: list
	scp /tmp/servers.txt $(PROJECT_HOME)/scripts/{apache-bench,spider}.sh \
		$(shell tail -n 1 /tmp/servers.txt):~
	ssh $(shell tail -n 1 /tmp/servers.txt) 'nohup bash ~/apache-bench.sh ~/servers.txt > ~/apache-bench-log.txt 2>&1 &'
	ssh $(shell tail -n 1 /tmp/servers.txt) 'nohup bash ~/spider.sh ~/servers.txt > ~/spider-log.txt 2>&1 &'

load-runnr:
	cp stress.sh apache-bench.sh spider.sh load-runnr.sh ~/Google_Drive/Workspace/load-runnr
