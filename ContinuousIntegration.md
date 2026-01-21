# An experiment with more "continuous" integration

## Old state

* Create dev branch -> Push to branch -> Deploy to lab -> Dev test -> QA in lab -> Demo in lab -> Merge to master -> Deploy to prod -> maybe QA in prod? 

## Reasoning

* Use dev branches to minimize risk, allow enough testing before merging it to master

## Problems

* Merge conflicts
* The code is deployed from multiple dev branches to lab so engineers were frequently stepping on each other toes
* It was taking one to several weeks to have a story in a releasable state – demo is once a week
* Sometimes we forgot to
   * merge to master after demo
   * deploy to prod or we were delaying the process for few more days after demo – requires context switch
   * test in production after the merge which sometimes made us miss problems specific to production or non obvious breaking changes when integrating 2 tracks which were fine independently
* We were breaking some of the Agile guidelines and paid a price
   * stories need to move quickly through the pipeline
   * bugs should be discovered quickly, etc.

## New State

* a pair works on a feature / bug fix
* they discuss whether the change should be pushed directly to master (default) or to a dev branch
* they take necessary precautions to feature flag / shadow deploy the work in progres
* code that is either tdd-ed or prototyped on a branch is not making it to master
* part of the testing activity in QA is now done early as dev testing - regression and new functionality
* we run tests locally
* push code to master
* code was already reviewed during paring
* code is ready to be deployed on the next deploy cycle - Continuous Delivery
* the pair thinks about other tests, we use the resources we were allocating for QA to harden our automated tests
* when testing is sufficient, the feature flag is turned on / code path is activated and pushed
* QA and demo happens sometimes after prod deploy. It needs to happen early, to minimize impact in case a problem is detected.

## Exceptions

* branches are still fine to use, it's feature branches living for multiple days which are not be the default choice
* special cases may still require a feature branch - e.g. changes with financial impact that we want to test with production data
* we aim for push to master at least once a day, we exercise judgement if end of day and change is not ready
* in some cases local commit without push - This may be needed in some cases and should be fine as long as we aim for once a day push

## Things to consider for continuous integration

* single team repo or multi teams repo (shared)
    * anything pushed to master of multi team repo is fair game, it can be released at any time by another team – before the QA phase
* desired frequency of releases - ability to do multiple releases per day is nice
* small team vs large team
* There is increased complexity in the code for feature flagging, i.e. this trades the complexity in managing branches with complexity in the code
* the feature flag approach works well with some types of work (e.g. a new form) but less well with others (bug fixes) 
* when using feature flags, they need to be left in the code up to the end of the QA stage, and then the flag needs to be tracked for removal
* continuum between the example Martin Fowler gave with integration before release at one end and pushing everything to master every few minutes at the other. We need to see if we are at an optimum spot.
* The half continuous integration (merging master to the dev branch) is considered sufficient by Martin Fowler, see side note about semi-integration - https://martinfowler.com/articles/continuousIntegration.html
* develop habit to run build and unit tests before pushing, some tests such as speedyg in main could still fail but that should be infrequent
* builds need to be monitored more closely and as soon as build is broken we need to fix/revert
* develop skills to feature flag and shadow deploy
* develop skills to automate more of the testing
    * more integration testing
    * canary testing
    * automated frontend testing?
    * look at each testing step we do in dev testing as a candidate for automation
* pair programming becomes a prerequisite for changes that are continuously integrated
    * this helps with immediate code review and audit, ensure chance for bugs is low

## Conclusion

* give Continuous Integration a try if you are not doing it already
* if you are doing CI, try Continuous Delivery and Continuous Deployment next
* retrospect and adjust if this introduces problems

## Learning Resources

* https://www.youtube.com/watch?v=v4Ijkq6Myfc - Continuous Integration vs Feature Branch Workflow
    * Dave Farley talks about the paradigm difference and techniques such as feature flagging, branch by abstraction, and dark launch
* https://www.youtube.com/watch?v=NcU0oEk6z8Y - The 10 COMMANDMENTS Of Continuous Integration (CI)
    * Dave Farley talks about steps like running tests, watching the build for failures
* https://martinfowler.com/articles/continuousIntegration.html

