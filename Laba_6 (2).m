## Copyright (C) 2020 nikit
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} Laba_6 (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: nikit <nikit@LAPTOP-F2VC9HFF>
## Created: 2020-05-08

function retval = Laba_6 (values, interval, step)
  tochnostb = 3;
  iterations = min(length(values), tochnostb);
  start = interval(1);
  stop = interval(2);
  x = start:step:stop;
  table(:, 1) = values(:);
  for i = 2:iterations
    for j = 1:length(values) - i+1
      table(j, i) = -table(j, i-1) + table(j+1, i-1);
    end
  end
  
  for i = 1:length(values)-iterations
    rez = 0;
    sign = 1;
    for j = 2:iterations
      rez += (table(i, j)*sign) / (j-1);
      sign = sign*-1;
      
    end
    proizv(i) = rez/step;
  end
  retval = proizv;
  plot(x, values,"r", x(1:length(x)-iterations), proizv, "g");
  
      
endfunction
