## Intro
- who used CloudFormation with YAML/JSON?
- who used CDK?

## CloudFormation 
- used for AWS cloud deployments
- infrastructure as code
    - repeatable
    - trackable via source control 
- declarative

## CDK 
- Cloud Development Kit
- framework for defining cloud infrastructure and provisioning
- uses constructs
- suite of tools for synth, diff and deploy
- imperative

## Example
- number of lines comparison (115 in synth vs 18)

## JSON/YAML
### Pros
- used everywhere, easy to find examples
- may be easier to grasp for non programmers
- low level, finer grain control (can also be a con)
- there are template builders available which take an entity and generate a template for you, e.g. CloudFormer 

### Cons
- easy to mess up spacing/indentation in YAML
- prone to missing truncated files, missing lines, copy/pasting errors

## CDK
### Pros
- higher level constructs
- autocompletion, strong typing, easy jump to docs from IDE
- you can still synthesize YAML if you want for inspect/compare
- no more mental switch between code and infrastructure
- better constructs for reusability - import files
- logic statements (if, for)
- testable

### Cons
- API for some services is not mature yet so there may be breaking changes - see stability notes in CDK docs
- some of the services do not have yet the high level constructs (ones with little superscript)
- tied to a programming language, which may go out of favor at some point (let's say you decide to not use .NET or Java anymore)

## Summary
- YAML/JSON are basic and lack some advantages that CDK brings
- CDK is worth a try for any new project
- if you like it, there are migration paths (Cfn.Include for step by step Migration)

## References
- Typescript References - https://docs.aws.amazon.com/cdk/api/latest/typescript/api/index.html
- CDK workshop docs - https://cdkworkshop.com/20-typescript.html
- Example from the workshop - https://github.com/mirceaned/cdk-workshop
- Migration to CDK approaches - https://garbe.io/blog/2019/09/11/hey-cdk-how-to-migrate/
