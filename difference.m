% 函数f(x)和它的差分运算
%create exact function and tis derivative
N_exact=301;
x_exact=linspace(0,6*pi,N_exact);
f_exact=sin(x_exact).*exp(-0.3*x_exact);
f_derivative_exact=cos(x_exact).*exp(-0.3*x_exact)...
    -0.3*sin(x_exact).*exp(-0.3*x_exact);

%plot exact function
figure(1);
plot(x_exact,f_exact,'r.','linewidth',0.1);
set(gca,'FontSize',12,'fontweight','demi');
axis([0 6*pi -1 1]);grid on;
xlabel('$x$','Interpreter','latex','FontSize',16);
ylabel('$f(x)$','Interpreter','latex','Fontsize',16);

%create exact function for pi/5 sampling period
% and its finite difference derivatives
N_a=31;%number of points for pi/5 period
x_a=linspace(0,6*pi,N_a);
f_a=sin(x_a).*exp(-0.3*x_a);
f_derivative_a=cos(x_a).*exp(-0.3*x_a)...
    -0.3*sin(x_a).*exp(-0.3*x_a);

dx_a=pi/5;
f_derivative_forward_a=zeros(1,N_a);
f_derivative_backward_a=zeros(1,N_a);
f_derivative_central_a=zeros(1,N_a);
f_derivative_forward_a(1:N_a-1)=...
    (f_a(2:N_a)-f_a(1:N_a-1))/dx_a;
f_derivative_backward_a(2:N_a)=...
    (f_a(2:N_a)-f_a(1:N_a-1))/dx_a;
f_derivative_central_a(2:N_a-1)=...
    (f_a(3:N_a)-f_a(1:N_a-2))/(2*dx_a);

%plot exact derivative of the function and its finite difference
figure(2);
plot(x_exact,f_derivative_exact,'k',...
    x_a(1:N_a-1),f_derivative_forward_a(1:N_a-1),'b--',...
    x_a(2:N_a),f_derivative_backward_a(2:N_a),'r-.',...
    x_a(2:N_a-1),f_derivative_central_a(2:N_a-1),'ms',...
    'MarkerSize',5,'linewidth',1.5);
axis([0 6*pi -1 1]);
grid on;





             