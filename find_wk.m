function [wk]=find_wk(train_data)

size_data=size(train_data,1);
% 计算欧式距离
%要删掉对角线元素
d=zeros(size_data);
dt = zeros(size_data);
for i =1:size_data-1
    for j=i+1:size_data
        d(i,j)=norm(train_data(i,:)-train_data(j,:));
    end
end 

for j =1:size_data-1
    for i=j+1:size_data
        dt(i,j)=d(j,i);
    end
end 
d=d+dt;

% 设定e的范围,根据实际数据大小决定
e_range=100;

d_ik=zeros(size_data,size_data);
%找出小于e的所有距离
for i=1:size_data
    for j=1:size_data
        if (i~=j) && (d(i,j)<e_range)
          d_ik(i,j)=d(i,j);
        end     
    end   
end

%求出zk
%按列相加d_ik
 z_k=sum(d_ik,2);
 
 %求出wk (n*1)
 wk=z_k/sum(z_k);