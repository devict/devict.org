package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func Test_jobsFromCSV(t *testing.T) {
	testCases := []struct {
		desc string
		in   [][]string
		want []Job
		err  bool
	}{
		{
			desc: "valid csv",
			in: [][]string{
				// Timestamp,Email Address,Who is hiring?,What's the position?,Any more information?,Who can be contacted if interested?,Link to apply?
				{"8/13/2019 18:35:55", "hello@shwat.com", "Shwat, Inc.", "Engineer", "More information!", "recruiting@shwat.com", "https://seriouslynotarealwebsite.com"},
				{"8/14/2019 18:35:55", "hello@nopenopenoooope.com", "Nopenopenoooope, Inc.", "Engineer", "More information!", "recruiting@nopenopenoooope.com", "https://seriouslynotarealwebsite.com"},
			},
			want: []Job{
				Job{
					Who:     "Shwat, Inc.",
					What:    "Engineer",
					Info:    "More information!",
					Contact: "recruiting@shwat.com",
					Link:    "https://seriouslynotarealwebsite.com",
				},
				Job{
					Who:     "Nopenopenoooope, Inc.",
					What:    "Engineer",
					Info:    "More information!",
					Contact: "recruiting@nopenopenoooope.com",
					Link:    "https://seriouslynotarealwebsite.com",
				},
			},
		},
	}
	for _, tC := range testCases {
		t.Run(tC.desc, func(t *testing.T) {
			jobs, err := jobsFromCSV(tC.in)
			switch tC.err {
			case true:
				assert.NotNil(t, err)
			case false:
				assert.Nil(t, err)
				assert.Equal(t, tC.want, jobs)
			}
		})
	}
}
