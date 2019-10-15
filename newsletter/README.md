# devICT Newsletter Tool

This little utility creates a newsletter shell by pulling data from a few sources and putting it into a new markdown file. The output file will be the latest newsletter number + 1. Currently the data sources are..

- Events from the Meetup API
- Job postings from the Google Form Responses sheet
- Volunteering opportunities, also from a Google Form sheet

After creating a new newsletter with this data pulled, the rest of the content needs to be added manually.

## Usage

```
$ go mod download
$ go run .
```