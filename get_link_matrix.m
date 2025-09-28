function [Link] = get_link_matrix(Labyrinth)
    Adj = get_adjanceny_matrix(Labyrinth);
    [nr_lines nr_columns] = size(Adj);
    Link = zeros(nr_lines, nr_columns);
    v = zeros(1, nr_lines);
    
    for i=1:nr_lines
      number = 0;
      for j=1:nr_columns
        if(Adj(i,j) == 1)
            number = number + 1;
        endif
      endfor
      v(i) = number;
    endfor
    
    for i=1:nr_lines
      for j=1:nr_columns
         if(Adj(i,j) == 1)
            Link(i,j) = 1/v(i);
         endif
      endfor
    endfor
    
    Link = sparse(Link);
    
endfunction
