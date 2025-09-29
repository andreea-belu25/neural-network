# Markov is coming

## Function Overview

### Labyrinth Pathfinding
- `parse_labyrinth`: Loads into memory a labyrinth of size NxM from file
- `get_adjacency_matrix`: Creates a matrix that stores the possible directions from a certain state in the labyrinth
- `get_link_matrix`: Creates a matrix that stores the chances to move into a state from another one
- `get_Jacobi_parameters`: Splits the link matrix into components to be able to perform the Jacobi algorithm
- `perform_iterative`: Performs the Jacobi algorithm to determine the chances to reach the win state from a certain state
- `heurestic_greedy`: Determines a path from the current location to the win state
- `decode_path`: Displays the path into a more friendly format

### Linear Regression
- `parse_data_set_file`: Reads a data set from file
- `prepare_for_regression`: Converts all the data into quantifiable data
- `linear_regression_cost`: Computes the linear cost for the dataset
- `parse_csv_file`: Loads a dataset from a csv file into memory
- `gradient_descent`: Computes the model's coefficients using the gradient descent method
- `normal_equation`: Computes the model's coefficients using the gradient conjugate method
- `lasso_regression_cost_function`: Computes the regulated cost for the dataset, using the lasso regression method
- `ridge_regression_cost_function`: Computes the regulated cost for the dataset, using the ridge regression method

### MNIST-101
- `load_dataset`: Loads the dataset into memory
- `split_dataset`: Shuffles the dataset into a training set and a testing set
- `initialize_weights`: Randomly assigns the values of the network's weights with values between [-ε, ε], where ε = sqrt(6) / (previous_layer_size + next_layer_size)
- `cost_function`: Returns the cost for the current weights of the network and the gradients. The gradients are calculated by performing backpropagation on the network
- `predict_classes`: Returns the predictions for the entries provided
