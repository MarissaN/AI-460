% Activation function for NOR operation
activate_nor(WeightedSum, Threshold, 1) :- WeightedSum < Threshold.
activate_nor(WeightedSum, Threshold, 0) :- WeightedSum >= Threshold.

% Perceptron learning rule
update_weight_nor(OldWeight, LearningCoefficient, TargetOutput, ActualOutput, Input, NewWeight) :-
    NewWeight is OldWeight + LearningCoefficient * (TargetOutput - ActualOutput) * Input.

% Perceptron learning for NOR operation
train_perceptron_nor([], [], Weights, Weights).
train_perceptron_nor([[Input1, Input2]|Inputs], [Target|Targets], Weights, NewWeights) :-
    % Calculate weighted sum for the first input
    WeightedSum1 is Input1 * Weights[1] + Input2 * Weights[2], 
    activate_nor(WeightedSum1, -1.5, ActualOutput1),
    update_weight_nor(Weights, 0.7, Target, ActualOutput1, Input1, UpdatedWeights1),

    % Calculate weighted sum for the second input
    WeightedSum2 is Input1 * UpdatedWeights1[1] + Input2 * UpdatedWeights1[2], 
    activate_nor(WeightedSum2, -1.5, ActualOutput2),
    update_weight_nor(UpdatedWeights1, 0.7, Target, ActualOutput2, Input2, UpdatedWeights),

    
    train_perceptron_nor(Inputs, Targets, UpdatedWeights, NewWeights).
