Started experimenting with ralph orchestrator because i found the link from awesomeclaude.com. But I didn't understand the concept at all. 
I torched 2 nights fiddling with things like trying to get it to work with my preferred cli agent (pi) and trying to get it to understand skills that I had defined previously. I also spent way too long defining personas (hats) and thinking up the perfect prompt. 

I also tried to use commands like ralph plan, but I couldn't get it to work as it was documented. I was getting things all wrong. 

So on night 3 I decided to go back to the very basics and understand it from the ground up. I had read a few people talking about how you shouldn't compliccate it by installing plugins or wrappers. You should start by writing the bash script that executed the loop yourself and use an agent to define specs. 

I did that and followed more advice about be a human in the loop for a while first. Which means only execute one iteration of the loop and watch it closely. Understand why it thought is succeeded (even though it didn't to my eyes). This allowed me to dial into a different concept I'd read about, Backpressure. 

Backpressure is the idea that you need to give the agent feedback and constraints to guide it. Start simple is what the blogs had said, begin with linting and level it up to unit, integration, and playwrite tests. The specs need to be highly specific, Engineers are going to become spec writers.

One key concept of ralph loops is that each iteration starts with a clean slate. The agent doesn't remember what it did in the previous iteration unless you explicitly tell it to (and the whole point is that you don't). If the iteration fails, it fails, dump the session and try again. You set a max num of iterations and if it fails that many times, you stop. This is a clear signal that your spec needs work, your requirements aren't clear. 

There are three outcomes from an iteration:
1. The backpressure is fulfilled, but the result is not what you wanted. 
2. The backpressure is not fulfilled, the agent failed. 
3. The backpressure is fulfilled and the result is what you wanted. 

In case 1 and 2, your spec is at fault, you need to better define the requirements. 

