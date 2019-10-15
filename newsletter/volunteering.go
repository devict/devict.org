package main

import (
	"encoding/csv"
	"net/http"

	"github.com/pkg/errors"
)

// Volunteering represents a volunteering opportunity from the devICT form responses.
type Volunteering struct {
	When       string
	Where      string
	Who        string
	Cause      string
	What       string
	Link       string
	Interested string
}

// VolunteeringFromGoogleSheet pulls the volunteering opportunities form response spreadsheet as a CSV
// and converts it into our internal Volunteering struct.
func VolunteeringFromGoogleSheet(url string) ([]Volunteering, error) {
	// Pull from googl sheets
	resp, err := http.Get(url)
	if err != nil {
		return []Volunteering{}, errors.Wrap(err, "failed to get volunteering opportunities csv")
	}

	// Read as a csv
	csvContent, err := csv.NewReader(resp.Body).ReadAll()
	if err != nil {
		return []Volunteering{}, errors.Wrap(err, "failed reading response body")
	}

	// Drop the header and parse the rest
	return volunteeringFromCSV(csvContent[1:])
}

func volunteeringFromCSV(csvContent [][]string) ([]Volunteering, error) {
	volunteering := make([]Volunteering, len(csvContent))
	for i := range volunteering {
		volunteering[i] = Volunteering{
			When:       csvContent[i][2],
			Where:      csvContent[i][3],
			Who:        csvContent[i][4],
			Cause:      csvContent[i][5],
			What:       csvContent[i][6],
			Link:       csvContent[i][7],
			Interested: csvContent[i][8],
		}
	}
	// TODO: validate results
	return volunteering, nil
}
