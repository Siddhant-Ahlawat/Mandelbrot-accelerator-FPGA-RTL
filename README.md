# Mandelbrot set accelerator on SoC
The Project was completed on the DE1-SOC by terasic, you can find the verilog and C code in the above folder, the C-code named final_code.c is to be run on the ARM, by first installing Linux on it. The Accelerator RTL code can be found in the Top module- mandelbrot_final_working/VGA_to_M10K/verilog/DE1_SoC_Computer.v.
The sof file is contained in the folder so no need to recompile.



https://github.com/Siddhant-Ahlawat/Mandelbrot-accelerator-FPGA-RTL/assets/82876080/789f2cd7-c5bf-42e9-9cf2-580579db6196



# INTRODUCTION

I used Verilog to design and implement a mandelbrot set accelerator on the dec1-soc.
The accelerator computes the color information required to display the visual representation of
the mandelbrot set, then this information is displayed on the VGA screen using a custom verilog
based VGA driver supplied by professor Adams. Through the mouse, a user has been given the
option to zoom in/zoom out , pan across the screen to explore the visual complexity and beauty
of the mandelbrot set. The user can press key[0] to reset the system to display the full mandelbrot
set. The user can also change the number of iterations that are computed for each pixel using a
User interface accessed through a ssh connection to the ARM.

The objective for this project was to minimize the time to render a particular frame of the
complex plane containing the mandelbrot set, which without an accelerator took 936
milliseconds to render on the ARM processor. Various optimizations were considered for
achieving speedup, keeping in mind the resource constraints (both hardware constraints on the
development board and time constraints to finish the project in 3 weeks ). The final time to
render came out to be 10.142 milliseconds, achieving a speedup of around x90, and to achieve
this I was able to implement 29 parallel iterators on our FPGA.

# DESIGN

## The Mandelbrot set
The mandelbrot set is a collection of points in the complex plain, such that for a complex
number c, the function -

![1](https://github.com/Siddhant-Ahlawat/Mandelbrot-accelerator-SoC-FPGA-RTL/assets/82876080/c29f1cf2-2d09-4516-945d-6d165eaf0797)


does not diverge to infinity when iterated from z=0 and remains bounded to finite value .
Now in the above equation, we can break complex numbers z and c into their real and imaginary
parts, and discretize z to time steps n and n+1, to get the following equations-

![2](https://github.com/Siddhant-Ahlawat/Mandelbrot-accelerator-SoC-FPGA-RTL/assets/82876080/b225979e-146c-44e5-96c9-106b4578bd9e)


In my computation, I have set the upper bound for checking divergence to be 2, that is we
shall say that a point does not lie in the mandelbrot set if its magnitude exceeds 2 after iterating.
therefore , we check for the following condition to make a decision-

![3](https://github.com/Siddhant-Ahlawat/Mandelbrot-accelerator-SoC-FPGA-RTL/assets/82876080/80c837d0-7e78-4722-8ace-3deaedeaf041)



## Fixed Point Usage

The values of z and c are converted to 4.23 fixed point format in this project, as it achieves the
desired level of precision and requires only a single DSP unit per multiplication. This was
important as it was determined prior to design that the DSP units would be a limiting resource
determining the number of iterators that we can fit on our FPGA and thus limiting the parallel
processing capabilities of our accelerator.

The conversion required a fixed point multiplier to be built and some float to fix and vice versa
conversion functions to be defined in the ARM code. These were made by modifying similar
functions provided to us by professor Adams in previous projects.

## Use of ARM + FPGA

![4](https://github.com/Siddhant-Ahlawat/Mandelbrot-accelerator-SoC-FPGA-RTL/assets/82876080/c6a556c3-550d-470b-82a3-be4fbb1f9c6a)



## FPGA

In this project, the FPGA contains 29 parallel solving iterators, each responsible for writing to
their own pre-distributed pixels using 29 M10k memory blocks, one for each iterator.
The pixels have been distributed column wise to the iterators, that is, they will parallelly
compute 29 consecutive pixels in a row. We could only fit 29 given the DSP block constraints.
The iterators compute and write a 8 bit color value for each of their pixels in the M10k memory
associated with them.
The FPGA also contains a verilog based custom VGA driver provided by professor Adams to
achieve low latency communication with the VGA screen. The FPGA gets the values of
Ci_initial, Cr_initial, step_i, step_r, and zoom/pan signals from the ARM in fixed point to gather
information about the subset of the complex plane that the user wants to view on the VGA. It
then starts the iterators parallelly to compute the requested frame.The time to render a frame is
computed in verilog using a counter circuit that counts up until all the iterators have finished
computing. The user can also reset the system by pressing key[0]. The count of the iterator and
reset signal is then sent over to the ARM via a pio port to be displayed on the terminal interface.

## ARM

The ARM is responsible for the user interface. Linux pthreads have been used to
structure the ARM code. We have three threads running independently- read1,write1,counter1,
and a main function to initialize and start their execution.

![fig2](https://github.com/Siddhant-Ahlawat/Mandelbrot-accelerator-SoC-FPGA-RTL/assets/82876080/5901ac51-e86d-462e-b290-6e1b5fc27a56)


The read1 thread is responsible for getting the user input through the serial terminal for
the maximum number of iterations to be computed by the iterators. It is also responsible for
getting the reset signal from the FPGA to set the values of Ci_initial, Cr_initial, step_i, step_r to
their initial values. It manipulates these values and then communicates them to the FPGA.
The counter1 thread is responsible for getting and printing the time to render a particular
frame on the terminal. It gets the time from the FPGA.

The write1 thread is responsible for reading the mouse input, converting it into x, y coordinates
mapped to our VGA screen pixel address range (x={0,639},y={0,479}) and then using this
information along with mouse clicks to generate zoom in, zoom out, pan outputs. The new values
of Ci_initial, Cr_initial, step_i, step_r are calculated according to the input from the mouse and
then sent over to the FPGA for computing the new frame. This thread also displays the four
boundary coordinates of the current frame on the terminal window.
Finally, the main function is used to initialize and start these threads.

## The User interface


![fig3](https://github.com/Siddhant-Ahlawat/Mandelbrot-accelerator-SoC-FPGA-RTL/assets/82876080/597437df-d597-4d9f-ac21-d0bf8ea479b9)


The user interface consists of a mouse to navigate through the screen. This is achieved by
sending the x,y coordinate values of the mouse to the FPGA and multiplexing the color in value
to the VGA at that address with white color to display the mouse pointer.

![fig4](https://github.com/Siddhant-Ahlawat/Mandelbrot-accelerator-SoC-FPGA-RTL/assets/82876080/e4632549-d92c-46cd-b071-c539527d16d9)


In the terminal, the four enclosing coordinates of the frame along with the time to render
is displayed. The user can also change the max iterations using this terminal. The user can also
reset the system to display the full mandelbrot set by pressing the key[0] on the board.

## The Iterator design

The iterator takes clock, reset, zoom/pan, max_iterations, Ci_initial, Cr_initial, step_i, step_r,
stride, initial shift, as inputs at the beginning of every new frame to be rendered, runs a state
machine to compute the color information for a particular set of pixels described by these inputs
and outputs the signals done, write enable, write address, color to be fed into the M10k blocks
and the timer counter.
When reset/zoom/pan signals are active(HIGH or LOW), the state machine is reset to reset state.
Then at the next clock cycle after the signals go inactive, the state machine begins. The
functionality of the three states is as follows-
Reset state: to initialize y=0 and x= initial shift.
To initialize Ci,Cr, count,finish signal.
Run state: to increment count check if the value is diverging or not, then outputting the value of
color according to the log of the value in count.
Read state: to increment x,y,Ci,Cr, also to send write enable when counting is done.
The above described flow is visually represented using the diagram below-

![fig5](https://github.com/Siddhant-Ahlawat/Mandelbrot-accelerator-SoC-FPGA-RTL/assets/82876080/70535771-2986-4eb5-99b0-89ad91d14cef)


To optimize the number of multiplies required by a single iterator, the feedback loop shown
below is deployed to reuse values instead of multiplying again. So effectively, after this
optimization only 3 multipliers were required to implement a single iterator.

![fig6](https://github.com/Siddhant-Ahlawat/Mandelbrot-accelerator-SoC-FPGA-RTL/assets/82876080/ed027304-5286-483e-bdae-2e882d1a75d3)


## The Addressing structure and the M10ks

To have a non blocking writing and reading of pixel data by the VGA driver and the iterators, we
use on-chip memory to act as a buffer between the two systems. This is achieved by making
M10k blocks in our verilog, one M10k for each iterator to write parallelly.
The issue with this approach is that we have limited on-chip memory which in our case is luckily
just a little more than we need to store all pixel data. Due to this constraint we have to be careful
not to waste any memory and address our data optimally in just 19 bit addresses.


![fig7](https://github.com/Siddhant-Ahlawat/Mandelbrot-accelerator-SoC-FPGA-RTL/assets/82876080/148e6da1-038f-4327-93ca-b8eece7eb525)



The VGA driver that we are using outputs the values of x and y coordinates it wishes to write in
the next clock cycle. We use these values to generate a 19 bit address.
Our iterators are designed to output write enable signal and 19 bit address for the values of x and
y coordinates it has computed the 8 bit color output for, using the same equation used by the
VGA driver address.
Now the task at hand was to use these addresses to make M10k memory blocks accessible to
both systems.
To do this, On the VGA driver side, The lower 5 bits of this address are used to multiplex into
the M10k block holding the value associated with those coordinates, and the rest 14 bits are used
to address the value inside the M10k block. On the iterator side of addressing, Since 5 bits would
produce 32 different combinations of addresses and we only have 29 iterators, it becomes a little
tricky. This problem is solved by making three iterators write to two of the 32 possible addresses.
This looks something like the figure below-


![fig8](https://github.com/Siddhant-Ahlawat/Mandelbrot-accelerator-SoC-FPGA-RTL/assets/82876080/95d1cbc9-546f-4898-ae31-4acc19f99184)



To achieve this addressing, on the iterator side, we set the stride input of our first three iterators
as 16 and the stride of the rest of the iterators as 32. We also set the value of the initial shift
parameter in each iterator according to the diagram above.
Now we do have to be careful about the size of the M10k blocks for each iterator as three of
them are now writing to twice the number of pixels as the rest of them. Thus the first three
iterators are provided with bigger(x2) M10k blocks which are internally addressed using 15 bits
instead of 14. The other M10k blocks are smaller and are addressed by 14 bits internally. This
completes our addressing structure.

## PIO ports from Platform Designer

![fig9](https://github.com/Siddhant-Ahlawat/Mandelbrot-accelerator-SoC-FPGA-RTL/assets/82876080/d8f1d912-37ad-4523-89af-195753f6a4d6)


## TESTING METHODS
### Modelsim
The iterator module was tested in model sim and the output was checked using a reference
python code provided by professor adams.

![fig10](https://github.com/Siddhant-Ahlawat/Mandelbrot-accelerator-SoC-FPGA-RTL/assets/82876080/1c2e9445-2bdc-4939-98ae-cd0b2c2009f1)


## BUGS ENCOUNTERED
When writing code for a design project, it is usually not correct the first time. It sometimes will
not even compile! This lab is no different, and we experienced many tedious yet interesting bugs,
such as…
● Multiplexing issues
We spent hours trying to figure out how to go from 16 to 29 iterators as we were getting a
vertical misalignment due to improper addressing.
● Signed notation issue
We experienced this weird bug that our mandelbrot set was coming out almost right but
was going crazy after row. We found that it was due to the fact that we were assigned
Ci_initial a signed value using 27d’_value, instead of 27sd’_value.
● Running out of memory
We made a mistake in our memory requirement calculation and tried to have a 20 bit
address for the pixels.
● Mouse non blocking
We forgot to add the non blocking statements to the mouse read and spent hours trying to
figure out what was wrong with pthreads (lol).
RESULTS
Below is a table of render times to compute various regions of the Mandelbrot set close to the
areas specified in the list that professor Adams has given.
Compared to the 936 milliseconds it takes to render on an ARM processor without the
accelerator, our design ends up taking only 10.142 milliseconds to render the entire set.
X range (Cr) Y range (Ci) time(ms)
[-2,1] [-1,1] 10.142024
[-0.757040, -0.747274] [0.053329,0.060653] 12.226782

[-1.455969, -1.299719] [-0.057755, 0.059433] 17.290196
Table 1. Render times for particular Frames
The following pictures showcase these frames-


![fig16](https://github.com/Siddhant-Ahlawat/Mandelbrot-accelerator-SoC-FPGA-RTL/assets/82876080/4d5e2449-7a18-4ce0-867d-871f3ca671b6)

![intersepoint](https://github.com/Siddhant-Ahlawat/Mandelbrot-accelerator-SoC-FPGA-RTL/assets/82876080/4d34abaf-7dfd-499d-80d4-25f78c0116e2)
