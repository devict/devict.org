package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func Test_volunteeringFromCSV(t *testing.T) {
	testCases := []struct {
		desc string
		in   [][]string
		want []Volunteering
		err  bool
	}{
		{
			desc: "valid csv",
			in: [][]string{
				// Timestamp,Email Address,When are volunteers needed?,Where will volunteers need to go?,Who is hosting or sponsoring the event?,What's the cause?,What are volunteers needed for?,Link for more info?,What to do if you're interested?
				{"8/13/2019 18:35:55", "hello@shwat.com", "Saturday, October 26, 2019, from 11 to 3", "The Wichita Boathouse", "The Etter Together Organization", "A wedding", "Celebrating", "https://google.com", "Show up!"},
				{"8/13/2019 18:35:55", "hello@shwat.com", "The month of September", "Advanced Learning Library", "City of Wichita", "Literacy!", "Reading!", "https://google.com", "Sign up on the website."},
			},
			want: []Volunteering{
				Volunteering{
					When:       "Saturday, October 26, 2019, from 11 to 3",
					Where:      "The Wichita Boathouse",
					Who:        "The Etter Together Organization",
					Cause:      "A wedding",
					What:       "Celebrating",
					Link:       "https://google.com",
					Interested: "Show up!",
				},
				Volunteering{
					When:       "The month of September",
					Where:      "Advanced Learning Library",
					Who:        "City of Wichita",
					Cause:      "Literacy!",
					What:       "Reading!",
					Link:       "https://google.com",
					Interested: "Sign up on the website.",
				},
			},
		},
	}
	for _, tC := range testCases {
		t.Run(tC.desc, func(t *testing.T) {
			volunteering, err := volunteeringFromCSV(tC.in)
			switch tC.err {
			case true:
				assert.NotNil(t, err)
			case false:
				assert.Nil(t, err)
				assert.Equal(t, tC.want, volunteering)
			}
		})
	}
}
