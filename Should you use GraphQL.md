# Should you use GraphQL for APIs?

## Intro
- who am I?
- previous experience with GraphQL
- end goals on whiteboard
    - know what GraphQL is
    - know when to use it
    - know where to find more
- questions welcome
## What is GraphQL?
- query language for APIs
- specification for a runtime
- started at Facebook, initially for solving performance issues for their phone apps accessing graph of data 
- evolved beyond that into a modern approach to API development, alternative to REST for fulfilling better today's apps requirements
- some similarity, some differences
- also HTTP based, just POST, queries, mutations, subscriptions

## Side by side comparison on the board

### GraphQL development workflow
- client and server teams get together and they define the public interface of the system - not the internals of their data
- schema becomes a contract and teams can work in parallel, one data graph so there is some flexibility on accessing data without changing server
### Fetching comparison + example
- is visible on screen check
- underfetch
- overfetch
- deep nesting for resolvers
    - show graphQL client and schema intellisense
    - show GraphQL playground, introspection and documentation
    - demonstrate users, reviews, users with reviews, create user, create review
### Type system + walkthrough
- introspection in GraphQL Playground
- optional fields in a mutation
- skipping mandatory fields
- renaming field on the server is visible in IDE
- send a wrong type for name in mutation
- returning something else than the contract specified provides immediate feedback
- enums to restrict to specific values
### Error handling
- all responses from GraphQL are sent back with HTTP code 200, which makes it harder to interpret errors
### Others
- in GraphQL caching becomes more complex, it cannot be done at the network level like for REST 
- potential performance issues / denial of service attacks for GraphQL which complicate the implementation 
- GraphQL versioning is simpler, deprecate with annotations vs adding new version to endpoint
- more tooling from Apollo - schema registry for versioning, access metrics for your fields, performance measurements
- GraphQL voyager example - https://apis.guru/graphql-voyager/ 
- Multiple endpoints vs one data graph - federation
    - centralizing concerns such as authentication/authorization
- migration from REST to GraphQL can be incremental- wrappers

## Summary
- REST strengths
    - good enough for simple, small apps
    - libraries are more mature
- GraphQL strengths
    - strong typing 
    - schema driven
    - more flexibility to get only relevant data
    - good tools and libraries especially for Node.js (Apollo)

## References
- https://www.howtographql.com/react-apollo - client side tutorial for React
- https://www.howtographql.com/graphql-js - server side tutorial for Node.js
- https://medium.com/@purposenigeria/build-a-restful-api-with-node-js-and-express-js-d7e59c7a3dfb - Build a simple REST API with Node.js
- https://github.com/mirceaned/rest-example
- https://github.com/mirceaned/graphql-example


