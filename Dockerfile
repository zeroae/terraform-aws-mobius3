FROM python:3.8-alpine
LABEL org.opencontainers.image.source=https://github.com/zeroae/terraform-aws-mobius3

RUN addgroup -S mobius3 && \
    adduser -S mobius3 -G mobius3 && \
    mkdir ~mobius3/data && \
    chown mobius3:mobius3 ~mobius3/data
WORKDIR /home/mobius3

RUN pip install mobius3==0.0.34
COPY zmobius3.py /usr/bin/zmobius3

USER mobius3

