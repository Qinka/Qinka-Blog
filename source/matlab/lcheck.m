function [P,c,error]=lcheck(x,var)
%进行后验差检验
n=length(x);
for i=1:n
     error(i,:)=abs(var(i,:)-x(i,:));     %计算绝对残差
end
c=std(abs(error))/std(x);                 %调用统计工具箱的标准差函数计算后验差的比值c
s0=0.6745*std(x);
ek=abs(error-mean(error));
pk=0;
for i=1:n
    if ek(i,:)<s0
        pk=pk+1;
    end
end
P=pk/n;                                   %计算小残差概率
end