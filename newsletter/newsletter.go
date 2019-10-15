package main

import (
	"fmt"
	"io"
	"text/template"
	"time"

	"github.com/pkg/errors"
)

// Newsletter is the main data structure we're building here.
type Newsletter struct {
	Number       int
	Events       []Event
	Jobs         []Job
	Volunteering []Volunteering
}

// DataSources tells the newsletter LoadData function wheere to
// load the data from.
type DataSources struct {
	EventsURL       string
	JobsURL         string
	VolunteeringURL string
}

// LoadData pulls all the necessary data for the Newsletter.
func (nl *Newsletter) LoadData(sources DataSources) error {
	err := nl.loadEvents(sources.EventsURL)
	if err != nil {
		return err
	}
	err = nl.loadJobs(sources.JobsURL)
	if err != nil {
		return err
	}
	err = nl.loadVolunteering(sources.VolunteeringURL)
	if err != nil {
		return err
	}
	return nil
}

func (nl *Newsletter) loadEvents(url string) error {
	events, err := EventsFromMeetup(url)
	if err != nil {
		return err
	}
	nl.Events = events
	return nil
}

func (nl *Newsletter) loadJobs(url string) error {
	jobs, err := JobsFromGoogleSheet(url)
	if err != nil {
		return err
	}
	nl.Jobs = jobs
	return nil
}

func (nl *Newsletter) loadVolunteering(url string) error {
	volunteering, err := VolunteeringFromGoogleSheet(url)
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
func (nl *Newsletter) Render(w io.Writer) error {
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
