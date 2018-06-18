# From MNIST: Save and restore model

## Agenda

This post is one of serial posts, named "From MNIST" .
The aim of writing this serial posts is to use
handwritten numeral recognition with MNIST dataset as an example
to introduce some hachnologies.

## Outline

This post is about the save and restore the model.
However the key idea I want to present in the post is use the handler of signals, such as `SIGINT`.

## Background and Montivation

There is a real example. When you training your model on a workstation,
the administrator says there is a higher priority task need to use the workstation,
and you need to stop your training. So you have to stop it.

As you can imaged, there might be tree situations. The first situation is that
you did not wrote any codes about save the model. The training is waste.
The second situation is that you write codes for saving and restore,
but the model will be saved only after the training of each epoch is done.
In this situation, the might just waste training of an undone epoch.
The last one is the model can be save just in time.

This post's primary target is use the handler of interrupt to handle the `SIGINT`
and at the same time we can save the model.

## Codes 

All the all of this experiment can be found at my repo
[reimagined-pancake](https://github.com/Qinka/reimagined-pancake) with commit `d0ff58f` (branch: deeplearning/dev2/master).

## Basic Saving and Restoring

The basic [guide](https://www.tensorflow.org/programmers_guide/saved_model) of saving and restoring can be found at he official website.
You have to understand the usage of `tf.Saver`.

## With Handler of `SIGINT`

There are two items needed:

  1. Handler function of `SIGINT`

  1. `saver`

In the handler function of `SIGINT`, we should use the 
saver to save the model.

So we can write a function to restore and install the handler function of signals.

```python
def restore_reload_model(sess:tf.Session,path):
  # 1
  saver = tf.train.Saver()
  # 2
  def signal_handler(signum, frame):
    if signum in [signal.SIGINT, signal.SIGABRT]:
      # 3
      saver.save(sess,path)
      os._exit(0)
  # 4
  signal.signal(signal.SIGINT,signal_handler)
  signal.signal(signal.SIGABRT,signal_handler)
  # 5
  if path in saver.last_checkpoints:
      saver.restore(sess,path)
  return saver
```

The parameter of function, named `sess`, is a Session, while
parameter `path` is the path where store the model and data.

  1. We initialized a new Saver

  1. Define the handler in the function so that we can use the closure with session.

  1. In the handler, when signal `SIGINT` or `SIGABRT` received,
  we will save the model. Then terminal the program.

  1. Install the handler of signal

  1. Checkout the checkpoints, and restore if it existed.

  Then we can call this function, `restore_reload_model`.