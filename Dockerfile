FROM rust:1.48 as build

WORKDIR /app

ADD . /app

RUN cargo install --path .

FROM gcr.io/distroless/cc

COPY --from=build /app/target/release/demo-rust /usr/local/bin/demo-rust

CMD ["demo-rust"]
