package main

import (
	"flag"
	"fmt"
	"io/ioutil"
	"os"
	"path/filepath"
	"regexp"
	"strconv"

	"github.com/joho/godotenv"
)

var out = flag.String("out", "../content/newsletters/", "Folder for newsletter output")

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

	fmt.Printf("Creating newsletter %03d\n", number)
	nl := &Newsletter{Number: number}

	fmt.Print("Pulling data..\n")
	err = nl.LoadData(DataSources{
		EventsURL:       os.Getenv("EVENTS_URL"),
		JobsURL:         os.Getenv("JOBS_URL"),
		VolunteeringURL: os.Getenv("VOLUNTEERING_URL"),
	})
	if err != nil {
		panic(err)
	}

	outFileName := filepath.Join(*out, fmt.Sprintf("newsletter-%03d.md", nl.Number))
	fmt.Printf("Creating %s\n", outFileName)

	outFile, err := os.Create(outFileName)
	if err != nil {
		panic(err)
	}
	defer outFile.Close()

	err = nl.Render(outFile)
	if err != nil {
		panic(err)
	}

	if err := outFile.Close(); err != nil {
		panic(err)
	}

	fmt.Print("Done!\n")
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
