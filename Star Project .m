load starData
nObs = size(spectra,1)
lambdaStart = 630.02
lambdaDelta = 0.14

lambdaEnd = lambdaStart + (nObs-1)*lambdaDelta
lambda = (lambdaStart:lambdaDelta:lambdaEnd)'

s = spectra(:,2)

loglog(lambda,s,".-")
xlabel("Wavelength")
ylabel("Intensity")

[sHa,idx] = min(s)
lambdaHa = lambda(idx)

hold on
loglog(lambdaHa,sHa,"rs","MarkerSize",8)
hold off

z = lambdaHa/656.28 - 1
speed = z*299792.458


load starData

[sHa,idx] = min(spectra);
lambdaHa = lambda(idx);
z = lambdaHa/656.28 - 1;
speed = z*299792.458

for v = 1:7
    s = spectra(:,v);

    if speed(v) <= 0
        loglog(lambda,s,"--")
    else
       loglog(lambda,s,"LineWidth",3) 
    end
    hold on
end
hold off

legend(starnames)

movaway = starnames(speed > 0)

