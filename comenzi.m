labyrinth = parse_labyrinth ("Mn_input.txt")
Adj = get_adjanceny_matrix(labyrinth)
Link = get_link_matrix(labyrinth)
[G, c] = get_Jacobi_parameters(Link);
n = size(G, 1);
x0 = zeros(n, 1);
tol = .01;
max_steps = 100;
[x, err, steps] = perform_iterative(G, c, x0, tol, max_steps);
path = [13, 8, 2, 12, 1, 3];
lines = 3;
cols = 3;
decoded_path = decode_path(path, lines, cols);
%start_position = 0;
%probabilities - initializare;
%[path] = heuristic_greedy(start_position, probabilities, Adj);
[Y, InitialMatrix] = parse_data_set_file("fisier.txt");
FeatureMatrix = prepare_for_regression(InitialMatrix);