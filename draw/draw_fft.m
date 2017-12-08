function draw_fft(data, mode)
  m = mean(data);
  s = std(data);
  if mode == 0
    % plot
    subplot(1, 2, 1);
    plot(m);
    title 'Mean value of fft sample'
    xlabel 'Frequency'
    ylabel 'Value'
    subplot(1, 2, 2);
    plot(s);
    title 'Standard deviation of fft sample'
    xlabel 'Frequency'
    ylabel 'Value'
  else
    % semilogy
    subplot(1, 2, 1);
    semilogy(m);
    title 'Mean value of fft sample'
    xlabel 'Frequency'
    ylabel 'Value'
    grid on;
    subplot(1, 2, 2);
    semilogy(s);
    title 'Standard deviation of fft sample'
    xlabel 'Frequency'
    ylabel 'Value'
    grid on;
  end
end