function p = findParentFig(h)
arguments
    h {mustBeGraphicsObject(h)}
end

p = ancestor(h, {'figure', 'uifigure'});

end

function mustBeGraphicsObject(a)
    if ~(isgraphics(a))
        eidType = 'mustBeGraphicsObject:notGraphicsObject';
        msgType = 'Input must be a graphics object.';
        throwAsCaller(MException(eidType,msgType))
    end
end