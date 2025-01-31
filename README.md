# A new solution based on multi-objective algorithm for multi-application mappings for Many-Core systems
This repository contains the resources and extra documentation for the manuscript "A new solution based on multi-objective algorithm for multi-application mappings for Many-Core systems" published in IEEE Latin America Transactions.
The guidelines are divided into:
- Preparation
- Base test
- Modifying Graphs


## Preparation

First, install the Platemo optimization tool according to the instructions in the manual, both available at: https://bimk.ahu.edu.cn/12957/list.htm.
Create a folder to receive the files contained in this repository, in the indicated path: "..\PlatEMO\Problems\Multi-objective optimization\YourPaste".
Copy the files from this location to the created folder.
Copy the file OperatorGA.m from this location to the "Utility functions" folder the path: "..\PlatEMO\Algorithms\Utility functions". Here are the new operators needed for mapping.

## Base test

To perform a test optimization, use the ProblemMCMA.m file to perform the optimization.
After the test is run, the generated maps can be displayed using the MOstraNoC.m file.

## Modifying Graphs

To perform other mappings with the combination of other applications, copy the entire contents of the ProblemMCMA.m file, create a new script, paste the copied contents and save the script with a new name.
Translate the desired applications into graphs, the graphs are defined at the beginning of the script, for example;

%VOPD  ==> Graph 1

&emsp;  S1 = [1    2   3   4  4   5   6   7   8   8   9 10 11 12 12 12  13 14 15 15 16];<br>
Where S1 is a vector that contains the (numeric) identification of the source nodes of each arc of graph 1.<br>

&emsp;  T1 = [2    3   4   5 16   6   7   8   9  10  10  9 12  6  9 13  14 15 11 13  5];<br>
T1 is a vector that contains the (numeric) identification of the destination nodes of each arc of graph 1.<br>

&emsp;  W1 = [70 362 362 362 49 357 353 300 313 500 313 94 16 16 16 16 157 16 16 16 27];<br>
W1 is a vector that contains the latency weight of each arc of graph 1.<br> 

&emsp;  params1 = {16, 9, 9, S1, T1, W1, 9};<br> 
The params1 variable is used to group the characteristics of graph1, where params1 = {number of tasks, mesh width, mesh height, S1, T1, W1, operator used}.
Mesh width and mesh height refer to the total size of the NoC.
Operator used is a predefined value for the operator used in the proposal.

Therefore, for each application it is necessary to describe its graph in S, T, W and params. and modify the line of code below to contain the params variable of each graph;<br>
[params, LenghtGrafos] = UniGrafo({params1, params2, params3, params4});
