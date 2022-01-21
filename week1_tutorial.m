% IPCV-Jan, 21, 2022

% Define a variable
a = 1;
fprintf('The value of a is = %d\n', a);

% Define a list
b = 1: 2: 10;
disp('The value of b is:');
disp(b);

% Addition of matrices to constants
c = b + 10;
disp('The value of c is:');
disp(c);

% Multiplication of matrices to constants
d = 2 * b;
disp('The value of d is:');
disp(d);

% 1D Array indexing
disp('The value of b[3] is:');
disp(b(4));

% 2D Array indexing
e = b' * ones(1, 5);
disp('The value of e[2][3] is:');
disp(e(3, 4));

% Matrix transpose
f = b';
disp('The value of tranpose f is:');
disp(f);

% Define arrays
g = [1 2 3; 4 5 6; 7 8 9];
h = eye(3);

% Matrix multiplication
disp('The value of g * h is:');
disp(g * h);

% Matrix dot production
disp('The value of g (dot) h is:');
disp(g .* h);

% Task 1
H = [0 4 2; 6 20 1; 3 2 0];
J = [1 6 3; 4 2 2; 2 1 0];
disp('The value of H + J, H * J, and H .* J:');
disp(H + J);
disp(H * J);
disp(H .* J);

% Task 2
% Element-wise power (.^)
A = [1: 7; 9: -2: -3; 2 .^ (2: 8)];
disp('The value of A:');
disp(A);

% Task 3
B = ones(3, 1) * (1: 5);
disp('The value of B:');
disp(B);
C = (0: 4)' * ones(1, 3);
disp('The value of C:');
disp(C);
