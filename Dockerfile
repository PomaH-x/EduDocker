# Stage 1: Test
FROM python AS test-stage

WORKDIR /usr/src/app
COPY . .
RUN make install-dev

# Stage 2: Production
# FROM python AS prod

# WORKDIR /usr/src/app
# COPY . .
# RUN make install

# CMD make run

FROM python:3.10-slim AS prod

WORKDIR /usr/src/app
COPY . .
RUN make install

ENV APP_PORT=8035
EXPOSE ${APP_PORT}

CMD ["make", "run"]