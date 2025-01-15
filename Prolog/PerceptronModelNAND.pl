% Activation function for NAND operation
activate_nand(WeightedSum, Threshold, 1) :- WeightedSum < Threshold.
activate_nand(WeightedSum, Threshold, 0) :- WeightedSum >= Threshold.

% Perceptron learning rule
update_weight_nand(OldWeight, LearningCoefficient, TargetOutput, ActualOutput, Input, NewWeight) :-
    NewWeight is OldWeight + LearningCoefficient * (TargetOutput - ActualOutput) * Input.

% Perceptron learning for NAND operation
train_perceptron_nand([], [], Weights, Weights).
train_perceptron_nand([[Input1, Input2]|Inputs], [Target|Targets], Weights, NewWeights) :-
    % Calculate weighted sum for the first input
    WeightedSum1 is Input1 * Weights[1] + Input2 * Weights[2], 
    activate_nand(WeightedSum1, -2.2, ActualOutput1),
    update_weight_nand(Weights, 0.8, Target, ActualOutput1, Input1, UpdatedWeights1),

    % Calculate weighted sum for the second input
    WeightedSum2 is Input1 * UpdatedWeights1[1] + Input2 * UpdatedWeights1[2], 
    activate_nand(WeightedSum2, -2.2, ActualOutput2),
    update_weight_nand(UpdatedWeights1, 0.8, Target, ActualOutput2, Input2, UpdatedWeights),

    
    train_perceptron_nand(Inputs, Targets, UpdatedWeights, NewWeights).
