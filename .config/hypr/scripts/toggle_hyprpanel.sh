
#!/bin/bash

if pgrep -x "ags" > /dev/null
then
    pkill -x ags
else
    ags
fi
