SHELL = /usr/bin/env bash

_python ?= python
# for bump2version, valid options are: major, minor, patch
PART ?= patch

PANDOC = pandoc
pandocArgs = --toc -M date="`date "+%B %e, %Y"`" --wrap=none
RSTs = CHANGELOG.rst README.rst docs/example-output.rst

# Main Targets #################################################################

.PHONY: docs api html test clean

docs: $(RSTs)
	$(MAKE) html
api: docs/api/
html: dist/docs/

test:
	rm -f .coverage*
	coverage run -m pytest -vv $(PYTESTARGS) \
		tests
coverage: test
	coverage combine
	coverage report
	coverage html

clean:
	rm -f $(RSTs) .coverage*

# docs #########################################################################

README.rst: docs/README.md
	printf \
		"%s\n\n" \
		".. This is auto-generated from \`$<\`. Do not edit this file directly." \
		> $@
	cd $(<D); \
	$(PANDOC) $(pandocArgs) $(<F) -V title='naive_cookiecutter Documentation' -s -t rst \
		>> ../$@

%.rst: %.md
	printf \
		"%s\n\n" \
		".. This is auto-generated from \`$<\`. Do not edit this file directly." \
		> $@
	$(PANDOC) $(pandocArgs) $< -s -t rst >> $@

docs/api/:
	sphinx-apidoc \
		--maxdepth 6 \
		--force \
		--separate \
		--module-first \
		--implicit-namespaces \
		--doc-project API \
		--output-dir $@ src/naive_cookiecutter

dist/docs/:
	sphinx-build -E -b dirhtml docs dist/docs
	# sphinx-build -b linkcheck docs dist/docs

# maintenance ##################################################################

.PHONY: pypi pypiManual gh-pages pep8 flake8 pylint
# Deploy to PyPI
## by CI, properly git tagged
pypi:
	git push origin v0.1.0
## Manually
pypiManual:
	rm -rf dist
	poetry build
	twine upload dist/*

gh-pages:
	ghp-import --no-jekyll --push dist/docs

# check python styles
pep8:
	pycodestyle . --ignore=E501
flake8:
	flake8 . --ignore=E501
pylint:
	pylint naive_cookiecutter

print-%:
	$(info $* = $($*))

# poetry #######################################################################

setup.py:
	poetry build
	cd dist; tar -xf naive_cookiecutter-0.1.0.tar.gz naive_cookiecutter-0.1.0/setup.py
	mv dist/naive_cookiecutter-0.1.0/setup.py .
	rm -rf dist/naive_cookiecutter-0.1.0

.PHONY: editable
# since poetry doesn't support editable, we can build and extract the setup.py,
# temporary remove pyproject.toml and ask pip to install from setup.py instead.
editable: setup.py
	mv pyproject.toml .pyproject.toml
	$(_python) -m pip install --no-dependencies -e .
	mv .pyproject.toml pyproject.toml

# releasing ####################################################################

.PHONY: bump
bump:
	bump2version $(PART)
	git push --follow-tags
