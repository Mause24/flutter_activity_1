.PHONY: dev prod build-dev build-prod fmt analyze test clean

fmt:
	dart format .

analyze:
	dart analyze

test:
	flutter test

clean:
	flutter clean

dev:
	@bash tool/env.sh dev

prod:
	@bash tool/env.sh prod

build-dev:
	@bash tool/env.sh dev build

build-prod:
	@bash tool/env.sh prod build

install-hooks:
	@echo "Instalando pre-commit hook..."
	@rm -f .git/hooks/pre-commit
	@ln -s ../../tool/pre-commit.sh .git/hooks/pre-commit
	@echo "Hook instalado!"
