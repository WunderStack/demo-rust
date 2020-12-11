FROM rust:1.48 as build

WORKDIR /app

ADD . /app

RUN cargo install --path .

# For more information about distroless
# see: https://www.youtube.com/watch?v=lviLZFciDv4&t=1576s
FROM gcr.io/distroless/cc

COPY --from=build /app/target/release/demo-rust /usr/local/bin/demo-rust

CMD ["demo-rust"]
