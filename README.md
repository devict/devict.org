**Our website now lives in the [devict/website](https://github.com/devict/website) repo!**

---

# devict.org

This is the source repository for [devict.org](http://devict.org). It is built using [Lume][lume], which is powered by [Deno][deno].

## Contributing

A great way to contribute is to [file an issue][issues] if you notice a bug or something that could be improved. Note that the [devICT Code of Conduct](https://devict.org/conduct) applies to collaboration in this space.

To modify the site itself you should fork this repo then clone your fork locally. Create a new branch off `main` for your issue such as `fix-link`. When your changes are ready, push up your branch to your fork and submit a PR to this repo for review.

## Local development

### Set up your IDE

- VSCode: install the recommended extensions (cmd+shift+p -> "show recommended extensions")
- Otherwise, [deno has docs on setting up other IDEs][deno-ide-setup]

### Install and run

- [Install deno][deno-install]
- `deno task cache` to install dependencies
- `deno task serve` to serve the site
- Visit http://localhost:3000

### Make changes

- Site config is stored at `_config.ts`, [here is a reference to available options](https://lume.land/docs/advanced/cheatsheet/).
- Page files are stored in the root directory, and are generally `md` files.
  - `index.md`, `about.md`, etc.
  - Just about any other extension works too (`njk`, or `js` for example).
    - [Additional format support](https://lume.land/docs/getting-started/page-formats/) can be added with plugins.
- Global data variables are in `_data.json`.
  - These values can be overridden in individual pages with [frontmatter](https://lume.land/docs/getting-started/page-data/).
  - Here is more information on [page data](https://lume.land/docs/getting-started/shared-data/).
- Static assets are stored in `static`.


## Deployment

This repo is deployed to [Netlify][netlify]. Commits to the `main` branch are autodeployed there. Our netlify deploy configuration is stored in repo at `netlify.toml`.

[lume]: https://lume.land "Lume"
[deno]: https://deno.land "Deno"
[netlify]: https://netlify.com "Netlify"
[issues]: https://github.com/devict/devict.org/issues "devICT.org issues"
[deno-ide-setup]: https://docs.deno.com/runtime/manual/getting_started/setup_your_environment#using-an-editoride "Deno IDE setup"
[deno-install]: https://docs.deno.com/runtime/manual/getting_started/installation "Install Deno"
