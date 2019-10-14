package main

// Newsletter is the main data structure we're building here.
type Newsletter struct {
	Number       int
	Events       []Event
	Jobs         []Job
	Volunteering []Volunteering
}