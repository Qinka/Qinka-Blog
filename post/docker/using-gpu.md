Using Host's GPU on Docker
===


There are two step to using GPU on your Docker:

* Install nvidia-docker (for it's volumes)
* Setup volumes and device for your container

## FIRST STEP: install nvidia docker

Checkout [Nvidia's officical report for nvidia-docker](https://github.com/NVIDIA/nvidia-docker) to get the guides about install
nvidia-docker, and then install it.

After it installed, you need to make sure `nvidia-docker-plugin` is running.
If not, you need run it on the backgorund.

Then you need to use `docker volumes ls` to checkout whether there are a volume `named nvidia-docker`.
You also need to run `nvidia-docker run --rm nvidia/cuda nvidia-smi` to checkout whether the container can connect to
host GPU.

## SECOND STEP: launch your container

> Before begnining with all of this section, it is important that in your image, there should install cuda toolkit or sdk.

If you want to use GPU, the follwing list is want you need to do:

* Mount volume `nvidia-docker` to your container by using the option `-v` when creating container
* Map the devices about GPU by using `--device` when creating container
  > You need to map those whose name has prefix `nvidia`
* Launch you container

