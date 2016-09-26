function [var,ago,alpha,error,P,c,rela,t] = basicgrey(x,m)
%alpha是包含α、μ值的矩阵;
%ago是预测后累加值矩阵;var是预测值矩阵;
%error是残差矩阵; c是后验差比值
% t 是比较评价
if nargin==1             %m为想预测数据的个数，默认为1
    m=1;
end
if length(x(:,1))==1     %对输入矩阵进行判断,如不是一维列矩阵,进行转置变换
    x=x';
end
n=length(x);             %取输入数据的样本量
x1(:,1)=cumsum(x);       %计算累加值,并将值赋与矩阵be  
for i=2:n                %对原始数列平行移位
    Y(i-1,:)=x(i,:);
end
for i=2:n                %计算数据矩阵B的第一列数据
    z(i,1)=0.5*x1(i-1,:)+0.5*x1(i,:);
end
B=ones(n-1,2);           %构造数据矩阵B
B(:,1)=-z(2:n,1);
alpha=inv(B'*B)*B'*Y;    %计算参数α、μ矩阵
for i=1:n+m              %计算数据估计值的累加数列,如改n+1为n+m可预测后m个值
     ago(i,:)=(x1(1,:)-alpha(2,:)/alpha(1,:))*exp(-alpha(1,:)*(i-1))+alpha(2,:)/alpha(1,:);
end
var(1,:)=ago(1,:);
for i=1:n+m-1                           %可预测后m个值
     var(i+1,:)=ago(i+1,:)-ago(i,:);    %估计值的累加数列的还原,并计算出下m个预测值
end
[P,c,error]=lcheck(x,var);              %进行后验差检验
[rela]=relations([x';var(1:n)']);       %关联度检验
t = judge(P,c,rela); %评价函数 显示这个模型是否合格
end
%ago             %显示输出预测值的累加数列
%alpha           %显示输出参数α、μ数列
%var             %显示输出预测值
%error           %显示输出误差
%P               %显示计算小残差概率
%c               %显示后验差的比值c
%rela            %显示关联度