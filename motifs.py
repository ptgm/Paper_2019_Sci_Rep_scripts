import os
import subprocess
import sys

motifs2num = {\
        '011101100': 12, \
        '010100100':  4, \
        '011101000': 10, \
        '011100010': 11, \
        '011100000':  5, \
        '011001000':  7, \
        '010100110':  9, \
        '011100100':  6, \
        '001100010':  8, \
        '000100100':  2, \
        '011000000':  1, \
        '001100000':  3, \
        '011101110': 13}
def error(msg):
    print(msg)
    sys.exit(1)

def dataset2num(lines,fname,ext):
    lNodes = []
    def spos(elem):
        return str(lNodes.index(elem)+1)
    fh = open(fname+"_num"+ext,'w')
    for line in lines:
        fields = line.split("\t")
        tf, tg = fields[0], fields[1]
        if tf not in lNodes: lNodes.append(tf)
        if tg not in lNodes: lNodes.append(tg)
        fh.write(spos(tf)+"\t"+spos(tg)+"\n")
    fh.close()

def motifPermuts(motif):
    lM = [motif[0:3], motif[3:6], motif[6:]]
    m12 = lM[1][1]+lM[1][0]+lM[1][2] \
        + lM[0][1]+lM[0][0]+lM[0][2] \
        + lM[2][1]+lM[2][0]+lM[2][2]
    m13 = lM[2][2]+lM[2][1]+lM[2][0] \
        + lM[1][2]+lM[1][1]+lM[1][0] \
        + lM[0][2]+lM[0][1]+lM[0][0]
    m23 = lM[0][0]+lM[0][2]+lM[0][1] \
        + lM[2][0]+lM[2][2]+lM[2][1] \
        + lM[1][0]+lM[1][2]+lM[1][1]
    return [motif, m12, m13, m23]

def uniqueness(f):
    count_dict={} #result dictionary
    uniq = {} #variable
    curr_motif = ""
    with open(f) as fh:
        for line in fh.readlines():
            line = line.strip().split()
            if curr_motif != line[0][:-1]:
                curr_motif = line[0][:-1]
                if not curr_motif in uniq.keys():
                    uniq[curr_motif] = set()
                    count_dict[curr_motif]=0
            nodes = line[1:]
            # 2 lines of debug
            if len(set(nodes)) != 3:
                print(nodes)
            if (len(uniq[curr_motif].intersection(nodes)) == 0):
                uniq[curr_motif].update(nodes);
                count_dict[curr_motif]+=1
    return count_dict

def parseResults(fname,ext):
    # Compute uniqueness
    uniqs = uniqueness(fname+"_num.gtrie.oc"+ext)
    os.remove(fname+"_num.gtrie.oc"+ext)

    # Get motifs Z-score
    fh = open(fname+"_num.gtrie"+ext)
    lRes = fh.readlines()
    fh.close()
    lRes = lRes[28:]

    fh = open(fname+"_num.gtrie.csv","w")
    fh.write("Num\tMotif\tOrg_Freq\tZ-score\tRnd_Avg\tRnd_Dev\tUniqueness\tZ-score (corrected)\n")
    for i in range(0,len(lRes),4):
        mInRes = lRes[i][:3]+lRes[i+1][:3]+lRes[i+2][:3]
        fields = lRes[i+2][4:].strip().split()
        u = 0
        num = 0
        for m in motifPermuts(mInRes):
            if m in motifs2num: num = motifs2num[m]
            if m in uniqs:
                u = uniqs[m]
                break
        zscore = fields[2]
        if u < 4: zscore = "0"
        fh.write("\t".join([str(num),"'"+mInRes,fields[0],fields[2],fields[4],fields[6],str(u),zscore])+"\n")
    fh.close()


if __name__ == "__main__":
    if len(sys.argv) < 2:
        error("Error - Invalid number of arguments")

    if not os.path.isfile(sys.argv[1]):
        error("Error - Invalid network file: " + sys.argv[1])
    fname, ext = os.path.splitext(sys.argv[1])

    fh = open(sys.argv[1],'r')
    lines = fh.readlines()
    fh.close()

    # Transform into numerical dataset
    dataset2num(lines,fname,ext)

    # Run gtrieScanner
    cline = "/opt/gtrieScanner_src_01/gtrieScanner -s 3 -m subgraphs /opt/gtrieScanner_src_01/dir3.str -g "+fname+"_num"+ext+" -d -f simple -t txt -r 10000 -o "+fname+"_num.gtrie"+ext+" -oc "+fname+"_num.gtrie.oc"+ext+" | tee "+fname+"_num.gtrie.log 2>1"
    while True:
        print(cline)
        proc = subprocess.run(cline, shell=True)
        fh = open(fname+"_num.gtrie.log", "r")
        lines = fh.readlines()
        fh.close()
        if "Occurences" in lines[-1]:
            break

    # Parse results
    parseResults(fname,ext)

