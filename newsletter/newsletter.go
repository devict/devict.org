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

func (nl Newsletter) loadEvents() error {
	events, err := EventsFromMeetup(meetupURL)
	if err != nil {
		return err
	}
	nl.Events = events
	return nil
}
