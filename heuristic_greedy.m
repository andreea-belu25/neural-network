function [path] = heuristic_greedy(start_position, probabilities, Adj)
  path = [start_position];
  visited(start_position) = 1;
  [n m] = size(Adj);
  while isempty(path) != 1
    position = path(end);
    if(position == m-1)
        return path;
    endif
    vec = [];
    for i=1:n
      if (Adj(position, i) ~= 0)
        vec = [vec i];
      endif
    endfor
    l = length(vec);
    if(l == 0)
        path(end) = [];
    else
        for j=1:l
          v_prob = probabilities(j);
          Max = max(v_prob);
        endfor
        for j=1:l
          if(Max == v_prob(j))
            neigh = vec(j);
          endif
        endfor
        visited(neigh) = 1;
        path = [path neigh];
    endif
  endwhile
endfunction
