function [decoded_path] = decode_path(path, lines, cols)
  labyrinth = parse_labyrinth ("Mn_input.txt");
 
  poz = 1;
  for i=1:lines
    for j=1:cols
      v(poz) = labyrinth(i, j);
      poz++;
    endfor
  endfor
  
  % I traverse the vector and if I find duplicates, on the second position found of the same number I put -1
  % -1 will not be found in the matrix because the matrix contains elements from 0 to 15
  % I made this trick to display the first position of a number encountered in the matrix,
  % ignoring the rest if duplicates exist

  for i=1:poz - 1
    for j=1:poz - 1
       if (i != j && v(i) == v(j))
         v(j) = -1;
       endif
     endfor
  endfor
  
  % move back all the elements
  
  poz = 1;
  for i=1:lines
    for j=1:cols
      labyrinth(i, j) = v(poz);
      poz++;
    endfor
  endfor
  
  % form `decoded_path` array
  
  [n m] = size(path');
  i1 = 1;
  j1 = 1;
  for k=1:n
    for i=1:lines
      for j=1:cols
        if (labyrinth(i, j) == path(k))
           decoded_path(i1, j1) = i;
           j1++;
           decoded_path(i1, j1) = j; 
           i1++;
           j1 = 1;
        endif
      endfor
    endfor
  endfor
endfunction

