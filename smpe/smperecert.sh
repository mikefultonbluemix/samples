#!/bin/sh
# See: http://www-03.ibm.com/support/techdocs/atsmastr.nsf/5cb5ed706d254a8186256c71006d2e0a/bdee3c698260c970852582170066c99f/$FILE/New%20Certificate%20Authority.pdf) 
#
set -x
function tsoPrintError {
	cmd="$@"
	tsocmd "$cmd" >/dev/null 2>&1
#	if [ $? -gt 0 ]; then
		tsocmd "$cmd" 
#	fi
	return $?
}

me=`hlq` #not whoami - it can give an odd answer for uid 0
certCADataset="${me}.SMPE.DIGICERT.CA.CRT"
CALabel="DigiCert Global Root CA"

tsoPrintError "RACDCERT CERTAUTH ADD('${certCADataset}') WITHLABEL('${CALabel}') TRUST"
tsoPrintError "racdcert certauth add('IBMUSER.SMPE.DIGICERT.CA.CRT') withlabel('DigiCert Global Root CA') TRUST"
tsoPrintError "racdcert certauth add('IBMUSER.SMPE.DIGICERT.G2.CRT') withlabel('DigiCert Global Root G2') TRUST"
