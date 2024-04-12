
%Read RGB, ground truth and low resolution depth map
high_res_rgb = imread("../data_rgb/0005.png");
gt = load("../data_matlab_gt/0005.mat");
Z = load("../data_matlab/0005.mat");
gt = gt.data;
Z = Z.data;

[normalized_gt] = min_max_normalization(gt);
[normalized_Z] = min_max_normalization(Z);

extra_package_paths = [genpath('./NNK_Image_graph')];
addpath(extra_package_paths);


[h, w, ~] = size(high_res_rgb);
N = h*w;
%Initialization and preparation
[Y_init, original_pixel_locations] = Preparation(normalized_Z, high_res_rgb);

%Obtain graph Laplacian
graph_params.sigma_f = 5/255;
graph_params.sigma_d = 1;
graph_params.wsz = 5;
L = get_graph_Laplacian(high_res_rgb, graph_params);

% Reconstruct the high resolution depth
high_res_depth = Reconstruct_depth(Y_init,original_pixel_locations, L, h, w);

% Measure MAE and RMSE
[MAE, RMSE]= get_metric(normalized_gt, high_res_depth);


