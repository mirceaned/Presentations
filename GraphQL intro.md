# APIs are in the house!
- your thermostat/smartwatch/Alexa
- twitter, linkedin
- weather

## How?
- to consume APIs you need a client program and the expected shape of the query (you can also be a robot)
- to produce APIs you need to implement a server that provides queries, mutations and subscriptions

## Why GraphQL? Why?
- a specification for APIs (Application Programming Interfaces)
- modern replacement for RESTful API
- developed by Facebook to help internal and external teams to query data organized in graphs (posts, friends)

## GraphQL Example

- define a schema

```
people(id: ID): Person
Person: {
  name: String,
  height: Int,
  mass: Float
}
```

- send a query (HTML POST)
```
{
  allPeople {
    people {
      name
      height
      mass
    }
  }
}
```

- receive a response
```json
{
  "data": {
    "allPeople": {
      "people": [
        {
          "name": "Luke Skywalker",
          "height": 172,
          "mass": 77
        },
        {
          "name": "C-3PO",
          "height": 167,
          "mass": 75
        }]
      }
   }
}   
```

## Cooler than the REST
- avoids over-fetching and under-fetching
- single endpoint, simplifies maintenance and security
- unlimited depth of queries
- less round-trips which means more responsive especially in phone apps
- better dev tools

## Curious for more?
- GraphQL playground: https://graphql.org/swapi-graphql/
