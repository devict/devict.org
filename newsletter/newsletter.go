package main

import (
	"fmt"
	"io"
	"text/template"
	"time"

	"github.com/pkg/errors"
)

var (
	meetupURL       = "https://api.meetup.com/2/events?&sign=true&photo-host=public&group_urlname=devICT&limited_events=false&fields=series&status=upcoming&page=20"
	jobsURL         = ""
	volunteeringURL = ""
)

// Newsletter is the main data structure we're building here.
type Newsletter struct {
	Number       int
	Events       []Event
	Jobs         []Job
	Volunteering []Volunteering
}

// LoadData pulls all the necessary data for the Newsletter.
func (nl Newsletter) LoadData() error {
	err := nl.loadEvents()
	if err != nil {
		return err
	}
	err = nl.loadJobs()
	if err != nil {
		return err
	}
	err = nl.loadVolunteering()
	if err != nil {
		return err
	}
	return nil
}

func (nl Newsletter) loadEvents() error {
	events, err := EventsFromMeetup(meetupURL)
	if err != nil {
		return err
	}
	nl.Events = events
	return nil
}

func (nl Newsletter) loadJobs() error {
	jobs, err := JobsFromGoogleSheet(jobsURL)
	if err != nil {
		return err
	}
	nl.Jobs = jobs
	return nil
}

func (nl Newsletter) loadVolunteering() error {
	volunteering, err := VolunteeringFromGoogleSheet(volunteeringURL)
	if err != nil {
		return err
	}
	nl.Volunteering = volunteering
	return nil
}

type templateData struct {
	Number       string
	Events       []Event
	Jobs         []Job
	Volunteering []Volunteering
}

// Render turns the Newsletter into markdown.
func (nl Newsletter) Render(w io.Writer) error {
	tmpl, err := template.New("template.md").Funcs(template.FuncMap{
		"dateFormat": func(t time.Time) string {
			return t.Format("Monday, 01/02/2006 @ 3PM")
		},
	}).ParseFiles("template.md")

	if err != nil {
		return errors.Wrap(err, "failed to load template")
	}

	return tmpl.Execute(w, templateData{
		Number:       fmt.Sprintf("%03d", nl.Number),
		Events:       nl.Events,
		Jobs:         nl.Jobs,
		Volunteering: nl.Volunteering,
	})
}
