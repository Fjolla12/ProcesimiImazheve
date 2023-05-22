function zhurma(Shperndarja, x, y, z, k, s, a, b)
    %Krijimi i nr te rreshtave dhe te kolonave
    nrRr = abs(z - x) + 1;
    nrK = abs(k - y) + 1;

    %Krijimi i matrices se zhurmes me numer nrRr te rreshtave dhe nrK te kolonave
    zhurma = zeros(nrRr, nrK, s);

    %Zaktimi i zhurmes ne baze te shperndarjes
    switch Shperndarja
        case 'Rayleigh'
            for i = 1:s
                zhurma(:,:,i) = a + b * sqrt(-2 * log(1 - rand(nrRr, nrK)));
            end
        case 'Eksponenciale'
            for i = 1:s
                zhurma(:,:,i) = exprnd(1/a, nrRr, nrK);
            end
        case 'LogNormal'
            for i = 1:s
                zhurma(:,:,i) = exp(b * randn(nrRr, nrK) + a);
            end
        case 'Salt&Pepper'
            for i = 1:s
                zhurma(:,:,i) = SaltPepper(nrRr, nrK, a);
            end
        case 'Erlang'
            for i = 1:s
                zhurma(:,:,i) = -a * sum(log(1 - rand(nrRr, nrK)), 3);
            end
        otherwise
            error('Shpërndarja qe keni zgjedhur nuk eshte e vlefshme.');
    end

    %Shfaqja e zhurmes
    disp(zhurma);
end

%funksioni ndihmes per Salt&Pepper
function sp = SaltPepper(x, y, p)
    sp = zeros(x, y);
    sp(rand(x, y) < p/2) = -1;
    sp(rand(x, y) >= 1 - p/2) = 1;
end


