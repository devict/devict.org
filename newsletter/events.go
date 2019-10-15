package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"time"

	"github.com/pkg/errors"
)

// Event represents a devICT event from Meetup.
type Event struct {
	Name              string
	SeriesID          int
	SeriesDescription string
	Time              time.Time
	Location          string
	Link              string
}

type meetupResponse struct {
	Results []meetupEvent `json:"results"`
}

type meetupEvent struct {
	Name      string       `json:"name"`
	Series    meetupSeries `json:"series"`
	Venue     meetupVenue  `json:"venue"`
	Time      int          `json:"time"`
	UTCOffset int          `json:"utc_offset"`
	Link      string       `json:"event_url"`
}

type meetupSeries struct {
	ID          int    `json:"id"`
	Description string `json:"description"`
}

type meetupVenue struct {
	Name    string `json:"name"`
	Address string `json:"address_1"`
	City    string `json:"string"`
	State   string `json:"state"`
	Zip     string `json:"zip"`
}

// EventsFromMeetup grabs events from the Meetup API, converts into our internal Event
// data structure, and filters unique events in a series and any beyond a date threshold.
func EventsFromMeetup(url string) ([]Event, error) {
	events := make([]Event, 0)
	resp, err := http.Get(url)
	if err != nil {
		return events, errors.Wrap(err, "failed http request")
	}

	respBody, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		return events, errors.Wrap(err, "error reading http response body")
	}

	parsedResponse := meetupResponse{}
	err = json.Unmarshal([]byte(respBody), &parsedResponse)
	if err != nil {
		return events, errors.Wrap(err, "failed parsing response json")
	}

	for _, e := range parsedResponse.Results {
		events = append(events, eventFromMeetupEvent(e))
	}

	return events, nil
}

func eventFromMeetupEvent(mEvent meetupEvent) Event {
	utc, _ := time.LoadLocation("UTC")
	seconds := (mEvent.Time + mEvent.UTCOffset) / 1000

	return Event{
		Name: mEvent.Name,
		Link: mEvent.Link,
		Time: time.Unix(int64(seconds), 0).In(utc),
		Location: fmt.Sprintf(
			"%s\n%s\n%s, %s, %s",
			mEvent.Venue.Name,
			mEvent.Venue.Address,
			mEvent.Venue.City,
			mEvent.Venue.State,
			mEvent.Venue.Zip,
		),
		SeriesID:          mEvent.Series.ID,
		SeriesDescription: mEvent.Series.Description,
	}
}

func eventsThisMonth(events []Event) []Event {
	// filter unique events in the next month
	filtered := make([]Event, 0)
	seriesIncluded := make(map[int]bool)

	utc, _ := time.LoadLocation("UTC")
	now := time.Now()
	daysAhead := 35
	maxDate := time.Date(now.Year(), now.Month(), now.Day(), 19, 0, 0, 0, utc).AddDate(0, 0, daysAhead)

	for _, e := range events {
		// Check that we haven't included this series yet
		if _, ok := seriesIncluded[e.SeriesID]; !ok {
			// Make sure it's within our date range
			if !e.Time.After(maxDate) {
				filtered = append(filtered, e)
				seriesIncluded[e.SeriesID] = true
			}
		}

	}

	return filtered
}
