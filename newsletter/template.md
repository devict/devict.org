+++
title = "devICT Newsletter: {{.Number}}"
date = "{{.Date}}"
+++
# devICT Newsletter: {{.Number}}

...

## Events

{{range .Events}}- [{{.Name}}]({{.Link}}): {{dateFormat .Time}}{{if .SeriesID}}
  - {{.SeriesDescription}}{{end}}
{{end}}
## Job Postings

{{range .Jobs}}- [{{.Who}}: {{.What}}]({{.Link}})
{{end}}
## Volunteering

{{range .Volunteering}}- [{{.Who}}: {{.Cause}}]({{.Link}}): {{.When}}
{{end}}