FROM shawoo/all-in-one-sandbox:FDEP

# COPY lab/bin/  /usr/local/bin/

RUN npm i -g -U opencode-ai@latest openclaw@latest @mariozechner/pi-coding-agent

RUN printf 'Y\n' | hermes update

COPY ./profiles/*.conf /opt/gem/supervisord/
