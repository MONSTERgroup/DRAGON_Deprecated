function newODF(app, nvp)
arguments
    app DRAGON
    nvp.Parent uitree
end

if isfield(nvp, 'Parent')
    p = nvp.Parent;
else
    p = app.WS;
end

t = uitreenode('Parent',p);
t.Text = 'ODF';
t.Tag = 'ODF';

end

