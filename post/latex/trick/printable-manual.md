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

## Two in One page (with another way)

There is another way to do that using pdfpage.
Firstly, our origin file will be compilted, and the `origin.pdf` will refer to the output pdf.
And the origin one might be looked like:

![origin pdf](/img/latex/trick/printable-manual/two-in-one-origin.PNG)

The [codes](/src/latex/trick/printable-manual/origin.tex) and [pdf](/src/latex/trick/printable-manual/origin.pdf)
can be found by following the links.

Then we can "import" origin pdf file by

```latex
\documentclass[12pt]{article}
\usepackage{pdfpages}
    \includepdfset{pages=-}
% ....
\begin{document}
    \includepdf[pages=-,nup=1x2,landscape]{origin.pdf}
\end{docuement}
```

The most possible result is

![two in one with pdfpages](/img/latex/trick/printable-manual/two-in-one-pdfpages.PNG)

The [codes](/src/latex/trick/printable-manual/two-in-one-pdfpages.tex) and [pdf](/src/latex/trick/printable-manual/two-in-one-pdfpages.pdf)
can be found by following the links.


## Backgrounds 

In the 8 bit guy's manual, each page has a greate backgound. So in this section, I will talk about the background with package `backgound` and `ifthen`.

After using package by `\usepackage{background}`, we can use `\backgroundsetup` to setup the background.
The package `background` supports tikz and pictures.
So we can a backgound with following codes:

```latex
\backgroundsetup{
	scale=1,
	angle=90,
	opacity=0.4,
	contents={\begin{tikzpicture}[remember picture,overlay]\node[minimum width=3cm,minimum height=3cm,font=\Huge,circle,draw,ultra thick] {B};\end{tikzpicture}}
}
```

Those code will add a circle with a letter "B".

![background with letter b](/img/latex/trick/printable-manual/origin-background.PNG)

We can also use the image. For example, we can use the following images:

![background](/src/latex/trick/printable-manual/bg.png)

and the codes:

```latex
\backgroundsetup{
	scale=1,
	angle=90,
	opacity=0.4,
	contents={\includegraphics[width=\paperwidth,height=\paperheight]{bg}}
}
```

And the final pdf might be looked like:

![background with image](/img/latex/trick/printable-manual/origin-background-image.PNG)

If you think the different pages should have different background images.
You can use the package `ifthen`. We can use that package to control to set the different pages with different images.
There is an example:

```latex
\backgroundsetup{
	scale=1,
	angle=0,
	contents={%
		\ifthenelse{\value{page} = 1}{\begin{tikzpicture}[remember picture,overlay]\node[minimum width=3cm,minimum height=3cm,font=\Huge,circle,draw,ultra thick] {B};\end{tikzpicture}}{\relax}
		\ifthenelse{\value{page} = 2}{\begin{tikzpicture}[remember picture,overlay]\node[minimum width=3cm,minimum height=3cm,font=\Huge,circle,draw,ultra thick] {A};\end{tikzpicture}}{\relax}
		\ifthenelse{\value{page} = 3}{\includegraphics[width=\paperwidth,height=\paperheight]{bg}}{\relax}	
	}
}
```

The final output of tex file might be looked like:

![background (full)](/img/latex/trick/printable-manual/origin-background-full.PNG)



The [codes](/src/latex/trick/printable-manual/origin-background.tex) and [pdf](/src/latex/trick/printable-manual/origin-background.pdf)
can be found by following the links.
