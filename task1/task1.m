clear all;
f = @(x)(testf(2, x));
x0 = [0,-1];
x1 = [-1,0];
[r1, val1] = fminunc(f, x0);
[r2, val2] = fminunc(f, x1);

[X, Y] = meshgrid(-4:0.1:4);
Z = testf(2, X, Y);
surf(X, Y, Z);
xlabel('x')
ylabel('y')
zlabel('z')
hold on;

plot3(x0(1),x0(2),f(x0),"^",'LineWidth',5);
plot3(r1(1),r1(2),val1,"^",'LineWidth',5);
plot3(x1(1),x1(2),f(x1),"^",'LineWidth',5);
plot3(r2(1),r2(2),val2,"^",'LineWidth',5);

