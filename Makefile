release-dry-run:
	@uv run semantic-release -vv --noop version --print

mkdocs-serve: 
	@uv run mkdocs serve

mkdocs-build: 
	@uv run mkdocs build

sphinx-generate: 
	@uv run sphinx-apidoc -f -o docs_sphinx src/github_action_workflows

sphinx-build: 
	@uv run sphinx-build -b html docs_sphinx site/reference

docs-build: mkdocs-build sphinx-generate sphinx-build
	@echo "Both documentation builds successful."