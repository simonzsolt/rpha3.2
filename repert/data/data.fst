1 0 v1
2 0 if v91='0' then 'INC=',&comma(v2) if a(v2) then &comma(v3) fi fi
3 0 if v91='0' then "TITRE="d3, &comma(v3) fi
4 0 (|AUT=?|d5^3,|%|d5)
5 0 if v91='0' then (|AUT=|d5,v5^1| |v5^2,|%|d5) fi
6 0 if v91='8' then 'NJ=',&comma(v2) if a(v2) then &comma(v3) fi fi
11 0 "TRAD="v11
12 0 |INCOR=|v12|%|
13 0 |TITOR=|v13|%|
14 0 |HYMNUS=|v14|%|
15 0 (|AUTET=|d15,v15^1|, |v15^2,|%|d15)
16 0 (|AUTET=?|d15^3,|%|d15)
18 0 "LANOR="v18
21 0 |AN=|v21|%|
22 0 "PREC="v22
23 0 "CHANS="v23
24 0 "SIGNE="v24
26 0 (|LEVEL=|d28,&pici(v28),|%|d28)
28 0 |GENRE=|v28.3|%|
28 0 |GENRE=|v28*4.3|%|
28 0 |GENRE=|v28*8.3|%|
28 0 |GENRE=|v28*12.3|%|
28 0 |GENRE=|v28*16.3|%|
30 0 "COLO="v30
31 0 |DEDIE=|v31|%|
33 0 "ACR="v33
41 0 "INT="v41
42 0 if v91='0' then (|LON=|d42,f(val(v42),4,0),|%|d42) fi
43 0 if v91='0' then "PRE="v43 fi
44 0 "TYPME="v44
46 0 "RIME="v46
47 0 "SYLL="v47
51 0 v51.11|%|
52 0 v52.11|%|
53 0 |MEL=|v53|%|
54 0 |CR=|v54|%|
55 0 |FACS=|v55|%|
61 0 if v91='0' then |DAL-CON=|v61|%| fi
91 0 "RECTYP="v91
101 0 "TIP="v101
111 0 v101"-",v111
131 0 "HELY="v131
132 0 "IDO="v132
142 0 "FEL="v142
161 0 |CF.=|v161|%|
162 0 |VIDE=|v162|%|
163 0 "REFR="v163
164 0 "ECHO="v164
165 0 |BCF.=|v165|%|
