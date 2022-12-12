rep=500;
mu_ = zeros(1,rep);
nu_ = zeros(1,rep);
sigma_ = zeros(1,rep);
i = 1;
while i < 501
    [mu,nu,sigma] = mmf(1000,0,4,eye(1),500);
    mu_(i) = mu;
    nu_(i) = nu;
    sigma_(i) = sigma;
    i = i + 1;
end
para_diff = [mu_,nu_,sigma_];
mu_g = zeros([1 500]);
nu_g = ones([1
    500]);
sigma_g = nu_g + 1;
group = [mu_g,nu_g,sigma_g];
figure
bh=boxplot(para_diff, group)
set(bh)
title('The Deivation from the truth in three estimates')
xlabel('Three estimates')
ylabel('deviation')

