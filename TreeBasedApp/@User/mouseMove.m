function mouseMove(~, ~, ax, gobj)

% Get mouse coordinate, round to nearest integer.
C = ax.CurrentPoint;
x = C(1,1); %round(C(1,1));
y = C(1,2); %round(C(1,2));
% If mouse isn't on axis, do nothing.
if x < ax.XLim(1) || x > ax.XLim(2) || y < ax.YLim(1) || y > ax.YLim(2)
    return
end
% Update crosshairs
gobj(1).Value = x;
gobj(1).Label = x;
gobj(2).Value = y;
gobj(2).Label = y;

end