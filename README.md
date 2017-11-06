moreman: Man Pages for Commands without Man Pages
=========

This program generates man pages for command line tools which do not come with proper separate man pages. For these tools `man` cannot display manual information, `moreman` however uses the command's help string (usually displayed via the command line option `--help`) and assembles from this a "man page".

## Overview

`moreman` is designed as a drop-in replacement for [`man`][man]. Apart from a few double-dash options `moreman` passes all arguments through to the man command it eventually calls. If `moreman` is called with a tool name for which a normal man page exists, it just passes the name through to `man`; if no normal man page exists, `moreman` assembles the man page in the described manner and then calls `man` for final formatting.

My personal use is inside [Emacs][emacs]: Emacs has a great feature [Man Page Lookup][emacs-man], which displays each man page in its own buffer/frame, so that you easily can view the domination while hacking away in a shell buffer shown in another window or frame. - With `moreman` this is extended to all commands which provide some meaningful documentation via their help message!

### A Word of Warning

`moreman` works by calling the command it wants to create the man apge for with the help option - normally `--help`. This *can* be dangerous if the command does not expect `--help` to display the help message.


## Installation

### Requirements

At least Python 2.7 or Python 3.5 plus the folwloing pacakge (preferrably installed via pip):

* [`argh`][argh]

[argh]: https://github.com/neithere/argh

### Install

1. For now install teh rqeurement and clone the repository to a llocal diretory.
2. Symlink `moreman.py` as `moreman` to a directory which is in your `PATH`.


## Usage

Test  whether every thing is set up correctly by displaying the help message:

    $ moreman --help

should give you something like

```
usage: moreman [-h] [-v] [--man-cmd MAN_CMD] [--help-arg HELP_ARG]
               name [name ...]

positional arguments:
  name                 name of the command or man page

optional arguments:
  -h, --help           show this help message and exit
  -v, --verbose        verbose output (’-v’ shadows man’s -v for version!)
                       (default: False)
  --man-cmd MAN_CMD    man command to be used (default: ’man’)
  --help-arg HELP_ARG  help argument used to generate help document (default:
                       ’--help’)

All other options are passed through to the ’man’ command
```

Now try to list the same info as a "man page":

    $ moreman moreman

Voila! This should look like a proper man pages - every man page viewer should be able to recognise this format.[^1]

[^1]: Under the hood `moreman` creates a nroff file which it passes to man and the man command used is customisable via the `--man-cmd` option. So if another man page viewer is used, this could be the place to hook in.

### Hooking up to Emacs

In order use `moreman` in Emacs, customise the Emacs variable `manual-program` (which is in the **man** group). After checking that you can access `moreman` from your shell prompt set `manual-program` to  `moreman`and everything should work fine.

## Miscellaneous 

If you have difficulties, please open an issue for it. If you have enhacments, pelase create a pull request.

Please note, this project uses another little tool I wrote: [ArghEx][arghex]

### Licensing

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

[man]: http://man7.org/linux/man-pages/man1/man.1.html
[emacs-man]: http://www.gnu.org/software/emacs/manual/html_node/emacs/Man-Page.html#Man-Page
[emacs]: http://www.gnu.org/software/emacs/
[arghex]: https://github.com/halloleo/arghex


<!--  LocalWords:  moreman nroff
 -->
