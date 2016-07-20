# devict.org

This is the source repository for [devict.org](http://devict.org). It is built
using [Hugo][hugo].

## Contributing

A great way to contribute is to [file an issue][issues] if you notice a bug or
something that could be improved.

### Development

To modify the site itself you should fork this repository then clone the repo
locally. Create a new branch off `master` for your issue such as `fix-link`.

Download and install Hugo from the [Hugo GitHub release page][hugo-release].
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

[hugo]: https://gohugo.io "Hugo"
[hugo-release]: https://github.com/spf13/hugo/releases "Hugo Releases"
[issues]: https://github.com/devict/devict.org/issues "devICT.org issues"
