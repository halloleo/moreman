.PHONY: clean build publish

build: clean
	pipenv install setuptools wheel twine
	pipenv run python  -m pip install --upgrade --quiet setuptools wheel twine
	pipenv run python setup.py --quiet sdist bdist_wheel

publish: build
	pipenv run python -m twine check dist/*
	pipenv run python -m twine upload dist/*

install: build
	pipx install moreman --spec .

clean:
	rm -r build dist *.egg-info || true
