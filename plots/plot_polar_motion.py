from astropy.coordinates.builtin_frames.utils import get_polar_motion
from astropy.time import Time
import astropy.units as u
import numpy as np
import matplotlib.pyplot as plt


t = Time('2010-01-01T00:00') + np.linspace(0, 10 * 365, 5000) * u.day
xp, yp = get_polar_motion(t)




fig = plt.figure(figsize=(6, 5))
ax = fig.add_subplot(111, projection='3d')


ax.plot(np.rad2deg(xp) * 3600, np.rad2deg(yp) * 3600, t.mjd)

ax.set_xlabel(r'$x_p \,\,/\,\, \mathrm{as}$')
ax.set_ylabel(r'$y_p \,\,/\,\, \mathrm{as}$')

years = np.arange(2010, 2021, 1)
ticks = Time([f'{y}-01-01T00:00' for y in years])
ax.set_zticks(ticks.mjd)
ax.set_zticklabels(years.astype(str))

ax.view_init(elev=20, azim=45)

fig.tight_layout()
fig.savefig('build/polar_motion.pdf')
