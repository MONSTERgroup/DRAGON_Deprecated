function newODF(app, nvp)
arguments
    app DRAGON
    nvp.Parent
end

if isfield(nvp, 'Parent')
    p = nvp.Parent;
else
    p = app.WS;
end

t = uitreenode('Parent',p);
t.Text = 'ODF';
t.Tag = 'ODF';

t.UserData = HierarchicalODF;

end

