%% for 19 fusis
clear
source = 39:57;
for i = 1:length(source)
    target = source(i)-19;
    k=14*(i-1)+1:14*(i);
    connectivity(k,1)=source(i);
    connectivity(k,2)=[target+[1:7] target-[1:7]];
    connectivity(k,3)=[1 2 3 3 3 2 1 1 2 3 3 3 2 1];
end
    %delete any rows that include targets above 38 or below 20 in column 2
rowsToKeep = connectivity(:, 2) >= 20 & connectivity(:, 2) <= 38;

% Keep only the rows that satisfy the condition
filteredconnectivity = connectivity(rowsToKeep, :);

%% Connect Int to Fusi
clear
source = 401:600;
for i = 1:length(source)
    target = source(i)-200;
    k=14*(i-1)+1:14*(i);
    connectivity(k,1)=source(i);
    connectivity(k,2)=[target+[1:7] target-[1:7]];
    connectivity(k,3)=[1 2 3 3 3 2 1 1 2 3 3 3 2 1];
end
    %delete any rows that include targets above 38 or below 20 in column 2
rowsToKeep = connectivity(:, 2) >= 201 & connectivity(:, 2) <= 400;

% Keep only the rows that satisfy the condition
filteredconnectivity = connectivity(rowsToKeep, :);

T = table(filteredconnectivity(:,1), ...
    repmat('Int',length(filteredconnectivity),1),...
    filteredconnectivity(:,2), ...
    repmat('Fusi',length(filteredconnectivity),1),...
    repmat('spiking',length(filteredconnectivity),1),...
    repmat('b',length(filteredconnectivity),1),...
    repmat([0],length(filteredconnectivity),1),...
    repmat([1],length(filteredconnectivity),1),...
    filteredconnectivity(:,3), ...
    'VariableNames', {'Source ID', 'Description', 'Target ID', 'Description2', 'Type', 'ID', 'Delay', 'Random factor', 'Gain modulator'});

%% plot showing strength of inhibition relative to distance
figure; clf
% plot(sort([connectivity(k,2) connectivity(k,3)],2),'k-')
plot(connectivity(k,2), connectivity(k,3),'k-')
ylabel('relative strength of inhibition')
xlabel('Neuron number')
ylim([0 4])

%% Connect SGN to Fusi
clear
clc
source = 1:200;
for i = 1:length(source)
    target = source(i)+200;
    connectivity(i,1)=source(i);
    connectivity(i,2)=target;
    connectivity(i,3)=1;
end
   
T = table(connectivity(:,1), ...
    repmat('SGN',length(connectivity),1),...
    connectivity(:,2), ...
    repmat('Fusi',length(connectivity),1),...
    repmat('spiking',length(connectivity),1),...
    repmat('f',length(connectivity),1),...
    repmat([0],length(connectivity),1),...
    repmat([1],length(connectivity),1),...
    connectivity(:,3), ...
    'VariableNames', {'Source ID', 'Description', 'Target ID', 'Description2', 'Type', 'ID', 'Delay', 'Random factor', 'Gain modulator'});

%% Connect Fusi to Int
clear
clc
source = 201:400;
for i = 1:length(source)
    target = source(i)+200;
    connectivity(i,1)=source(i);
    connectivity(i,2)=target;
    connectivity(i,3)=1;
end
   
T = table(connectivity(:,1), ...
    repmat('Fusi',length(connectivity),1),...
    connectivity(:,2), ...
    repmat('Int',length(connectivity),1),...
    repmat('spiking',length(connectivity),1),...
    repmat('a',length(connectivity),1),...
    repmat([0],length(connectivity),1),...
    repmat([1],length(connectivity),1),...
    connectivity(:,3), ...
    'VariableNames', {'Source ID', 'Description', 'Target ID', 'Description2', 'Type', 'ID', 'Delay', 'Random factor', 'Gain modulator'});


%% Connect Fusi to IC
clear
clc
source = 201:400;
for i = 1:length(source)
    target = source(i)+400;
    connectivity(i,1)=source(i);
    connectivity(i,2)=target;
    connectivity(i,3)=1;
end
   
T = table(connectivity(:,1), ...
    repmat('Fusi',length(connectivity),1),...
    connectivity(:,2), ...
    repmat('IC',length(connectivity),1),...
    repmat('spiking',length(connectivity),1),...
    repmat('g',length(connectivity),1),...
    repmat([0],length(connectivity),1),...
    repmat([1],length(connectivity),1),...
    connectivity(:,3), ...
    'VariableNames', {'Source ID', 'Description', 'Target ID', 'Description2', 'Type', 'ID', 'Delay', 'Random factor', 'Gain modulator'});

%% Connect IC back to Fusi
clear
clc
source = 601:800;
for i = 1:length(source)
    target = source(i)-400;
    connectivity(i,1)=source(i);
    connectivity(i,2)=target;
    connectivity(i,3)=1;
end
   
T = table(connectivity(:,1), ...
    repmat('IC',length(connectivity),1),...
    connectivity(:,2), ...
    repmat('Fusi',length(connectivity),1),...
    repmat('spiking',length(connectivity),1),...
    repmat('h',length(connectivity),1),...
    repmat([0],length(connectivity),1),...
    repmat([1],length(connectivity),1),...
    connectivity(:,3), ...
    'VariableNames', {'Source ID', 'Description', 'Target ID', 'Description2', 'Type', 'ID', 'Delay', 'Random factor', 'Gain modulator'});

%% Connect IC back to Int
clear
clc
source = 601:800;
for i = 1:length(source)
    target = source(i)-200;
    connectivity(i,1)=source(i);
    connectivity(i,2)=target;
    connectivity(i,3)=1;
end
   
T = table(connectivity(:,1), ...
    repmat('IC',length(connectivity),1),...
    connectivity(:,2), ...
    repmat('Int',length(connectivity),1),...
    repmat('spiking',length(connectivity),1),...
    repmat('i',length(connectivity),1),...
    repmat([0],length(connectivity),1),...
    repmat([1],length(connectivity),1),...
    connectivity(:,3), ...
    'VariableNames', {'Source ID', 'Description', 'Target ID', 'Description2', 'Type', 'ID', 'Delay', 'Random factor', 'Gain modulator'});