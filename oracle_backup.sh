#!/bin/sh
#
ORACLE_HOME=/opt/app/oracle/product/11.2.0/dbhome_1
export ORACLE_HOME

DELTIE=`date -d "7 days ago" +%Y%m%d`
BAKUPTIME=`date +%Y%m%d%H%M%S`
DATA_DIR='~/dbpump'

echo "Starting bakup..."
echo "Bakup file path $DATA_DIR/$BAKUPTIME.dmp"

$ORACLE_HOME/bin/expdp  amoy/123456@orcl directory=dbpump tables=table_name  dumpfile=$BAKUPTIME.dmp query=AMOY.table_name:\"where PASS_TIME\>=to_date\(\'2016-04-18 00:01:00\',\'yyyy-mm-dd hh24:mi:ss\'\) and PASS_TIME\<to_date\(\'2016-04-24 00:01:00\',\'yyyy-mm-dd hh24:mi:ss\'\)\" parallel=1 >> ~/dump.log

echo "Delete the file bakup before 7 days..."
rm -rf $DATA_DIR/$DELTIME*.dmp
rm -rf $LOGS_DIR/$DELTIME*.log
echo "Delete the file bakup successfully. "

echo "Bakup completed."
