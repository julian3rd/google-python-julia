# Copyspecial

One goal of mine is to make code and analyses portable across platforms and programs. The Google Python course is good for this, at it instructs how to perform basic tasks (file I/O, counts, low-level tokenization) using base Python. Julia is a good language to port this to, as not only it shares data structures, but also is designed to be fast; something that could be very useful when doing basic NLP-like tasks in batches.  So in order to familiarize myself with Julia and learn how to port things, I will implement the exercises in Julia.  

The IJulia notebook and script `copyspecial.jl` implements the Copyspecial Python Exercise in base Julia. The script takes one or more directories as an argument, along with optional flags, and prints the absolute paths of the files and either copies the files to a new directory or places them in a `.zip` file.  

This notebook is geared towards Unix-alikes; references to directories inside of functions involve tilde exansion.
