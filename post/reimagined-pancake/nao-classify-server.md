Nao Classify Server
===

So this serial of blogs are about the toys ``reimagined-pancake''.

## Snapshot for ``reimagined-pancake''

The ``reimagined-pancake'' is a collection of programs which use the nao robot as a front-end to fetch data,
translate the data to backend, and then classify, regression, etc.

There are some classifiers which use the data fetch by robot, including "age", "smile", and "gender",
to judge whether a face is good or "not good". There are four classifiers based on decision tree, k-nearest neighbor, support vector machine, and artificial neural network.
And the followings will be the details.

# Data

So finally I decide to talk about how the data are generated.

We judge whether a face is looked good or bad with the age, smile, and gender of the face, simply.
The type of age is intergal number

