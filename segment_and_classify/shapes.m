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
   
    img_thres_adap = imbinarize(img, 'adaptive', 'Sensitivity', 0.62);
    %figure;
    %imshow(img_thres_adap);
    
    % Close up the holes in the image:
    img_seg = imopen(img_thres_adap, strel('disk', 20));
    %figure;
    %imshow(img_seg);
    
    img_seg_inv = ~img_seg;
    %figure;
    %imshow(img_seg_inv);
    
    % Extract features (regions):
    s = regionprops(img_seg_inv, 'Centroid', 'Circularity');
    centroids = cat(1, s.Centroid);
    
    figure;
    imshow(img);
    hold on;
    plot(centroids(:,1), centroids(:,2), 'rx');
    hold off;
    
    % Classify the shapes using circularity:
    % Note 13 circles, 4 squares and 4 triangles - 21 blobs!
    
    % Sort by circularity, in descending order (1 to 0).
    % The first 13 blobs should be the circles.
    
    %for i = 1:21
        
    %end
end
