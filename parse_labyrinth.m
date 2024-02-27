function [Labyrinth] = parse_labyrinth(filename)
  fid = fopen(filename, 'r');
  dims = fscanf(fid, '%d', [1,2]);
  nr_lines = dims(1,1);
  nr_columns = dims(1,2);
  for i = 1:nr_lines
    line = fscanf(fid, '%d', [1 nr_columns]);
    Labyrinth(i,:) = line;
  endfor
  fclose(fid);
endfunction
