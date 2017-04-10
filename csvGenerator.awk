#! /usr/bin/gawk -f 

BEGIN{FS=",";OFS=","; print "ORDER#,NAME,MOX,MOX-UNS,BAC9,CHM,C4M,GRI,GRI-UNS,GBAC9,CHG,C4G,HB,CUA,LCUA,MSB,SB,HD,MIN-MOX,MIN-GRI,MIN-JAL,MIN-CRA,MUFL,MUFB,MFL-6"}
{$1=$1;$2=$2;NF=25;
	for(i=3;i<=NF;i++){
		#MOX RELATED PRODUCTS					#-Field number-:
		if($i ~ /^MOX-W/){MOX=$(i+1)} 			#3
		if($i ~ /^MOX-UNS-W/){MOXUNS=$(i+1)}	#4
		if($i ~ /^BAC9-W/){BAC9=$(i+1)} 		#5
		if($i ~ /^CHM-W/){CHM=$(i+1)} 			#6
		if($i ~ /^C4M-W/){C4M=$(i+1)}			#7
		#GRI RELATED PRODUCTS
		if($i ~ /^GRI-W/){GRI=$(i+1)} 			#8
		if($i ~ /^GRI-UNS-W/){GRIUNS=$(i+1)}	#9
		if($i ~ /^GBAC9-W/){GBAC9=$(i+1)} 		#10
		if($i ~ /^CHG-W/){CHG=$(i+1)} 			#11
		if($i ~ /^C4G-W/){C4G=$(i+1)}			#12
		#BUNS
		if($i ~ /^HB-DZ/){HB=$(i+1)} 			#13
		if($i ~ /^CUA-W-4/){CUA4=$(i+1)}		#14
		if($i ~ /^CUA-W-6/){CUA6=$(i+1)} 		#15
		if($i ~ /^MSB/){MSB=$(i+1)} 			#16
		if($i ~ /^SLI/){SB=$(i+1)}				#17
		#MINIS
		if($i ~ /^MIN-MOX-W.*/){MM=$(i+1)} 		#19
		if($i ~ /^MIN-G-W.*/){MG=$(i+1)}		#20
		if($i ~ /^MIN-JAL-W.*/){MJ=$(i+1)} 		#21
		if($i ~ /^MIN-C-W.*/){MC=$(i+1)} 		#22
		#MUFFINS
		if($i ~ /^MUFL/){MUFL=$(i+1)} 			#23
		if($i ~ /^MUFB/){MUFB=$(i+1)}			#24
		#Croutons
		if($i ~ /^MFL/){MFL=$(i+1)} 			#25
		#Cases of MINIS AND HB
		if($i ~ /^C10MINM/){MM=$(i+1)*10} 	
		if($i ~ /^C10MING/){MG=$(i+1)*10}
		if($i ~ /^C10MINJ/){MJ=$(i+1)*10} 
		if($i ~ /^C10MINC/){MC=$(i+1)*10} 
		if($i ~ /^C6HB/){HB=$(i+1)*6}  			 
		if($i ~ /^C3C/){CUA4=$(i+1)*3} 
		if($i ~ /^CS5/){SB=$(i+1)*5}
		if($i ~ /^C6MSB/){MSB=$(i+1)*6}   
	}
	#ASSIGN VARIABLES TO FIELDS
	$3=MOX;		$8=GRI;		$13=HB;		$18=HD;		$23=MUFL;
	$4=MOXUNS;	$9=GRIUNS;	$14=CUA4;	$19=MM;		$24=MUFB;
	$5=BAC9;	$10=GBAC9;	$15=CUA6;	$20=MG;		$25=MFL;
	$6=CHM;		$11=CHG;	$16=MSB;	$21=MJ;
	$7=C4M;		$12=C4G;	$17=SB;		$22=MC;
	
	#PRINT RECORDS
	print $0;
	
	#RESET ALL VARIABLES PER RECORD FOR NEXT LOOP
	MOX="";		GRI="";		HB="";		HD="";	MUFL="";
	MOXUNS="";	GRIUNS="";	CUA4="";	MM="";	MUFB="";
	BAC9="";	GBAC9="";	CUA6="";	MG="";	MFL="";
	CHM="";		CHG="";		MSB="";		MJ="";
	C4M="";		C4G="";		SB="";		MC="";	
	
}

