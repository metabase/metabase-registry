# Metabase Partner Drivers Registry

This repo serves as a registry for partner drivers, so you can use a script to download the driver you need.

## drivers.yaml format

It's a list of drivers under `drivers` key, with every driver having those fields:

- `name` - a short name for the driver;
- `homepage` - a link to driver's homepage;
- `versions` - a map of driver versions suitable for different major Metabase versions. `default` is a special key and means "use this one if a more specific one not found";
- `deps` (_optional_) - a list of urls for dependencies, like an additional specific jdbc driver
