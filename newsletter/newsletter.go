package main

var (
	meetupURL       = "https://api.meetup.com/2/events?&sign=true&photo-host=public&group_urlname=devICT&limited_events=false&fields=series&status=upcoming&page=20"
	jobsURL         = ""
	volunteeringURL = ""
)

// Newsletter is the main data structure we're building here.
type Newsletter struct {
	Number       int
	Events       []Event
	Jobs         []Job
	Volunteering []Volunteering
}

// LoadData pulls all the necessary data for the Newsletter.
func (nl Newsletter) LoadData() error {
	err := nl.loadEvents()
	if err != nil {
		return err
	}
	err = nl.loadJobs()
	if err != nil {
		return err
	}
	err = nl.loadVolunteering()
	if err != nil {
		return err
	}
	return nil
}

func (nl Newsletter) loadEvents() error {
	events, err := EventsFromMeetup(meetupURL)
	if err != nil {
		return err
	}
	nl.Events = events
	return nil
}

func (nl Newsletter) loadJobs() error {
	jobs, err := JobsFromGoogleSheet(jobsURL)
	if err != nil {
		return err
	}
	nl.Jobs = jobs
	return nil
}

func (nl Newsletter) loadVolunteering() error {
	volunteering, err := VolunteeringFromGoogleSheet(volunteeringURL)
	if err != nil {
		return err
	}
	nl.Volunteering = volunteering
	return nil
}
