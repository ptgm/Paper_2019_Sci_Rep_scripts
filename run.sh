###########################################
############################ YEASTRACT 2017 
echo "* YEASTRACT 2017 - B or E *"
cat yeast2017-full-conds-net.txt | grep -v Unknown > yeast2017-B-E-net.txt
echo "  - nodes:" `cut -f1,2 yeast2017-B-E-net.txt | sed -e 's/\t/\n/g'| sort | uniq | wc -l`
echo "    . TFs:" `cut -f1 yeast2017-B-E-net.txt | sort | uniq | wc -l`
echo "    . TGs:" `cut -f2 yeast2017-B-E-net.txt | sort | uniq | wc -l`
echo "  - edges:" `cat yeast2017-B-E-net.txt | wc -l`

echo "* YEASTRACT 2017 - B *"
cat yeast2017-B-E-net.txt  | grep Direct > yeast2017-B-net.txt
echo "  - nodes:" `cut -f1,2 yeast2017-B-net.txt | sed -e 's/\t/\n/g'| sort | uniq | wc -l`
echo "    . TFs:" `cut -f1 yeast2017-B-net.txt | sort | uniq | wc -l`
echo "    . TGs:" `cut -f2 yeast2017-B-net.txt | sort | uniq | wc -l`
echo "  - edges:" `cat yeast2017-B-net.txt | wc -l`

echo "* YEASTRACT 2017 - E *"
cat yeast2017-B-E-net.txt | grep -P "(Indirect\t|irect )" > yeast2017-E-net.txt
cat yeast2017-E-net.txt | grep "Positive" > yeast2017-E-P-net.txt
cat yeast2017-E-net.txt | grep "Negative" > yeast2017-E-N-net.txt
cat yeast2017-E-net.txt | grep "Dual"     > yeast2017-E-D-net.txt
echo "  - nodes:" `cut -f1,2 yeast2017-E-net.txt | sed -e 's/\t/\n/g'| sort | uniq | wc -l`
echo "    . TFs:" `cut -f1 yeast2017-E-net.txt | sort | uniq | wc -l`
echo "    . TGs:" `cut -f2 yeast2017-E-net.txt | sort | uniq | wc -l`
echo "  - edges:" `cat yeast2017-E-net.txt | wc -l`
echo "    . P:" `cat yeast2017-E-P-net.txt | wc -l`
echo "    . N:" `cat yeast2017-E-N-net.txt | wc -l`
echo "    . D:" `cat yeast2017-E-D-net.txt | wc -l`

echo "* YEASTRACT 2017 - B & E *"
cat yeast2017-B-E-net.txt  | grep "Direct " > yeast2017-BE-net.txt
cat yeast2017-BE-net.txt | grep "Positive" > yeast2017-BE-P-net.txt
cat yeast2017-BE-net.txt | grep "Negative" > yeast2017-BE-N-net.txt
cat yeast2017-BE-net.txt | grep "Dual"     > yeast2017-BE-D-net.txt
echo "  - nodes:" `cut -f1,2 yeast2017-BE-net.txt | sed -e 's/\t/\n/g'| sort | uniq | wc -l`
echo "    . TFs:" `cut -f1 yeast2017-BE-net.txt | sort | uniq | wc -l`
echo "    . TGs:" `cut -f2 yeast2017-BE-net.txt | sort | uniq | wc -l`
#echo "    . P:" `cut -f1,2 yeast2017-BE-P-net.txt | sed -e 's/\t/\n/g'| sort | uniq | wc -l`
#echo "    . N:" `cut -f1,2 yeast2017-BE-N-net.txt | sed -e 's/\t/\n/g'| sort | uniq | wc -l`
#echo "    . D:" `cut -f1,2 yeast2017-BE-D-net.txt | sed -e 's/\t/\n/g'| sort | uniq | wc -l`
echo "  - edges:" `cat yeast2017-BE-net.txt | wc -l`
echo "    . P:" `cat yeast2017-BE-P-net.txt | wc -l`
echo "    . N:" `cat yeast2017-BE-N-net.txt | wc -l`
echo "    . D:" `cat yeast2017-BE-D-net.txt | wc -l`


###########################################
echo "------------------------------------"
###########################################
############################ YEASTRACT 2019
echo "* YEASTRACT 2019 - B or E *"
cat yeast2019-full-conds-net.txt | grep -v Unknown > yeast2019-B-E-net.txt
echo "  - nodes:" `cut -f1,2 yeast2019-B-E-net.txt | sed -e 's/\t/\n/g'| sort | uniq | wc -l`
echo "    . TFs:" `cut -f1 yeast2019-B-E-net.txt | sort | uniq | wc -l`
echo "    . TGs:" `cut -f2 yeast2019-B-E-net.txt | sort | uniq | wc -l`
echo "  - edges:" `cat yeast2019-B-E-net.txt | wc -l`

echo "* YEASTRACT 2019 - B *"
cat yeast2019-B-E-net.txt  | grep Direct > yeast2019-B-net.txt
echo "  - nodes:" `cut -f1,2 yeast2019-B-net.txt | sed -e 's/\t/\n/g'| sort | uniq | wc -l`
echo "    . TFs:" `cut -f1 yeast2019-B-net.txt | sort | uniq | wc -l`
echo "    . TGs:" `cut -f2 yeast2019-B-net.txt | sort | uniq | wc -l`
echo "  - edges:" `cat yeast2019-B-net.txt | wc -l`

echo "* YEASTRACT 2019 - E *"
cat yeast2019-B-E-net.txt | grep -P "(Indirect\t|irect )" > yeast2019-E-net.txt
cat yeast2019-E-net.txt | grep "Positive" > yeast2019-E-P-net.txt
cat yeast2019-E-net.txt | grep "Negative" > yeast2019-E-N-net.txt
cat yeast2019-E-net.txt | grep "Dual"     > yeast2019-E-D-net.txt
echo "  - nodes:" `cut -f1,2 yeast2019-E-net.txt | sed -e 's/\t/\n/g'| sort | uniq | wc -l`
echo "    . TFs:" `cut -f1 yeast2019-E-net.txt | sort | uniq | wc -l`
echo "    . TGs:" `cut -f2 yeast2019-E-net.txt | sort | uniq | wc -l`
echo "  - edges:" `cat yeast2019-E-net.txt | wc -l`
echo "    . P:" `cat yeast2019-E-P-net.txt | wc -l`
echo "    . N:" `cat yeast2019-E-N-net.txt | wc -l`
echo "    . D:" `cat yeast2019-E-D-net.txt | wc -l`

echo "* YEASTRACT 2019 - B & E *"
cat yeast2019-B-E-net.txt  | grep "Direct " > yeast2019-BE-net.txt
cat yeast2019-BE-net.txt | grep "Positive" > yeast2019-BE-P-net.txt
cat yeast2019-BE-net.txt | grep "Negative" > yeast2019-BE-N-net.txt
cat yeast2019-BE-net.txt | grep "Dual"     > yeast2019-BE-D-net.txt
echo "  - nodes:" `cut -f1,2 yeast2019-BE-net.txt | sed -e 's/\t/\n/g'| sort | uniq | wc -l`
echo "    . TFs:" `cut -f1 yeast2019-BE-net.txt | sort | uniq | wc -l`
echo "    . TGs:" `cut -f2 yeast2019-BE-net.txt | sort | uniq | wc -l`
#echo "    . P:" `cut -f1,2 yeast2019-BE-P-net.txt | sed -e 's/\t/\n/g'| sort | uniq | wc -l`
#echo "    . N:" `cut -f1,2 yeast2019-BE-N-net.txt | sed -e 's/\t/\n/g'| sort | uniq | wc -l`
#echo "    . D:" `cut -f1,2 yeast2019-BE-D-net.txt | sed -e 's/\t/\n/g'| sort | uniq | wc -l`
echo "  - edges:" `cat yeast2019-BE-net.txt | wc -l`
echo "    . P:" `cat yeast2019-BE-P-net.txt | wc -l`
echo "    . N:" `cat yeast2019-BE-N-net.txt | wc -l`
echo "    . D:" `cat yeast2019-BE-D-net.txt | wc -l`


###########################################
################################# Constanzo
echo "* Costanzo - 2001 *"
if [ ! -f Costanzo_dataset.txt ]; then
	wget http://www.weizmann.ac.il/mcb/UriAlon/sites/mcb.UriAlon/files/uploads/CollectionsOfComplexNetwroks/yeastinter_st.txt
	cat yeastinter_st.txt | sed -e 's/ /\t/g' > Costanzo_dataset.txt; rm -f yeastinter_st.txt
fi
echo "  - nodes:" `cut -f1,2 Costanzo_dataset.txt | sed -e 's/\t/\n/g' | sort | uniq | wc -l`
echo "    . TFs:" `cut -f1 Costanzo_dataset.txt | sort | uniq | wc -l`
echo "    . TGs:" `cut -f2 Costanzo_dataset.txt | sort | uniq | wc -l`
echo "  - edges:" `cat Costanzo_dataset.txt | sort | uniq | wc -l`


###########################################
#################################### Balaji
echo "* Balaji - 2006 *"
echo "  - nodes:" `cut -f1,2 Balaji_dataset.txt | sed -e 's/\t/\n/g' | sort | uniq | wc -l`
echo "    . TFs:" `cut -f1 Balaji_dataset.txt | sort | uniq | wc -l`
echo "    . TGs:" `cut -f2 Balaji_dataset.txt | sort | uniq | wc -l`
echo "  - edges:" `cat Balaji_dataset.txt | sort | uniq | wc -l`

echo "Balaji & yeast2019-B"
cat yeast2019-B-net.txt | cut -f1,2 | sort > tmpYeastB
cat Balaji_dataset.txt  | cut -f1,2 | sort > tmpBalaji
echo "  . Inter:" `comm -12 tmpYeastB tmpBalaji | wc -l`

echo "Balaji & yeast2019-BE"
cat yeast2019-BE-net.txt | cut -f1,2 | sort > tmpYeastBE
echo "  . Inter:" `comm -12 tmpYeastBE tmpBalaji | wc -l`
rm -f tmpYeastB tmpBalaji tmpYeastBE


###################################################################################
nets="yeast2017-B-E-net.txt yeast2017-E-net.txt yeast2017-B-net.txt yeast2017-BE-net.txt yeast2019-B-E-net.txt yeast2019-E-net.txt yeast2019-B-net.txt yeast2019-BE-net.txt Balaji_dataset.txt Costanzo_dataset.txt"


###################################################################################
echo "DEGREE ANALYSIS"
###################################################################################
# Call python3 to generate the in/out degree data and associated plots
for net in ${nets}; do
	python3 degree.py $net
done

# YEASTRACT 2017
gnuplot  indegcount2017.gnuplot
gnuplot outdegcount2017.gnuplot
gnuplot   indegdist2017.gnuplot
gnuplot  outdegdist2017.gnuplot
gnuplot  indegordered2017.gnuplot
gnuplot outdegordered2017.gnuplot

# YEASTRACT 2019
gnuplot  indegcount2019.gnuplot
gnuplot outdegcount2019.gnuplot
gnuplot   indegdist2019.gnuplot
gnuplot  outdegdist2019.gnuplot
gnuplot  indegordered2019.gnuplot
gnuplot outdegordered2019.gnuplot


# Compute TFs with 20 most/less outdegree
# YEASTRACT 2017
gnuplot -c tfout25moreless.gnuplot 'yeast2017-BE-net.outdegord25more.pdf' 'yeast2017-BE-net.outdegord25more'
gnuplot -c tfout25moreless.gnuplot 'yeast2017-BE-net.outdegord25less.pdf' 'yeast2017-BE-net.outdegord25less'
# YEASTRACT 2019
gnuplot -c tfout25moreless.gnuplot 'yeast2019-BE-net.outdegord25more.pdf' 'yeast2019-BE-net.outdegord25more'
gnuplot -c tfout25moreless.gnuplot 'yeast2019-BE-net.outdegord25less.pdf' 'yeast2019-BE-net.outdegord25less'


###################################################################################
# Call python3 to generate the co-regulation data and associated plots
for net in ${nets}; do
	python3 co-regulation.py $net
	bname=`basename $net .txt`
	# Generate the plots - more
	gnuplot -c tfcoregmoreless.gnuplot $bname".coregmore.pdf" $bname".coregmore"
	# Generate the plots - less
	gnuplot -c tfcoregmoreless.gnuplot $bname".coregless.pdf" $bname".coregless"
done

# YEASTRACT 2017
S=0; for v in `cut -f2 yeast2017-B-net.tfcoregs`; do S=$((S+v)); done;
avg=$((S/`cat yeast2017-B-net.tfcoregs | wc -l`))
gnuplot -c tfcoregs.gnuplot "yeast2017-B-net-tfcoregs.pdf"    $avg 2500 "yeast2017-B-net.tfcoregs"
S=0; for v in `cut -f2 yeast2017-BE-net.tfcoregs`; do S=$((S+v)); done;
avg=$((S/`cat yeast2017-BE-net.tfcoregs | wc -l`))
gnuplot -c tfcoregs.gnuplot "yeast2017-BE-net-tfcoregs.pdf"   $avg 1000 "yeast2017-BE-net.tfcoregs"

# YEASTRACT 2019
S=0; for v in `cut -f2 yeast2019-B-net.tfcoregs`; do S=$((S+v)); done;
avg=$((S/`cat yeast2019-B-net.tfcoregs | wc -l`))
gnuplot -c tfcoregs.gnuplot "yeast2019-B-net-tfcoregs.pdf"    $avg 2500 "yeast2019-B-net.tfcoregs"
S=0; for v in `cut -f2 yeast2019-BE-net.tfcoregs`; do S=$((S+v)); done;
avg=$((S/`cat yeast2019-BE-net.tfcoregs | wc -l`))
gnuplot -c tfcoregs.gnuplot "yeast2019-BE-net-tfcoregs.pdf"   $avg 1000 "yeast2019-BE-net.tfcoregs"

S=0; for v in `cut -f2 Balaji_dataset.tfcoregs`; do S=$((S+v)); done;
avg=$((S/`cat Balaji_dataset.tfcoregs | wc -l`))
gnuplot -c tfcoregs.gnuplot "Balaji_dataset-tfcoregs.pdf" $avg  400 "Balaji_dataset.tfcoregs"

S=0; for v in `cut -f2 Costanzo_dataset.tfcoregs`; do S=$((S+v)); done;
avg=$((S/`cat Costanzo_dataset.tfcoregs | wc -l`))
gnuplot -c tfcoregs.gnuplot "Costanzo_dataset-tfcoregs.pdf" $avg  80 "Costanzo_dataset.tfcoregs"

gnuplot coreg2017.gnuplot
gnuplot coreg2019.gnuplot
#117
#46
#71

###################################################################################
#echo "MOTIF ANALYSIS"
###################################################################################
# 2017
cat yeast2017-BE-net.txt | grep "Carbon source"   > yeast2017-BE-Carbon-net.txt
cat yeast2017-BE-net.txt | grep "Cell cycle"      > yeast2017-BE-CellCycle-net.txt
cat yeast2017-BE-net.txt | grep "Nitrogen source" > yeast2017-BE-Nitrogen-net.txt
cat yeast2017-BE-net.txt | grep "(control)"       > yeast2017-BE-Control-net.txt
cat yeast2017-BE-net.txt | grep "Stress"          > yeast2017-BE-Stress-net.txt
#
cat yeast2017-B-net.txt | grep "(control)"        > yeast2017-B-Control-net.txt
# 2019
cat yeast2019-BE-net.txt | grep "Carbon source"   > yeast2019-BE-Carbon-net.txt
cat yeast2019-BE-net.txt | grep "Cell cycle"      > yeast2019-BE-CellCycle-net.txt
cat yeast2019-BE-net.txt | grep "Nitrogen source" > yeast2019-BE-Nitrogen-net.txt
cat yeast2019-BE-net.txt | grep "(control)"       > yeast2019-BE-Control-net.txt
cat yeast2019-BE-net.txt | grep "Stress"          > yeast2019-BE-Stress-net.txt
#
cat yeast2019-B-net.txt | grep "(control)"        > yeast2019-B-Control-net.txt

# Run each network in separated (parallel) processes
# time python3 motifs.py $net
 

  
