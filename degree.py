import os
import sys


def error(msg):
    print(msg)
    sys.exit(1)

def degCounts(degrev, outfile):
    fh = open(outfile, 'w')
    for t in sorted(degrev.items(), key=lambda x: x[0], reverse=True):
        fh.write("{}\t{}\n".format(t[1], t[0]))
    fh.close()

def degDist(degrev, outfile):
    fh = open(outfile, 'w')
    for t in sorted(degrev.items(), key=lambda x: x[0]):
        fh.write("{}\t{}\n".format(t[0],t[1]))
    fh.close()

def degOrdered(degree, outfile):
    sortedDeg= sorted(degree.values(), key=lambda kv: kv, reverse=True)
    i = 0
    fh = open(outfile, 'w')
    for k in sortedDeg:
        i += 1
        fh.write("{}\t{}\n".format(i, k))
    fh.close()
    tfsMoreLess = sorted(degree.items(), key=lambda x: (x[1],x[0]), reverse=True)

    sz = 25
    # sz more
    fh = open(outfile[0:-4] + str(sz) + 'more', 'w')
    for t in tfsMoreLess[0:sz]:
        fh.write("{}\t{}\n".format(t[0], t[1]))
    fh.close()
    # sz less
    fh = open(outfile[0:-4] + str(sz) + 'less', 'w')
    for t in tfsMoreLess[-sz:]:
        fh.write("{}\t{}\n".format(t[0], t[1]))
    fh.close()

def writeFiltered(degree, degType, m, M):
    fh = open(fname+'.'+degType+str(m)+'-'+str(M), 'w')
    for k in degree:
        if m <= degree[k] <= M: fh.write("{}\t{}\n".format(k,degree[k]))
    fh.close()


def reverseDegree(degree):
    degrev = {}
    for g in degree:
        n = degree[g]
        if n not in degrev:
            degrev[n] = 0
        degrev[n] += 1
    return degrev

if __name__ == "__main__":
    if len(sys.argv) < 2:
        error("Error - Invalid number of arguments")
    
    if not os.path.isfile(sys.argv[1]):
        error("Error - Invalid network file: " + sys.argv[1])
    fname, ext = os.path.splitext(sys.argv[1])

    fh = open(sys.argv[1],'r')
    lines = fh.readlines()
    fh.close()

    indeg,outdeg = {}, {}
    for line in lines:
        fields = line.split("\t")
        if fields[0] not in outdeg: outdeg[fields[0]] = 0
        if fields[1] not in  indeg:  indeg[fields[1]] = 0
        outdeg[fields[0]] += 1
        indeg[fields[1]]  += 1

    indegrev  = reverseDegree(indeg)
    outdegrev = reverseDegree(outdeg)

    writeFiltered(indeg, "indeg",  5,  9)
    writeFiltered(indeg, "indeg", 10, 14)
    writeFiltered(indeg, "indeg", 15, 20)

    degCounts(indegrev,  fname+'.indegcount')
    degCounts(outdegrev, fname+'.outdegcount')

    degDist(indegrev,  fname+'.indegdist')
    degDist(outdegrev, fname+'.outdegdist')

    degOrdered(indeg,  fname+'.indegordered')
    degOrdered(outdeg, fname+'.outdegordered')

