addpath('C:/Users/Joker Poker/Desktop/libsvm-3.22/matlab');
si = [100:100:1000];
si_acc = [];
for m = si
  acc = [];
  for i = 1:5
    sub_sample = sub_set(sca_class, m);
    svm_model = svm_train(sub_sample, 0.5);
    acc = [acc, svm_predict(sca_tsam, fil_tlab, svm_model)];
  end
  si_acc = [si_acc, max(acc)];
end
clear acc m;