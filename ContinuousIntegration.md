# An experiment with more "continuous" integration

## The pain (old state)

* Create dev branch -> Push to branch -> Manual deploy to lab -> Dev test -> QA in lab -> Demo in lab -> Merge to master -> Deploy to prod (later) -> maybe QA in prod? 
* reasoning: use dev branches to minimize risk, allow enough testing before merging the change to master

### Problems

* frequent merge conflicts
* deploy from multiple branches to lab => engineers stepping on each other toes (hard to detect)
* taking one to several weeks to have a story in a releasable state – demo is once a week
* sometimes we forgot to
   * merge to master after demo
   * deploy to prod after demo or we were waiting for few more days – we lose context
   * test in production after the merge - sometimes made us miss problems specific to production env or breaking changes when integrating 2 tracks which were fine independently
* we were breaking some of the Agile guidelines and paid a price
   * stories need to move quickly through the pipeline
   * bugs should be discovered quickly, etc.

## The change (new state)

* Dev Test -> Push to master -> Auto deploy to lab -> QA in lab -> deploy to prod (as part of QA) -> QA in prod -> Demo in prod
* a pair works on a feature / bug fix
* discuss whether the change should be pushed directly to master (default) or to a dev branch
* take necessary precautions to feature flag / shadow deploy the work in progres
* part of the testing in QA is now done early as dev testing
* run tests locally
* push code to master
* code is ready to be deployed on the next deploy cycle - Continuous Delivery
* when testing is sufficient, the feature flag is turned on
* prod deploy
* QA and demo happens sometimes before, sometimes after prod deploy. Early is better, to minimize impact in case a problem is detected.

### Exceptions

* branches are still fine to use, it's feature branches living for multiple days which are not be the default choice
  * special cases for feature branch - e.g. changes with financial impact that we want to test with production data
* we aim for push to master at least once a day, we exercise judgement if end of day and change is not ready
* local commits are fine for a short interval

### Things to consider for continuous integration

* single team repo or multi teams repo
    * anything pushed to master of a multi team repo is fair game, it can be released at any time by another team – before the QA phase
* desired frequency of releases - ability to do multiple releases per day is nice
* small team vs large team
* increased code complexity because of feature flagging (trade-off between the complexity in managing branches with complexity in the code)
* the feature flag approach works well with some types of work (e.g. a new form) but less well with others (bug fixes) 
* when using feature flags, they need to be left in the code up to the end of the QA stage, and then the flag needs to be tracked for removal
* continuum between the example Martin Fowler gave with integration before release at one end and pushing everything to master every few minutes at the other. Optimum would differ by situation.
* the half continuous integration (merging master to the dev branch) may be insufficient, see resources section for more context
* develop habit to run build and unit tests before pushing
* builds need to be monitored more closely and as soon as build is broken we need to fix/revert
* develop skills to feature flag and shadow deploy
* develop skills to automate more of the testing
    * more integration testing
    * canary testing
    * automated frontend testing?
    * look at each testing step we do in dev testing as a candidate for automation
* pair programming becomes important
    * this helps with immediate code reviews, minimizes bugs

## "What if we break production?"

* Unit tests
* Pair programming for complex changes
* Code review for solo work
* Feature flags for instant rollback
* Canary deployments
* Real-time monitoring and alerting

## Conclusion

* we are happy with the new state
  * less manual steps
  * deployment frequency: weekly -> daily
  * lead time: 1-2 weeks -> 2-3 days
  * no noticeable increase in problems
* give Continuous Integration a try if you are not doing it already
* if you are doing CI, try Continuous Delivery and Continuous Deployment next, see what works for your situation
* retrospect and adjust

## Learning Resources

* https://www.youtube.com/watch?v=v4Ijkq6Myfc - Continuous Integration vs Feature Branch Workflow
    * Dave Farley talks about the paradigm difference and techniques such as feature flagging, branch by abstraction, and dark launch
* https://www.youtube.com/watch?v=NcU0oEk6z8Y - The 10 COMMANDMENTS Of Continuous Integration (CI)
    * Dave Farley talks about steps like running tests, watching the build for failures
* https://martinfowler.com/articles/continuousIntegration.html

