default:
	@echo make init
	@echo ""
	@echo make lint
	@echo make format
	@echo ""
	@echo make run
	@echo make clean
	@echo ""
	@echo make docker-pull-arize
	@echo make docker-run-arize
	@echo make open-ui-arize
	@echo ""
	@echo make run-0
	@echo make run-server-1
	@echo make run-client-1
	@echo make run-server-2	
	@echo make run-client-2
	@echo make run-client-3
	@echo make run-server-3
	@echo make run-client-4
	@echo ""
	@echo make beeai-install
	@echo make beeai-start
	@echo make beeai-run
	@echo make beeai-run-chat
	@echo ""
	@echo make run-server-4a
	@echo make run-server-4b
	@echo make run-client-4a	
	@echo make run-client-4b
	@echo make run-client-4c
	@echo ""
	@echo make run-beeai-ui	

init:
	uv venv --python 3.11

lint:
	ruff check

format:
	ruff format

run: run-0
	
docker-pull-arize:
	docker pull arizephoenix/phoenix

docker-run-arize:
	docker run -p 6006:6006 -p 4317:4317 -i -t arizephoenix/phoenix:latest

open-ui-arize:
	open http://localhost:6006

clean:
	rm -rf ./db

run-0:
	uv run crew.py

run-server-1:
	uv run crew_agent_server.py

run-client-1:
	uv run acp_client.py

run-server-2:
	uv run smolagents_server.py

run-client-2:
	uv run hospital_workflow.py

run-client-3:
	uv run hospital_hierarchy.py

run-server-3:
	uv run smolagents_server_acp.py

run-client-4:
	uv run doctor_workflow.py

run-server-4a:
	uv run crew_agent_server_beeai.py

run-server-4b:
	uv run smolagents_server_beeai.py

beeai-install:
	uv tool install beeai-cli

beeai-start:
	beeai platform start --no-telemetry-sharing

beeai-list:
	beeai list

beeai-run-chat:
	beeai run chat "Where is Rome?"

run-client-4a:
	beeai run doctor_agent

run-client-4b:
	beeai run policy_agent

run-client-4c:
	beeai run health_agent

beeai-run-ui:
	beeai ui

beeai-stop:
	beeai platform stop
