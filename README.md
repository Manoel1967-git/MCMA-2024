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

7- use the ProblemMCMA file to perform the optimization.

## Modifying Graphs

in the ProblemMCMA file the graphs are defined at the beginning of the script, for example;

%VOPD
S1 = 1    2   3   4  4   5   6   7   8   8   9 10 11 12 12 12  13 14 15 15 16];

T1 = 2    3   4   5 16   6   7   8   9  10  10  9 12  6  9 13  14 15 11 13  5];

W1 = 70 362 362 362 49 357 353 300 313 500 313 94 16 16 16 16 157 16 16 16 27];

params1 = {16, 9, 9, S1, T1, W1, 9};

where S1 represents the source nodes of the graph, 
T1 represents the destination nodes and W1 represents the weight of each arc.

params1 = {number of tasks, mesh width, mesh height, S1, T1, W1, Operator used}.

