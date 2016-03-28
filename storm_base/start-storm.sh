#!/bin/bash
IP=`hostname -i`

ZK_LINES=
for i in $ZK_SERVERS ; do
    ZK_LINES="$ZK_LINES\\n - "\"$i\"
done

sed -i -e "s/%localhostname%/$IP/g" $STORM_HOMR/conf/storm.yaml
sed -i -e "s/%zkservers%/$ZK_LINES/g" $STORM_HOME/conf/storm.yaml
sed -i -e "s/%nimbusserver%/$NIMBUS_SERVER/g" $STORM_HOME/conf/storm.yaml
sed -i -e "s/%drpcserver%/$NIMBUS_SERVER/g" $STORM_HOME/conf/storm.yaml
sed -i -e "s/%topologydebug%/$TOPOLOGY_DEBUG/g" $STORM_HOME/conf/storm.yaml
sed -i -e "s/%topologyworkers%/$TOPOLOGY_WORKERS/g" $STORM_HOME/conf/storm.yaml
sed -i -e "s/%message_timeout_secs%/$MESSAGE_TIMEOUT_SECS/g" $STORM_HOME/conf/storm.yaml
sed -i -e "s/%zk_session_timeout%/$ZK_SESSION_TIMEOUT/g" $STORM_HOME/conf/storm.yaml
sed -i -e "s/%zk_connection_timeout%/$ZK_CONNECTION_TIMEOUT/g" $STORM_HOME/conf/storm.yaml
sed -i -e "s/%max_spout_pending%/$MAX_SPOUT_PENDING/g" $STORM_HOME/conf/storm.yaml

exec storm %STORMAPP%
