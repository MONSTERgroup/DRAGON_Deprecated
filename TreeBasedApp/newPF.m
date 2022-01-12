function newPF(app, nvp)
arguments
    app DRAGON
    nvp.Parent
end

if isfield(nvp, 'Parent')
    p = nvp.Parent;
else
    error('Error, no parent ODF specified for pole figure.')
end

t = uitreenode('Parent',p);
t.Text = 'PF';
t.Tag = 'PF';

end

