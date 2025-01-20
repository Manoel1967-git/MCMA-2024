# MCMA-2024
NoC Mapping

Start;

1- Download Platemo; https://bimk.ahu.edu.cn/12957/list.htm.
2- Install Platemo.
3- create a folder in the indicated path; "..\PlatEMO\Problems\Multi-objective optimization\YourPaste".
4- copy the files from this location to the created folder.
5- C:\Doutorado\PlatEMO-master - ManyCore\PlatEMO\Algorithms\Utility functions
6- copy the OperadorGA file from this location to the path: "..\PlatEMO\Algorithms\Utility functions"
7- use the ProblemMCMA file to perform the optimization.

in the ProblemMCMA file the graphs are defined at the beginning of the script, for example;

%VOPD
S1 = 1    2   3   4  4   5   6   7   8   8   9 10 11 12 12 12  13 14 15 15 16];
T1 = 2    3   4   5 16   6   7   8   9  10  10  9 12  6  9 13  14 15 11 13  5];
W1 = 70 362 362 362 49 357 353 300 313 500 313 94 16 16 16 16 157 16 16 16 27];
params1 = {16, 9, 9, S1, T1, W1, 9};

where S1 represents the source nodes of the graph, 
T1 represents the destination nodes and W1 represents the weight of each arc.
params1 = {number of tasks, mesh width, mesh height, S1, T1, W1, Operator used}.

