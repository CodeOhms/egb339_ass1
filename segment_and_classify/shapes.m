function [triangles, squares, circles, mask] = shapes(img)
    % Return the centroids of all triangles, squares, and circles.
    %
    % Inputs Variable:
    %        img will be a grayscale image of type uint8.
    %
    % Outputs:
    %   triangles, squares, cirles should be of shape [n, 2]
    %   mask should be the binarized image, but is not evaluated. It can be
    %   helpful for your debugging.

img_thres_adap = imbinarize(img, 'adaptive', 'Sensitivity', 0.65);

mask = ~img_thres_adap;

s = regionprops(mask, 'Centroid', 'Circularity');
centroids = cat(1, s.Centroid);
circularity = [s.Circularity];
[sorted_circularity, i]= sort(circularity);
sorted_centroids = centroids(i,:);
triangles = sorted_centroids(1:4,:);
squares = sorted_centroids(5:8,:);
circles = sorted_centroids(9:21,:);



              
end