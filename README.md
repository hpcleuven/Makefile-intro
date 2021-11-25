# Makefile introduction course

GitHub repository for participants of the "worker & atools" training. For information on the training, see the website [https://hpcleuven.github.io/Makefile-intro/](https://hpcleuven.github.io/Makefile-intro/)

## Dependencies

To work out the hands-on exercises, you need GNU Make, GCC, Python 2.7 (for data analysis) and a compatible version of Matplotlib (for plotting).

- If you follow this training using your VSC account on the Tier-2 Genius cluster, you may simply load the `matplotlib/2.1.2-intel-2018a-Python-2.7.14` module.
- If you prefer to work on your local machine, you may create a (mini)conda environment by using the `conda.yml` file. This assumes that you already have inistalled (mini)conda; this conda environment is self-contained:
```bash
cd </path/to/this/repository>
which conda # to make sure conda is in your PATH
conda env create -f conda.env
```

## What is it?

1. [`Make.pdf`](Make.pdf) - slides from the course,

1. [`make-lesson.zip`](make-lesson.zip) - set of files for hands-on sessions,

1. [`lapack-3.3.0.tgz`](lapack-3.3.0.tgz) - alternative location of laback source for the last hands-on,

1. README.md - info about content,

1. docs - directory containing the website for this repository.

1. [`conda.yml`](conda.yml) is a YAML file to recreate a (mini)conda working environment containing Python 2.7 and a consistent version of matplotlib

1. ['compilation_example.sh'](compilation_example.sh) automatically generates all needes source files for Hands-on exercise 9 (building a simple C code)
