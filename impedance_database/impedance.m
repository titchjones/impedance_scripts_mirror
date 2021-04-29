function elem = impedance(famname,class,L,material,conductivity,thickness,apertures,varargin)
%IMPEDANCE Creates an impedance element
%IMPEDANCE ('FAMNAME',limits, method)

%  INPUTS
%  1. FAMNAME	    - Family name
%  2. CLASS         - Class
%  3. L             - Element length [m]
%  4. MATERIAL      - Vector with material name
%  5. CONDUCTIVITY  - Vector with conductivity for materials  (S/m)
%  6. THICKNESS     - Vector with tickness for materials [m]
%  7. APERTURES     - Aperatures [m], [(Xmin_upstream, Xmax_upstream, Ymin_upstream, Ymax_upstream);...
%                                       (Xmin_downstream, Xmax_downstream, Ymin_downstream, Ymax_downstream)]
%
%  OPTIONS (order does not matter)
%  
%  8. RW_IMPEDANCE_FILES       - Path to resistive-wall impedance files (x,y,z)
%  9. RW_WAKE_FILES      - Path to resistive-wall wake files (x,y,z)
%  10. GEOM_IMPEDANCE_FILES    - Path to geometric impedance files (x,y,z)
%  11. GEOM_WAKE_FILES   - Path to geometric wake files (x,y,z)
%  12. RW_K_FACTORS      - Vector of resistive-wall kick/loss factors [x(V/pC/mm) y(V/pC/mm) z(V/pC)]
%  14. GEOM_K_FACTORS    - Vector of geometric kick/loss factors [x(V/pC/mm) y(V/pC/mm) z(V/pC)]
%  15. GEOM_FIT    - Struct with fit of geometric impedance
%
%  OUTPUTS
%  1. ELEM - Structure with the AT element

    elem.FamName = famname;
    elem.Class = class;
    elem.Length = L;
    elem.Material = material;
    elem.Conductivity = conductivity;
    elem.Thickness = thickness;
    elem.Apertures = apertures;

    if nargin > 7

        for i = 1:(length(varargin) - 1)
            if strcmpi(varargin{i}, 'RW_impedance_files')
                elem.RW_impedance_files = varargin{i+1};
            elseif strcmpi(varargin{i}, 'RW_wake_files')
                elem.RW_wake_files = varargin{i+1};
            elseif strcmpi(varargin{i}, 'Geom_impedance_files')
                elem.Geom_impedance_files = varargin{i+1};       
            elseif strcmpi(varargin{i}, 'Geom_wake_files')
                elem.Geom_wake_files = varargin{i+1};                   
            elseif strcmpi(varargin{i}, 'RW_k_factors')
                elem.RW_k_factors = varargin{i+1};
            elseif strcmpi(varargin{i}, 'Geom_k_factors')
                elem.Geom_k_factors = varargin{i+1};
            elseif strcmpi(varargin{i}, 'Geom_fit')
                elem.Geom_fit = varargin{i+1};              
            end

        end        

    end

end
