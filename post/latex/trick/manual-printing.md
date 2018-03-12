# Printable Manual

I just watched a video of *the 8-bit guy*. In the video, the 8-bit guy just write a real time strategy game, named Planet X2 on Commodore 64.
And some one just help David design a manual of gmae, using Adobe's close-source application.

![The 8 Bit Guy's manual](/img/latex/trick/printable-manual/8-bit-guys-man.PNG)

The image is the 8 bit guy's manual of his game.

So I begin to think about how to design this manual with LaTeX. And in my thinking, I just what to know how to add the background, and re-sort
then in a reasonable order of each page.

In following sections, I will talk about these.

## Two in One page
I use the package `pgfpages`. The command `\pgfpagesuselayout` can gather two small page into single on.
After "using" that package, we can set up the page by `\pgfpagesuselayout{2 on 1}[a4paper,border shrink=5mm,landscape]`
The following image is an example.

![two in one](/img/latex/trick/printable-manual/two-in-one.PNG)

The detail of [codes](/src/latex/trick/printable-manual/two-in-one.tex) and [pdf](/src/latex/trick/printable-manual/two-in-one.pdf) can following the links.
