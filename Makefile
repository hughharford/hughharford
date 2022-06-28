# ----------------------------------
#          INSTALL & TEST
# ----------------------------------
install_requirements:
	@pip install -r requirements.txt

check_code:
	@flake8 scripts/* hughharford/*.py

black:
	@black scripts/* hughharford/*.py

test:
	@coverage run -m pytest tests/*.py
	@coverage report -m --omit="${VIRTUAL_ENV}/lib/python*"

ftest:
	@Write me

clean:
	@rm -f */version.txt
	@rm -f .coverage
	@rm -fr */__pycache__ */*.pyc __pycache__
	@rm -fr build dist
	@rm -fr hughharford-*.dist-info
	@rm -fr hughharford.egg-info

install:
	@pip install . -U

all: clean install test black check_code

streamlit:
	@streamlit run hughharford/app.py

# --server.port 8000
