function high_res_depth = Reconstruct_depth(Y_init,original_pixel_locations, L, h, w)

%Depth values are the signals defined on the graph (high resolution RGB)
f = reshape(Y_init.',1,[])'; % Row major order (verify if this is valid)
N = size(f,1);

S = reshape(original_pixel_locations.',1,[])';
I = speye(N,N);
Is = I(:,S);
fs = f(S);
mu = 0.001;
f_hat = (Is*Is' + mu*L)\(Is*fs);%This internally calls Conjugate Gradient (CG).

%reconstruct high resolution image
high_res_depth = reshape(f_hat, h, w);

end