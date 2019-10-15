package main

import (
	"fmt"
	"testing"
	"time"

	"github.com/stretchr/testify/assert"
)

func Test_eventFromMeetupEvent(t *testing.T) {
	loc, err := time.LoadLocation("UTC")
	if err != nil {
		t.Errorf("failed to load timezone: %v", err)
	}

	tests := []struct {
		in   meetupEvent
		want Event
	}{
		{
			in: meetupEvent{
				Name: "Some Event",
				Series: meetupSeries{
					ID:          123,
					Description: "This Meetup repeats every Monday.",
				},
				Venue: meetupVenue{
					Name:    "The Labor Party",
					Address: "216 N Mosley St",
					City:    "Wichita",
					State:   "KS",
					Zip:     "67202",
				},
				Time:      1571097600000,
				UTCOffset: -18000000,
				Link:      "https://meetup.com/fake/event/url",
			},
			want: Event{
				Name:              "Some Event",
				Time:              time.Date(2019, 10, 14, 19, 0, 0, 0, loc),
				Location:          "The Labor Party\n216 N Mosley St\nWichita, KS, 67202",
				SeriesID:          123,
				SeriesDescription: "This Meetup repeats every Monday.",
				Link:              "https://meetup.com/fake/event/url",
			},
		},
	}

	for i, tc := range tests {
		got := eventFromMeetupEvent(tc.in)
		assert.Equal(t, tc.want, got, fmt.Sprintf("failed; %d", i))
	}
}

func Test_eventsThisMonth(t *testing.T) {
	tests := []struct {
		in   []Event
		want []Event
	}{
		{
			in: []Event{
				{
					Name:              "Some Event",
					Time:              todayPlusDays(3),
					Location:          "The Labor Party\n216 N Mosley St\nWichita, KS, 67202",
					SeriesID:          123,
					SeriesDescription: "This Meetup repeats every Monday.",
				},
				{
					Name:              "Some Event: Special Edition",
					Time:              todayPlusDays(10),
					Location:          "The Labor Party\n216 N Mosley St\nWichita, KS, 67202",
					SeriesID:          123,
					SeriesDescription: "This Meetup repeats every Monday.",
				},
				{
					Name:              "Too Far In The Future",
					Time:              todayPlusDays(40),
					Location:          "The Labor Party\n216 N Mosley St\nWichita, KS, 67202",
					SeriesID:          0,
					SeriesDescription: "",
				},
			},
			want: []Event{
				{
					Name:              "Some Event",
					Time:              todayPlusDays(3),
					Location:          "The Labor Party\n216 N Mosley St\nWichita, KS, 67202",
					SeriesID:          123,
					SeriesDescription: "This Meetup repeats every Monday.",
				},
			},
		},
	}

	for i, tc := range tests {
		got := eventsThisMonth(tc.in)
		assert.Equal(t, tc.want, got, fmt.Sprintf("failed; %d", i))
	}
}

func todayPlusDays(days int) time.Time {
	utc, _ := time.LoadLocation("UTC")
	now := time.Now()
	return time.Date(now.Year(), now.Month(), now.Day(), 19, 0, 0, 0, utc).AddDate(0, 0, days)
}
