# V Rising Docker Server

## Container Configuration

| Name          | Type   | Default   | Description                                   |
| ------------- | ------ | --------- | --------------------------------------------- |
| UPDATE_SERVER | string | `true`    | Whether or not to update game's server files. |
| SERVER_DIR    | string | `/server` | Location to store server files                |
| DATA_DIR      | string | `/data`   | Location to store settings/saves              |

## Server Configuration

The data directory contains a `Settings` and `Save`. Inside `Settings`, create and configure a `ServerHostSettings.json` and `ServerGameSettings.json`
as defined here: https://github.com/StunlockStudios/vrising-dedicated-server-instructions

```text
> tree $DATA_DIR
/data
├── Settings
│   ├── ServerGameSettings.json
│   └── ServerHostSettings.json
└── Saves
    └── v1
        └── world1
            ├── AutoSave_0
            │   └── WorldData.save
            └── SessionId.json
```

## Example

```bash
docker run \
  -v $PWD:/data \
  -p 27015:27015/udp \
  -p 27016:27016/udp \
  justmiles/vrising:3
```
