# Should you use GraphQL for APIs?

## Intro
- who am I?
- end goals on whiteboard
    - know what GraphQL is
    - know when to use it
    - know where to find more information 
- questions welcome

## What is GraphQL?
- query language for APIs
- specification for a runtime
- started at Facebook, initially for solving performance issues for their phone apps accessing graph of data 
- evolved beyond that into a modern approach to API development, alternative to REST for fulfilling better today's apps requirements
- some similarity, some differences

## Side by side comparison on the board

### GraphQL development workflow
- client and server teams get together and they define the public interface of the system
- schema becomes a contract and teams can work in parallel, one data graph so there is some flexibility on accessing data without changing server

### Fetching comparison + example
- underfetch
- overfetch
- deep nesting for resolvers

### Type system + walkthrough
- introspection in GraphiQL
- optional fields in a mutation
- skipping mandatory fields
- renaming field on the server is visible in IDE
- returning something else than the contract specified provides immediate feedback
- enums to restrict to specific values

### Error handling
- all responses from GraphQL are sent back with HTTP code 200, which makes it harder to interpret errors

### Others
- in GraphQL caching becomes more complex, it cannot be done at the network level like for REST 
- potential performance issues / denial of service attacks for GraphQL which complicate the implementation 
- versioning 
- REST has been around for a while and libraries are more mature
- for simple and small apps REST is the quickest solution
- more tooling from Apollo - sceham registry for versioning, access metrics for your fields, performance measurements 

### Multiple endpoints vs one data graph
- federation

## Summary
- REST strengths
    - good enough for simple, small apps
    - more mature
    
- GraphQL strengths
    - strong typing
    - more flexibility to get only relevant data
    - excellent tools and libraries for Node.js and JVM

## References
https://www.howtographql.com/react-apollo - client side tutorial for React
https://www.howtographql.com/graphql-js - server side tutorial for Node.js
https://medium.com/@purposenigeria/build-a-restful-api-with-node-js-and-express-js-d7e59c7a3dfb - Build a simple REST API with Node.js


