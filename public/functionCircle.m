function y = circular_convolution(x, h)
  N = max(length(x), length(h));

  x = [x, zeros(1, N-length(x))];
  h = [h, zeros(1, N-length(h))];

  X = zeros(1, N);
  H = zeros(1, N);
  Y = zeros(1, N);
  y = zeros(1, N);
  v = exp((-2*pi*1i)/N);


  for k = 1:N
    for j = 1:N
      X(k) = X(k) + x(j) * v^((j-1)*(k-1));
      H(k) = H(k) + h(j) * v^((j-1)*(k-1));
    end
    Y(k) = X(k) * H(k);
  end


  for m = 1:N
    for k = 1:N
      y(m) = y(m) + Y(k) * v^(-(m-1)*(k-1));
    end
    y(m) = y(m) / N;
  end
end

