% Construct NNK graph on high resolution rgb image and return the graph
% Laplacian

function [L] = get_graph_Laplacian(high_res_rgb, graph_params)

    sigma_f = graph_params.sigma_f; 
    sigma_d = graph_params.sigma_d; 
    wsz = graph_params.wsz; % (window = 2*wsz + 1)
    [A, ~] = smart_nnk_inverse_kernel_graph(high_res_rgb, wsz, 2*sigma_f^2, 2*sigma_d^2);
    %get graph (combinatorial) Laplacian
    L = w2l(A);
end