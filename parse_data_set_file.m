function [Y, InitialMatrix] = parse_data_set_file(filename)
  fid = fopen(filename, 'r');
  dims = fscanf(fid, '%d', [1,2]);
  nr_lines = dims(1,1);
  nr_columns = dims(1,2);
  InitialMatrix = textscan(fid, '%s', 'whitespace', ' ');
  InitialMatrix = InitialMatrix{1};
  InitialMatrix = reshape(InitialMatrix, nr_columns + 1, nr_lines)'; %+1 => +Y si dupa il separ
  Y = InitialMatrix(:,1);
  Y = cellfun(@str2num, Y);
  InitialMatrix = InitialMatrix(:,2:end);
  fclose(fid);
endfunction
