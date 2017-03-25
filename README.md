<a href="http://www.ruby-lang.org/en/">Ruby</a>
===

&nbsp; The root folder contains <a href="https://github.com/Ice101781/scripts/blob/master/Ruby/Math.rb">`Math.rb`</a>, which supports a timer, some basic trigonometric functions, and a class for Imaginary numbers. Computation for the images below was done on a first-gen Microsoft Surface Pro with the following specs: Intel Core i5-3317U @ 1.7 GHz, 4GB RAM, Windows 10.

<br>

* <a href="#julia-sets">Julia Sets</a>
* <a href="#riemann-zeta-function">Riemann Zeta Function</a>

<a name="julia-sets" href="http://en.wikipedia.org/wiki/Julia_set">Julia Sets</a>
---

&nbsp; <a href="https://github.com/Ice101781/scripts/blob/master/Ruby/Julia%20Sets/julia.rb">`julia.rb`</a> estimates fractals of the form `f(z) = z^2 + c` using a brute-force approach. The program creates a
<a href="https://en.wikipedia.org/wiki/Polar_coordinate_system">polar</a> mesh on the space of <a href="https://en.wikipedia.org/wiki/Complex_number">complex numbers</a>. This has a softening effect on the edges of the images, since the density of points in the mesh decreases outward from the origin. As the script finishes, a two-dimensional array containing points in the set is saved to a `.csv` file. Graphing software can then be used to view the result.

<br>

<p align="center">
  <img width="650" alt="powershell-julia" src="https://drive.google.com/uc?export=download&id=0B3rehuqgDPeVZG12cWJ6ODFyN2c" />
</p>

<br>

<img alt="" width="" src="https://drive.google.com/uc?export=download&id=0B3rehuqgDPeVNUVuZ21jeEZGOEk" />
<br>

&nbsp; <i>Graph of a <a href="https://en.wikipedia.org/wiki/Douady_rabbit">Douady Rabbit</a>.</i>
<br>

<img width="" alt="Douady's Rabbit" src="https://drive.google.com/uc?export=download&id=0B3rehuqgDPeVb3JZMHBjOVdtTGM" />
<br>

<img alt="" width="" src="https://drive.google.com/uc?export=download&id=0B3rehuqgDPeVMUFhOVM4UDZJTVE" />
<br>

<img alt="" width="" src="https://drive.google.com/uc?export=download&id=0B3rehuqgDPeVZmtLUHFyTHB5ZHM" />
<br>

<br>

<a name="riemann-zeta-function" href="https://en.wikipedia.org/wiki/Riemann_zeta_function">Riemann Zeta Function</a>
---

&nbsp; <a href="https://github.com/Ice101781/scripts/blob/master/Ruby/Riemann%20Zeta%20Function/recip_zeta.rb">`recip_zeta.rb`</a> approximates the <a href="https://en.wikipedia.org/wiki/Absolute_value">modulus</a> of the reciprocal <a href="https://en.wikipedia.org/wiki/Riemann_zeta_function">Riemann Zeta function</a> in terms of the <a href="https://en.wikipedia.org/wiki/Dirichlet_eta_function">Dirichlet Eta function</a>. The reciprocal is used to make visual location of the <a href="https://en.wikipedia.org/wiki/Riemann_hypothesis">zeros</a> easier. The computational mesh used to generate the image is the region `{(x, yi) : 0.005 <= x <= 0.95, 0.1 <= y <= Y}`, where `Y` is a user-selected parameter. Program output is a `190 x 10Y` array saved in `.csv` format.

<br>

<p align="center">
  <img width="650" alt="powershell-riemann" src="https://drive.google.com/uc?export=download&id=0B3rehuqgDPeVRlR3ZW90Tm5VTlU" />
</p>

<br>

&nbsp; <i>The zeros of the Riemann Zeta function up to 100i. They appear in the graph as twenty-nine peaks beginning around 14i.<i>

<img alt="" width="" src="https://drive.google.com/uc?export=download&id=0B3rehuqgDPeVUzhLVkl2dVp0eXM" />
<br>
