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
	Name     string
	Time     time.Time
	Location string
}

type meetupResponse struct {
	Results []meetupEvent `json:"results"`
}

type meetupEvent struct {
	Name  string `json:"name"`
	Venue struct {
		Name    string `json:"name"`
		Address string `json:"address_1"`
		City    string `json:"string"`
		State   string `json:"state"`
		Zip     string `json:"zip"`
	} `json:"venue"`
	Time int `json:"time"`
}

func eventsFromMeetup() ([]Event, error) {
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
	event.Time = time.Unix(int64(mEvent.Time), 0)
	event.Location = fmt.Sprintf(
		"%s\n%s\n%s, %s, %s",
		mEvent.Venue.Name,
		mEvent.Venue.Address,
		mEvent.Venue.City,
		mEvent.Venue.State,
		mEvent.Venue.Zip,
	)

	return event
}