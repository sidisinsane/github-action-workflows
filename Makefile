release-dry-run:
	@uv run semantic-release -vv --noop version --print

mkdocs-serve: 
	@uv run mkdocs serve

mkdocs-build: 
	@uv run mkdocs build