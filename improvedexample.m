% clear all
% clc

%默认参数
metric=@euclidean;
m = 1.5;
Max = 1000;
tol = 1e-3;

%%%%%%% 预处理数据，（可选）%%%%%%%%%%%%%
% in=xlsread('E:\Google下载内容\实验数据大全\letter.xlsx');
% data=normalizations(in(:,1:16));
% new_data=single(data);
%加载数据
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

%计算w
% w=find_wk(train_data);
w=find_wk(dada);
%调用改进型fcm函数
[train_pred,train_v,train_U] = improvedfcm(w,c, train_data, m, metric, Max, tol);
 
% 直接算训练样本之间的（概率）距离，并排序
 d_label=find_train_p_dist(train_U, train_label); %可以由d_label看出训练数据的k
 
 %找训练数据的k
 train_k=find_train_k(c,train_label,d_label);
 
 %***********验证时间从这里开始算起！！***************************
 %找测试数据的k，其实连距离也排好序了，直接可以给出结果
 tic
 [p_dist,k_test]=find_k_test(c,train_label,test_data,train_v,train_U,train_k);
 

%***************FCM************************
%或者用实际距离
 %real_label=cal_train_test_dist(train_data,test_data,train_label);
 
 %************kNN*******************

result=knnfind(p_dist,k_test,c);
toc 
 %计算精度
 acc=0;
 for i=1:size(k_test,1)
    if result(i)==test_label(i)
        acc=acc+1;
    end
 end
acc=acc/size(k_test,1);


    