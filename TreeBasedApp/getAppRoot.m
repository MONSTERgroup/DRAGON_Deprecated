function p = getAppRoot
    if ~(ismcc || isdeployed)
        p = pwd;
    elseif isdeployed
        p = ctfroot;
    end
end