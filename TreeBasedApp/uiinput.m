function [x, y, b] = uiinput(n, ax)
arguments
    n uint32
    ax {mustBeA(ax,{'matlab.graphics.axis.Axes', 'matlab.ui.control.UIAxes'})}
end

% create crosshairs
xhs(1) = xline(min(xlim(ax)), 'k-','Parent',ax);
xhs(2) = yline(min(ylim(ax)), 'k-','Parent',ax);

u = User;
temp = ax.UserData;
ax.UserData = 0;

set(findParentFig(ax), 'windowbuttonmotionfcn', {@User.mouseMove, ax, xhs})
set(findParentFig(ax), 'windowbuttondownfcn', {@u.mouseClick, ax})
set(findParentFig(ax), 'keypressfcn', {@u.keyboardPress})

waitfor(ax, 'UserData', n)
set(findParentFig(ax), 'windowbuttonmotionfcn', [])
set(findParentFig(ax), 'windowbuttondownfcn', [])
set(findParentFig(ax), 'keypressfcn', [])

ax.UserData = temp;
clear temp;

x = u.mousepos(1,:);
y = u.mousepos(2,:);
b = u.b;

delete(u);
delete(xhs);

end