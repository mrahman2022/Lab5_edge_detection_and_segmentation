%% Lab 5: Edge Detection and Segmentation
% Course: Mathematical Algorithms (DSP) — Image Processing Labs
% -------------------------------------------------------------------------
% Learning outcomes:
% - Relate edges to high-frequency components.
% - Apply gradient-based and zero-crossing operators.
% - Perform automatic thresholding (Otsu) and simple segmentation.
%
% HOW TO SUBMIT:
% Include screenshots and short explanations for each section in GitHub.
% Submit only the GitHub URL.
% -------------------------------------------------------------------------

close all; clear; clc;

%% 0) Setup: Load image and prepare output folder
I = im2double(rgb2gray(imread('peppers.png')));

% ✅ Create a folder for saving figures (absolute path)
outputDir = fullfile(pwd, 'figures');
if ~exist(outputDir, 'dir')
    mkdir(outputDir);
end

%% 1) Basic derivative filters (Sobel, Prewitt)
edges_sobel = edge(I, 'Sobel');
edges_prewitt = edge(I, 'Prewitt');

figure;
montage({edges_sobel, edges_prewitt}, 'Size', [1 2]);
title('Sobel | Prewitt edges');

% ✅ Save outputs
saveas(gcf, fullfile(outputDir, 'edges_sobel_prewitt.png'));
imwrite(edges_sobel, fullfile(outputDir, 'edges_sobel.png'));
imwrite(edges_prewitt, fullfile(outputDir, 'edges_prewitt.png'));

%% 2) Canny detector (multi-stage)
edges_canny = edge(I, 'Canny', [0.05 0.2]);
figure; imshow(edges_canny);
title('Canny edges');
saveas(gcf, fullfile(outputDir, 'edges_canny.png'));
imwrite(edges_canny, fullfile(outputDir, 'edges_canny_mask.png'));

%% 3) Laplacian of Gaussian (LoG)
edges_log = edge(I, 'log');
figure; imshow(edges_log);
title('Laplacian of Gaussian edges');
saveas(gcf, fullfile(outputDir, 'edges_log.png'));
imwrite(edges_log, fullfile(outputDir, 'edges_log_mask.png'));

%% 4) Edge map → segmentation (Otsu threshold)
level = graythresh(I); % Otsu's method
BW = imbinarize(I, level);

figure;
montage({I, BW}, 'Size', [1 2]);
title('Original | Otsu threshold binary mask');
saveas(gcf, fullfile(outputDir, 'otsu_threshold.png'));
imwrite(BW, fullfile(outputDir, 'otsu_binary.png'));

%% 5) Label and visualize regions
[L, num] = bwlabel(BW);
RGB = label2rgb(L);
figure; imshow(RGB);
title(['Labeled regions: ', num2str(num)]);
saveas(gcf, fullfile(outputDir, 'labeled_regions.png'));
imwrite(RGB, fullfile(outputDir, 'labeled_regions_rgb.png'));

%% 6) Reflections
% - Which operator gives the thinnest, cleanest edges?
%   → Canny produces the thinnest and most continuous edges due to
%     its multi-stage process (gradient + non-maximum suppression +
%     hysteresis thresholding).

% - Why does Canny outperform simple gradient filters?
%   → Because it combines smoothing (to reduce noise), gradient magnitude
%     calculation, and adaptive thresholding for strong/weak edges.

% - How does Otsu relate to histogram-based thresholding?
%   → Otsu's method automatically finds a threshold that minimizes
%     intra-class variance, effectively separating foreground and background
%     based on the image's intensity histogram.

disp('✅ Lab 5 completed successfully. Figures saved in:');
disp(outputDir);
