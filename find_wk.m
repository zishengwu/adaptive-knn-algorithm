function [wk]=find_wk(train_data)

size_data=size(train_data,1);
% ����ŷʽ����
%Ҫɾ���Խ���Ԫ��
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

% �趨e�ķ�Χ,����ʵ�����ݴ�С����
e_range=100;

d_ik=zeros(size_data,size_data);
%�ҳ�С��e�����о���
for i=1:size_data
    for j=1:size_data
        if (i~=j) && (d(i,j)<e_range)
          d_ik(i,j)=d(i,j);
        end     
    end   
end

%���zk
%�������d_ik
 z_k=sum(d_ik,2);
 
 %���wk (n*1)
 wk=z_k/sum(z_k);