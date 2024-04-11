function [MAE, RMSE] =  get_metric(gt, high_res_depth)
    [h,w]= size(gt);
    N = h*w;

    error = abs(gt - high_res_depth);
    MAE = (1/N)*sum(error, "all");

    RMSE = rmse(gt, high_res_depth, 'all');


end