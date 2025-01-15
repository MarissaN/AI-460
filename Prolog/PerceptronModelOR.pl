% Activation function for OR operation
activate_or(WeightedSum, Threshold, 1) :- WeightedSum >= Threshold.
activate_or(WeightedSum, Threshold, 0) :- WeightedSum < Threshold.

% Perceptron learning rule
update_weight_or(OldWeight, LearningCoefficient, TargetOutput, ActualOutput, Input, NewWeight) :-
    NewWeight is OldWeight + LearningCoefficient * (TargetOutput - ActualOutput) * Input.

% Perceptron learning for OR operation
train_perceptron_or([], [], Weights, Weights).
train_perceptron_or([[Input1, Input2]|Inputs], [Target|Targets], Weights, NewWeights) :-
    % Calculate weighted sum for the first input
    WeightedSum1 is Input1 * Weights[1] + Input2 * Weights[2],
    activate_or(WeightedSum1, 3.1, ActualOutput1),
    update_weight_or(Weights, 0.7, Target, ActualOutput1, Input1, UpdatedWeights1),

    % Calculate weighted sum for the second input
    WeightedSum2 is Input1 * UpdatedWeights1[1] + Input2 * UpdatedWeights1[2],
    activate_or(WeightedSum2, 3.1, ActualOutput2),
    update_weight_or(UpdatedWeights1, 0.7, Target, ActualOutput2, Input2, UpdatedWeights),

   
    train_perceptron_or(Inputs, Targets, UpdatedWeights, NewWeights).
