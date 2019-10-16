.PHONY: format clean build publish

format:
	black moreman/main.py

build: clean
	pipenv install setuptools wheel twine
	pipenv run python  -m pip install --upgrade --quiet setuptools wheel twine
	pipenv run python setup.py --quiet sdist bdist_wheel

publish: build
	pipenv run python -m twine check dist/*
	pipenv run python -m twine upload dist/*

install: build
	pipx install moreman --spec .

upgrade:
	pipx upgrade moreman --spec .

clean:
	rm -r build dist *.egg-info || true
