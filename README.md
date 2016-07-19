# devict.org development

Work on the site happens in this branch.

Download and install [Hugo][hugo] then run `hugo server`. The site will be
visible at http://localhost:1313 with LiveReload enabled so changes will be
built and displayed instantly.

To publish run `./deploy.sh` which will generate the site, copy necessary files
to the `master` branch, and push to GitHub.

[hugo] https://gohugo.io "Hugo"
