% Copyright (C) 2017 Nike Dattani
% Created: 2017-03-26
Hartree2wavenumber=219474.6313702;

%% next time define these as a vector where X is the index so all CBS formulas just need to change X, the index of the vector

E_ROHF_4Z_C=-37.6883418587164627;
E_ROHF_5Z_C=-37.688687304976;
E_ROHF_6Z_C=-37.688687304976;
E_ROHF_7Z_C=-37.6886927227247952;
E_ROHF_8Z_C=-37.6886936;

E_FCI_4Z_C=-37.840485349639;
E_FCI_5Z_C=-37.842955;
E_FCI_6Z_C=-37.8438405;
E_FCI_7Z_C=-37.8442515;
E_FCI_8Z_C=-37.8443555;

E_Corr_4Z_C=E_FCI_4Z_C-E_ROHF_4Z_C
E_Corr_5Z_C=E_FCI_5Z_C-E_ROHF_5Z_C
E_Corr_6Z_C=E_FCI_6Z_C-E_ROHF_6Z_C
E_Corr_7Z_C=E_FCI_7Z_C-E_ROHF_7Z_C
E_Corr_8Z_C=E_FCI_8Z_C-E_ROHF_8Z_C

E_ROHF_4Z_Cplus=-37.2919827736529754;
E_ROHF_5Z_Cplus=-37.2922425028660101;
E_ROHF_6Z_Cplus=-37.29228304;
E_ROHF_7Z_Cplus=-37.29228304;
E_ROHF_8Z_Cplus=-37.2922893509869482;

E_FCI_4Z_Cplus=-37.427214148753;
E_FCI_5Z_Cplus=-37.429265388928;
E_FCI_6Z_Cplus=-37.430004;
E_FCI_7Z_Cplus=-37.43034505;
E_FCI_8Z_Cplus=-37.4304125;

E_Corr_4Z_Cplus=E_FCI_4Z_Cplus-E_ROHF_4Z_Cplus
E_Corr_5Z_Cplus=E_FCI_5Z_Cplus-E_ROHF_5Z_Cplus
E_Corr_6Z_Cplus=E_FCI_6Z_Cplus-E_ROHF_6Z_Cplus
E_Corr_7Z_Cplus=E_FCI_7Z_Cplus-E_ROHF_7Z_Cplus
E_Corr_8Z_Cplus=E_FCI_8Z_Cplus-E_ROHF_8Z_Cplus


E_ROHF_CBS_C=E_ROHF_8Z_C;
E_ROHF_CBS_Cplus=E_ROHF_8Z_Cplus;

% C (4,5)
E_3P_K3__=CBSextrapolation(5,-37.6883418587164627,-37.840485349639,E_ROHF_5Z_C,E_FCI_5Z_C,E_ROHF_CBS_C,3,'Kutzelnigg');
E_3P_K3d5=CBSextrapolation(5,-37.6883418587164627,-37.840485349639,E_ROHF_5Z_C,E_FCI_5Z_C,E_ROHF_CBS_C,3.5,'Kutzelnigg'); 
E_3P_M4__=CBSextrapolation(5,-37.6883418587164627,-37.840485349639,E_ROHF_5Z_C,E_FCI_5Z_C,E_ROHF_CBS_C,4,'Martin');
%E_1D_K3__=CBSextrapolation(6,-37.60491456,-37.797803,-37.430004,-37.6886927227247952,-37.8442515,-37.6886927227247952,3,'Kutzelnigg');

% C+
E_2P_K3__=CBSextrapolation(5,-37.2919827736529754,-37.427214148753,E_ROHF_5Z_Cplus,E_FCI_5Z_Cplus,E_ROHF_CBS_Cplus,3,'Kutzelnigg');
E_2P_K3d5=CBSextrapolation(5,-37.2919827736529754,-37.427214148753,E_ROHF_5Z_Cplus,E_FCI_5Z_Cplus,E_ROHF_CBS_Cplus,3.5,'Kutzelnigg');
E_2P_M4__=CBSextrapolation(5,-37.2919827736529754,-37.427214148753,E_ROHF_5Z_Cplus,E_FCI_5Z_Cplus,E_ROHF_CBS_Cplus,4,'Martin');

E_ionization_K3=(E_2P_K3__-E_3P_K3__)*Hartree2wavenumber;       % (4,5)=
E_ionization_K3d5=(E_2P_K3d5-E_3P_K3d5)*Hartree2wavenumber;     % (4,5)=
E_ionization_M4=(E_2P_M4__-E_3P_M4__)*Hartree2wavenumber;       % (4,5)=

mean([E_ionization_K3,E_ionization_K3d5,E_ionization_M4]);
mean45=mean([E_ionization_K3d5,E_ionization_M4]);
sqrt(var([E_ionization_K3,E_ionization_K3d5,E_ionization_M4]));
uncertainty45=sqrt(var([E_ionization_K3d5,E_ionization_M4]));

disp(strcat('CBS(4,5)',num2str(mean45),'+/-',num2str(uncertainty45)));

% C (5,6)
E_3P_K3__=CBSextrapolation(6,-37.6886482323825334,-37.842955,-37.688687304976,-37.8438405,-37.6886936,3,'Kutzelnigg');
E_3P_K3d5=CBSextrapolation(6,-37.6886482323825334,-37.842955,-37.688687304976,-37.8438405,-37.6886936,3.5,'Kutzelnigg'); 
E_3P_M4__=CBSextrapolation(6,-37.6886482323825334,-37.842955,-37.688687304976,-37.8438405,-37.6886936,4,'Martin');
%E_1D_K3__=CBSextrapolation(6,-37.60491456,-37.797803,-37.430004,-37.6886927227247952,-37.8442515,-37.6886927227247952,3,'Kutzelnigg');

% C+
E_2P_K3__=CBSextrapolation(6,-37.2922425028660101,-37.429265388928,-37.29228304,-37.430004,-37.29229064,3,'Kutzelnigg');
E_2P_K3d5=CBSextrapolation(6,-37.2922425028660101,-37.429265388928,-37.29228304,-37.430004,-37.29229064,3.5,'Kutzelnigg');
E_2P_M4__=CBSextrapolation(6,-37.2922425028660101,-37.429265388928,-37.29228304,-37.430004,-37.29229064,4,'Martin');

E_ionization_K3=(E_2P_K3__-E_3P_K3__)*Hartree2wavenumber;       % (5,6)=
E_ionization_K3d5=(E_2P_K3d5-E_3P_K3d5)*Hartree2wavenumber;     % (5,6)=
E_ionization_M4=(E_2P_M4__-E_3P_M4__)*Hartree2wavenumber;       % (5,6)=

mean([E_ionization_K3,E_ionization_K3d5,E_ionization_M4]);
mean56=mean([E_ionization_K3d5,E_ionization_M4]);
sqrt(var([E_ionization_K3,E_ionization_K3d5,E_ionization_M4]));
uncertainty56=sqrt(var([E_ionization_K3d5,E_ionization_M4]));

disp(strcat('CBS(5,6)',num2str(mean56),'+/-',num2str(uncertainty56)));

% C (6,7)
E_3P_K3__=CBSextrapolation(7,-37.688687304976,-37.8438405,-37.6886927227247952,-37.8442515,-37.6886936,3,'Kutzelnigg');
E_3P_K3d5=CBSextrapolation(7,-37.688687304976,-37.8438405,-37.6886927227247952,-37.8442515,-37.6886936,3.5,'Kutzelnigg'); 
E_3P_M4__=CBSextrapolation(7,-37.688687304976,-37.8438405,-37.6886927227247952,-37.8442515,-37.6886936,4,'Martin');
%E_1D_K3__=CBSextrapolation(7,-37.60491456,-37.797803,-37.430004,-37.6886927227247952,-37.8442515,-37.6886927227247952,3,'Kutzelnigg');

% C+
E_2P_K3__=CBSextrapolation(7,-37.29228304,-37.430004,-37.2922893509869482,-37.43034505,-37.29229064,3,'Kutzelnigg');
E_2P_K3d5=CBSextrapolation(7,-37.29228304,-37.430004,-37.2922893509869482,-37.43034505,-37.29229064,3.5,'Kutzelnigg');
E_2P_M4__=CBSextrapolation(7,-37.29228304,-37.430004,-37.2922893509869482,-37.43034505,-37.29229064,4,'Martin');

E_ionization_K3=(E_2P_K3__-E_3P_K3__)*Hartree2wavenumber;       % (7,8)=90866.4033515227
E_ionization_K3d5=(E_2P_K3d5-E_3P_K3d5)*Hartree2wavenumber;     % (7,8)=90863.5825008623
E_ionization_M4=(E_2P_M4__-E_3P_M4__)*Hartree2wavenumber;       % (7,8)=90862.4613681449

mean([E_ionization_K3,E_ionization_K3d5,E_ionization_M4]);
mean67=mean([E_ionization_K3d5,E_ionization_M4]);
sqrt(var([E_ionization_K3,E_ionization_K3d5,E_ionization_M4]));
uncertainty67=sqrt(var([E_ionization_K3d5,E_ionization_M4]));

disp(strcat('CBS(6,7)',num2str(mean67),'+/-',num2str(uncertainty67)));

% C (7,8)
E_3P_K3__=CBSextrapolation(8,-37.6886927227247952,-37.8442515,-37.6886936,-37.844357,-37.6886936,3,'Kutzelnigg');
E_3P_K3d5=CBSextrapolation(8,-37.6886927227247952,-37.8442515,-37.6886936,-37.844357,-37.6886936,3.5,'Kutzelnigg'); 
E_3P_M4__=CBSextrapolation(8,-37.6886927227247952,-37.8442515,-37.6886936,-37.844357,-37.6886936,4,'Martin');
%E_1D_K3__=CBSextrapolation(8,-37.60491456,-37.797803,-37.60491542,-37.79796513,-37.60491542,3,'Kutzelnigg');

% C+
E_2P_K3__=CBSextrapolation(8,-37.2922893509869482,-37.43034505,-37.29229064,-37.4304125,-37.29229064,3,'Kutzelnigg');
E_2P_K3d5=CBSextrapolation(8,-37.2922893509869482,-37.43034505,-37.29229064,-37.4304125,-37.29229064,3.5,'Kutzelnigg');
E_2P_M4__=CBSextrapolation(8,-37.2922893509869482,-37.43034505,-37.29229064,-37.4304125,-37.29229064,4,'Martin');

E_ionization_K3=(E_2P_K3__-E_3P_K3__)*Hartree2wavenumber;       % (7,8)=90866.4033515227
E_ionization_K3d5=(E_2P_K3d5-E_3P_K3d5)*Hartree2wavenumber;     % (7,8)=90863.5825008623
E_ionization_M4=(E_2P_M4__-E_3P_M4__)*Hartree2wavenumber;       % (7,8)=90862.4613681449

mean78_3=mean([E_ionization_K3,E_ionization_K3d5,E_ionization_M4]);
mean78=mean([E_ionization_K3d5,E_ionization_M4]);
uncertainty78_3=sqrt(var([E_ionization_K3,E_ionization_K3d5,E_ionization_M4]));
uncertainty78=sqrt(var([E_ionization_K3d5,E_ionization_M4]));

disp(strcat('CBS(7,8)_Oly2=',num2str(mean78),'+/-',num2str(uncertainty78)));
disp(strcat('CBS(7,8)_All3=',num2str(mean78_3),'+/-',num2str(uncertainty78_3)));
%%   RAW

Raw4=(-37.840485349639+37.427214148753)*219474.6313705;
Raw5=(-37.842955+37.429265388928)*219474.6313705;
Raw6=(-37.8438405+37.430004)*219474.6313705;
Raw7=(-37.8442515+37.43034505)*219474.6313705;
Raw8=(-37.844356+37.4304125)*219474.6313705;

%% Klopper:
90826.09-90820.45;
(90826.09-90820.45)/1.1;

%%
X=[5 6 7 8];
IE=[90854.8643 90861.9685 90862.8988 90863.0375];
IEuncertainties=[1.6952 1.5682 1.1407 0.80044];
meshForFits=0:0.01:10;
figure(2)
axis([4.5 8.5 90853 90864.5 ])
hold('on')
%errorbar(5,90861.9684,1.8943,'o');
%plot(meshForFits,90863.06334629324-91479.63085459486*exp(-1.88891063258*meshForFits),'LineWidth',3,'Color','b');% only 6,7,8
plot(meshForFits,90863.0485600015-203399.063568663*exp(-2.02414408889605*meshForFits),'LineWidth',3,'Color','b');% also with 5
errorbar(X,IE,IEuncertainties,'o','MarkerSize',10,'MarkerEdgeColor','k','MarkerFaceColor','k','LineWidth',3,'Color','k','CapSize',15);
line([0 10],[90863.0485600015 90863.0485600015],'LineWidth',3,'Color','r')  

box('on');
set(gca,'XMinorTick','on','YMinorTick','on','LineWidth',2.5,'FontSize',20,'Layer','top');
xlabel('$X$','Interpreter','Latex','FontSize',36)
ylabel('CBS($X-1,X$) Ionization Energy [cm$^{-1}$]','Interpreter','Latex','FontSize',32)
set(gcf, 'Color', 'w');

ax = gca;
ax.YAxis.Exponent = 0;
ytickformat('%10.1f')

xticks([5 6 7 8])
set(gcf,'renderer','Painters')

% General model:
%      f(x) = c-a*exp(-b*x)
% Coefficients (with 95% confidence bounds):
%        a =   2.034e+05  (5.929e+04, 3.475e+05)
%        b =       2.024  (1.881, 2.168)
%        c =   9.086e+04  (9.086e+04, 9.086e+04)
% 
% Goodness of fit:
%   SSE: 0.0001056
%   R-square: 1
%   Adjusted R-square: 1
%   RMSE: 0.01027

% MyCoeffs = coeffvalues(fittedmodel) 
% 203399.063568663
% 2.02414408889605
% 90863.0485600015