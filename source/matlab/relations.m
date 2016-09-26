function [rela]=relations(x)
%计算关联度
%以x(1,:)的参考序列求关联度
[m,n]=size(x);
for i=1:m
    for j=n:-1:2
        x(i,j)=x(i,j)/x(i,1);
    end
end
for i=2:m
    x(i,:)=abs(x(i,:)-x(1,:));               %求序列差
end
c=x(2:m,:);
Max=max(max(c));                             %求两极差
Min=min(min(c));
p=0.5;                                       %p称为分辨率,0<p<1,一般取p=0.5   
for i=1:m-1
    for j=1:n        
         r(i,j)=(Min+p*Max)/(c(i,j)+p*Max);  %计算关联系数
    end
end
for i=1:m-1
    rela(i)=sum(r(i,:))/n;                   %求关联度
end
end
         