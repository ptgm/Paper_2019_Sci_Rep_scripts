import os
import sys


def error(msg):
    print(msg)
    sys.exit(1)


def writeLines(fname, lines, key1, key2, key3, key4, key5):
    lsort = sorted(lines, key=lambda x : (x[key1], x[key2], x[key3], x[key4], x[key5]), reverse=True)
    fh = open(fname,'w')
    for l in lsort:
        s = l['tf'] + '\t' + str(l['total'])
        for b in bins:
            s += '\t' + str(l[b])
        fh.write(s+'\n')
    fh.close()

def writeLineSingle(fname, lines, key):
    lsort = sorted(lines, key=lambda x : (x[key], x['total']), reverse=True)
    fh = open(fname,'w')
    for l in lsort:
        s = l['tf'] + '\t' + str(l['total']) + '\t' + str(l[key])
        fh.write(s+'\n')
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

    # Build the Fwr/Rev adjacency list
    dirRegs, revRegs = {}, {}
    for line in lines:
        fields = line.split("\t")
        tf,tg = fields[0],fields[1]
        if not tf in dirRegs:
            dirRegs[tf] = []
        dirRegs[tf] = dirRegs[tf] + [tg]
        if not tg in revRegs:
            revRegs[tg] = []
        revRegs[tg] = revRegs[tg] + [tf]

    # Figure 6: Number of co-regulators as a function of the out-degree
    fh = open(fname+'.tfcoregs','w')
    #m100, M100 = 0, 0
    for tf in dirRegs:
        coTFs = set()
        for tg in dirRegs[tf]:
            coTFs = coTFs | set(revRegs[tg])
        coTFs = coTFs - {tf}
        fh.write(str(len(dirRegs[tf])) +'\t'+ str(len(coTFs)) +'\n')
        #if len(coTFs) >= 100: M100 += 1
        #else: m100 += 1
    fh.close()
    #print(fname)
    #print("<100:", m100)
    #print(">100:", M100)

    # Figure 7 - Number of transcription factors as a function of the number of co-regulators
    coreg = {}
    maxCoReg = 0
    for tg in revRegs:
        sz = len(revRegs[tg]) - 1
        for tf in revRegs[tg]:
            if not tf in coreg:
                coreg[tf] = {}
            if not sz in coreg[tf]:
                coreg[tf][sz] = 0
            coreg[tf][sz] += 1
            if sz > maxCoReg:
                maxCoReg = sz
    coregcounts = {}
    for tf in coreg:
        for sz in coreg[tf]:
            if sz not in coregcounts:
                coregcounts[sz] = 0
            coregcounts[sz] += coreg[tf][sz]
    fh = open(fname+'.coregcounts','w')
    for sz in sorted(coregcounts.keys()):
        fh.write(str(sz) + '\t' + str(coregcounts[sz]) + '\n')
    fh.close()

    # Figure 8 - Representation of the TFs that have more/less co-regulators
    def getCount(tf, low, high):
        total = 0
        for n in range(low, high+1):
            if n in coreg[tf]:
                total += coreg[tf][n]
        return total
    bins = ['0', '1-4', '5-9', '10-14', '15+']
    tfbincounts = {}
    for tf in coreg:
        if not tf in tfbincounts:
            tfbincounts[tf] = {}
        for b in bins:
            if isinstance(b, int):
                high = low = b
            elif '-' in b:
                low = b.split('-')[0]
                high = b.split('-')[1]
            elif '+' in b:
                low = b.split('+')[0]
                high = maxCoReg
            else:
                high = low = str(b)
            tfbincounts[tf][b] = getCount(tf, int(low), int(high))

    # Lines to be written to file
    lines = []
    for tf in tfbincounts:
        elem = {}
        total = sum(n for n in tfbincounts[tf].values())
        for b in bins:
            elem[b] = tfbincounts[tf][b] * 100 / total
        elem['tf'] = tf
        elem['total'] = total
        lines.append(elem)

    writeLines(fname+'.coregmore', lines, '15+','10-14', '5-9', '1-4', '0')
    writeLines(fname+'.coregless', lines, '0','1-4', '5-9', '10-14', '15+')

    #writeLineSingle(fname+'.coregcount0',     lines, '0')
    #writeLineSingle(fname+'.coregcount1-4',   lines, '1-4')
    #writeLineSingle(fname+'.coregcount5-9',   lines, '5-9')
    #writeLineSingle(fname+'.coregcount10-14', lines, '10-14')
    #writeLineSingle(fname+'.coregcount15+',   lines, '15+')
