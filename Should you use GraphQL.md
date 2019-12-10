# Should you use GraphQL?

## What is it?

## Fetching comparison
- underfetch
- overfetch
- nested resolvers

## Multiple endpoints vs one data graph
- federation

## Type system
- introspection
- optional fields in a mutation
- skipping mandatory fields
- renaming field on the server
- returning something else than the contract specified
- enums 

## GraphQL type system
- prevents you from doing mistakes - returning something else than what the schema specifies
- tooling (e.g. GraphiQL, IDE plugins)

## FraphQL schema design
- schema first design allow frontend and backend to agree on what needs to done and proceed in parallel

## Error handling
- all responses from GraphQL are sent back with HTTP code 200, which makes it harder to interpret errors

## Others
- caching becomes more complex 
- language support

