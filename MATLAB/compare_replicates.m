% read Sosik chlorophyll data from GitHub
urlwrite('https://raw.githubusercontent.com/WHOIGit/nes-lter-examples/master/data/neslter_sosik_chl.csv', 'local.csv');
T = readtable('local.csv');

% limit to cruise EN608 WSW samlples
T = T(strcmp(T.cruise, 'EN608'),:);
T = T(strcmp(T.filter_mesh_size, '>0'),:);

% separate out the a and b replicates
rep_a = T(strcmp(T.replicate, 'a'),:);
rep_b = T(strcmp(T.replicate, 'b'),:);

% merge rep_a and rep_b to put replicates side by side
for ii = 1:size(rep_a,1)
   temp = rep_b((rep_b.cast==rep_a.cast(ii) & rep_b.niskin==rep_a.niskin(ii)),:);
   if ~isempty(temp)
       rep_b_match2a(ii,:) = temp;
   end
end

% plot a against b
plot(rep_a.chl, rep_b_match2a.chl, '.')