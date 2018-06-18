## Summary

This post is about save and restore model. The key idea is use the python's handler of `SIGINT`.
To understand this paper, you need to know what the signal of a unix-like system
is(MS-Windows also has the similar things),
what a handler of IRQ, or say interrupt, is,
and how closure works.