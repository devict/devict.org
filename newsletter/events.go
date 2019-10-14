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

func EventsFromMeetup() ([]Event, error) {
	events := make([]Event, 0)
	meetupURL := "https://api.meetup.com/2/events?&sign=true&photo-host=public&group_urlname=devICT&limited_events=false&fields=series&status=upcoming&page=20"
	resp, err := http.Get(meetupURL)
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
	event := Event{Name: mEvent.Name}

	utc, _ := time.LoadLocation("UTC")
	seconds := (mEvent.Time + mEvent.UTCOffset) / 1000
	event.Time = time.Unix(int64(seconds), 0).In(utc)

	event.Location = fmt.Sprintf(
		"%s\n%s\n%s, %s, %s",
		mEvent.Venue.Name,
		mEvent.Venue.Address,
		mEvent.Venue.City,
		mEvent.Venue.State,
		mEvent.Venue.Zip,
	)
	event.SeriesID = mEvent.Series.ID
	event.SeriesDescription = mEvent.Series.Description

	return event
}

func eventsThisMonth(events []Event) []Event {
	// filter unique events in the next month
	filtered := make([]Event, 0)
	seriesIncluded := make(map[int]bool)

	for _, e := range events {
		// Check that we haven't included this series yet
		if _, ok := seriesIncluded[e.SeriesID]; !ok {
			filtered = append(filtered, e)
			seriesIncluded[e.SeriesID] = true
		}
	}

	return filtered
}
