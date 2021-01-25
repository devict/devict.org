# devict.org

This is the source repository for [devict.org](http://devict.org). It is built
using [Hugo][hugo].

## Contributing

A great way to contribute is to [file an issue][issues] if you notice a bug or
something that could be improved.

### Development

To modify the site itself you should fork this repository then clone the repo
locally. Create a new branch off `master` for your issue such as `fix-link`.

Download and install Hugo from the [Hugo Getting Started][hugo-release] page.
There are many versions of Hugo to support a wide variety of users. Pick the
installation steps that match your operating system. You do **not** need to have
Go installed to use Hugo.

With hugo installed run `hugo server`. The site will be visible at
http://localhost:1313 with LiveReload enabled so changes will be built
and displayed instantly.

You may also [create a GitHub Codespace][create-codespace] and run the `Hugo Build` task from the dev environment. Ports will forward automatically, so you can visit http://localhost:1313 as with other methods.

[create-codespace]: https://docs.github.com/en/free-pro-team@latest/github/developing-online-with-codespaces/creating-a-codespace "Creating a Codespace"

### Deployment

Merges/commits to the `master` branch trigger a build on [Travis CI][travis].
The build parameters are defined in `.travis.yml`. That file defines the build
environment, decrypts an SSH key for deployment (`.travis.key.enc`), installs
Hugo, then runs the script `.travis.sh`.

That script clones, builds, commits, and pushes the website to a separate
repository [devict.github.io][deploy-repo]. That repo is a "GitHub Pages" site
which serves the generated HTML content.


[hugo]: https://gohugo.io "Hugo"
[hugo-release]: https://gohugo.io/getting-started/installing/ "Hugo Installation"
[issues]: https://github.com/devict/devict.org/issues "devICT.org issues"
[travis]: https://travis-ci.org/github/devict/devict.org "Travis CI"
[deploy-repo]: https://github.com/devict/devict.github.io "deploy repository"
