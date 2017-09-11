
m.magn_rad       = da2/2
m.rotor_rad      = da2/2
m.yoke_rad       = dy2/2

m.magn_height     =    ${model.get(['magnet','magnetIron2', 'magn_height'])*1e3}
m.magn_width      =    ${model.get(['magnet','magnetIron2', 'magn_width'])*1e3}
m.gap_ma_iron     =    ${model.get(['magnet','magnetIron2', 'gap_ma_iron'])*1e3}
m.air_triangle    =    ${model.get(['magnet','magnetIron2', 'air_triangle'])}
m.iron_height     =    ${model.get(['magnet','magnetIron2', 'iron_height'])*1e3}
m.magn_rem        =    ${model.get(['magnet','magnetIron2', 'magn_rem'])}
m.shaft_rad      =     ${model.get(['magnet','magnetIron2', 'condshaft_r'])*1e3}
m.gap_ma_rigth    =    ${model.get(['magnet','magnetIron2', 'gap_ma_right'])*1e3}
m.gap_ma_left     =    ${model.get(['magnet','magnetIron2', 'gap_ma_left'])*1e3}
m.magn_ori        =    ${model.get(['magnet','magnetIron2', 'magn_ori'])}
m.iron_shape      =    ${model.get(['magnet','magnetIron2', 'iron_shape'])*1e3}

m.zeroangl        =     0.0
m.cond_shaft      =     0.000

m.mcvkey_yoke     =   mcvkey_yoke
m.nodedist        =   ${model.magnet.get('nodedist',1)}

 pre_models("Magnet Iron 2")

%if isinstance(model.get(['magnet','material'],0), dict):
orient = ${model.magnet['material'].get('orient', 'mpolaniso')}
mcv = '${model.magnet['material']['name']}'
rlen = ${model.magnet['material'].get('rlen', 1)*100}

for i = 0, m.npols_gen-1 do
    x0, y0 = pr2c(m.magn_rad*math.cos(math.pi/m.num_poles)) - m.magn_height/2 -m.iron_shape,
                  (2*i+1)*math.pi/m.num_poles)
    if i % 2 == 0 then
        def_mat_pm_nlin(x0, y0, red, mcv, 0, orient, rlen)
    else
        def_mat_pm_nlin(x0, y0, green, mcv, 180, orient, rlen)
    end
end
%endif
