package main

import (
	"bytes"
	"strings"
	"testing"
	"time"

	"github.com/stretchr/testify/assert"
)

func TestRender(t *testing.T) {
	nl := Newsletter{
		Number: 1,
		Date:   "2019-10-26",
		Events: []Event{
			Event{
				Name: "Code & Coffee",
				Link: "https://devict.org/codeandcoffee/01",
				Time: time.Date(2019, 10, 17, 7, 0, 0, 0, time.UTC),
			},
			Event{
				Name: "devICT Presents",
				Link: "https://devict.org/devictpresents/01",
				Time: time.Date(2019, 10, 17, 19, 0, 0, 0, time.UTC),
			},
		},
		Jobs: []Job{
			Job{
				Who:  "The Government",
				What: "Software Engineer",
				Link: "https://usa.gov",
			},
		},
		Volunteering: []Volunteering{
			Volunteering{
				Who:   "MakeICT",
				Cause: "Building things",
				Link:  "https://google.com",
				When:  "The month of October",
			},
		},
	}

	b := &bytes.Buffer{}

	err := nl.Render(b)
	assert.Nil(t, err)

	out := b.Bytes()
	expect := `
+++
title = "devICT Newsletter: 001"
date = "2019-10-26"
+++
# devICT Newsletter: 001

...

## Events

- [Code & Coffee](https://devict.org/codeandcoffee/01): Thursday, 10/17/2019 @ 7AM
- [devICT Presents](https://devict.org/devictpresents/01): Thursday, 10/17/2019 @ 7PM

## Job Postings

- [The Government: Software Engineer](https://usa.gov)

## Volunteering

- [MakeICT: Building things](https://google.com): The month of October
`

	expect = strings.TrimPrefix(expect, "\n")
	assert.Equal(t, expect, string(out))
}
