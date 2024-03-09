# Corks

Corks are authorization tokens which are based off Google's [Macaroons](https://research.google/pubs/macaroons-cookies-with-contextual-caveats-for-decentralized-authorization-in-the-cloud/) paper. They are bearer tokens which identify the entity possessing them, while providing a mechanism for embedding further restrictions via [Cedar](https://www.cedarpolicy.com/en) policy caveats.

## Development

Corks use Protobuf for serialization and deserialization of bearers and caveats. The proto definitions are located in the [proto](./proto) directory and the [Buf](https://buf.build) toolchain is used to generate Dart code from the Protobuf files.

To generate the Dart code, install Buf then run the following command from the `proto/` directory:

```sh
$ buf generate
```
