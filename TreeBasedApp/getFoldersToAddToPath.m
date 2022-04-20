function [d,p] = getFoldersToAddToPath(p)

arguments
    p {mustBeFolder}
end

d = dir(p);
d = d(cellfun(@(x) x == 1, {d.isdir}));
d = d(~cellfun(@(x) strcmp(x(1), '@'), {d.name}));
d = d(~cellfun(@(x) strcmp(x, '.') || strcmp(x, '..'), {d.name}));

% I'm lazy and overwriting the input argument p now that I don't need it.
p = cellfun(@(x,y) fullfile(x,y), {d.folder}, {d.name}, 'UniformOutput', false);
[d(:).path] = p{:};

p = p';

fprintf('Planning to add the following to the MATLAB search path:\n');
cellfun(@(x) fprintf('%s\n',x), p);

end