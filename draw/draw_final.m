semilogx(x, y);
hold on;
plot([0, x(19)], [y(19), y(19)], '--r');
plot([x(19), x(19)], [0.7, y(19)], '--r');
axis([10 100000 0.7 0.84]);
set(gca, 'xtick', [10 100 1000 10000 x(19) 100000]);
set(gca, 'ytick', [0.7 0.72 0.74 0.76 0.78 0.80 0.82 y(19) 0.84]);
xlabel 'Number of sample'
ylabel('Accuracy')
xlabel('Number of sample', 'FontSize', 15)
xlabel('Number of sample', 'FontSize', 18)
ylabel('Accuracy', 'FontSize', 18)
title('Accuracy with different training set size', 'FontSize', 20)