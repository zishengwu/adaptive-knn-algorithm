
% [t,p,accuracy,gmeans] = adaKnn( train_wine(:,1:13),...
%     train_wine(:,14),test_wine(:,1:13), test_wine(:,14), 12);
tic
[ errors , bestRun ] = crossValidationKNN( [train_wine(:,1:13);test_wine(:,1:13)] ,...
    [train_wine(:,14);test_wine(:,14)] , [10,12,15] , 20 );
toc