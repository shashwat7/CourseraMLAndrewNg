function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

hX = sigmoid(X * theta);
temp = 0;
for i = 1:m
	temp = temp + ((y(i) * log(hX(i))) + (1 - y(i)) * log(1-hX(i)));
end
J = (-1 / m * temp) + (lambda * sum((theta(2:size(theta,1))).^2) / (2*m) );

grad(1) = (1/m)*(X(:,1)') * (hX - y);
for j = 2:size(theta)(1)
	grad(j) = (1/m)*(X(:,j)') * (hX - y) + (lambda * theta(j) / m);
end






% =============================================================

end
