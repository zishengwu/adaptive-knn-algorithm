%�������ݹ�һ���ͻ���
in=xlsread('E:\Google��������\ʵ�����ݴ�ȫ\letter.xlsx');
dada=normalizations(in(:,1:16));
zoo =[dada,in(:,17)];
% da=[train_car;test_car];

% num=10294;
% 
% a=randperm(num)';
% train_5=da(a(1:0.9*num),:);
% test_5=da(a(0.9*num+1:end),:);

[Idx,C,sumD,D]=kmeans(in,2,'Replicates',100) ;