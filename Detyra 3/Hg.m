function hg = Hg(M, N, u0, v0, Do)
   %Krijon nje meshgrid per koordinatat x dhe y te imazhit
   [u, v] = meshgrid(1:N, 1:M);
   %Vlerat e llogaritura te D1 DHE D2 me ane te formulave perkatese
    D1 = sqrt((u - M/2 + ((-1)^1) * u0).^2 + (v - N/2 + ((-1)^1) * v0).^2);
    D2 = sqrt((u - M/2 + ((-1)^2) * u0).^2 + (v - N/2 + ((-1)^2) * v0).^2);
    %Llogarit filterin me ane te formules se dhene
    hg = 1 - exp(-0.5 * ((D1 .* D2) / Do^2));
end
