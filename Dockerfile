FROM python:3.8-alpine

RUN addgroup -S mobius3 && \
    adduser -S mobius3 -G mobius3 && \
    mkdir ~mobius3/data && \
    chown mobius3:mobius3 ~mobius3/data
WORKDIR /home/mobius3

RUN pip install mobius3==0.0.34

USER mobius3

