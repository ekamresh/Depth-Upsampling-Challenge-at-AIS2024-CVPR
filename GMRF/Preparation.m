% This function initialize the high resolution depth image with 0 in
% unknown locations.

% The sampling pattern adapted in this adds equally spaced 0's in between
% the known samples: We can do something different.


function [high_res_depth, original_pixel_locations] = Preparation(low_res_depth, high_res_rgb)
    [h, w, ~] = size(high_res_rgb);
    [hd, wd] = size(low_res_depth);

    %initialize the high resolution depth image (Alternate sampling pattern)
    upsampling_ratio_h = round(h/hd); upsampling_ratio_w = round(w/wd);
    high_res_depth = zeros(h, w);
    high_res_depth(1:upsampling_ratio_h:end, 1:upsampling_ratio_w:end) = low_res_depth;

    %Original pixel location
    original_pixel_locations = false(size(high_res_depth));
    original_pixel_locations(1:2:end, 1:2:end) = true;
end