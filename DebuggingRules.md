# Debugging rules!

- general
- obviously **good habits**, easy to overlook in the heat of the battle
- usually learnt through own mistakes or apprenticeship

## 1. Understand the system
- language, API, tools, product (how it is supposed to work)

## 2. Make it fail
- make it fail **multiple times** to take a closer look
- intermittent issues:
  - **stimulate** the failure, but don't simulate it (you may get distracted)
  - run test in a **loop**
  - **timing** issues and Heisenbug principle
- build **debugging tools** and keep them for later, e.g. debug flag for old code path, viewer for message exchange, replace hardware component with sw emulator, record and replay

## 3. Quit thinking and look
- pay attention to the **symptoms**
- coming up with elaborate **theories** before the issue is clearly understood (engineers beware!)
- **confirmation** bias
- add **instrumentation**, diff logs good vs bad
- guess just to **narrow down** search, **prove** hypothesis with experiments

## 4. Divide and conquer
- at **source control**/**version** level
- at **scenario level**: simplify to the smallest configuration/test that still reproduces the issue: e.g. for a network test tool, reduce if possible to one device.
- at **module level**:
  - start from the module with symptoms and go upstream. too many good parts to inspect them all.
  - when modules are owned by different teams, you need to corner it before handover

## 5. Change one thing at a time
- did it work before? What **changed**?
- after failed experiment, put back the system in the **initial state**
- resist temptation to refactor/redesign at the same time

## 6. Keep an audit trail
- **take notes** with experiment and results
- **document** the process/tools once investigation is done 

## 7. Check the plug
- check **assumptions**
  - are you running expected version?
  - is the test correct?

## 8. Get a fresh view
- describe it to someone else
  - it may become clear
  - novices can detect blind spot
- report **symptoms not theories**

## 9. If you didn't fix it, it ain't fixed
- always make sure it **reproduces**, before attempting fix
- after verifying fix, take it out and try again to reproduce
- with some intermittent issues, there is a way to know if the issue was supposed to happen
- don't be satisfied with explanation if things are still unclear

## References
Debugging by David Agans - https://www.amazon.com/Debugging-Indispensable-Software-Hardware-Problems/dp/0814474578
