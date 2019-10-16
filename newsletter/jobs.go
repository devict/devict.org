package main

import (
	"encoding/csv"
	"fmt"
	"net/http"

	"github.com/pkg/errors"
)

// Job represents a job opportunity from the devICT form responses.
type Job struct {
	Who     string
	What    string
	Info    string
	Contact string
	Link    string
}

// JobsFromGoogleSheet pulls the job opportunities form response spreadsheet as a CSV
// and converts it into our internal Jobs struct.
func JobsFromGoogleSheet(url string) ([]Job, error) {
	// Pull from googl sheets
	resp, err := http.Get(url)
	if err != nil {
		return nil, errors.Wrap(err, "failed to get job opportunities csv")
	}
	defer resp.Body.Close()

	if resp.StatusCode != http.StatusOK {
		return nil, fmt.Errorf("unsuccessful http response (%v)", resp.StatusCode)
	}

	// Read as a csv
	csvContent, err := csv.NewReader(resp.Body).ReadAll()
	if err != nil {
		return nil, errors.Wrap(err, "failed reading response body")
	}

	// Drop the header and parse the rest
	return jobsFromCSV(csvContent[1:])
}

func jobsFromCSV(csvContent [][]string) ([]Job, error) {
	jobs := make([]Job, len(csvContent))
	for i := range jobs {
		jobs[i] = Job{
			Who:     csvContent[i][2],
			What:    csvContent[i][3],
			Info:    csvContent[i][4],
			Contact: csvContent[i][5],
			Link:    csvContent[i][6],
		}
	}
	return jobs, nil
}
