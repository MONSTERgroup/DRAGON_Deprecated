CS = crystalSymmetry('cubic');
SS = specimenSymmetry('1');

hw = 16*degree;

% o1 = orientation.byEuler(0*degree,0*degree,45*degree, CS);
% o2 = orientation.byEuler(0*degree,90*degree,45*degree, CS);
% o3 = orientation.byEuler(60*degree,55*degree,45*degree, CS);
% o4 = orientation.byEuler(90*degree,55*degree,45*degree, CS);
% 
% f_a = fibre(o1,o2);
% f_g = fibre(o4,o3);

%o_c = orientation.cube(CS,SS)
o_s1 = orientation.SR(CS,SS);
o_s2 = orientation.SR2(CS,SS);
o_s3 = orientation.SR3(CS,SS);
o_s4 = orientation.SR4(CS,SS);

o_copper = orientation.copper(CS,SS);
o_copper2 = orientation.copper2(CS,SS);

o_brass = orientation.brass(CS,SS);
o_brass2 = orientation.brass2(CS,SS);

%alpha = fibreODF(fibre.alpha(CS,SS),CS,SS, 'halfwidth', hw);
%gamma = fibreODF(fibre.gamma(CS,SS),CS,SS, 'halfwidth', hw);
%eta = fibreODF(fibre.eta(CS,SS),CS,SS, 'halfwidth', hw);

h = Miller(...
    {0,0,1},...
    {0,1,1},...
    {1,1,1},...
    CS,SS);

%odf_a = fibreODF(f_a, CS, SS, 'halfwidth', hw);
%odf_g = fibreODF(f_g, CS, SS, 'halfwidth', hw);
%odf_c = unimodalODF(o_c, CS,specimenSymmetry('1'),'halfwidth', hw);
odf_s1 = unimodalODF(o_s1, CS,specimenSymmetry('1'),'halfwidth', hw);
odf_s2 = unimodalODF(o_s2, CS,specimenSymmetry('1'),'halfwidth', hw);
odf_s3 = unimodalODF(o_s3, CS,specimenSymmetry('1'),'halfwidth', hw);
odf_s4 = unimodalODF(o_s4, CS,specimenSymmetry('1'),'halfwidth', hw);

odf_copper = unimodalODF(o_copper, CS,specimenSymmetry('1'),'halfwidth', hw);
odf_copper2 = unimodalODF(o_copper2, CS,specimenSymmetry('1'),'halfwidth', hw);
odf_brass = unimodalODF(o_brass, CS,specimenSymmetry('1'),'halfwidth', hw);
odf_brass2 = unimodalODF(o_brass2, CS,specimenSymmetry('1'),'halfwidth', hw);

odf = odf_s1 + odf_s2 + odf_s3 + odf_s4 + 0.5*odf_copper + 0.5*odf_copper2 + odf_brass + odf_brass2;

figure;
plotPDF(odf,h, 'projection', 'eangle')
mtexColorMap LaboTeX;
hold on
plotPDF(odf, h, 'contour', 1:2.5:13, 'linecolor', 'black', 'ShowText', 'on', 'upper', 'projection', 'eangle');
hold off
mtexColorbar;
