function [decoded_path] = decode_path(path, lines, cols)
  labyrinth = parse_labyrinth ("Mn_input.txt");  %matricea citita la primul subpunct
  %pun intr-un vector toate elemnetele matricei
  poz = 1;
  for i=1:lines
    for j=1:cols
      v(poz) = labyrinth(i, j);
      poz++;
    endfor
  endfor
  % parcurg vectorul si daca gasesc duplicate, pe a doua pozitie gasita a aceluiasi numar pun -1
  % -1 nu se va gasi in matrice pentru ca in matrice sunt elemnetele de la 0 la 15
  % am facut acest artificiu pentru a-mi afisa prima pozitie a unui numar intalnit in matrice, 
 % neglijandu-le pe restul daca exista duplicate
  for i=1:poz - 1
    for j=1:poz - 1
       if (i != j && v(i) == v(j))
         v(j) = -1;
       endif
     endfor
  endfor
  % mut toate elementele din vector inapoi in matrice
  poz = 1;
  for i=1:lines
    for j=1:cols
      labyrinth(i, j) = v(poz);
      poz++;
    endfor
  endfor
  % parcurg matricea si vectorul path si formez vectorul decoded_path
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
