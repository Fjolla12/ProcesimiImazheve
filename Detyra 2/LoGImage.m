## Copyright (C) 2023 HP
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} LoGImage (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: HP <HP@DESKTOP-413VNFC>
## Created: 2023-04-19

function result = LoGImage(I, sigma)
    % Define the grid
    [x, y] = meshgrid(-floor(3*sigma):floor(3*sigma));

    % Calculate the Gaussian filter
    G = Gaussian(x, y, sigma);

    % Normalize the filter
    G = G / sum(G(:));

    % Calculate Laplacian of Gaussian
    LoG = LaplacianOfGaussian(x, y, sigma);

  % Normalize LoG filter
    LoG = LoG / sum(abs(LoG(:)));

    % Apply filter to image using convolution
    filtered_img = conv2(double(I), LoG, 'same');

    % Apply Gaussian smoothing to the output image
    out = conv2(filtered_img, G, 'same');

    result = out;

endfunction
