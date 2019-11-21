**Title**
Assessing regulatory features of the current transcriptional network of Saccharomyces cerevisiae

**Authors**
Pedro T. Monteiro, Tiago Pedreira, Monica Galocha, Miguel C. Teixeira, Claudine Chaouiya

---

This work relies on a bash script ``run.sh`` to be run on a nix environment.
* Linux
* OSX
* Windows with a Bash shell (e.g. cygwin)

Additionally, it calls Python 3 scripts for more specific analyses.

The results from each analysis may need gnuplot (provided by GraphViz) installed, to generate the associated plots for data visualization.

---

Input
=====
This work considers the following 4 networks as input:
* Costanzo et al. - ``Costanzo_dataset.txt``
* Balaji et al.   - ``Balaji_dataset.txt``
* YEASTRACT 2017  - ``yeast2017-full-conds-net.txt``
* YEASTRACT 2019  - ``yeast2019-full-conds-net.txt``


Network characteristics
=======================
The Bash script ``run.sh`` starts by extracting network characteristics (# nodes, # edges, # TFs, # TGs) from each network.
Also, it computes the intersection between the:
* Balaji et al. network and YEASTRACT 2019 Binding
* Balaji et al. network and YEASTRACT 2019 Binding and Expression
This information is used in Table 1.


Additionally, for the YEASTRACT networks, it extracts the subnetworks considering interactions with:
* only Binding evidence
* only Expression evidence
* both Binding and Expression evidence
and for those with Expression evidence, how many classified as:
* Positive
* Negative
* Dual
This information is used for Figure 1.


Degree analysis
===============
For the (In and Out) degree analysis, we rely on the ``degree.py`` Python 3 script which needs to be called independently for each network.

The network file is passed simply as a command line argument.
(ex: `python3 degree.py Balaji_dataset.txt`)

The multiple files generated for each network are then processed by gnuplot.
For example, in the run.sh file, the command:
`gnuplot  indegcount2019.gnuplot`
generates the In degree plot comparing:
* YEASTRACT 2019 Binding plus Expression
* YEASTRACT 2019 Expression
* YEASTRACT 2019 Binding
* YEASTRACT 2019 Binding and Expression
* Balaji et al.
* Costanzo et al.

Many other gnuplot files are available to provide other views of the network's In and Out degrees.


Co-regulation analysis
======================
Similarly to the degree analysis, we rely on a Python 3 script ``co-regulation.py``, to analyse each network individually and generate the necessary intermediate files.

The network file is passed simply as a command line argument.
(ex: `python3 co-regulation.py Balaji_dataset.txt`)

Again, gnuplot is used to visualise the information contained in the intermediate files related to TF co-regulation. In particular, the comparison between all networks:
`gnuplot coreg2019.gnuplot`
or the computation the 26 TFs with more/less co-regulators:
`gnuplot -c tfcoregmoreless.gnuplot Balaji_dataset.coregmore.pdf Balaji_dataset.coregmore`


Motif analysis
==============
For the motif analysis, the run.sh script further divides the YEASTRACT networks with respect to the interaction environmental condition (e.g. Control, Stress, ...).

The user can then pass each of these networks individually to the ``motifs.py`` Python 3 script to call the gtrieScanner software (which extracts the triad enrichment) and process all the intermediate files.
For a given network, it generates a .csv file with the Z-score of each of the 13 triad motifs to be easily open in a Spreadsheet.

Finally, the ``yeast2019-all-motifs.gnuplot`` and ``yeast2017-2019-motifs.gnuplot``, read the motif profiles and rely on gnuplot to generate the motif enrichment plots.
