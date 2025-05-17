# Stage 1: Test
FROM python AS test-stage

WORKDIR /usr/src/app
COPY . .
RUN make install-dev

# Stage 2: Production
FROM python AS prod

WORKDIR /usr/src/app
COPY . .
RUN make install

CMD make run


