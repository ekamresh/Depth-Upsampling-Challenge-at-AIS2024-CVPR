function [normalized_img] = min_max_normalization(img)
min_val = min(img(:));
max_val = max(img(:));

normalized_img = 255*((img - min_val)/(max_val - min_val));

end