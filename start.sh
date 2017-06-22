 #!/bin/bash

ps aux |grep jekyll |awk '{print $2}' | xargs kill -9

#jekyll serve --detach   --no-watch --host 0.0.0.0
jekyll build --drafts


