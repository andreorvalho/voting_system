# README

To install:

Make sure you have ruby, rails and bundle. I would recommend using rbenv for ruby version managment.
1. bundle install

API documentation:

Endpoints:

1. POST `/elections` -  This endpoint creates an election with the give name and ballots. Responds with the created object(data + id)

body example:
```{
  "name": "Food Preferences",
  "ballots": [
    {
      "name": "Best Ice Cream flavour",
      "type": "multiple-choice",
      "options": [
        "Vanilla",
        "Chocolate",
        "Strawberry",
        "Cookie Dough"
      ]
    },
    {
      "name": "Tastiest Breakfast",
      "type": "single-choice",
      "options": [
        "Toast",
        "Pancakes",
        "Sandwich",
        "Cereal"
      ]
    },
    {
      "name": "Favourite Style of Food",
      "type": "write-in",
      "options": [ ]
    }
  ]
}
```
response example:
```
{
  "id": "1"
  "name": "Food Preferences",
  "ballots": [
    {
      "name": "Best Ice Cream flavour",
      "type": "multiple-choice",
      "options": [
        "Vanilla",
        "Chocolate",
        "Strawberry",
        "Cookie Dough"
      ]
    },
    {
      "name": "Tastiest Breakfast",
      "type": "single-choice",
      "options": [
        "Toast",
        "Pancakes",
        "Sandwich",
        "Cereal"
      ]
    },
    {
      "name": "Favourite Style of Food",
      "type": "write-in",
      "options": [ ]
    }
  ]
}
```
2. POST `/registrations` -  creates a registration to a given voter and election

body example:
```
{
  "voter_id": "1"
  "election_id": "1",
}
```
response example:
```
{
  "status": "ok",
  "error": "if there is an error is described here"
}
```
3. POST `/responses` -  To create a response a user has to send it's voter id and the election id that they are answering to.
Then the answers need to be ordered in order the ballots are on the election

body example:
```
{
  "voter_id": "1",
  "election_id": "1",
  responses: [
    "1",
    "2",
    "answer"
  ]
}
```
response example:
```
{
  [
    {
      "id": "1",
      "voter_id": "1",
      "election_id": "1",
      "option_id": "1"
    },
    {
      "id": "2",
      "voter_id": "1",
      "election_id": "1",
      "option_id": "2"
    },
    {
      "id": "1",
      "voter_id": "1",
      "election_id": "1",
      "value": "answer"
    }
  ]
}
```
4. PUT `/responses/1` -  To update a response a user has to send it's id and the new value or option

body example:
```
{
  "id": "1",
  "voter_id": "1",
  "election_id": "1",
  "value": "answer"
}
```
response example:
```
{
  "id": "1",
  "voter_id": "1",
  "election_id": "1",
  "value": "answer"
}
```
