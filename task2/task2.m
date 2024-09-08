clear;
f = @(x)(testf(7, x));
x0 = [5,-5];
% A, b: Inequality constraints of the parameters p with A * p - b <= 0.
% Aeq, beq: Equality constraints of the parameters p with A * p - b = 0.
% lb, ub: Bounds of the parameters p with lb <= p <= ub.
% c(x) is the array of nonlinear inequality constraints at x. 
% fmincon attempts to satisfy c(x) <= 0 for all entries of c.
% ceq(x) is the array of nonlinear equality constraints at x.
% fmincon attempts to satisfy ceq(x) = 0 for all entries of ceq.
A = [];
b = [];
Aeq = [];
beq = [];
lb = [-10 -10];
ub = [10 10];
[r1, val1] = fmincon(f,x0,A,b,Aeq,beq,lb,ub);

figure(1);
[X, Y] = meshgrid(-15:0.1:15);
Z = testf(7, X, Y);
surf(X, Y, Z);
xlabel('x')
ylabel('y')
zlabel('z')
hold on;

plot3(x0(1),x0(2),f(x0),"^",'LineWidth',5);
plot3(r1(1),r1(2),val1,"^",'LineWidth',5);

A = [-5, 3];
b = -15;
[r1, val1] = fmincon(f,x0,A,b);

figure(2);
[X, Y] = meshgrid(-15:0.1:15);
Z = testf(7, X, Y);
surf(X, Y, Z);
xlabel('x')
ylabel('y')
zlabel('z')
hold on;

plot3(x0(1),x0(2),f(x0),"^",'LineWidth',5);
plot3(r1(1),r1(2),val1,"^",'LineWidth',5);


function [c,ceq] = circlecon(x)
c = (x(1)-5)^2 + (x(2)+5)^2 - (5)^2;
ceq = [];
end

A = [];
b = [];
Aeq = [];
beq = [];
lb = [];
ub = [];
nonlcon = @circlecon;
[r1, val1] = fmincon(f,x0,A,b,Aeq,beq,lb,ub,nonlcon);

figure(3);
[X, Y] = meshgrid(-15:0.1:15);
Z = testf(7, X, Y);
surf(X, Y, Z);
xlabel('x')
ylabel('y')
zlabel('z')
hold on;

plot3(x0(1),x0(2),f(x0),"^",'LineWidth',5);
plot3(r1(1),r1(2),val1,"^",'LineWidth',5);
