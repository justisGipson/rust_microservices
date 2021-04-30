FROM rust:nightly

RUN USER=root cargo new --bin rust_microservices
WORKDIR /rust_microservices
COPY ./Cargo.toml ./Cargo.toml
RUN cargo build

RUN rm src/*.rs
COPY ./src ./src
RUN rm ./target/debug/deps/rust_microservice*
RUN cargo build

CMD ["./target/debug/rust_microservice"]

EXPOSE 8080
