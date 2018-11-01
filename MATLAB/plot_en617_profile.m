% construct URL to data file
base_url = 'https://raw.githubusercontent.com/WHOIGit/nes-lter-examples/master/data/';
fname = 'en617_ctd_profiles.csv';

% read CSV data from GitHub
url = strcat(base_url,fname);
urlwrite(url, 'local.csv');
T = readtable('local.csv');

% extract depth and chl
dvc = T{T.cast == 13, {'depsm','fleco_afl'}};
depth = dvc(:,1);
chl = dvc(:,2);

% plot the profile
figure;
plot(chl, depth);
set(gca,'xaxisLocation','top')
set(gca,'YDir','reverse');