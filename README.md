# B2 Assessments

Base repository for B2 assessments and diagnostics.

This repository requires and has been tested on Ruby v2.5.3 and is based on Rails 5.2.4.3.

RSpec and Shoulda-Matchers have been installed and set up.

## Setup

1. fork this repo
2. clone your fork
3. `git clone <paste_repo>`
4. `cd b2-mid-mod`
5. `bundle install`

When you run `bundle exec rspec` you should have 0 tests.

## Instructions

* Work on this assessment independently. DO NOT discuss with anyone.
* Read each story carefully before you start working.
* Commit Frequently, about every 15 - 30 minutes
* Push your code to your fork once the time is up (not before!)

## Submission

Once the time for the assessment is up, push your code to your fork and create a pull request to the `turingschool-examples` repository. Include the following:

* Your Name
* A reflection on how you felt you did with this challenge and what story you got through

## Requirements

* TDD all new work
* model methods and relationships must be fully tested.

## Not Required

* No visual styling is required or expected
* You do not need to test for or create any model validations.

## User Stories

User stories will be released at the start of the assessment.

## Description
Field Trip is an app that allows a user to see airlines, flights, and passengers. Airlines have many flights, and flights belong to airlines. This one to many relationship is already set up for you. You will need to set up the table and relationship between passengers and flights. Flights have many passengers and passengers can have many flights. Make sure to read all instructions, tasks, and user stories before getting started. Also, take a look at your schema to see what you're working with to start.
## Tasks
1. Create a passengers table
  - Passengers will have a name and age
2. Set up a many to many relationship between flights and passengers
3. Complete the following user stories:

```
User Story 1, Flights Index Page
As a visitor
When I visit the flights index page ('/flights')
I see a list of all flight numbers
And under each flight number I see the names of all that flights passengers
```
```
User Story 2, Airlines Show Page
As a visitor
When I visit an airlines show page ('/airlines/:id')
I see a unique list of passengers that have flights from that airline
```
```
User Story 3, Remove a Passenger from a Flight
As a visitor
When I visit the flights index page
Next to each passengers name
I see a link to remove that passenger from that flight
When I click on that link
I'm returned to the flights index page
And I no longer see that passenger listed under that flight
```
```
User Story 4, Passengers Index Page
As a visitor
When I visit a passengers index page ('/passengers/:id')
I see names of all passengers
And next to the passengers name, I see the number of flights that the passenger has
