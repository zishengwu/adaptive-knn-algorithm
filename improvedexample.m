% clear all
% clc

%Ĭ�ϲ���
metric=@euclidean;
m = 1.5;
Max = 1000;
tol = 1e-3;

%%%%%%% Ԥ�������ݣ�����ѡ��%%%%%%%%%%%%%
% in=xlsread('E:\Google��������\ʵ�����ݴ�ȫ\letter.xlsx');
% data=normalizations(in(:,1:16));
% new_data=single(data);
%��������
% load('C:\Users\Administrator\Desktop\xin\train_car.mat');
% load('C:\Users\Administrator\Desktop\xin\test_car.mat');

weidu=16;

order=randperm(101);
train=zoo(order(1:90),:);
test=zoo(order(91:end),:);

X_train= train(:,1:weidu);
X_test =test(:,1:weidu);
Y_train= train(:,1+weidu);
Y_test =test(:,1+weidu);

 train_data= X_train;
 test_data =X_test;
train_label=Y_train ;
test_label =Y_test ;

c =7;

%����w
% w=find_wk(train_data);
w=find_wk(dada);
%���øĽ���fcm����
[train_pred,train_v,train_U] = improvedfcm(w,c, train_data, m, metric, Max, tol);
 
% ֱ����ѵ������֮��ģ����ʣ����룬������
 d_label=find_train_p_dist(train_U, train_label); %������d_label����ѵ�����ݵ�k
 
 %��ѵ�����ݵ�k
 train_k=find_train_k(c,train_label,d_label);
 
 %***********��֤ʱ������￪ʼ���𣡣�***************************
 %�Ҳ������ݵ�k����ʵ������Ҳ�ź����ˣ�ֱ�ӿ��Ը������
 tic
 [p_dist,k_test]=find_k_test(c,train_label,test_data,train_v,train_U,train_k);
 

%***************FCM************************
%������ʵ�ʾ���
 %real_label=cal_train_test_dist(train_data,test_data,train_label);
 
 %************kNN*******************

result=knnfind(p_dist,k_test,c);
toc 
 %���㾫��
 acc=0;
 for i=1:size(k_test,1)
    if result(i)==test_label(i)
        acc=acc+1;
    end
 end
acc=acc/size(k_test,1);


    