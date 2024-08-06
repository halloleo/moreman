# TODOs

#### 6-Aug-2024

- [ ] Strip all ANSI (color) codes (if not already stripped by special handlers like  `scala -color never`). Use https://github.com/mmlb/ansi2txt/blob/main/ansi2txt.py.
      
#### 9-Feb-2024

- [ ] **Special case list:** `scala` needs `scala -color never`

#### 19-Jan-2024

- [ ] Strip (with an option?) ANSI control codes in the help output from some ommands (like `scala`). Colour escape code for example look like `[0m` (or hex `1b 5b 30 6d`).

#### 18-Jul-2018 

- [ ] Handle commands which are only reachable in particular virtualenvs or Pipenv setups. I.e. allow something like

        (cd /directory/with/pipfile; pipenv run pweave --help)

    to run. Might be not easy to include in Emacs man system.

#### 30-Apr-2018

- [ ] Make moreman in the case of an *internal* error return exit status Ok (and output the error to stdout), so that Emacs shows the info. 

#### 21-Dec-2017

- [ ] Option to suppress the man page header (for commands which generate their own headers. E.g. `pipenv --man`)

#### Earlier

- [x] ~For commands *with* man page: option to "force" moreman/`--help` processing~ 

- [ ] For commands *with* man page: recognise when a moreman option is used and switch implicitly to force mode


- [ ] **Special case list:** `pew` needs `pew` (without args)

- [ ] Handle commands which have no man page *and* no `--help` option. Use a  **Special case list.** *This might need a config file for these special cases)
