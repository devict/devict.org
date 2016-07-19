# devict.org development

Work on the site happens in this branch.

First clone this repo and switch to the `code` branch.

Download and install Hugo from the [Hugo GitHub release page][hugo].
There are many versions of Hugo to support a wide variety of users. To
simplify things:

* On a Mac with Homebrew run `brew update && brew install hugo`
* On Windows download and unzip either `hugo_0.16_windows-32bit.zip` or
  `hugo_0.16_windows-64bit.zip`. Move `hugo.exe` to somewhere in your
  system's `PATH`.
* On some flavor of Linux you can install one of the various `.deb` or `.rpm`
  files, add one of the repos and use your package manager, or download and
  untar a file like `hugo_0.16_linux-64bit.tgz`. If you choose the download
  option you should move the binary to somewhere in your `$PATH` as just
  `hugo`.
* On any system with Go installed you can install from source with `go
  get -u -v github.com/spf13/hugo`. Note that if you use one of the
  previous options you do not need to have Go installed.

With hugo installed run `hugo server`. The site will be visible at
http://localhost:1313 with LiveReload enabled so changes will be built
and displayed instantly.

# Deployment

To publish run `./deploy.sh` which will generate the site, copy
necessary files to the `master` branch, and push to GitHub. This deploy script
probably only works on Mac and Linux but if any Windows user wanted to create a
similar script we'd be happy to have it.

Note that the `code` branch itself is not pushed so be sure to do that
when necessary.

[hugo]: https://github.com/spf13/hugo/releases "Hugo"
