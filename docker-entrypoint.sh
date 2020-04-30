#!/bin/bash

sed -i 's/127.0.0.1/'${HOST}'/g' /gekko/web/vue/dist/UIconfig.js
sed -i 's/localhost/'${HOST}'/g' /gekko/web/vue/dist/UIconfig.js
sed -i 's/3000/'${PORT}'/g' /gekko/web/vue/dist/UIconfig.js
sed -i 's/sqlite/'${DB}'/g' /gekko/web/vue/dist/UIconfig.js
if [[ "${USE_SSL:-0}" == "1" ]] ; then
    sed -i 's/ssl: false/ssl: true/g' /usr/src/app/web/vue/dist/UIconfig.js
fi
exec node --max_old_space_size="$MEMORYNODE" gekko "$@"
