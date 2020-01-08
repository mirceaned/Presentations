## Intro
- who used CloudFormation with YAML/JSON?
- who used CDK?
- infrastructure as code
    - e.g. deploy some IOT things which save data to s3 buckets 
    - repeatable
    - source control
    
## CloudFormation 
- AWS solution for cloud deployments
- declarative

## CDK
- Cloud Development Kit
- framework for defining cloud infrastructure and provisioning
- multiple language support
- uses constructs
- suite of tools: synth, diff and deploy
- imperative

## Example
- number of lines comparison (115 in synth vs 18)
- add one prop to sqs Queue
- jump to documentation for Queue and constructor params
- browse API reference

## CloudFormation
### Pros
- it's been around for a long time, more examples in the wild
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
- easy to add logic statements
- testable

### Cons
- API for some services is not mature yet so there may be breaking changes - see stability notes in CDK docs
- some of the services do not have yet the high level constructs (ones with little superscript)
- tied to a programming language, which may go out of favor at some point (let's say you decide to not use .NET or Java anymore)

## Summary
- YAML/JSON are basic and lack some advantages that CDK brings
- CDK is worth a try for any new project
- if you like it, migration path is incremental (Cfn.Include for step by step Migration)

## References
- CDK API Reference - https://docs.aws.amazon.com/cdk/api/latest/docs/aws-construct-library.html
- CDK workshop docs - https://cdkworkshop.com/20-typescript.html
- Example from the workshop - https://github.com/mirceaned/cdk-workshop
- Migration to CDK approaches - https://garbe.io/blog/2019/09/11/hey-cdk-how-to-migrate/
