* 30-Apr-2018: make moreman in the case of an *internal* error return exit status Ok (and output the error to stdout), so that Emacs shows the info. 

* 21-Dec-2017: suppress the man page header (for commands which generate their own headers. E.g. `pipenv --man`)

* for commands with man page: option for "force" moreman, i.e. `--help` processing 

* for commands with man page: recognise when a moreman option is used and switch implicitly to force mode

* handle commands which have no man page *and* no `--help` option. Here a list of them:
    - `pew` -> help at `pew` (without args)
