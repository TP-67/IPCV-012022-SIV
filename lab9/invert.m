% Task 2: Create a function for image inversion.

% Note that the function must has the same name as its file.
% Using the following code, read in an image and invert it.

% Define invert function
function output_img = invert(img)
    % Checks if the image is a gray-level image
    if ndims(img) > 2
        % Checks if the image is a RGB image
        if ndims(img) == 3
            img = double(rgb2gray(uint8(img)));
        else
        display('Unknown format, Cannot guarantee result');
        end
    end
    
    % Create new figure
    figure(1);
    % Display image with scaled colors
    imagesc(img);
    % Convert image type to double
    img = double(img);
    % View and set current colormap
    colormap(gray);
    
    % Rescales img between [0, 255]
    mini = min(min(img));
    maxi = max(max(img));
    output_img = (img - mini) / (maxi - mini) * 255;
    % Invert image
    output_img = 255 - output_img;
    
    % Display inverted image
    % Create new figure
    figure(2);
    % Display image with scaled colors
    imagesc(output_img);
    % View and set current colormap
    colormap(gray);
end
