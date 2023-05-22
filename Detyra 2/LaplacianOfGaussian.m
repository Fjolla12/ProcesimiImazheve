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
## @deftypefn {} {@var{retval} =} LaplacianOfGaussian (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: HP <HP@DESKTOP-413VNFC>
## Created: 2023-04-19

function LoG = LaplacianOfGaussian(x, y, sigma)
    % Calculate partial derivatives using central differences
    dx2 = (Gaussian(x+1,y,sigma) - 2*Gaussian(x,y,sigma) + Gaussian(x-1,y,sigma))/(1^2);
    dy2 = (Gaussian(x,y+1,sigma) - 2*Gaussian(x,y,sigma) + Gaussian(x,y-1,sigma))/(1^2);

    % Calculate Laplacian of Gaussian
    LoG = dx2 + dy2;

endfunction
