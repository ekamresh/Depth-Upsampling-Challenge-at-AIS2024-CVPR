high_res_rgb = imread("../data/Office/Original/oyla_0009.jpg");

extra_package_paths = [genpath('../NNK_Image_graph')];
addpath(extra_package_paths);

%Low resolution depth
Z = imread("../data/Office/oyla_0009.png");
[h, w, ~] = size(high_res_rgb);
N = h*w;
%Initialization and preparation
[Y_init, original_pixel_locations] = Preparation(Z, high_res_rgb);

%Obtain graph Laplacian
graph_params.sigma_f = 10/255;
graph_params.sigma_d = 2;
graph_params.wsz = 5;
L = get_graph_Laplacian(high_res_rgb, graph_params);

% Reconstruct the high resolution depth
high_res_depth = Reconstruct_depth(Y_init,original_pixel_locations, L, h, w);




