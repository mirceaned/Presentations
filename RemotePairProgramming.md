# Remote Collaboration Patterns

## Why remote?

- we switched to remote work during the pandemic
- now some on hybrid, and some on full remote
- teams in multiple geos

## Why collaborate closely via Pair Programming?

- great for onboarding a new team member
- great for training (seniors mentoring juniors, experts spread the knowledge)
- better problem definition, better solutions, easy to maintain discipline for things like TDD, better code / less bugs, continuous code reviews
- we mix with solo work when pairing does not make sense: prototyping, figuring out things from documentation, partner is out

## How?

- assign roles - driver and navigator
	- usually the more experienced person navigates
  	- let junior do most of the typing
- switch periodically navigator and driver roles
- frequent questions to gauge understanding and increase participation
- incorporate breaks
- announce when taking the keyboard to prevent overlaps
- we do retrospectives to see what works and what needs to change

## Patterns we prefer

- Driver as "smart keyboard" (our default)
	- Similar to traditional driver/navigator, but navigator is guiding the driver to a solution, they have a stronger influence while they are navigating 
	- Navigator isn't necessarily dictating exactly what to do as far as keystrokes, but rather gives guidance on logic
    - switch based on timer, usually 10 minutes
    - take breaks every hour 
	- Pros
		- Good for teaching
		- Both partners are actively participanting

- Ping/Pong
	- Each partner takes turn in the red/gree/refactor cycle
	- Both members of the pair are actively participating/talking
		- P1 test (red)
		- P2 implementation (green)
		- P1 refactor (optional)
		- P2 test (red)
	- Pros
	  	- Both members of the pair are actively participating/talking
		- Quick rotation built in
		- Encourages switching at a given time instead of arbitrarily
			- That switch happens at a good time as well
		- Need to be on the same page up front
	- Cons
		- Doesn't work well for prototyping
		- Need to be on the same page up front
	
## Which tools?

- Find people that work well together

- Use a timer, e.g. https://jahed.github.io/agility/

- Audio
  - external directional microphone - I use Blue Yeti Nano
  - I prefer speakers instead of headset
  
- Screen sharing and control
  - we evaluated multiple tools: Zoom, Tuple, Slack, TeamViewer, MS Teams, Pop, Idea Code with Me
  - Tuple followed by Zoom seems the better solution for remote pairing, but it's not perfect
  - pay attention to
    - seamless experience of taking over and controlling the screen
    - low latency
    - environmental noise reduction
    - low CPU usage
    - tools to point to the screen and draw
    - keyboard shortcuts need to work

## References
- Practical Remote Pair Programming - https://www.amazon.com/Practical-Remote-Pair-Programming-collaborating/dp/1800561369
- Example - https://vimeo.com/7814261
- Mob programming - https://www.youtube.com/watch?v=SHOVVnRB4h0
