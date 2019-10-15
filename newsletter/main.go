package main

import (
	"flag"
	"io/ioutil"
	"os"
	"regexp"
	"strconv"

	"github.com/joho/godotenv"
)

var (
	filenameBase = "newsletter-%03d.md"
	out          = flag.String("out", "../content/newsletters/", "Folder for newsletter output")
)

func main() {
	flag.Parse()
	godotenv.Load()

	files, err := ioutil.ReadDir(*out)
	if err != nil {
		panic(err)
	}

	number, err := nextNumber(files)
	if err != nil {
		panic(err)
	}

	nl := &Newsletter{Number: number}

	err = nl.LoadData(DataSources{
		EventsURL:       os.Getenv("EVENTS_URL"),
		JobsURL:         os.Getenv("JOBS_URL"),
		VolunteeringURL: os.Getenv("VOLUNTEERING_URL"),
	})
	if err != nil {
		panic(err)
	}

	// err = nl.Render(outFile)
	err = nl.Render(os.Stdout)
	if err != nil {
		panic(err)
	}
}

// Reads the list of files, checks them for valid newsletter filename format,
// and extracts the next newsletter number based on those filenames.
func nextNumber(files []os.FileInfo) (int, error) {
	newsletterRegExp := regexp.MustCompile(`newsletter-(\d\d\d)\.md`)

	finalNumber := 0
	for _, f := range files {
		matches := newsletterRegExp.FindSubmatch([]byte(f.Name()))
		if matches != nil && len(matches) == 2 {
			number, err := strconv.Atoi(string(matches[1]))
			if err != nil {
				return 0, err
			}
			if number > finalNumber {
				finalNumber = number
			}
		}
	}
	return finalNumber + 1, nil
}
